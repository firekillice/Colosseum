FROM ubuntu:18.04

RUN apt-get update && apt-get install -y libc6-i386 binutils

COPY linux64.hla.tar.gz /workpath/linux64.hla.tar.gz
RUN cd /workpath && tar xzvf /workpath/linux64.hla.tar.gz 

ENV hlainc /workpath/usr/hla/include/
ENV hlalib /workpath/usr/hla/hlalib
ENV PATH="$PATH:/workpath/usr/hla"

COPY hw.hla /workpath/hw.hla
