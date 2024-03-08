all: 
	mkdir -p /home/hinda/data/mariadb
	mkdir -p /home/hinda/data/wordpress
	mkdir -p /home/hinda/data/adminer
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx
	docker logs redis
	docker logs ftp_server
	docker logs adminer
	docker logs hugo
clean:
	docker container stop nginx mariadb wordpress redis ftp_server adminer hugo 
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/hinda/data/mariadb/*
	@sudo rm -rf /home/hinda/data/wordpress/*
	@sudo rm -rf /home/hinda/data/adminer/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean
