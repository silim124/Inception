# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: silim <silim@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/27 22:10:12 by silim             #+#    #+#              #
#    Updated: 2022/04/05 02:05:04 by silim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME=/home/${HOST}
HOST=silim
HOSTS_DIR=/etc/hosts

all: clean hosts volumes build up

hosts:
		@echo "set host to ${HOST}..."
		@sudo sed -i "s/localhost/${HOST}.42.fr/g" /etc/hosts

build:
		docker-compose -f srcs/docker-compose.yml build --no-cache

up:
		docker-compose -f srcs/docker-compose.yml up -d --remove-orphans

down:
		docker-compose -f srcs/docker-compose.yml down -v
		@sudo sed -i "s/${HOST}.42.kr/localhost/g" /etc/hosts

volumes:
		@echo "create volume folders on ${HOME}..."
		sudo mkdir -p $(HOME)/data/db_data $(HOME)/data/wp_data

clean: down
		@echo "remove remaining data..."
		docker rmi			mariadb wordpress nginx

fclean: clean
		docker volume rm	db_data wp_data

re:		down fclean all

.PHONY:	 all build up down clean fclean re
