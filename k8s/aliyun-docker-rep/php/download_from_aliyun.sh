#!/bin/bash

REP_CLOUD=registry.cn-hangzhou.aliyuncs.com/sandstone/php:v-game-1.0.0

docker login --username=wang70bin@163.com --password=123qweasd registry.cn-hangzhou.aliyuncs.com

docker pull $REP_CLOUD
