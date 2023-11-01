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

- **Multistage builds**: Made use of the multistage build functionality to create an intermediate container that contained the file and compilation was done in it to produce the final executable which exists in the final image alone without anything else. 
    Although my usage of multistage is not perfect it still enhances the security of the application by reducing the attack surface, and I also think it reduces the image size although I did not use a scratch image due to some issues I faced where the go app couldn't display moscow time correctly on the site and I didn't fully understand why.
    