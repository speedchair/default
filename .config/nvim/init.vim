aug vimrc
  au! *
aug END

call plug#begin()
if !exists('g:vscode')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-vinegar'

  colorscheme peachpuff
  set clipboard=unnamedplus
  set cmdheight=0
  set fillchars=vert:\ ,eob:\ ,diff:\  listchars=tab:‧\ ,eol:¬
  set noshowcmd noshowmode
  set statusline=%f\ %m
  set title

  au BufRead *.git/COMMIT_EDITMSG setl spell
  cnoreabbrev S CocSearch
  inoremap <silent><expr> <c-x><c-o> coc#refresh()
  let g:coc_disable_transparent_cursor = 1
  let g:python3_host_prog = "~/.local/bin/python3"
  set synmaxcol=1000

  au vimrc FileType javascript,typescript
    \ setl et ts=4 sw=4
    \ | nm <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
    \ | nn <buffer> <silent> K :call CocAction('doHover')<CR>
    \ | nn <buffer> <silent> gH :call CocAction('jumpReferences')<CR>
  au vimrc FileType yaml,json
    \ setl et ts=2 sw=2
    \ | nn <buffer> <silent> K :call CocAction('doHover')<CR>
  au vimrc FileType markdown
    \ nn <buffer> <silent> <C-]> :e <cfile><CR>
    \ | nn <buffer> <silent> <Leader>p :silent CocCommand markdown-preview-enhanced.openPreview<CR>
  au vimrc FileType python
    \ setl et ts=4 sw=4
    \ | let b:coc_root_patterns = ['.git', 'venv', '.venv']
    \ | nm <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
    \ | nn <buffer> <silent> K :call CocAction('doHover')<CR>
    \ | nn <buffer> <silent> gH :call CocAction('jumpReferences')<CR>
  function! VimrcGolang()
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
  endfunction
  au vimrc FileType go call VimrcGolang()
endif
Plug 'michaeljsmith/vim-indent-object'
call plug#end()
