YAML = -f srcs/docker-compose.yml

all :
	@docker-compose $(YAML) up --build -d

clean :
	@docker-compose $(YAML) down

fclean :
	@docker-compose $(YAML) down --rmi all
