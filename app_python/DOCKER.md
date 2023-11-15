# Docker Best Practices for FastAPI application

* Use `COPY` instead of `ADD` to copy files into the container
* Run from non-root user for better security
* Add `EXPOSE` that indicates the ports on which a container listens for connections
* Use `alpine` to build and deploy lightweight application
* Apply `hadolint` - linter that helps you build best practice Docker images