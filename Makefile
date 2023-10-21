DOCKERCOMP_FILE = ./srcs/docker-compose.yml


all:
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb
	docker-compose $(FLAGS) -f ${DOCKERCOMP_FILE} build
	docker-compose $(FLAGS) -f ${DOCKERCOMP_FILE} up

clean:
	docker-compose $(FLAGS) -f ${DOCKERCOMP_FILE} down

fclean:
	- docker stop $(shell docker ps -qa)
	- docker rm $(shell docker ps -qa)
	- docker rmi -f $(shell docker images -qa)
	- docker volume rm $(shell docker volume ls -q)
	- docker network rm $(shell docker network ls -q)

re: fclean all

.PHONY: all clean fclean re