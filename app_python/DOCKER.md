# Best Practices Applied

- **Small Base Image**: Utilized the `python:alpine` base image to create a minimalistic image containing only the necessary requirements for the application.

- **Official Images**: Employed an official and well-maintained Python image.

- **Version Tagging**: Specified a version tag for the base image to ensure stability and prevent potential issues caused by automatic updates.

- **Non-Root User**: Established a non-root user with appropriate ownership and permissions to enhance security by minimizing unnecessary privileges.

- **Custom Port**: Utilized a custom port for the application to mitigate port conflicts.

- **Metadata Labels**: Incorporated metadata labels as per the OCI image specification to facilitate image management.

- **.dockerignore File**: Employed a `.dockerignore` file to exclude unnecessary files from the image build process.

- **Docker Linter**: Utilized the Haskell Dockerfile Linter (hadolint) to identify and address any issues with the Dockerfile's writing style.

- **Healthcheck**: Implemented a healthcheck mechanism to verify the availability of the main server page at regular 30-second intervals.

- **Layer sanity**: Grouped multiple commands together to reduce number of layers.