FROM debian:buster as builder
RUN apt-get update && apt-get upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y
COPY ./config/html.conf /etc/nginx/sites-available/default
RUN mkdir -p /etc/nginx/ssl && openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=FR/ST=Rhone/L=Lyon/O=42/CN=gchatain.42.fr/emailAddress=gchatain@student.42lyon.fr" \
	-keyout /etc/nginx/ssl/gchatain.42.fr.key -out /etc/nginx/ssl/gchatain.42.fr.crt


EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]