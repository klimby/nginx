#!/usr/bin/make
# Makefile readme (ru): <http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html>
# Makefile readme (en): <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>
SHELL = /bin/sh

docker_bin := $(shell command -v docker 2> /dev/null)

PREFIX := klimby

.DEFAULT_GOAL := help

.PHONY: help build push create up down enter

--------------------: ## --------------------

help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

--------------------: ## --------------------


build: create push ## Create and send to hub

push: ## Send to docker hub
	$(docker_bin) push $(PREFIX)/nginx:1.21
	$(docker_bin) push $(PREFIX)/nginx:latest

create: ## Create image
	$(docker_bin) build -t $(PREFIX)/nginx:1.21 -t $(PREFIX)/nginx:latest .

--------------------: ## --------------------

up: ## Start test compose
	@$(docker_bin) compose -f ./docker-nginx/docker-compose.yml up

down: ## Stop test compose, delete db data
	@$(docker_bin) compose -f ./docker-nginx/docker-compose.yml down

enter: ## Enter in container
	@$(docker_bin)  exec -i -t  nginx-test /bin/sh


