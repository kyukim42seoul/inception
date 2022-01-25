# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kyukim <kyukim@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/25 16:43:01 by kyukim            #+#    #+#              #
#    Updated: 2022/01/25 16:59:06 by kyukim           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

YAML = -f srcs/docker-compose.yml

all :
	@cp -rp srcs/hosts /etc
	@./srcs/makedir.sh
	@docker-compose $(YAML) up --build -d

clean :
	@docker-compose $(YAML) down

fclean :
	@docker-compose $(YAML) down --rmi all
	@docker volume rm srcs_DB srcs_WordPress
	@docker network rm srcs_Br1