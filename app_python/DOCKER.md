# Docker usage within app_python

Several practices were implemented. Let's discuss one by one

## Official language image

It is only reasonable (and easiest) to stick to official python image. Used `3.8-slim` as it had the least amount of issues within its' 5 month lifespan.

Also it is a lightweight base image, which makes it less prone to security risks and keeps docker image size down.

## Keeping packages up to date

Dockerfile ensures that all packages are up to date to prevent any security mishaps. See Dockerfile.

## Limiting Image Layers

This was done as much as possible to keep the layers themed around their function and lower complexity. Still kept many `RUN` layers apart for the sake of readability of Dockerfile within this exercise.

## Cleaning up unnecessary packages
`apt-get autoremove` and `apt-get autoclean` are used to to remove any unnecessary items and artifacts, to make docker image as lightweight as possible.

## Vulnerability scans

It is possible to use automated tools to scan for vulnerabilities within packages.

I personally used `trivy`. Here is how to pull it from docker hub:

```
docker pull aquasec/trivy:0.18.3
```

And here is how to use it to scan my image on a linux machine

```
sudo docker run --rm -v ~/.cache:/root/.cache/ aquasec/trivy:0.18.3 justsomedude22/app_python:latest
```

## Running container with non-root user

This is one of the recommendations from the lab document and is implemented in the docker file.

## Resource constraints

When running the docker image, trying to set limits for resource usage. In case of our minor project it might be useful to prevent docker image from craching the machine.

However if you are working on a bigger project that might have its' docker image ran on servers with other images, it might save other images from having no resources, if this one is echaustion attacked.

Possible flags to add to `run`:
```
--cpu-shares=8 --memory=1g
```

## Drop unnecessary capabilities

In case of an unnoticed vulnerabilities, it is best if image cannot do something it is not supposed to do. 

Identified several capabilities of this image that are unnecessary:

### CHOWN

The CHOWN capability allows changing the ownership of files. Dropping this capability prevents the container processes from modifying the ownership of files, reducing the potential for privilege escalation attacks

### DAC_OVERRIDE

DAC_OVERRIDE (Discretionary Access Control override) capability allows bypassing file permission checks. Dropping this capability restricts the container processes from overriding file permissions, enhancing file system security.

### SETUID and SETGID

These capabilities enable setting the UID and GID on a file execution. By dropping these capabilities, you prevent the container processes from setting the UID and GID, reducing the risk of privilege escalation.

### SYS_PTRACE

SYS_PTRACE allows container processes to trace arbitrary processes using the ptrace system call. By dropping this capability, you limit the ability to debug or trace processes within the container, thus reducing the possibility of unauthorized access or malicious activities.

---

Flags to add to `run` to drop all of the above capabilities:

```
--cap-drop=CHOWN,DAC_OVERRIDE,SETUID,SETGID,SYS_PTRACE
```
