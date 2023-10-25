<p align="center">

  <h3 align="center">Lab 1</h3>

  <p align="center">
    Web application displaying time in Moscow
    <br>
  </p>
</p>

![app_python](https://github.com/JustSomeDude2001/core-course-labs/actions/workflows/app_python.yml/badge.svg)

## Table of contents

- [Table of contents](#table-of-contents)
- [Description](#description)
- [Quick start](#quick-start)
- [Testing](#testing)
- [Docker](#docker)
- [Unit Tests](#unit-tests)
- [CI Workflow](#ci-workflow)


## Description

This is a simple web application on flask. It displays current date and time in Moscow. 


## Quick start

Clone the repository

```
git clone https://github.com/JustSomeDude2001/core-course-labs
```

Navigate to the project directory

```
cd ./core-course-labs/app_python
```

Install the requirements

```
pip install -r requirements.txt
```

Run the app

```
python3 app.py
```

Afterwards, the date and time can be seen on `127.0.0.1:5000`


## Testing

After installing the application, go to the directory and run unit tests package using `pytest`

```
python3 -m pytest
```

Note that if your ping is higher than 2 minutes (which is highly unlikely) test for date and time will most likely fail.

## Docker

Make sure you are in the `app_python` directory
```
cd app_python
```

Building docker image. Note that docker BuildKit needs to be enabled to allow for more functionality such as mounting.
```
DOCKER_BUILDKIT=1 docker build -t app_python .
```

Running latest docker image

```
docker run --rm justsomedude22/app_python:latest
```

To run the docker image with the security measures described in `DOCKER.md`, add the following flags:

```
--cap-drop={CHOWN,DAC_OVERRIDE,SETUID,SETGID,SYS_PTRACE} --cpu-shares=8 --memory=1g
```

How to push the docker image to public repo

```
docker push justsomedude/app_python:<tag>
```

How to add a tag

```
docker tag app_python justsomedude22/app_python:<tag>
```

How to pull docker image by tag from repo

```
docker pull justsomedude22/app_python:<tag>
```

If no tag provided, will pull latest

## Unit Tests

Within `tests` directory, packages for testing are contained. You can run them one by one as follows:

```
python3 -m pytest tests/test_testname.py
```

Where `test_testname.py` is the unit test module you chose to test.

Alternatively, run all tests from `app_python` directory:

```
python3 -m pytest
```

## CI Workflow

CI workflow consists of 3 stages:

- `test_and_lint` - includes setting up the environment, running the linter, and then running unit tests. Note that tests will not be executed if linter sees fault.
- `snyk` - runs security analysis using snyk. Happens in parallel to other steps.
- `push_docker` - logins into docker hub using credentials from secrets, builds the image, and pushes it. It is required for `test_and_lint` to not fail, before it runs.