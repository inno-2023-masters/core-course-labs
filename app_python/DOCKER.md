# Docker Best Practices

- **Set a non-root user**: Change user from root

- **Use an Explicit Base Image Tag**: It's a good practice to use a specific tag for the base image (e.g., python:3.10) instead of the default latest. This ensures consistency and prevents unexpected changes when the base image is updated.

- **Combine RUN Commands**: Combine multiple RUN commands into a single one to reduce the number of image layers, which makes the image smaller and build faster.

- **Clean Up After Installations**: After installing packages, it's a good practice to remove any unnecessary files to reduce the image size.

- **Use COPY with Requirements First**: Copy the requirements.txt file separately and install dependencies before copying the rest of the project files. This way, Docker can take advantage of caching for dependency installation.

- **Prefer COPY Over ADD**

- **Documentation**: Include comments and documentation to explain the purpose of each section in your Dockerfile.
