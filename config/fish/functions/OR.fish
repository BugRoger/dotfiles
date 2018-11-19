function OR 
  if test (count $argv) -gt 0
    set -gx OS_REGION_NAME $argv[1]
    echo "Openstack region is now $argv[1]"
  else
    set -u OS_REGION_NAME
    echo "Openstack region has been removed"
  end
end
