#!/bin/bash
REP=$1
TAG=$2

REP_CLOUD=registry.cn-hangzhou.aliyuncs.com/sandstone/$REP:$TAG
docker build -t $TAG .

docker login --username=wang70bin@163.com  --password=123qweasd registry.cn-hangzhou.aliyuncs.com

docker tag $TAG $REP_CLOUD

docker push $REP_CLOUD

