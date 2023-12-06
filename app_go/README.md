![go workflow](https://github.com/art22m/F23-DevOps/actions/workflows/app_go_ci.yaml/badge.svg)

# Go Web Application

## Overview

This is simple Go web application, that shows current time in Moscow

## Requirements

Requirements and dependencies could be found in go.mod file.

## Run

```
// Run linter
// To install:
// go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest  
make lint

// Run app
// (dependencies will be downloaded automatically)
make run
```

## Usage

To get current moscow time run `curl 127.0.0.1:9000` or enter `127.0.0.1:9000` in any browser.

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
docker build -t art22m/goapp:v1 .
 ```

Or you can pull an image from docker hub:

 ```
docker pull art22m/goapp:v1
 ```

To run docker image:

 ```
docker run -p 9000:9000 art22m/goapp:v1
 ```

## Unit Tests

To run tests use `make test`

## CI

Workflow:

- Security check
- Lint, Build and Run tests
- Dockerhub image push

## Contact

Telegram: @art22m