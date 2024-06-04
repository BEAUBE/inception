#!/bin/bash

# Launch the service
/etc/init.d/mariadb start

# Automatically answers the questionnaire for mysql_secure_installation
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | mysql_secure_installation
	  # Enter current password for root (enter for none):
	y # Switch to unix_socket authentication
	y # Change the root password?
	${SQL_ROOT_PASSWD} # New password:
	${SQL_ROOT_PASSWD} # Re-enter new password:
	y # Remove anonymous users?
	n # Disallow root login remotely? attention oui
	y # Remove test database and access to it?
	y # Reload privilege tables now?
EOF

# Create database, user and updates rights
#service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWD}';"
mysql -e "FLUSH PRIVILEGES;"

# Shutdown the service
mysqladmin -u root -p$SQL_ROOT_PASSWD shutdown

exec "$@"
