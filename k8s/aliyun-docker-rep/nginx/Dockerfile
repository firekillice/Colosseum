FROM nginx:latest

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list 
RUN apt-get clean && apt-get update && apt-get install -y procps net-tools vim inetutils-ping
