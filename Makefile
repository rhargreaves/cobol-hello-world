DOCKER_IMAGE=cobol-hello-world

cobc-build:
	docker build -t $(DOCKER_IMAGE) .

helloworld-exe: helloworld.cbl cobc-build
	docker run \
		-it \
		-w /app \
		-v $(PWD):/app \
		$(DOCKER_IMAGE) \
		-free \
		-x \
		-o helloworld-exe \
		helloworld.cbl

build: helloworld-exe

run:
	@docker run \
		-it \
		-w /app \
		-v $(PWD):/app \
		--entrypoint=/app/helloworld-exe \
		$(DOCKER_IMAGE)

.PHONY: cobc-build build run


