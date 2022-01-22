function __kubectl_context
  set -l prompt 
  set -l context ""
  set -l namespace ""
  set -l config ""

  if test -n "$KUBECONFIG"
    set config (basename $KUBECONFIG)
  end

  if test -n "$KUBECTL_CONTEXT"
    set context $KUBECTL_CONTEXT
  else
    if test -n "$KUBECONFIG"
      set context (cat $KUBECONFIG | grep "current-context:" | sed -E 's/current-context: "?([^"]*)"?/\1/')
    else
      set context (cat ~/.kube/config | grep "current-context:" | sed -E 's/current-context: "?([^"]*)"?/\1/')
    end
  end

  if test -n "$KUBECTL_NAMESPACE"
    set namespace $KUBECTL_NAMESPACE
  else
    test -n "$context"; and set namespace "default"
  end



  test -n "$config"; and set prompt $prompt $config
  test -n "$context"; and set prompt $prompt $context
  test -n "$namespace"; and set prompt $prompt $namespace

  set prompt (string join "/" $prompt)
  if test -n "$prompt"
    echo " "(set_color -o blue)‹(string join "/" $prompt)› 
  end
end

function __openstack_context
  if not set -q OS_REGION_NAME
    if not set -q OS_PROJECT_DOMAIN_NAME
      if not set -q OS_PROJECT_NAME
        return
      end
    end
  end

  set -q OS_REGION_NAME; or set -l OS_REGION_NAME ..
  set -q OS_PROJECT_DOMAIN_NAME; or set -l OS_PROJECT_DOMAIN_NAME ..
  set -q OS_PROJECT_NAME; or set -l OS_PROJECT_NAME ..
  set -l OS_PROMPT $OS_REGION_NAME\|$OS_PROJECT_DOMAIN_NAME\|$OS_PROJECT_NAME
  set -q OS_PROJECT_ID; and set -l OS_PROMPT $OS_REGION_NAME\|$OS_PROJECT_ID

  echo " "(set_color -o yellow)\[$OS_PROMPT\] 
end

function fish_prompt2
  set -gx __fish_git_prompt_showdirtystate true
  set -gx __fish_git_prompt_showcolorhints true

  echo -n -s (set_color -o cyan)(basename (prompt_pwd)) (__fish_git_prompt) (__openstack_context) " " (u8s prompt) (set_color normal) " "
end

function fish_prompt
  set -l normal (set_color normal)

  echo -n -s (set_color $color_cwd) (prompt_pwd) $normal " " (u8s prompt) $normal " > "
end
