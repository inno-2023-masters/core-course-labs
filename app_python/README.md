# Lab1

Develop a Python web application that displays the current time in Moscow

## Preparation/Installation

***Install Flask:***
```
$ pip3 install Flask
```

***Set up a Python virtual environment in order to install dependencies:***
```
$ pip install virtualenv
$ pip install virtualenvwrapper-win
$ mkvirtualenv env-name
```

Install the dependencies:

```
$ pip install -r requirements.txt
```

## Starting the Application

Start the application with the main.py script:

```
$ python main.py
```

The application started at http://localhost:5000 (http://127.0.0.1:5000/).

## Running the Docker 

Build the docker image with the following command:
```
docker build -t devops-lab2 .
```

Run the image with the following commands:
```
docker run --rm -p 5000:5000 devops-lab2
```

To pull the image from the dockerhub:


```
docker pull vladimirzelenokor/devops-lab2:<TAG>
```
## Running the Unit Tests

To run the unit tests, follow these steps:

Move to the project directory:

```
cd core-course-labs
cd app_python
```

Run the unit tests with the following command:

```
python test.py
```

## CI

Need to specife these secrets to run:

***DOCKERHUB_USERNAME*** - DockerHub username.
***DOCKERHUB_PASSWORD*** - DockerHub password.
