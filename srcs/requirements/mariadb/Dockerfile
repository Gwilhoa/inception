FROM debian:buster as builder
RUN apt-get update && apt-get upgrade -y
RUN apt install mariadb-server mariadb-client -y
# RUN chmod 777 /var/lib/mysql
ARG MDB_USER=${MDB_USER}
ARG MDB_ROOT_PASSWORD=${MDB_ROOT_PASSWORD}
ARG MDB_PASSWORD=${MDB_PASSWORD}
ARG MDB_DATABASE=${MDB_DATABASE}
ARG MDB_HOST=${MDB_HOST}
RUN service mysql start && mysql -u root -e "CREATE DATABASE ${MDB_DATABASE};" \
&& mysql -u root -e "CREATE USER '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASSWORD}';" \ 
&& mysql -u root -e "GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_USER}'@'%';" \ 
&& mysql -u root -e "FLUSH PRIVILEGES;" \ 
&& mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MDB_ROOT_PASSWORD}');"
COPY ./config/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
CMD ["mysqld"]