function OP 
  if test (count $argv) -gt 0
    set -gx OS_PROJECT_NAME $argv[1]
    echo "Openstack project is now $argv[1]"
  else
    set -u OS_PROJECT_NAME
    echo "Openstack project has been removed"
  end
end
