# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gchatain <gchatain@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/07 17:26:19 by gchatain          #+#    #+#              #
#    Updated: 2023/01/21 13:37:10 by gchatain         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

start:
	@echo "Starting docker containers..."
	@docker-compose -f srcs/docker-compose.yml up -d 

stop:
	@echo "Stopping docker containers..."
	@docker-compose -f srcs/docker-compose.yml  down

restart:
	@echo "Restarting docker containers..."
	@docker-compose -f srcs/docker-compose.yml  restart

build:
	@echo "Building docker containers..."
	@docker-compose -f srcs/docker-compose.yml build

clean:
	@echo "Cleaning docker containers..."
	@docker-compose -f srcs/docker-compose.yml down --rmi all
	@docker system prune --all --force
	@docker volume prune --force
	# @rm -rf srcs/wordpress/content
	# @rm -rf srcs/mariadb/content

re : clean build start

.PHONY: start stop restart build clean
