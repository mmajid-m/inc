all: inception

inception:
	mkdir -p /home/${User}/data/mariadb
	mkdir -p /home/${User}/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all -v --remove-orphans 2>/dev/null || true

fclean: clean
	rm -rf /home/${User}/data/*
	docker rmi -f $$(docker images -a -q) 2> /dev/null || true
	docker volume prune -f

re: fclean all

.PHONY: all clean fclean re
