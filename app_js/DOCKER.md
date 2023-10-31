# Docker best practices used

- Set a non-root user
- `docker scout quickview` for scanning vulnerabilities
- Use a non-root base image (e.g., Node's official image)
- Use trusted base images
- Multi-stage builds to reduce image size
- Copy only the necessary files needed for the build
- Layer sanity
- Use a slim image for the final production image
- Lint dockerfile
- Use `.dockerignore` to exclude unnecessary files
