# Dockerfile description

This is a simple Dockerfile for the application. It is based on the latest python 3.11 image. It copies the whole project to the image, installs the dependencies and runs the application.

## Docker best practices used

- Use trasted latest image of python 3.11 as base image. Use a decently low size image, because it will be faster to download, run and would potentially **reduce the attack surface**.

- **Use non-root user** inside the container. It is a good practice to use non-root user inside the container, because it is more secure.

- Layer sanity: place the commands that are less likely to change, and easier to cache, first. So, placing `COPY` comand lower is much better.

- Use `LABEL` to add metadata to the image. It is a good practice to add metadata to the image, so that it is easier to find it later. I added the following labels:

- On the stage on making `Dockerfile` check it with [hadolint](https://github.com/hadolint/hadolint) to make sure that it is written correctly. For me it didn't find any errors.

## Docker Multi-Stage Builds for Go

### There are two stages

- First stage downloads the dependencies and builds the application.

- Second stage copies binary file from the first stage and runs it.

This allows to reduce the size of the image, because the first stage is not included in the final image. Besides, it is faster to build the image, because the first stage is cached and it improves the security.
