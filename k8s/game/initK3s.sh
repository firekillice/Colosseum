#!/bin/bash

kubectl delete configmap --all

#kubectl create configmap nginx-conf-d-rock-mongo-conf --from-file ./nginx/conf/conf.d/rock-mongo.conf
#kubectl create configmap nginx-conf-d-game-conf --from-file ./nginx/conf/conf.d/game.conf
#kubectl create configmap nginx-conf-d-manage-conf --from-file ./nginx/conf/conf.d/manage.conf
#kubectl create configmap nginx-conf-d-upstream-php-conf --from-file ./nginx/conf/conf.d/upstream_php-fpm.conf


kubectl create configmap nginx-base-config --from-file=./nginx/conf
kubectl create configmap nginx-game-config --from-file=./nginx/conf/conf.d

kubectl create configmap nginx-rock-config --from-file=./nginx/rock/config.php

kubectl create configmap server-game-config --from-file=./server/config
kubectl create configmap server-game-go-config --from-file=./server/go/config

#kubectl create configmap nginx-server-conf --from-file ./nginx/conf/server.conf
#kubectl create configmap nginx-nginx-conf --from-file ./nginx/conf/nginx.conf
#kubectl create configmap nginx-fcgi-conf --from-file ./nginx/conf/fcgi.conf

kubectl create configmap redis-conf --from-file ./redis/redis.conf

kubectl create configmap mongodb-setup-script --from-file ./mongo/setup.sh

kubectl apply -f ./mongo/mongo-cm.yaml


kubectl get configmap
