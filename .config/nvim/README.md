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
