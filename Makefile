YAML = -f srcs/docker-compose.yml

all :
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
