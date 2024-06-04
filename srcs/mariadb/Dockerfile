FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install mariadb-server

COPY ./config /etc/mysql/mariadb.consf.d/50-serveur.cnf

#scrpit.sh
COPY ./script.sh /script.sh
RUN chmod 755 /script.sh

EXPOSE 3306

ENTRYPOINT [ "bash", "/script.sh" ]

CMD [ "mysqld_safe" ]
