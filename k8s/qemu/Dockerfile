FROM ubuntu:focal

# include manual pages and documentation
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
  yes | unminimize


RUN apt-get install -y qemu

RUN apt-get install -y qemu-kvm virt-manager bridge-utils

RUN apt-get install -y gtk+3
