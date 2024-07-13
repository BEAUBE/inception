FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get -y update && apt-get -y upgrade && apt-get -y install wget php7.4 php-fpm php-mysql mariadb-client

COPY ./conf/wordpress.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
RUN mkdir /run/php
WORKDIR	/var/www/wordpress/

COPY tools/script.sh /usr/local/bin/script.sh
RUN chmod 755 /usr/local/bin/script.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT ["bash", "/usr/local/bin/script.sh"]
