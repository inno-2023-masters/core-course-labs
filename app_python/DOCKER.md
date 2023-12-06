### Best practices applied:

* Do not use `alpine` for Python. I have used image ``.
* Point tag explicitly. I have no used `latest` in my image, and point app version as a tag.
* No root user. Application is started with new no-root user inside the container.
* docker scan
* Use linter for `Dockerfile`. I have used PyCharm plugin **Docker** for lint.
* Use `.dockerignore`.
* Use official images.
* Use less-size base images. I have used `eclipse-temurin:17-jdk`.
* Place commands in the correct order for caching. 
* Use `COPY` instead `ADD` when no unarchive is needed.
* Make sure there is one process per container.
* Use `ENTRYPOINT` instead of `CMD` for process entrypoint.
