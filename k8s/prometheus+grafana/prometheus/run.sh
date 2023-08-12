## add repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

#helm upgrade pvp-prometheus --kubeconfig ../k8s.kubeconfig --namespace bq-t4 --values ./values.yml prometheus-community/prometheus
#helm install pvp-prometheus --kubeconfig ../k8s.kubeconfig --namespace bq-t4 --values ./values.yml prometheus-community/prometheus

helm uninstall  --kubeconfig ../k80.kubeconfig  pvp-prometheus --namespace bq-t4
