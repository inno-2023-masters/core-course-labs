## Python app

### Prepare to work
- Run `pip install -r requirements.txt`

### Run web app
Run `python app/main.py`

## Unit Tests

This application is accompanied by a suite of unit tests that verify its functionality. The tests cover different aspects of the code and ensure its correctness.

To run the unit tests:

1. Make sure you have the necessary dependencies installed. You can use `pip` to install the required packages specified in the `requirements.txt` file.
2. Run the command `python -m unittest discover test` to automatically discover and execute all unit tests in the application.

## Docker

This section provides instructions on how to containerize and run the application.

### Build

To build the Docker image, navigate to the app_python directory and run the following command:

Run `docker build -t myapp .`

### Pull

To pull the Docker image from a remote repository, use the following command:

Run `docker pull muurrk/myapp:first-image`

### Run

To run the application as a Docker container, execute the following command:

Run `docker run -p <port>:8080 myapp`