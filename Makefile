userid := $(shell id -u)
groupid := $(shell id -g)
dc := USER_ID=$(userid) GROUP_ID=$(groupid) docker-compose
de := USER_ID=$(userid) GROUP_ID=$(groupid) docker-compose exec
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

.PHONY: up
dev:
	@chmod +x bin/console
	@$(dc) build
	@$(dc) up

.PHONY: seed
seed:
	@$(de) php bin/console doctrine:migrations:migrate -q
	@$(de) php bin/console doctrine:fixtures:load -q


.PHONY: lint
lint:
	@$(de) php ./vendor/bin/phpstan --memory-limit=2G
