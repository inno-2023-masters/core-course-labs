### DOCKER.md for C++ Application (DOCKER.md)

# Docker Best Practices for C++ Application

In this document, we discuss the Docker best practices implemented in our Dockerfile for the C++ Summer Time Application. These practices enhance the security and efficiency of our containerized application.

## Non-Root User

We have created a non-root user and configured our container to run as this user. Running applications as non-root users is a best practice to mitigate potential security risks. It reduces the scope of possible attacks and limits the damage that can be caused by potential vulnerabilities.

## Minimizing Image Size

To reduce the attack surface and minimize the size of our Docker image, we have removed unnecessary files and dependencies. A smaller image size not only improves security but also decreases storage and bandwidth requirements, making our application more efficient.

## Compiling the Application

We compile the C++ application inside the Dockerfile to ensure that it is built with the required dependencies and libraries. This practice helps in creating a consistent and reproducible environment for our application.

## Running the Application

We run the C++ application as the final step when the container starts. This ensures that the application is executed within the container's isolated environment.
