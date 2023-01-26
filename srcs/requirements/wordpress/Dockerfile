FROM debian:buster
ENV MDB_USER=${MDB_USER}
ENV MDB_ROOT_PASSWORD=${MDB_ROOT_PASSWORD}
ENV MDB_PASSWORD=${MDB_PASSWORD}
ENV MDB_DATABASE=${MDB_DATABASE}
ENV MDB_HOST=${MDB_HOST}

RUN apt-get update -y && \
	mkdir /run/php && \
	apt-get install php7.3 php-mysqli php-fpm wget -y

RUN mkdir -p /var/www/html && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	useradd -ms /bin/bash gchatain
COPY /config/run.sh /
COPY /config/www.config /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod +x /run.sh

EXPOSE 9000
ENTRYPOINT [ "/run.sh"]

