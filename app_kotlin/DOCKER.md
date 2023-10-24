## Dockerfile best practices used

### Multi-stage Dockerfile

I used multi-stage dockerfile to divide process of building and running to different steps that runs on a different base
images. In the `build` stage:

```
FROM maven:3.8.4-openjdk-17-slim AS build
...
```

I build the application, then pass it to the `Run` stage, copying ready `.jar` file target to another image base where I
can run it.

```
FROM openjdk:17-alpine
COPY --from=build /home/testuser/target/lab1-0.0.1-SNAPSHOT.jar /usr/local/lib/lab1.jar
```

### User and permissions

I also created a default user with home directory and all needed permissions:

```
RUN useradd -ms /bin/bash testuser
RUN chown testuser /home/testuser
```

I also copied all the needed data to its home directory and set it as default one:

```
WORKDIR /home/testuser
COPY . /home/testuser
USER testuser
```

### EXPOSE

I also added the `EXPOSE` instruction
that ["functions as a type of documentation between the person who builds the image and the person who runs the container"](https://docs.docker.com/engine/reference/builder/#expose)

### DOCKERIGNORE

I also added `.dockerignore` file and listed files and directories redundant for build. This would reduce build cost and security risks.