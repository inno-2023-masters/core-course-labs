# Live Moscow Time Web App

## Overview

This web application displays the current time in Moscow. It features a dynamic and playful design with a color-changing container. The text inside the container has each letter displayed in a random color. It provides a fun and unique way to check the current time.

## Build locally

To run this application locally, follow these steps:

1. Navigate to the `app_go` folder:

    ```bash
        cd app_go
    ```

1. Build the application:

    ```bash
        go build
    ```

1. Run the application:

    ```bash
        ./app_go
    ```

1. Open the application in your browser:

    ```bash
        http://localhost:8080
    ```

## Build with Docker locally

To run this application with Docker, follow these steps:

1. Navigate to the `app_go` folder:

    ```bash
        cd app_go
    ```

1. Build the Docker image:

    ```bash
        docker build -t app_go .
    ```

1. Run the Docker container:

    ```bash
        docker run -d -p 8080:8080 --name app_go app_go   
    ```

1. Open the application in your browser:

    ```bash
        http://localhost:8080
    ```

## Build from Docker Hub

1. Pull the Docker image from Docker Hub:

    ```bash
        docker pull max3k/app_go
    ```

1. Run the Docker container:

    ```bash
        docker run -d -p 8080:8080 --name app_go max3k/app_go
    ```

1. Open the application in your browser:

    ```bash
        http://localhost:8080

## Usage

- The main page displays the current time in Innopolis/Moscow.
- The text inside the container change colors for a playful effect.
- The time updates every second to reflect the current time.

## Contact

For any questions or issues, please contact:

- [Mikhail Fedorov](mailto:fedorovm093@gamil.com)

## Best Practices Applied

1. **TML Templating**: The application uses HTML templates for rendering, separating the presentation layer from the logic.

1. **Static File Serving**: Static files (CSS and JavaScript) are served correctly from the `static` folder, adhering to best practices.

1. **Error Handling**: Although not explicitly shown in the code, error handling and logging are essential components of a production-ready application. Gin allows adding middleware for error handling, which is a recommended practice.

## Framework Choice: Gin

**Gin** is chosen as the web framework for this application. Here are the pros and cons:

### Pros

- **Lightweight**: Gin is a minimalistic web framework that provides essential features without unnecessary overhead, making it fast and efficient.

- **Routing**: It offers a powerful routing system, making it easy to define routes and handle HTTP requests.

- **Performance**: It is known for its high performance, making it suitable for building fast web applications.

### Cons

- **Lack of Built-in Features**: Gin's minimalistic approach means it lacks some built-in features found in larger frameworks, which may require more manual setup.

## Linters

- **gofmt**: To format Go code.

- **golangci-lint**: To perform static code analysis and identify potential issues.
