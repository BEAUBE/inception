FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nginx openssl

RUN rm -f /etc/nginx/nginx.conf

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

EXPOSE 443

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ajoliet.42.fr/UID=ajoliet"

CMD [ "nginx" , "-g", "daemon off;"]
