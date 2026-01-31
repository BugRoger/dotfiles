# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS development environment. Files are deployed via symlinks from the home directory into `~/.dotfiles/`.

Active symlinks:
- `~/.config` → `config/`
- `~/.gitconfig` → `gitconfig`
- `~/.githelpers` → `githelpers`
- `~/.gitlocalconfig` → `gitlocalconfig`
- `~/.vim` → `vim/`
- `~/.vimrc` → `vimrc`
- `~/.base16_theme` → `config/base16-shell/scripts/base16-monokai.sh`

## Key Commands

**Install (referenced in README but scripts/ directory is absent):**
```bash
git clone https://github.com/BugRoger/dotfiles.git ~/.dotfiles
.dotfiles/scripts/install
```

**Vim plugins are managed as Git submodules:**
```bash
# Add a new plugin
git submodule add http://github.com/user/plugin.git vim/bundle/plugin-name

# Update all plugins
git submodule foreach git pull
```

## Architecture

- **`config/`** — XDG config directory (symlinked as `~/.config`). Contains fish shell, GitHub CLI, iTerm2, 1Password, Raycast, Wireshark, and base16-shell theme configs.
- **`config/fish/config.fish`** — Primary shell configuration. Heavy Kubernetes/kubectl aliases using a custom `u8s` binary, Git shortcuts, PATH setup for Homebrew (Apple Silicon), Go, and various tools.
- **`config/fish/functions/`** — Fish functions including Tide prompt (v6 via fisher plugin manager).
- **`vim/bundle/`** — 30 Vim plugins as Git submodules, managed by Pathogen.
- **`vimrc`** — Vim config: 2-space tabs, comma leader key, Base16 Monokai theme, Airline statusbar. Language support for Go, Ruby/Rails, JavaScript, Markdown.
- **`gitconfig`** — Git aliases, SSH commit signing (key at `~/.ssh/git-signingkey`), vim as editor.
- **`githelpers`** — Bash functions for pretty git log formatting.
- **`bin/`** — Custom binaries (notably `u8s` for Kubernetes context/config management).

## Important Details

- The entire `~/.config` directory is a symlink to this repo's `config/` folder — changes to any XDG config file are changes to this repo.
- `config/base16-shell/` is a Git submodule, not regular files.
- Git is configured for SSH signing (not GPG). The `gpgformat = ssh` setting in gitconfig is intentional.
- Fish shell is the primary shell; there is no bash/zsh configuration beyond githelpers.
