.PHONY: run
run:
	docker-compose up

.PHONY: down
down:
	docker-compose down

.PHONY: build
build:
	docker-compose build

.PHONY: bash
bash:
	docker-compose run --rm web bash

.PHONY: install
install:
	docker-compose run --rm web bundle install

.PHONY: db-reset
db-reset:
	docker-compose run --rm web bundle exec rails db:create rp:apply

.PHONY: init
init:
	@make build
	@make install
	@make db-reset
