call plug#begin()

Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

if !exists('g:vscode')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-vinegar'

  colorscheme shine
  set fillchars=vert:\ ,eob:\ ,diff:\  listchars=tab:‧\ ,eol:¬,leadmultispace:\ ‧
  set noshowcmd noshowmode
  set statusline=%f\ %m
  set title

  autocmd BufEnter * set indentexpr=
  inoremap <silent><expr> <c-x><c-o> coc#refresh()
  let g:coc_disable_transparent_cursor = 1
  let g:python3_host_prog = "/usr/local/bin/python3.13"
  set synmaxcol=511

  nm <silent> <Leader>F :<C-u>CocSearch <C-F>i
  xm <silent> <Leader>F y:<C-u>call CocActionAsync('search', escape(@", '\.*+?^$()[]{}\|'))<CR>
  xm <silent> <Leader>y "+y
  aug vimrc
    au! *
    au BufWritePost $MYVIMRC source %
    au BufRead *.git/COMMIT_EDITMSG setl spell

    fu! BindKeys()
      nm <buffer> <silent> <C-]> <Plug>(coc-definition)
      nm <buffer> <silent> <Leader>N <Plug>(coc-rename)
      nm <buffer> <silent> <Leader>a <Plug>(coc-codeaction-selected)
      nm <buffer> <silent> [g <Plug>(coc-diagnostic-prev)
      nm <buffer> <silent> ]g <Plug>(coc-diagnostic-next)
      nn <buffer> <silent> <Leader>i <Plug>(coc-implementation)
      nn <buffer> <silent> == <Plug>(coc-format)
      nn <buffer> <silent> K :call CocAction('doHover')<CR>
      nn <buffer> <silent> gH <Plug>(coc-references)
      xm <buffer> <silent> <Leader>a <Plug>(coc-codeaction-selected)
      xm <buffer> <silent> = <Plug>(coc-format-selected)
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

    fu! SetMarkdown()
      call BindKeys()
      nn <buffer> <silent> <Leader>V :<C-u>silent CocCommand markdown-preview-enhanced.openPreview<CR>
    endf
    au FileType markdown call SetMarkdown()

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
endif
call plug#end()
