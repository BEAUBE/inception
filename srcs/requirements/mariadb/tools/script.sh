#!/bin/bash

if [ ! -d /var/lib/mysql/dbception ]; then
    mysql_install_db --user=mysql --ldata=/var/lib/mysql/dbception

    mysqld_safe --skip-networking &
    sleep 10

    mysql=( mysql -uroot )
    "${mysql[@]}" <<-EOSQL
        CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
        CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASS}';
        GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASS}';
        FLUSH PRIVILEGES;
EOSQL

    mysqladmin -uroot shutdown
fi

exec mysqld --bind-address=0.0.0.0
