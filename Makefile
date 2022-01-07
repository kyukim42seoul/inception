YAML = -f srcs/docker-compose.yml

all :
	@./srcs/makedir.sh
	@docker-compose $(YAML) up --build -d

nginx :
	@docker-compose $(YAML) up --build -d nginx

mariadb :
	@docker-compose $(YAML) up --build -d mariadb

wordpress :
	@docker-compose $(YAML) up --build -d wordpress

clean :
	@docker-compose $(YAML) down

fclean :
	@docker-compose $(YAML) down --rmi all
	@docker volume rm srcs_DB
	@docker volume rm srcs_WordPress
