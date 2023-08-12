#!/bin/bash

REP_CLOUD=registry.cn-hangzhou.aliyuncs.com/sandstone/nginx:v-game-1.0.0
docker build -t nginx-k3s:1.0.0 .

docker login --username=wang70bin@163.com  --password=123qweasd registry.cn-hangzhou.aliyuncs.com

docker tag nginx-k3s:1.0.0 $REP_CLOUD

docker push $REP_CLOUD

