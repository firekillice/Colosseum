helm repo add metallb https://metallb.github.io/metallb

kubectl create namespace metallb
helm install metallb metallb/metallb --kubeconfig=/var/lib/k0s/pki/admin.conf --namespace=metallb -f values.yaml
#helm uninstall metallb --kubeconfig=/var/lib/k0s/pki/admin.conf
