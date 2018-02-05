bla = $(shell pwd)
build:
	docker build -t docker-postgres-backup .
