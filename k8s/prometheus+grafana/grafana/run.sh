helm repo add bitnami https://charts.bitnami.com/bitnami
helm install pvp-grafana --kubeconfig ../k8s.kubeconfig --namespace bq-t4 --values ./values.yml bitnami/grafana
