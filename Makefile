# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: silim <silim@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/27 22:10:12 by silim             #+#    #+#              #
#    Updated: 2022/04/05 12:14:19 by silim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME=/home/${HOST}
HOST=silim
HOSTS_DIR=/etc/hosts

all: down hosts volumes build up

hosts:
		@echo "set host to ${HOST}..."
		@sudo sed -i "s/localhost/${HOST}.42.fr/g" /etc/hosts

build:
		docker-compose -f srcs/docker-compose.yml build

up:
		docker-compose -f srcs/docker-compose.yml up -d --remove-orphans

down:
		docker-compose -f srcs/docker-compose.yml down
		@sudo sed -i "s/${HOST}.42.fr/localhost/g" /etc/hosts

volumes:
		@echo "create volume folders on ${HOME}..."
		sudo mkdir -p $(HOME)/data/db_data $(HOME)/data/wp_data

clean: down
		@echo "remove remaining data..."
		docker rmi	mariadb wordpress nginx
		rm -rf $(HOME)/data
		docker system prune -a

re:		down clean all

.PHONY:	 all build up down clean re
