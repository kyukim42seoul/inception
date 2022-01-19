YAML = -f srcs/docker-compose.yml

all :
	@./srcs/makedir.sh
	@docker-compose $(YAML) up --build -d

nginx :
	@./srcs/makedir.sh
	@docker-compose $(YAML) up --build -d nginx

mariadb :
	@./srcs/makedir.sh
	@docker-compose $(YAML) up --build -d mariadb

wordpress :
	@./srcs/makedir.sh
	@docker-compose $(YAML) up --build -d wordpress

clean :
	@docker-compose $(YAML) down

fclean :
	@docker-compose $(YAML) down --rmi all
	@docker volume rm srcs_DB
	@docker volume rm srcs_WordPress
