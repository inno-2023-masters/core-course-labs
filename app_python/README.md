# Moscow Time App

## Overview

Python Web App built using Flask Framework and ApiNinjas for requesting Moscow Time

## Usage

1. Install Python 3.9
2. Install pip
3. Install Flask
4. Enter app_python repository
5. Run `flask run`
6. An application will open at http://127.0.0.1:5000/


## Docker

Link of the image on DockerHub: https://hub.docker.com/repository/docker/arseniylev17/msctime/ 

### DOCKER INSTRUCTIONS:

To build the Docker image:

    docker build -t {docker_login}/{image_name}:{version} .

To pull the Docker image:

    docker pull {image_name}

* Image name for this app is `arseniylev17/msctime`

To run the Docker container:

    docker run -p 8000:8000 arseniylev17/msctime

This will start the container and map port 8000 on the host to port 8000 in the container. You can then access the MoscowTime application on http://localhost:8000.

## Unit testing

To run unit tests, type the following command:

    python3 testing.py

## Best practices for CI using GitHub Actions

- Do not install unnecessary dependencies
- To enhance security, it is recommended to limit the usage of environment variables to the narrowest possible scope. This means being specific to the workflow, job or step in which they are required.
- To optimize efficiency, it is advisable to keep Actions concise. Although Actions' virtual machines are fast and have high bandwidth, the longer an action takes to execute, the more time is wasted waiting.


#### Contact: Arseniy Levochkin, B20-SD-02, a.levochkin@innopolis.university

