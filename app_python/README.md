# Flask App README

[![PR Testing and Building](https://github.com/thecarrot123/core-course-labs/actions/workflows/main.yml/badge.svg)](https://github.com/thecarrot123/core-course-labs/actions/workflows/main.yml)

## Project Overview

This Flask app displays the current time in Moscow's time zone (MSK).

## Getting Started

### Prerequisites

- Python 3.x

### Installation

1. Clone the repository and navigate to it.

2. Install dependencies:

```bash
    pip install -r requirements.txt
```

## Running the App

To run the Flask app in development:

```bash
    python run.py
```

Or with gunicorn:

```bash
    gunicorn --bind 0.0.0.0:5050 --workers 4 run:app
```

The app will be available at <http://localhost:5050/>.

## Unit Test

To test the Flask app run:

```bash
    python -m unittest main/tests.py
```

## Docker

I proved a docker file to run this application with ease.

### Build

To build the docker run:

```bash
    docker build -t thecarrot/whataretime .
```

### Run

To run the docker container write:

```bash
    docker run -it -p 8000:8000 thecarrot/whataretime
```

### Pull

To pull the docker image:

```bash
    docker pull thecarrot/whataretime
```
