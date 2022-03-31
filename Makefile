# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: silim <silim@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/27 22:10:12 by silim             #+#    #+#              #
#    Updated: 2022/03/31 23:54:36 by silim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME=/home/${HOST}
HOST=silim
HOSTS_DIR=/etc/hosts

all: clean hosts volumes build up

hosts:
		@echo "set host to ${HOST}..."
		#@sudo chmod a+w ${HOSTS_DIR}
		#@echo "# This is for Inception Project" >> ${HOSTS_DIR}
		#@echo "127.0.0.1 ${HOST}.42.fr" >> ${HOSTS_DIR}
		#@echo "# This is for Inception Project" >> ${HOSTS_DIR}
		#@sudo chmod a-w ${HOSTS_DIR}

build:
		docker-compose -f srcs/docker-compose.yml build

up:
		docker-compose -f srcs/docker-compose.yml up -d --remove-orphans

down:
		docker-compose -f srcs/docker-compose.yml down -v

volumes:
		@echo "create volume folders on ${HOME}..."
		sudo mkdir -p /home/silim/data/db_data /home/silim/data/wp_data
		sudo mkdir -p $(HOME)/data/db_data $(HOME)/data/wp_data

clean: down
		@echo "remove remaining data..."
		sudo rm -rf $(HOME)/data

fclean: clean
		docker rmi			mariadb wordpress nginx
		docker volume rm	db_data wp_data

re:		down fclean all

.PHONY:	 all build up down clean fclean re
