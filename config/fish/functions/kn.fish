function kn 
  if test (count $argv) -gt 0
    set -gx KUBECTL_NAMESPACE $argv[1]
    echo "Namespace is now $argv[1]"
  else
    set -u KUBECTL_NAMESPACE
    echo "Namespace has been removed"
  end
end


