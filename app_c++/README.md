# C++ Time Left Until Summer App

## Description
This C++ application calculates and displays the time left until the start of summer.

## Features
- Calculates and displays the time left until the summer season.

## Installation
1. Clone the repository to your local machine:
   git clone https://github.com/RobertGabdullin/core-course-labs.git
   cd app_c++
   g++ -o app app.cpp
2. Install dependicies:
   git clone https://github.com/yhirose/cpp-httplib.git (in app_c++)
   
## Usage
1. Run the application:
   ./app
2. Open your web browser and navigate to http://127.0.0.1:5050/ to view the time left until the start of summer.

## Docker Container

### Building the Docker Image

To build the Docker image for this application, follow these steps:

1. Ensure that you have Docker installed on your system.

2. Open a terminal and navigate to the 'app_c++' directory.

3. Build the Docker image using the provided Dockerfile:
   docker build -t my-cpp-app .
   
### Pulling the Docker Image
1. To pull the Docker image use following command:
   docker pull acceptasis/my-cpp-app

### Running the Docker Container
1. To run the Docker container and access the application, use the following command:
   docker run -p 5050:80 my-cpp-app
2. If you pulled the Docker image you can use the following command:
   docker run -p 5050:80 acceptasis/my-cpp-app

## Author
Robert Gabdullin

## Contact
r.gabdullin@innopolis.university
