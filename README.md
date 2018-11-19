# Installation

## Prerequisites

  * Git

## Manual Installation

    git clone https://github.com/BugRoger/dotfiles.git ~/.dotfiles
    .dotfiles/scripts/install

When setting up a new Mac, you may want to set some sensible OS X defaults:

### Sensible OS X defaults

```bash
scripts/osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
scripts/brew
```

## VIM

Plugins that are published on github can be installed as submodules. 

    cd ~/dotfiles
    git submodule add http://github.com/pangloss/vim-javascript.git vim/bundle/vim-javascript

Updating all plugins

     git submodule foreach git pull
