YAML = -f srcs/docker-compose.yml

all :
	@docker-compose $(YAML) up --build -d

clean :
	@docker-compose $(YAML) down

fclean : clean
	docker rmi $(docker images -q)
