FROM debian:buster
ENV MDB_USER=${MDB_USER}
ENV MDB_ROOT_PASSWORD=${MDB_ROOT_PASSWORD}
ENV MDB_PASSWORD=${MDB_PASSWORD}
ENV MDB_DATABASE=${MDB_DATABASE}
ENV MDB_HOST=${MDB_HOST}


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y	\
	curl				\
	php-fpm				\
	php-mysql			\
	php-mbstring		\
	php-zip				\
	php-gd				\
	php-xml				\
	php-pear			\
	php-gettext			\
	php-cgi				


RUN mkdir /run/php
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update --allow-root
RUN mkdir -p /var/www/html/wordpress
COPY /config/run.sh /
COPY /config/www.config /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod +x /run.sh

EXPOSE 9000
ENTRYPOINT [ "/run.sh"]
CMD ["php-fpm7.3", "-F"]

