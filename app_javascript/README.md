# Show Your Time

Here I developed small Svelte web application that displays the current time in Moscow.

## Before the start

Run `npm install`

## Start
Run the application using the following command
```bash
npm run dev
```
Default running on `http://127.0.0.1:5173`

## Docker

This app was added to Docker Hub

### Build

To build Docker image need to run
```bash
docker build -t your_image_name .
```

### Pull

Since it's public then there's no need to sign in
Run the following command for pulling the image
```bash
docker pull lizavetta/devops-svelte
```

### Run

Run using the following command
```bash
docker run -d --name your_container_name -p 80:80 your_image_name
```
**Make sure that there is no container on port 80!**
