# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gchatain <gchatain@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 18:16:16 by gchatain          #+#    #+#              #
#    Updated: 2023/01/20 14:38:09 by gchatain         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash 
wp core download --allow-root --path=/var/www/html/wordpress
wp config create --dbcharset=utf8mb4 --dbname=$MDB_DATABASE --dbuser=$MDB_USER --dbpass=$MDB_PASSWORD --dbhost=$MDB_HOST --allow-root --path=/var/www/html/wordpress --skip-check
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=gchatain@student.42lyon.fr --allow-root --path=/var/www/html/wordpress
php-fpm7.3 -F