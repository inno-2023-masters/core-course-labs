### MoscowTimeWebApplication

![Build](https://github.com/Sl1va/core-course-labs/actions/workflows/app-build.yaml/badge.svg)

#### Overview

This web application shows the current time in Moscow. The application is built using Flask, a popular web framework in Python.

When the user accesses the main page of the application, it retrieves the current time in Moscow and displays it on a webpage. The time is formatted as "YYYY-MM-DD HH:MM:SS". The application uses the Flask's built-in development server and listens port 8080.

#### Prepare

In order to prepare project to run, it is necessary to install dependencies:

```bash
pip3 install -r requirements.txt
```

#### Unit Testing

On order to run unit tests on application it is neccessary to intall dev-requirements:

```bash
pip3 install -r dev-requirements.txt
```

And run tests using pytest

```bash
pytest app.py
```

#### Usage (Docker)

The application can be easily runned in docker.
First, pull the image:
```bash
docker pull elatypovinno/devops_inno
```

Then it is possible to start container, it will build and run everything automatically:
```bash
docker run -it -p 8080:8080 --name time-app elatypovinno/devops_inno:latest 
```

To build the container was used the following command:
```bash
docker build -t elatypovinno/devops_inno:latest .
```

#### CI Workflow

Currently CI workflow contains following stages:

- Set up python version
- Install dependencies (primary and development)
- Run linter (`pylint`) on source code
- Run unit tests
- Run Snyk vulnerabilities check
- Login to Dockerhub using credentials stored as secrets
- Set up docker build environment (Docker Buildx)
- Build and push docker container to Dockerhub

#### Contact

Emil Latypov, e.latypov@innopolis.university
