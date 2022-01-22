set -g fish_greeting ''

set EDITOR /usr/bin/vim
set GOPATH ~/go

set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "$GOBINPATH/bin" $fish_user_paths
set -g fish_user_paths "$GOPATH/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/coreutils/libexec/gnubin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/go/libexec/bin" $fish_user_paths

set -gx U8S_GITHUB_TOKEN (security find-generic-password -a $USER -s U8S_GITHUB_TOKEN -w)

alias h="u8s helm3 --"
alias h3="u8s helm3 --"
alias h2="u8s helm2 --"

alias k="u8s kubectl --"
alias kn="u8s set --namespace"
alias kc="u8s set --context"
alias kk="u8s set --kubeconfig"

alias ke="u8s kubectl -- exec -ti"
alias kl="u8s kubectl -- logs -f"
alias kg="u8s kubectl -- get"
alias kgy="u8s kubectl -- get -o yaml"
alias kgp="u8s kubectl -- get pods -o wide"
alias kgpy="u8s kubectl -- get pods -o wide -o yaml"
alias kgpa="u8s kubectl -- get pods -o wide --all-namespaces --sort-by='{.metadata.namespace}'"
alias kgn="u8s kubectl -- get nodes -L container-linux-update.v1.coreos.com/version -L zone -L species -L failure-domain.beta.kubernetes.io/zone"
alias kdn="u8s kubectl -- describe node"
alias kdp="u8s kubectl -- describe pod"
alias kds="u8s kubectl -- describe service"

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

test -e "/usr/local/share/autojump/autojump.fish" ; and source /usr/local/share/autojump/autojump.fish
test -e "{$HOME}/.iterm2_shell_integration.fish" ; and source {$HOME}/.iterm2_shell_integration.fish
test -e "/usr/local/bin/direnv"; and eval (direnv hook fish)

# Base16 Shell
if status --is-interactive; and test -e "{$HOME}/.config/base16-shell"
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
