# Docker Best Practices

1. Using a slim Python image given that don't need the fully blown Python image.
2. Explicitly marking ports with EXPOSE.
3. Installing dependencies listed in the requirements.txt before copying code.
4. GitBash for running the application.
5. The parts of the Dockerfile that rarely change are pushed up to enable successful caching of layers.
6. Removing unnecessary dependencies and files after installation.
7. Using the package versions in the file requirements.txt.
8. Minimizing image layers in the Dockerfile using && to reduce the number of image layers created. 
9. Checking for resource leaks upon completion.
10. Using multi-stage builds for image size optimization.
11. Adding a User which helps reduce potential security threats since the application will run with limited privileges.

## Continuous Integration (CI)
I have set up a CI workflow that automates Docker-related tasks using GitHub Actions. Here's what it does:

- **Docker Login**: The workflow logs in to Docker Hub using securely stored credentials.
- **Docker Build**: It builds a Docker image from the code in this repository.
- **Docker Push**: The built Docker image is pushed to Docker Hub.

This CI workflow is triggered automatically whenever changes are pushed to the `main` branch. It ensures that Docker images are always up to date and available on Docker Hub.
