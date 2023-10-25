# Docker Best Practices that I used

## Base Image

I have used the `python:3.10-slim` image as my base image. This provides a minimal environment with Python 3.10 installed. The `slim` variant is lightweight and omits many packages/tools that are unnecessary for running Python applications, thus reducing potential security vulnerabilities.

## Installing Necessary Dependencies

To ensure my application has all the necessary dependencies, I've installed:

- `gcc`: The GNU Compiler Collection, sometimes necessary for compiling Python packages.
- `curl`: A command-line tool for data transfer, useful for debugging and health checks.

Before installing these packages, I perform an `apt update` to fetch the latest package lists.

## Setting Up Application Directory

The working directory inside the container is set to `/app_python`. Additionally, I've set the `PYTHONPATH` environment variable to this directory to ensure Python can locate and load modules correctly.

## Dependency Installation

Before installing the Python packages listed in `requirements.txt`, I make sure to update `pip` to its latest version. I use the `--no-cache-dir` flag with `pip` to prevent caching, leading to a reduced image size.

## Non-Root User for Running the Application

For enhanced security, it's undesirable for my application to execute as the root user inside the Docker container. Running as root can expose the application to various vulnerabilities. To mitigate this, I've created a user named `core_lab_user` and switch to this user for executing our application.

## Application Start Command

My application is run using `uvicorn`. The specified command ensures my application is accessible externally and listens on port `8000`.
