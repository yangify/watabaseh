DC = docker compose

up:
	$(DC) up -d

down:
	$(DC) down --remove-orphan

rebuild-service:
	$(DC) up -d --build service