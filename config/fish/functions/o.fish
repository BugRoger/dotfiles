function O
  if test (count $argv) -gt 0
    set -gx OS_REGION_NAME $argv[1]
    set -gx OS_AUTH_URL https://identity-3.$argv[1].cloud.sap/v3 
    set -gx OS_USERNAME $USER
    set -gx OS_PASSWORD (security find-generic-password -a $USER -s openstack -w)
  else
    set -e OS_AUTH_URL
    set -e OS_REGION_NAME 
    set -e OS_PROJECT_DOMAIN_NAME 
    set -e OS_PROJECT_NAME 
    set -e OS_PROJECT_ID
    set -e OS_PASSWORD
    set -e OS_USERNAME 
    set -e OS_USER_DOMAIN_NAME
  end

  if test (count $argv) -eq 2
    set -gx OS_PROJECT_ID $argv[2]
    set -e OS_PROJECT_NAME 
    set -e OS_PROJECT_DOMAIN_NAME 
  end

  if test (count $argv) -gt 2
    set -e OS_PROJECT_ID
    set -gx OS_PROJECT_DOMAIN_NAME $argv[2]
    set -gx OS_PROJECT_NAME $argv[3]
    set -gx OS_USER_DOMAIN_NAME $argv[2]
  end
end
