# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gchatain <gchatain@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 18:16:16 by gchatain          #+#    #+#              #
#    Updated: 2023/01/18 18:28:17 by gchatain         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash 
wp config create --dbname=${MDB_DATABASE} --dbuser=${MDB_USER} --dbpass=${MDB_PASSWORD} --dbhost=${MDB_HOST} --allow-root
wp core install --url=gchatain.42.fr --title=inception --admin_user=root --admin_password=root --admin_email=gchatain@localhost --allow-root
$@ 