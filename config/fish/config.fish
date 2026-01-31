set -g fish_greeting ''

set EDITOR /usr/bin/vim
set GOPATH ~/go

fish_add_path ~/.dotfiles/bin
fish_add_path /opt/homebrew/bin
fish_add_path $GOPATH/bin

alias t="talosctl"

alias h="u8s helm3 --"
alias k="u8s kubectl --"
alias kn="u8s set --namespace"
alias kc="u8s set --context"
function kk
  set -l config_path $argv[1]
  set -l current_ctx (kubectl --kubeconfig $config_path config current-context 2>/dev/null)
  u8s set --kubeconfig $config_path --context $current_ctx
end
alias ke="u8s kubectl -- exec -ti"
alias kl="u8s kubectl -- logs -f"
alias kg="u8s kubectl -- get"
alias kgy="u8s kubectl -- get -o yaml"
alias kgpw="u8s kubectl -- get pods -o wide -w"
alias kgp="u8s kubectl -- get pods -o wide"
alias kgpy="u8s kubectl -- get pods -o wide -o yaml"
alias kgpa="u8s kubectl -- get pods -o wide --all-namespaces --sort-by='{.metadata.namespace}'"
alias kgpaw="u8s kubectl -- get pods -w -o wide --all-namespaces --sort-by='{.metadata.namespace}'"
alias kge="u8s kubectl -- get events --sort-by='.metadata.creationTimestamp'"
alias kgew="u8s kubectl -- get events -w --sort-by='.metadata.creationTimestamp'"
alias kgn="u8s kubectl -- get nodes -L container-linux-update.v1.coreos.com/version -L zone -L species -L failure-domain.beta.kubernetes.io/zone"
alias kdn="u8s kubectl -- describe node"
alias kdp="u8s kubectl -- describe pod"
alias kds="u8s kubectl -- describe service"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gr="git rm"
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
alias gss="git stash push"
alias gsp="git stash pop"

function fish_user_key_bindings
  bind \e.       'history-token-search-backward'
  bind \e\[1\;9A 'history-token-search-backward'
  bind \e\[1\;9B 'history-token-search-forward'
  bind \e\[1\;9C 'forward-word'
  bind \e\[1\;9D 'backward-word'
end

fzf --fish | source
zoxide init fish | source

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"

  u8s set --kubeconfig ~/.kube/woopse --context woopse > /dev/null 2>&1
end