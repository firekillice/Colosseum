kubectl create -f ./nginx/go-svc.yaml
kubectl create -f ./nginx/nginx-svc.yaml
kubectl create -f ./nginx/nginx-php-deployment.yaml

kubectl create -f ./mongo/mongo-svc.yaml
kubectl create -f ./mongo/mongo-statefulset.yaml


kubectl create -f ./redis/redis-pv.yaml
kubectl create -f ./redis/redis-pvc.yaml
kubectl create -f ./redis/redis-svc.yaml
kubectl create -f ./redis/redis-deployment-7478.yaml


