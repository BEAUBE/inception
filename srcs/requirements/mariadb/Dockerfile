FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install mariadb-server

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/mariadb.conf

COPY tools/script.sh /usr/local/bin/script.sh
RUN chmod 755 /usr/local/bin/script.sh

EXPOSE 3306

ENTRYPOINT ["bash", "/usr/local/bin/script.sh"]
