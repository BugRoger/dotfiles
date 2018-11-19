function OD
  if test (count $argv) -gt 0
    set -gx OS_PROJECT_DOMAIN_NAME $argv[1]
    echo "Openstack domain is now $argv[1]"
  else
    set -u OS_PROJECT_DOMAIN_NAME
    echo "Openstack domain has been removed"
  end
end


