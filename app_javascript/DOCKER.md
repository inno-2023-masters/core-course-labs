# Docker Best Practices for Svelte application

* Use `alpine` to build and deploy lightweight application
* Run from non-root user for better security
* Use `COPY` instead of `ADD` to copy files into the container
* Apply `hadolint` - linter that helps you build best practice Docker images
  
