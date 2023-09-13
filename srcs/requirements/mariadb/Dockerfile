FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server
RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh /
RUN chmod +x mariadb.sh
EXPOSE 3306
CMD ["/mariadb.sh"]