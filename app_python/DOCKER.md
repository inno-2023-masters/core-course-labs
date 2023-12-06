# Dockerfile description

This is a simple Dockerfile for the application. It is based on the latest python 3.11 image. It copies the whole project to the image, installs the dependencies and runs the application.

## Docker best practices used

- Use trasted latest image of python 3.11 as base image. Use a decently low size image, because it will be faster to download, run and would potentially **reduce the attack surface**.

- **Use non-root user** inside the container. It is a good practice to use non-root user inside the container, because it is more secure.

- Although it is saver to copy only the necessary files, it is not possible to do so in this case, without changing the structure of the project. So, I used another best practice - **an extensive `.dockerignore` file** to exclude unnecessary files from the image.

- Layer sanity: place the commands that are less likely to change, and easier to cache, first. So, placing `COPY` comand lower is much better.

- Use `LABEL` to add metadata to the image. It is a good practice to add metadata to the image, so that it is easier to find it later. I added the following labels:

- On the stage on making `Dockerfile` check it with [hadolint](https://github.com/hadolint/hadolint) to make sure that it is written correctly. For me it didn't find any errors.

- Use `HEALTHCHECK` to check if the container is healthy. It is a good practice to use `HEALTHCHECK` to check if the container is healthy. I used the following command:
