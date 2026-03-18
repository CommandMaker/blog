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

.PHONY: composer-install
composer-install:
	@$(de) php composer install

.PHONY: composer-require
composer-require:
	@$(de) php composer require $(RUN_ARGS)

.PHONY: composer-require-dev
composer-require-dev:
	@$(de) php composer require $(RUN_ARGS) --dev

.PHONY: seed
seed:
	@$(de) php bin/console doctrine:migrations:migrate -q
	@$(de) php bin/console doctrine:fixtures:load -q

.PHONY: update-schemas
update-schemas:
	@$(de) php bin/console doctrine:schema:update --force

.PHONY: create-db
create-db:
	@$(de) php bin/console doctrine:database:create

.PHONY: migration
migration:
	@$(de) php bin/console make:migration

.PHONY: migrate
migrate:
	@$(de) php bin/console doctrine:migrations:migrate
