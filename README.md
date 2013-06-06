Installation

    git clone git://github.com/BugRoger/dotfiles.git
    git clone git://github.com/BugRoger/dotfiles-source.git

Where possible, Vim plugins are installed as git submodules. Check these out by
running the commands:

    cd dotfiles
    git submodule init
    git submodule update

# VIM 

My preferences for Vim are stored in `dotfiles/vimrc`.

## Adding Bundles

Plugins that are published on github can be installed as submodules. 

    cd ~/dotfiles
    git submodule add http://github.com/pangloss/vim-javascript.git vim/bundle/vim-javascript

