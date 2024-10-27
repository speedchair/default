call plug#begin()
Plug 'michaeljsmith/vim-indent-object'
if exists('g:vscode')
  call plug#end()
  finish
endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

colorscheme shine
set clipboard=unnamedplus
set fillchars=vert:\ ,eob:\ ,diff:\  listchars=tab:‧\ ,eol:¬
set noshowcmd noshowmode
set statusline=%f\ %m
set title

autocmd BufEnter * set indentexpr=
cnoreabbrev S CocSearch
inoremap <silent><expr> <c-x><c-o> coc#refresh()
let g:coc_disable_transparent_cursor = 1
" let g:python3_host_prog = "~/.local/bin/python3"
set synmaxcol=1000

aug vimrc
  au! *
  au BufWritePost $MYVIMRC source %
  au BufRead *.git/COMMIT_EDITMSG setl spell
  fu! BindKeys()
    nm <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
    nn <buffer> <silent> <Leader>i :call CocAction('jumpImplementation')<CR>
    nn <buffer> <silent> K :call CocAction('doHover')<CR>
    nn <buffer> <silent> gH :call CocAction('jumpReferences')<CR>
  endf
  fu! SetJavaScript()
    setl et ts=4 sw=4
    call BindKeys()
  endf
  au FileType javascript,typescript call SetJavaScript()
  fu! SetJSON()
    setl et ts=2 sw=2
    call BindKeys()
  endf
  au FileType yaml,json call SetJSON()
  au FileType markdown nn <buffer> <silent> <Leader>v :silent CocCommand markdown-preview-enhanced.openPreview<CR>
  fu! SetPython()
    setl et ts=4 sw=4
    call BindKeys()
    let b:coc_root_patterns = ['.git', 'venv', '.venv']
  endf
  au FileType python call SetPython()
  fu! SetGolang()
    setl noet ts=8 sw=8
    call BindKeys()
    aug lvimrc
      au! * <buffer>
      au BufWritePre <buffer> :silent CocCommand editor.action.formatDocument
      au BufWritePre <buffer> :silent CocCommand editor.action.organizeImport
    aug END
  endf
  au FileType go call SetGolang()
aug END
call plug#end()
