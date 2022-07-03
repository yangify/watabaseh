DC = docker-compose

up:
	$(DC) up -d --build

build:
	$(DC) build -d

down:
	$(DC) down --remove-orphan

service:
	$(DC) up -d --build service