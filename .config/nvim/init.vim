call plug#begin()

Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

nn <silent> y "+y
xn <silent> y "+y

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
  set notermguicolors
  set synmaxcol=511

  nm <silent> <Leader>F :<C-u>CocSearch <C-F>i
  xm <silent> <Leader>F y:<C-u>call CocActionAsync('search', '-U', escape(@", '\.*+?^$()[]{}\|'))<CR>
  aug vimrc
    au! *
    au BufWritePost $MYVIMRC source %
    au BufRead *.git/COMMIT_EDITMSG setl spell

    fu! s:BindKeys()
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

    fu! s:SetJavaScript()
      setl et ts=4 sw=4
      call s:BindKeys()
    endf
    au FileType javascript,typescript call s:SetJavaScript()

    fu! s:SetJSON()
      setl et ts=2 sw=2
      call s:BindKeys()
    endf
    au FileType yaml,json call s:SetJSON()

    fu! s:SetMarkdown()
      call s:BindKeys()
      setl spell
      nn <buffer> <silent> <Leader>V :<C-u>silent CocCommand markdown-preview-enhanced.openPreview<CR>
    endf
    au FileType markdown call s:SetMarkdown()

    fu! s:SetPython()
      setl et ts=4 sw=4
      call s:BindKeys()
      let b:coc_root_patterns = ['.git', 'venv', '.venv']
    endf
    au FileType python call s:SetPython()

    fu! s:SetGolang()
      setl noet ts=8 sw=8
      call s:BindKeys()
      aug lvimrc
        au! * <buffer>
        " au BufWritePre <buffer> :silent CocCommand editor.action.formatDocument
        au BufWritePre <buffer> :silent CocCommand editor.action.organizeImport
      aug END
    endf
    au FileType go call s:SetGolang()
  aug END
endif
call plug#end()
