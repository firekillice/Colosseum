FROM ubuntu:focal

RUN apt-get update -y 

RUN apt-get install build-essential  -y
RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y gdb
RUN apt-get install nasm -y
RUN apt-get install vim -y

RUN echo 'syntax on' >> /root/.vimrc
RUN echo 'set tabstop=4' >> /root/.vimrc


