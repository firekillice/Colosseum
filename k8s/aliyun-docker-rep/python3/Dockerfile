FROM rackspacedot/python37:latest

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
&& apt-get clean && apt-get update

RUN apt-get install -y libsasl2-modules-ldap libz-dev \
&& pip3 install xlrd openpyxl  xlwt

COPY ./servers /root/.subversion/servers

RUN svn info svn://122.14.46.103/server3/commonTables/commonTables_master --username bin.wang  --password bornfish  --non-interactive

RUN apt-get install -y locales locales-all 
RUN pip3 install xlrd==1.2.0
