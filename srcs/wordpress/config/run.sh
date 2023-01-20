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
wp config create --dbname=$MDB_DATABASE --dbuser=$MDB_USER --dbpass=$MDB_PASSWORD --dbhost=$MDB_HOST --allow-root --path=/var/www/html/wordpress --skip-check
wp core install --url=gchatain.42.fr --title=inception --admin_user=root --admin_password=root --admin_email=gchatain@localhost --allow-root --path=/var/www/html/wordpress
$@ 