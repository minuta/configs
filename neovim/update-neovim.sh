#!/usr/bin/env zsh

mv nvim.appimage backup.nvim.appimage -f
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
