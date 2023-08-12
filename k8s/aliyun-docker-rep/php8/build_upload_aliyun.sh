#!/bin/bash

REP_CLOUD=registry.cn-hangzhou.aliyuncs.com/sandstone/php8:v-game-1.0.1
docker build -t php8-k3s:1.0.0 .

docker login --username=wang70bin@163.com  --password=123qweasd registry.cn-hangzhou.aliyuncs.com

docker tag php8-k3s:1.0.0 $REP_CLOUD

docker push $REP_CLOUD
