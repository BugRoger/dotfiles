function fish_right_prompt
  set -l red (set_color -o red)
  set -l normal (set_color normal)

  echo "$normal$status$red ↵$normal"
end
