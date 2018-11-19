function asr1k_utils
  set -l asrpod (kubectl --context $KUBECTL_CONTEXT --namespace=monsoon3 get pods  -l name=neutron-cisco-asr-agent-01 -o=jsonpath='{.items[0].metadata.name}')
  kubectl --context $KUBECTL_CONTEXT --namespace=monsoon3 exec -ti $asrpod -- /var/lib/openstack/bin/asr1k_utils $argv
end
