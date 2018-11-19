function __kubectl_context
  set -l context ""
  set -l namespace ""

  if test -n "$KUBECTL_CONTEXT"
    set context $KUBECTL_CONTEXT
  else
    set context (cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
  end

  if test -n "$KUBECTL_NAMESPACE"
    set namespace "/$KUBECTL_NAMESPACE"
  end

  echo " "(set_color -o blue)‹$context$namespace› 
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

function fish_prompt
  set -gx __fish_git_prompt_showdirtystate true
  set -gx __fish_git_prompt_showcolorhints true

  echo -n -s (set_color -o cyan)(basename (prompt_pwd)) (__fish_git_prompt) (__openstack_context) (__kubectl_context) (set_color normal) " "
end
