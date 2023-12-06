# Docker information

### Best practices applied:

* Mutli-stage build.
For any Java/Kotlin application you have to build application firstly and only then run it.
So, in the first stage I build it with **Gradle** and in the second stage I run it with **Java**.
* Point tag explicitly. I have no used `latest` in my image, and point app version as a tag.
* No root user. Application is started with new no-root user inside the container.
* Vulnerability scanning. I have use **Trivy** to scan image vulnerabilities. The resul is that the image has only LOW/MEDIUM level vulnerabilities.
* Use linter for `Dockerfile`. I have used Intellij IDEA plugin **Docker** for lint.
* Use `.dockerignore`.
* Use official images.
* Use less-size base images. I have used `eclipse-temurin:17-jdk`.
* Place commands in the correct order for caching. 
* Use `COPY` instead `ADD` when no unarchive is needed.
* Make sure there is one process per container.
* Use `ENTRYPOINT` instead of `CMD` for process entrypoint.
