#!/bin/bash

#git clone https://github.com/firekillice/chickadee.git
#cd chickadee/docker
#docker build . -t chickadee:v0

REP_CLOUD=registry.cn-hangzhou.aliyuncs.com/sandstone/chickadee:v1.0.0

docker login --username=wang70bin@163.com  --password=123qweasd registry.cn-hangzhou.aliyuncs.com

docker tag chickadee:v0 $REP_CLOUD

docker push $REP_CLOUD

#### Usage
#docker run --rm -it -v `pwd`:/app chickadee:v0 /bin/bash
# cd /app; make run
