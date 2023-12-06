## Docker best practices

There are several practices in Docker usage which are considered as recommended ones. In the project I tried to apply as much of them as possible, and here is the list:

#### Specify base image version

```Dockerfile
FROM python:3.8-slim
```

Specifying a version number allows to ensure that the docker image build is reproducible and will not break on incompatible updates. It is hightly recommended not to use such tag as `latest` in production as there is a probability to break application in future updates of base image.

Moreover, regarding to python, it is reasonable to use minimal version of interpreter to minimize image size (postfix `-slim` on image name)

#### Use non-root user for application

```Dockerfile
RUN useradd -m app
USER app
```

It is one of the most important security practices in docker containers to avoid using root user to run the application. It helps to protect host machine if container will be compromised.

#### Copy only files that are used in project

```Dockerfile
WORKDIR /app
COPY requirements.txt app.py /app/
COPY templates/ /app/templates/
COPY static/ /app/static/
```

It allows to minimize image size. Moreover, in context of security it allows to minimize risk of publishing sensitive data.

#### Expose used network ports

```Dockerfile
EXPOSE 8080
```

It can be considered as a tip from container developer to container users.

#### Separate dev depenencies and production dependencies

This practice is not directly related to docker, but worth mentioning there. There are some dependencies, which are used only during development. For example, testing libraries are used only by developers and will waste space on production images. Due to this reason I split `requirements.txt` into 2 files: production one and development one.