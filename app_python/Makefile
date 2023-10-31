DOCKER_USERNAME = kernie
IMAGE_NAME = time-python
TAG = latest

# Build the Docker image
build:
	docker build -t $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG) .

# Run the Docker container
run:
	docker run -p 8000:8000 --name $(IMAGE_NAME) $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)

# Push the Docker image to a registry
push:
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)

# Clean up - remove the local Docker image
clean:
	docker rm $(IMAGE_NAME); docker rmi $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)

# Default target when "make" is run without arguments
default: help

# Help target to display available make targets
help:
	@echo "Available make targets:"
	@echo "  build        - Build the Docker image"
	@echo "  run          - Run the Docker container"
	@echo "  push         - Push the Docker image to a registry"
	@echo "  clean        - Remove the local Docker image"
	@echo "  help         - Display this help message (default target)"

# Prevent conflicts with files of the same name
.PHONY: build run push clean help