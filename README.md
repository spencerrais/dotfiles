# dotfiles
Workflow based on using tmux w/neovim along with a web browser for either Arch Linux or MacOS.

Common packages are installed via the arch-packages folder or the brewfile for MacOS.

Neovim config based on [kickstart](https://github.com/nvim-lua/kickstart.nvim).

The installation can be as simple as 
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "${HOME}/.local/bin/" init --purge-binary --apply spencerrais
```
