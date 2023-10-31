# python_time

![example workflow](https://github.com/kerniee/core-course-labs/actions/workflows/python.yml/badge.svg)

Simple Python web application that displays the current time in Moscow.

- **Framework**: FastAPI
- **Testing**: pytest
- **Code style**: autoflake, isort and black

## Preparing dev environment

1. Make sure you have at least python3.8 installed.
   You can create new virtual environment if you want

   ```shell
   python -m venv /path/to/new/virtual/environment
   source /path/to/new/virtual/environment/bin/activate
   ```

1. Install python packages

   ```shell
   cd app_python
   pip install -r ./requirements/base.txt
   # Optional
   pip install -r ./requirements/dev.txt
   ```

### Running application

```shell
uvicorn src.main:app
```

### Unit Tests

`pytest` to run unit tests

## Docker

You can use Docker to run the application.

1. `make build` to build Docker image
1. `make run` to run Docker image locally on port 8000
1. `make push` to push Docker image to Docker Hub
1. `make clean` to remove local container and image

## CI

On push, if `app_pyton` folder is modified, GitHub Actions will run CI workflow.
It will run tests, build Docker image and push it to Docker Hub.
