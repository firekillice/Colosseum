
echo ====================================secret==================================================================
kubectl config view --raw -o=jsonpath='{.clusters[0].cluster.certificate-authority-data}' | base64 --decode
echo ======================================================================================================


kubectl delete -f sa-gitlab.yaml -f crb-gitlab.yaml 

kubectl create -f sa-gitlab.yaml -f crb-gitlab.yaml 

SECRET=$(kubectl -n kube-system get secret | grep gitlab-admin | awk '{print $1}')


TOKEN=$(kubectl -n kube-system get secret $SECRET -o jsonpath='{.data.token}' | base64 --decode)

echo ==========================================token=============================================================
echo $TOKEN
echo =======================================================================================================
