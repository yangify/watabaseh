DC = docker compose

up:
	$(DC) up -d

down:
	$(DC) down --remove-orphan

rebuild-spring:
	$(DC) up -d --build service