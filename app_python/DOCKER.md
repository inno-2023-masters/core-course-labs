## Dockerfile best practices used

### User and permissions

I created a default user with home directory:

```
RUN useradd -ms /bin/bash testuser
```

and granted it required permissions to run the application:

```
RUN chown testuser /home/testuser
RUN chown testuser db.sqlite3
```

I also copied all the needed data to its home directory:

```
WORKDIR /home/testuser
COPY . /home/testuser
```

and set this user as the default one:

```
USER testuser
```

Now, when I connect to the container by `docker exec -it <container_id> /bin/bash` I log in as `testuser` with limited
permissions and start from the home directory of the user (`/home/testuser`)

### EXPOSE

I also added the `EXPOSE` instruction that ["functions as a type of documentation between the person who builds the image
and the person who runs the container"](https://docs.docker.com/engine/reference/builder/#expose)


### DOCKERIGNORE

I also added `.dockerignore` file and listed files and directories redundant for build. This would reduce build cost and security risks.