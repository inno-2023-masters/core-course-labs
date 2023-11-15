# Docker.md

Ive used such best practices in my Dockerfile:

- Use official images
  - Ive used official python image with fixed version as base image
- Multi stage building
  - Multi stage building is used to reduce image size and remove unnecessary files from final image that can be used to attack container
- Combine RUN instructions
  - Combined RUN instructions can reduce number of layers in image
- Using entrypoint
  - Entypoint is used to configure container before running application. For example, in my case, I am activating virtual environment
- Use COPY instead of ADD

Docker image can be found here: https://hub.docker.com/repository/docker/platun0v/devops-lab2/general
