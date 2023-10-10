# Description
Display moscow time

# Build and run
    1. conan install . --output-folder=${BUILD_DIR} --build=missing
    2. cmake -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -B ${BUILD_DIR}
    3. cmake --build ${BUILD_DIR}
    4. Run 'TestCmakeDemo' from ${BUILD_DIR}

## Docker

This section provides instructions on how to build, pull, and run the containerized application.

### Build

To build the Docker image, navigate to the app_cpp directory and run the following command:

```shell
docker build -t myapp_cpp .
```

### Pull

To pull the Docker image from a remote repository, use the following command:

```shell
docker pull muurrk/myapp_cpp:first-image
```

### Run

To run the application as a Docker container, execute the following command:
```shell
docker run -p <port>:8080 myapp_cpp
```