call plug#begin()
if !exists('g:vscode')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-vinegar'

  colorscheme shine
  set clipboard=unnamedplus
  set cmdheight=0
  set fillchars=vert:\ ,eob:\ ,diff:\  listchars=tab:‧\ ,eol:¬
  set noshowcmd noshowmode
  set statusline=%f\ %m
  set title

  cnoreabbrev S CocSearch
  inoremap <silent><expr> <c-x><c-o> coc#refresh()
  let g:coc_disable_transparent_cursor = 1
  let g:python3_host_prog = "~/.local/bin/python3"
  set synmaxcol=1000

  aug vimrc
    au! *
    au BufWritePost $MYVIMRC source %
    au BufRead *.git/COMMIT_EDITMSG setl spell
    fu! VimrcJs()
      setl et ts=4 sw=4
      nm <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
      nn <buffer> <silent> K :call CocAction('doHover')<CR>
      nn <buffer> <silent> gH :call CocAction('jumpReferences')<CR>
    endf
    au FileType javascript,typescript call VimrcJs()
    fu! VimrcJson()
      setl et ts=2 sw=2
      nn <buffer> <silent> K :call CocAction('doHover')<CR>
    endf
    au FileType yaml,json call VimrcJson()
    au FileType markdown nn <buffer> <silent> <Leader>p :silent CocCommand markdown-preview-enhanced.openPreview<CR>
    fu! VimrcPython()
      setl et ts=4 sw=4
      let b:coc_root_patterns = ['.git', 'venv', '.venv']
      nm <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
      nn <buffer> <silent> K :call CocAction('doHover')<CR>
      nn <buffer> <silent> gH :call CocAction('jumpReferences')<CR>
    endf
    au FileType python call VimrcPython()
    fu! VimrcGo()
      setl noet ts=8 sw=8
      aug lvimrc
        au! * <buffer>
        au BufWritePre <buffer> :silent CocCommand editor.action.formatDocument
        au BufWritePre <buffer> :silent CocCommand editor.action.organizeImport
      aug END
      nm <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
      nn <buffer> <silent> <Leader>i :call CocAction('jumpImplementation')<CR>
      nn <buffer> <silent> K :call CocAction('doHover')<CR>
      nn <buffer> <silent> gH :call CocAction('jumpReferences')<CR>
    endf
    au FileType go call VimrcGo()
  aug END
endif
Plug 'michaeljsmith/vim-indent-object'
call plug#end()
