# Live Moscow Time Web App

## Overview

This web application displays the current time in Moscow. It features a dynamic and playful design with a color-changing container. The text inside the container has each letter displayed in a random color. It provides a fun and unique way to check the current time.

## Build locally

To run this application locally, follow these steps:

1. Navigate to the `app_pyhon` folder:

    ```bash
        cd app_python
    ```

1. Install project dependencies:

    ```bash
        pip3 install -r requirements.txt
    ```

1. Start the FastAPI application::

    ```bash
        uvicorn  src.main:app --host 0.0.0.0 --port 80 --reload
    ```

1. Open the application in your browser:

    ```bash
        http://localhost:8000
    ```

## Build with Docker locally

To run this application with Docker, follow these steps:

1. Navigate to the `app_python` folder:

    ```bash
        cd app_python
    ```

1. Build the Docker image:

    ```bash
        docker build -t app_python .
    ```

1. Run the Docker container:

    ```bash
        docker run -d -p 80:80 --name app_python app_python   
    ```

1. Open the application in your browser:

    ```bash
        http://localhost
    ```

## Build from Docker Hub

1. Pull the Docker image from Docker Hub:

    ```bash
        docker pull max3k/app_python
    ```

1. Run the Docker container:

    ```bash
        docker run -d -p 80:80 --name app_python max3k/app_python
    ```

1. Open the application in your browser:

    ```bash
        http://localhost
    ```

## Web Application Structure

### Endpoints

#### Endpoint: `/`

- Includes a basic HTML, JavaScript, CSS frontend, which displays the current time in Moscow.
- The time is fetched from the `/time` endpoint.

#### Endpoint: `/time`

- Returns the current time in Moscow in JSON format.
- Pytz is used to get the current time in Moscow.
- If `timezone` is specified in the query string, the time in that timezone is returned instead.

#### Endpoint: `/visits`

- Returns the number of times the `/` endpoint has been accessed.
- The number of visits is stored in a `visit_volume/visits` file.
- The number of visits is incremented every time the `/` endpoint is accessed.

### Project Structure

- Code is separated into different modules (e.g., `main.py`, `time.py`) for better maintainability.
- Static files (HTML, JavaScript, CSS) are placed in the `static` directory.

### Configuration

- Configuration settings are abstracted into a `settings.py` module.
- Requirements are managed using a `requirements.txt` file, allowing for easy dependency installation.

### Unit Tests

- Tests are included in the `tests` directory to validate the functionality of the application.
- The `pytest` testing framework is used for writing and running tests.
- Tests are run automatically using GitHub Actions CI.
- Test covers /time endpoint, with different timezones and different formats.

To run it locally, run the following command:

```bash
    pytest tests
```

### Frontend

- A basic HTML, JavaScript, CSS frontend is included in the `static` directory.
- The frontend is designed to fetch and display the current time from the backend in a dynamic and playful way.
- JavaScript is used to update the displayed time on the webpage.
- The frontend is intentionally made absurd and playful)

## Usage

- The main page displays the current time in Innopolis/Moscow.
- The text inside the container change colors for a playful effect.
- The time updates every second to reflect the current time.

## Contact

For any questions or issues, please contact:

- [Mikhail Fedorov](mailto:fedorovm093@gamil.com)
