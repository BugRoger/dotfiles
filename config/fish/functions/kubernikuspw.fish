function kubernikuspw
  set -l context $KUBECONTEXT
  test  (count $argv) -gt 0; and set -l $context $argv[1]

  set -l server (kubectl config view -o jsonpath="{.clusters[?(@.name == \"$context\")].cluster.server}")
  set -l kluster_fqdn (echo $server | sed -n "s!https://\([^.]*\).*!\1!p")
  set -l parent_context (echo $server | sed -n "s!https://[^.]*\.kubernikus\.\([^.]*\)\.cloud\.sap!\1!p")

  echo "Node password for kluster $context ($server):" >&2
  kubectl --context k-$parent_context --namespace kubernikus get secret $kluster_fqdn -o go-template --template='{{index .data "node-password" }}' | base64 -D
end
