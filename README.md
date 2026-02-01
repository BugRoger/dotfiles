# Dotfiles

Personal dotfiles for macOS. Managed via symlinks from `~/.dotfiles/`.

## Setup

```bash
git clone https://github.com/BugRoger/dotfiles.git ~/.dotfiles
.dotfiles/scripts/upgrade
```

The upgrade script is idempotent — run it on a fresh machine or re-run it anytime to sync changes. It handles:

- Homebrew installation and packages
- Git submodules (Vim plugins, base16-shell)
- Symlinks (`~/.config`, `~/.gitconfig`, `~/.vimrc`, etc.)
- Fish shell as default shell + fisher plugins
- iTerm2 preferences sync

## App Settings

Some apps can't be configured via symlinks and need explicit export/import:

```bash
# Export settings into the dotfiles repo
scripts/export raycast

# Import settings on a new machine
scripts/import raycast
```

## Vim Plugins

Plugins are managed as Git submodules via Pathogen:

```bash
# Add a new plugin
git submodule add http://github.com/user/plugin.git vim/bundle/plugin-name

# Update all plugins
git submodule foreach git pull
```
