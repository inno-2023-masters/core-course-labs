# Show Your Time

Here I developed small Python web application that displays the current time in Moscow.

## Before the start

1. Install Python 3.8 or higher
2. Install required dependencies
```bash
python -m pip install -r requirements.txt
```

## Start
Run the application using the following command
```bash
uvicorn main:app --reload
```
Default running on `http://127.0.0.1:8000`
Note: run this command from the `app` directory

### Unit Tests
Run `pytest` command from the `app_python` directory

## Docker

This app was added to Docker Hub

### Build

To build Docker image need to run
```bash
sudo docker build -t your_image_name .
```

### Pull

Since it's public then there's no need to sign in
Run the following command for pulling the image
```bash
docker pull lizavetta/devops-python
```

### Run

Run using the following command
```bash
sudo docker run -d --name your_container_name -p 80:80 your_image_name
```