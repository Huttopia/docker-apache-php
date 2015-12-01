step=-----------------------

# HELP MENU
all: help
help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1.  make build    - Build image"
	@echo "   2.  make start    - Start container"
	@echo "   3.  make state    - Current state container"
	@echo "   4.  make logs     - Print logs container"
	@echo "   5.  make stop     - Stop container"
	@echo "   6.  make remove   - Remove container"
	@echo "   7.  make enter    - Enter in bash to container"
	@echo ""

# Manage
build:
	@echo "$(step) Building $(step)"
	@docker build --tag=huttopia/nginx-php-fpm:latest .

start:
	@echo "$(step) Starting $(step)"
	@docker run --name huttosoft-apache-php -d -it -v $(PWD):/src huttopia/nginx-php-fpm:latest

state:
	@echo "$(step) Current state $(step)"
	@docker ps -a | grep huttosoft-apache-php

logs:
	@echo "$(step) Logs $(step)"
	@docker logs -f huttosoft-apache-php

stop:
	@echo "$(step) Stopping $(step)"
	@docker stop huttosoft-apache-php

remove: stop
	@echo "$(step) Removing $(step)"
	@docker rm huttosoft-apache-php

bash:
	@echo "$(step) Bash $(step)"
	@docker exec -it huttosoft-apache-php bash
