![py workflow](https://github.com/art22m/F23-DevOps/actions/workflows/app_py_ci.yaml/badge.svg)

# Python Web Application

## Overview

This is simple Python web application, that shows current time in Moscow

## Requirements

Before usage, you should install packages listed in requirements.txt file. To install all the dependencies, execute
the command below.

 ```
 pip3 install -r requirements.txt
 ```

## Build

There is Makefile in the project.
 ```
 # Run linters
 make lint 
 
 # Run formatters
 make format
 
 # Run app
 make run
 ```

## Usage
To get current moscow time run `curl 127.0.0.1:8000` or enter `127.0.0.1:8000` in any browser.

## Roots
```
/        -- get current time
/metrics -- get 
/health  -- health check
/visits  -- number of time root path accessed
```

## Docker
This application can be run using docker containers. 
To do this make sure docker is installed on your machine.


You can clone this repository and build an image by your own:
 ```
docker build -t art22m/pyapp:v1 .
 ```

Or you can pull an image from docker hub:
 ```
docker pull art22m/pyapp:v1
 ```

To run docker image:
 ```
docker run -p 8000:8000 art22m/pyapp:v1
 ```

## Unit Tests
To run tests use `make test`

## CI
Workflow:
-  Security check
-  Lint, Build and Run tests
-  Dockerhub image push

## Contact

Telegram: @art22m