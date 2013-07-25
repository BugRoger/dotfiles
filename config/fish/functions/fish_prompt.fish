function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function _rbenv_version
  if type -P rbenv >/dev/null
    echo (rbenv version-name | sed -e 's/ .*//')
  end
end

function fish_prompt

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l green (set_color -o green)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_rbenv_version) ]
    set ruby_info (_rbenv_version)
    set ruby_info " $red‹$ruby_info›"
  end

  if [ (_git_branch_name) ]
    set git_info $yellow(_git_branch_name)

    if [ (_is_git_dirty) ]
      set indicator "$red ✗"
    else
      set indicator "$green ✔"
    end

    set git_info " $yellow‹$git_info$indicator$yellow›"
  end

  if type -P autojump >/dev/null
    autojump -a $PWD > /dev/null &
  end

  echo -n -s $arrow $cwd $ruby_info $git_info $normal ' '
end

