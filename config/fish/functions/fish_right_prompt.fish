function fish_right_prompt
  #Save the return status of the previous command
  set stat $status

  set -l red (set_color -o red)
  set -l normal (set_color normal)

  echo "$normal$stat$red ↵$normal"
end
