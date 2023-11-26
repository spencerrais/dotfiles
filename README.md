# dotfiles
Workflow based on using tmux w/neovim along with a web browser for either Arch Linux or MacOS.

Common packages are installed via the arch-packages folder or the brewfile for MacOS.

Neovim config based on [kickstart](https://github.com/nvim-lua/kickstart.nvim).

The installation can be as simple as 
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "${HOME}/.local/bin/" init --purge-binary --apply spencerrais
```
SSH keys for git will need to be set up, this will differ slightly by OS, [follow GitHub's steps](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac).
