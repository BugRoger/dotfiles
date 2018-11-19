set -g fish_greeting ''

set EDITOR /usr/local/bin/mvim
set -x GOPATH $HOME/Go
set -x GOBINPATH $HOME/GoBin

set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "$GOBINPATH/bin" $fish_user_paths
set -g fish_user_paths "$GOPATH/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/coreutils/libexec/gnubin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/go/libexec/bin" $fish_user_paths

alias h="helm"
alias k="kubectl"

alias kg="k get"
alias kgk="k get kluster"
alias kgka="k get kluster --all-namespaces"
alias kgp="kg pods -o wide"
alias kgpa="kgp --all-namespaces"
alias kgs="kg services --show-all"
alias kgsa="kg services --all-namespaces"
alias kgr="kg rc --all-namespaces"
alias kgn="kg nodes -L container-linux-update.v1.coreos.com/version -L zone -L species -L failure-domain.beta.kubernetes.io/zone"
alias kl="k logs -f"
alias klt="kl --tail 1000"
alias ke="k exec -ti"
alias kd="k describe"
alias kdp="kd pod"
alias kds="kd service"
alias kdr="kd rc"
alias kdn="kd node"
alias kc="k create"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gr="git remove"
alias gc="git commit"
alias gca="git commit --amend"
alias gcam="git commit -am"
alias gcm="git commit -m"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gprom="git pull --rebase origin master"
alias gprum="git pull --rebase upstream master"
alias gpom="git push origin master"
alias gpum="git push upstream master"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gri="git rebase -i"
alias grm="git rebase master"
alias gd="git diff"
alias gdc="git diff --cached"
alias gss="git stash save"
alias gsp="git stash pop"

function fish_user_key_bindings
  bind \e.       'history-token-search-backward'
  bind \e\[1\;9A 'history-token-search-backward'
  bind \e\[1\;9B 'history-token-search-forward'
  bind \e\[1\;9C 'forward-word'
  bind \e\[1\;9D 'backward-word'
end

[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish
eval (direnv hook fish)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
