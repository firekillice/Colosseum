#!/bin/bash

REP_CLOUD=registry.cn-hangzhou.aliyuncs.com/sandstone/java-bi:v-1.0.1
docker build -t java-bi:1.0.0 .

docker login --username=wang70bin@163.com  --password=123qweasd registry.cn-hangzhou.aliyuncs.com

docker tag java-bi:1.0.0 $REP_CLOUD

docker push $REP_CLOUD
