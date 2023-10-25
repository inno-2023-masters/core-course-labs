# Web Application: Moscow Time using FastAPI

## Overview
A simple web application built with FastAPI that shows the current time in Moscow.

## Build
1. Clone the repository and navigate to the project directory.
2. Set up a Python virtual environment:

   ```bash
   python3 -m venv venv
   source venv/bin/activate
   
3. Install the required packages:

    ```bash
    cd app_python
    pip install -r requirements.txt

4. Run the application:

    ```bash
    uvicorn app:app --reload

## Usage
* Visit http://127.0.0.1:8000/api/time in your browser to view the current time in Moscow.
* Access the interactive API documentation at http://127.0.0.1:8000/docs.

## Docker

### Building the Docker Image

```bash
   docker build -t dmitriypru/core_course_labs_python:latest .
```

### Pulling the Docker Image

```bash
docker pull dmitriypru/core_course_labs_python:latest
```

### Running the Docker Container

```bash
docker run -p 8000:8000 dmitriypru/core_course_labs_python:latest
```

## Continuous Integration

My CI workflow consists of several essential steps to ensure the stability and quality of my codebase. These steps include:

1. **Dependencies installation**: Installs all necessary dependencies for the project.
2. **Linter**: I use `flake8` for linting to maintain code quality.
3. **Tests**: I (and everybody else) use `pytest` to run all unit tests to ensure code integrity. After successful tests I run snyk to find existing vulnerabilities in code or dependencies.
4. **Docker integration**: Includes steps to login to Docker Hub and to build & push the Docker image.

The workflow gets triggered on pull requests to the `main` branch and when changes occur in the `app_python` folder.

## Contact

For questions, feedback, or suggestions, please contact [@dmitriypru](https://t.me/dmitriypru).
