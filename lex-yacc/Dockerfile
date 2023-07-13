
FROM ubuntu:18.04

MAINTAINER derofim

# https://askubuntu.com/a/1013396
# RUN export DEBIAN_FRONTEND=noninteractive
# Set it via ARG as this only is available during build:
ARG DEBIAN_FRONTEND=noninteractive

# how many cores to use for compilation
ARG BUILD_CORES=4

ARG version=4.7.2

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

ARG APT="apt-get -qq --no-install-recommends"

# https://www.peterbe.com/plog/set-ex
RUN set -ex

RUN $APT update

RUN $APT install -y flex bison vim
RUN $APT install -y gcc libfl-dev
RUN $APT install -y libc6-dev
