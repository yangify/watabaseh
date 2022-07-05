DC = docker-compose

up:
	$(DC) up -d --build

build:
	$(DC) build -d

down:
	$(DC) down --remove-orphan && docker volume prune -f

service:
	$(DC) up -d --build service