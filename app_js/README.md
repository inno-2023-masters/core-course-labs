# JokeJS

![example workflow](https://github.com/kerniee/core-course-labs/actions/workflows/js.yml/badge.svg)

Simple NodeJS Express web application that says jokes.

- **Framework**: Express
- **Testing**: Jest
- **Code style**: typescript-eslint

## Preparing dev environment

`npm install` in the `app_js` directory

### Running application

`npm run start`

### Linter

`npm run build` for typescript and `npm run lint`

### Unit Tests

`npm run test`

## Docker

You can use Docker to run the application.

1. `make build` to build Docker image
1. `make run` to run Docker image locally on port 8000
1. `make push` to push Docker image to Docker Hub
1. `make clean` to remove local container and image
