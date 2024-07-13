FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get -y update && apt-get -y upgrade && apt-get -y install nginx

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y

RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

COPY tools/script.sh /usr/local/bin/script.sh
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT ["bash", "/usr/local/bin/script.sh"]
