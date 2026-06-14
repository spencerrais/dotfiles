# dotfiles
Workflow based on using tmux w/neovim along with a web browser for either Arch Linux or MacOS.

Simple neovim config which gets out of the way, but still provides benefits of modern tooling. 

This repo uses chezmoi for dotfiles and mise for the portable tool layer.

- chezmoi applies dotfiles and OS-specific templates.
- mise installs runtimes, common CLI tools, and a small pacman/brew package layer.
- uv installs global Python CLI tools.
- Arch AUR usage is intentionally limited to a small allowlist.
- macOS GUI apps are installed with a small brew cask script.

The installation can be as simple as 
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "${HOME}/.local/bin/" init --purge-binary --apply spencerrais
```
SSH keys for git will need to be set up, this will differ slightly by OS, [follow GitHub's steps](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac).
