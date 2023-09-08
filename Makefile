name = inception

all:
	@printf "Launch configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@printf "Building configuration ${name}...\n"
	mkdir /home/hed-diou/data/mariadb
	mkdir /home/hed-diou/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker volume rm srcs_wordpress_volume
	@docker volume rm srcs_mariadb_volume
	@docker system prune -af
	sudo rm -rf /home/hed-diou/data/wordpress
	sudo rm -rf /home/hed-diou/data/mariadb

.PHONY	: all build down clean