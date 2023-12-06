# Innopolis University DevOps [F23] | Kotlin 
[![Kotlin CI](https://github.com/i-nafikov/iu-devops-course/actions/workflows/CI-kotlin.yml/badge.svg?branch=lab3&event=pull_request)](https://github.com/i-nafikov/iu-devops-course/actions/workflows/CI-kotlin.yml)

## Overview
The service provides information about current time in Europe/Moscow timezone.

## Build
### Building application on host machine
To run the application go to the `./app_kotlin` directory and run the following command:
```shell
./gradlew boot
```
### Building application Docker image
To build the application Docker image go to the `./app_kotlin` directory and run the following command:
```shell
docker build --tag iskanred/app_kotlin:1.0.0 .
```

## Unit tests
Details about testing you can find in [KOTLIN.md](KOTLIN.md) file in '**Unit tests**' section.
To run tests go to the `./app_kotlin` directory and run the following command:
```shell
./gradlew test
```

## How to run?
### GitHub repository.
1. Clone this repo.
2. Go to the `./app_kotlin` directory of the cloned repo.
3. Run the following command:
    ```shell
    ./gradlew bootRun
    ```
4. Now the service can be used
### Docker
1. Pull the image from Docker Hub (you can skip this step if you already have the image):
    ```shell
    docker pull iskanred/app_kotlin:1.0.0
    ```
2. Run a container based on this image:
    ```shell
    docker run -p 8080:8080 --name app_kotlin iskanred/app_kotlin:1.0.0
    ```
3. Now the service can be used

## CI workflow
Kotlin workflow run only on pull requests and
if pull request contains changes in `./app_kotlin` directory or in Kotlin workflow file.

**Jobs:**
1. Security vulnerabilities analysis
2. Test & Lint
3. Build docker image & Push to dockerhub: https://hub.docker.com/repository/docker/iskanred/app_kotlin/general

Best practices applied in CI process are described in [CI.md](CI.md).

## Usage
The server's URL is `http://127.0.0.1:8080/`.
1. Obtain the page from the browser or make a GET request from any HTTP client.
   The resulting response is a text string with current Moscow time.
2. Making HTTP GET request for URL `http://127.0.0.1:8080/visits` the one can obtain the
   number of times users visited the main page (`http://127.0.0.1:8080/`).
   The information is persistent because it is stored in the file (`visits_dir/visits`)
   with number of visits which is created at the first run of the application.

## Contact
* Author: Iskander Nafikov
* E-mail: i.nafikov@innopolis.university
