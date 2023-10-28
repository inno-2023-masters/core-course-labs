![workflow](https://github.com/ShohKhan-dev/core-course-labs/actions/workflows/app_python-ci.yml/badge.svg)


# Python Web Application

Simple Web application that displays Current Moscow time and date that is made using Django on DevOps course

## Installation

Clone the repository and install the dependencies:

```
$ git clone https://github.com/ShohKhan-dev/core-course-labs
$ cd core-course-labs
$ cd app_python
```

## Running the Application

1. pull the Docker Image from existing repo on Docker hub:

   ```
   docker pull rametago/my-first-repo:latest
   ```

2. Run the Docker Container:

   ```
   docker run -d -p 8000:8000 rametago/my-first-repo:latest
   ```

The application will be accessible at http://localhost:8000 in your web browser.


## Running the Linting and Formatting
```
$ pre-commit run --all-files
```


## Testing the application
Testing application by checking response status code and checking time difference after each request.
```
$ python manage.py test
```


# CI Workflow
it works as follows:
- setting up python and enviroment
- install dependencies
- linting code
- run some tests to check application
- install and test project with Snyk
- docker login
- build and push image to dockerhub

**Used Secrets for Token and login information**
