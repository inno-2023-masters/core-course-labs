### DevOps Labs: Time Service realisation with Python

### src

The starting point of all project `src/main.py`.

Here I initialise variable `app`, that is fastAPI server.

In the package `app_python.src.timer` are placed two classes:

1) `Timer` - class that provides simple interface to work with time
2) `TimeRouter` - class that initialises routes to work with the `Timer` class. Route paths can be configured from outside

Important point. I am importing `uvicorn` to be able to run the service without any external programs.
Just install all necessary requirements and start using!

### requirements

Directory with only file `requirements.txt`. Here is a full list of required external libraries.

### tests

This directory contains all tests for the project. 
Such as unit tests for the `Timer` class itself and 
tests for all the program. I am not using any external services
now, so can not provide any integration tests. But I
already have test to the full user's path.

### docker

my image - wiirtex/python_time_service with tag 0.1.0

More info in DOCKER.md

### run

docker run wiirtex/python_time_service:0.1.0 -p 7098:7098

then go to localhost:7098 to see time

I still have problems with building my python program into executable. 
This is because python's awful module system. I will try to manage it till next lab
