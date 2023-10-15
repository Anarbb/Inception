DOCKERCOMP_FILE = ./srcs/docker-compose.yml


all:
	docker-compose $(FLAGS) -f ${DOCKERCOMP_FILE} build
	docker-compose $(FLAGS) -f ${DOCKERCOMP_FILE} up

clean:
	docker-compose $(FLAGS) -f ${DOCKERCOMP_FILE} down
	docker-compose $(FLAGS) -f $(BONUSDOCKERCOMP_FILE) down

fclean:
	docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

re: fclean all