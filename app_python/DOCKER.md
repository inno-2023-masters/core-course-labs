# Dockerfile 

`Dockerfile` is used to create a Docker image for a Python application.

## Best Practices

1. A new user is created and used not in the container. No root user.

2. The `WORKDIR` specifies the working directory to `/app`. 

3. The `/app` directory is set to the new user.

4. The `EXPOSE` sets the port (`5000`) the application listen to.

5. The `CMD` starts the app.

6. The `.dockerignore` is added not to copy unnecessary files.