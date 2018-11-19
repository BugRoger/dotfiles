function ksh
  test -n "$KUBECTL_CONTEXT"; or set -x KUBECTL_CONTEXT (monsoonctl config current-context)
  ssh "core@$argv[1].cc.$KUBECTL_CONTEXT.cloud.sap"
end


