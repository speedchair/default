# Installation
Requires `curl` and `git`

```sh
curl -fL https://github.com/neovim/neovim/releases/download/stable/nvim.appimage \
  --create-dirs -o "$HOME/.local/bin/nvim" \
  && chmod u+x "$HOME/.local/bin/nvim" \
  && git config --global core.editor nvim \
  && git config --global diff.tool "nvim -d" \
  && nvim +PlugInstall +qa
```
Check health for functionalities like CoC and clipboard
```sh
nvim +checkhealth
```
For the XDG Menu support
```sh
curl -L --remote-name-all https://raw.githubusercontent.com/neovim/neovim/master/runtime/nvim{.desktop,.png} \
  && xdg-icon-resource install --novendor --size 128 nvim.png \
  && xdg-desktop-menu install --novendor nvim.desktop
```
# Language specific configuration
Considering
```vim
aug lvimrc
  au! * <buffer>
aug END

```
## Golang
```vim
if &ft ==# 'go'
  setl noet ts=8 sw=8
  let b:ale_linters = {'go': ['golangci-lint']}
  au lvimrc BufWritePre <buffer> :silent call CocAction('format')
  au lvimrc BufWritePre <buffer> :silent call CocAction('runCommand', 'editor.action.organizeImport')
  nm <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
  nn <buffer> <silent> K :call CocAction('doHover')<CR>
  nn <buffer> <silent> <Leader>r :call CocAction('jumpReferences')<CR>
  nn <buffer> <silent> <Leader>i :call CocAction('jumpImplementation')<CR>
endif
```

## Python
```vim
if &ft ==# 'python'
  setl et ts=4 sw=4
  let b:ale_linters = {'python': ['pyre']}
  let b:coc_root_patterns = ['.git', 'venv']
  au lvimrc BufWritePre <buffer> :silent call CocAction('format')
  au lvimrc BufWritePre <buffer> :silent call CocAction('runCommand', 'pyright.organizeimports')
  nm <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
  nn <buffer> <silent> K :call CocAction('doHover')<CR>
  nn <buffer> <silent> <Leader>r :call CocAction('jumpReferences')<CR>
endif
```
