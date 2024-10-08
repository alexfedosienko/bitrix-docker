help: ## Список команд
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run-site: ## Запуск сайта
	docker-compose up -d --build

down-site: ## Остановка сайта
	docker-compose down

restart-site: ## Перезапуск сайта
	make down-site && make run-site

run-traefik: ## Запуск прокси traefik
	docker-compose  --env-file .env -f docker-compose-traefik.yml up -d --build

down-traefik: ## Остановка прокси traefik
	docker-compose  --env-file .env -f docker-compose-traefik.yml down

restart-traefik: ## Перезапуск сайта
	make down-traefik && make run-traefik

default: help
