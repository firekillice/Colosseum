kubectl create secret docker-registry aliyun-secret --docker-server=registry.cn-hangzhou.aliyuncs.com --docker-username=wang70bin@163.com --docker-password=123qweasd

kubectl create sa aliyun

kubectl patch serviceaccount aliyun -p '{"imagePullSecrets": [{"name": "aliyun-secret"}]}'
