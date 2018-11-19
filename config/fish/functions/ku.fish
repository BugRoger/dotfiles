function ku 
  if test (count $argv) -gt 0
    set -gx KUBECTL_CONTEXT $argv[1]
    echo "Context is now $argv[1]"
  else
    set -u KUBECTL_CONTEXT
    echo "Context has been removed"
  end
end
