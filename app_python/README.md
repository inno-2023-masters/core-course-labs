![workflow](https://github.com/nikolina2k/core-course-labs/actions/workflows/app_python.yml/badge.svg)

# Current Time in Moscow

A simple Python web app that displays the current time in Moscow.

- **Framework**: Flask
- **Testing**: unittest
- **Code style**: flake8 and black

## Docker

This application can be easily containerized using Docker. Below are instructions on how to build, pull, and run the Docker image.

1. Make sure you have Docker installed on your system.

2. Clone this repository to your local machine:

   ```
   git clone https://github.com/nikolina2k/core-course-labs.git
   ```

3. Navigate to the project directory:

   ```
   cd core-course-labs
   cd app_python
   ```

4. Build the Docker image manually:

   ```
   docker build -t nikolina2k/ma-repo .
   ```

5. Or pull the Docker Image from existing repo on Docker hub:

   ```
   docker pull nikolina2k/ma-repo:latest
   ```

6. Run the Docker Container:

   ```
   docker run -p 8000:8000 nikolina2k/ma-repo
   ```

The application will be accessible at http://localhost:8000 in your web browser.

## Unit Tests

To run the unit tests, follow these steps:

1. Make sure you have Python installed on your system.
2. Install the required dependencies for testing. You can use `pip` for this:

   ```
   pip install -r requirements.txt
   ```

3. Navigate to the project directory:

   ```
   cd core-course-labs
   cd app_python
   ```

4. Run the unit tests using the following command:

   ```
   python test_app.py
   ```

## CI

The following secrets need to be specified in order to run the pipeline:

- **DOCKER_PASSWORD** - DockerHub password (or token).
- **DOCKER_USERNAME** - DockerHub username.
- **SNYK_TOKEN** - Snyk token.
