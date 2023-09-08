FROM debian:buster

RUN apt-get update && apt-get install -y php7.3 php7.3-fpm php7.3-mysql && apt-get install -y curl && apt install -y mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp 

RUN mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/wordpress.sh .

RUN chmod +x wordpress.sh

EXPOSE 9000
WORKDIR /var/www/html

ENTRYPOINT ["/wordpress.sh"]



