#!/bin/bash
service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS $db_name;"
mysql -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pass' ;"
mysql -e "CREATE USER IF NOT EXISTS '$reg_user'@'%' IDENTIFIED BY '$reg_pass' ;"
mysql -e "GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_user'@'%' IDENTIFIED BY '$db_pass' ;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_pass' ;"
kill $(cat /var/run/mysqld/mysqld.pid)
mysqld