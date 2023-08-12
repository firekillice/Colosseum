FROM php:8.0-fpm

ENV XHPROF_DATA_PATH /data/xhprof

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list 

RUN apt-get update \
&& apt-get install -y libyaml-dev libcurl4-openssl-dev libssl-dev  libevent-dev wget procps net-tools vim inetutils-ping zlib1g-dev libzip-dev

RUN docker-php-ext-install sockets

RUN pecl install yaml-2.2.1 \
&& pecl install mongodb-1.11.1 \
&& pecl install redis-5.3.4 \
&& pecl install xhprof-2.3.4 \
&& docker-php-ext-enable redis mongodb yaml xhprof \
&& docker-php-ext-install opcache \
&& docker-php-ext-install pcntl \
&& docker-php-ext-install zip

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
&& sed -i 's/memory_limit\s*=.*/memory_limit=1024M/g' /usr/local/etc/php/php.ini \
&& sed -i 's/~E_DEPRECATED & ~E_STRICT/~E_NOTICE/g' /usr/local/etc/php/php.ini \
&& sed -i 's/;date.timezone =/date.timezone = Asia\/Shanghai/g' /usr/local/etc/php/php.ini \
&& sed -i 's/;slowlog = /slowlog = \/logs\/php-slow.log/g' /usr/local/etc/php-fpm.d/www.conf \
&& echo opcache.jit=1255 >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
&& echo opcache.jit_buffer_size=100M >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
&& echo "xhprof.output_dir = ${XHPROF_DATA_PATH}" >> /usr/local/etc/php/conf.d/docker-php-ext-xhprof.ini  \
&& sed -i 's/upload_max_filesize =/upload_max_filesize = 50M/g' /usr/local/etc/php/php.ini
