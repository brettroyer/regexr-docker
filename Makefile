container = regexr
dockerfile = Dockerfile
compose = docker-compose.yml
image_name = "bdr/regexr:3.6.1"

build:
	@echo "Building $(image_name) image"
	@docker build --rm -t $(image_name) -f $(dockerfile) .

run:
	# Automatically remove the container when it exits
	@echo "Create Temporary Container"
	@docker run --rm -p 8084:8080 $(image_name)

sh:
	@docker exec -it $(container) sh
	
bash:
	@docker exec -it $(container) bash

removeall:
	@echo "Removing Images $(image_name)"
	@docker stop $(container)
	@docker rm $(container)
	@docker rmi $(image_name)

tag:
	@echo "TAG IMAGE LATEST..."
	@docker tag $(image_name):3.6.1 $(IMAGE_NAME):latest
