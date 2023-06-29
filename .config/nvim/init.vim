call plug#begin()
if !exists('g:vscode')
  Plug 'dense-analysis/ale'
  Plug 'embear/vim-localvimrc'
  Plug 'honza/vim-snippets'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-vinegar'

  let g:coc_disable_transparent_cursor = 1
  let g:localvimrc_persistent = 2
  let g:localvimrc_sandbox = 0
  set synmaxcol=1000

  cnoreabbrev S CocSearch

  au BufRead *.git/COMMIT_EDITMSG setl spell
  colorscheme peachpuff
  set clipboard=unnamedplus
  set cmdheight=0
  set fillchars=vert:\ ,eob:\ ,diff:\  listchars=tab:‧\ ,eol:¬
  set noshowcmd noshowmode
  set statusline=%f\ %m
  set title
endif
Plug 'michaeljsmith/vim-indent-object'
call plug#end()
