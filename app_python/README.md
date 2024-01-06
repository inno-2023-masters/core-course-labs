![Build Status](https://github.com/RobertGabdullin/core-course-labs/workflows/CI/badge.svg)
# My Python Web Application

## Description
This Python web application displays the current time in Moscow using the Flask framework.

## Features
- Displays the current time in Moscow.
- Automatically updates the displayed time upon page refreshing.

## Installation
1. Clone the repository to your local machine:
   git clone https://github.com/RobertGabdullin/core-course-labs.git
   cd app_python
2. Install the required dependencies:
   pip install flask
   pip install pytz

## Usage
1. Run the application:
   python3 app.py
2. Open your web browser and navigate to http://127.0.0.1:5000/ to view the current time in Moscow.

## Unit Tests

### Overview

This project includes a suite of unit tests designed to validate the correctness and reliability of the codebase. Unit tests play a crucial role in maintaining code quality, preventing regressions, and ensuring the stability of the application. Follow the instructions below to run the tests locally and contribute to the ongoing development of robust and maintainable software.

### How to Run

1. cd app_python
2. python3 -m unittets test_app.py

## CI 

- Name: ```CI```
- Triggers on:
  - Pull requests targeting the main branch
  - Push to the main or lab3 branches
- Jobs:
  - Steps:
      1. Checkout code using the ```actions/checkout``` action.
      2. Set up Python with the specified version using the ```actions/setup-python``` action.
      3. Install dependencies by running ```pip install -r requirements.txt``` in the app_python directory.
      7. Run the flake8 linter for Python code.
      8. Run unit tests using ```python3 -m unittest test_app.py``` in the app_python directory.
      10. Login to Docker Hub using the ```docker/login-action``` action and the specified username and password.
      11. Build and push a Docker image using the ```docker/build-push-action``` action.
  

## Docker Container

### Building the Docker Image

To build the Docker image for this application, follow these steps:

1. Ensure that you have Docker installed on your system.

2. Open a terminal and navigate to the 'app_python' directory.

3. Build the Docker image using the provided Dockerfile:
   docker build -t my-python-app .
   
### Pulling the Docker Image
1. To pull the Docker image use following command:
   docker pull acceptasis/my-python-app

### Running the Docker Container
1. To run the Docker container and access the application, use the following command:
   docker run -p 4000:80 my-python-app
2. If you pulled the Docker image you can use the following command:
   docker run -p 4000:80 acceptasis/my-python-app

## Author
Robert Gabdullin

## Contact
r.gabdullin@innopolis.university
