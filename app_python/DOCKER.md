# Docker description

## Dockerfile best practices

* Use official base images (like python:3.10-slim).
* Minimize the number of layers: Each instruction in a Dockerfile creates a new layer, and having too many layers can impact the image size and build time.
* Order instructions efficiently: Structure your Dockerfile in a way that the instructions that are least likely to change are placed at the top, while the ones that are more likely to change are placed at the bottom. This way, you can take advantage of Docker's caching mechanism to speed up the build process.
* Use .dockerignore file: this helps reduce the image size and build time.
* Specify the version for each dependency: to ensure reproducibility and avoid unexpected issues.
* Use COPY instead of ADD when possible: COPY is more explicit and doesn't attempt to auto-extract compressed files as ADD does.
* Remove unnecessary packages: After installing a package or running a specific task, it is recommended to remove any unnecessary packages or files to keep the image size minimal.
* Use multi-stage builds: allows to create intermediate temporary containers to build these artifacts and then copy only the necessary files to the final image.
* Run as non-root user: Running your containers as a non-root user enhances security by limiting the container's access to the host system.
* Document your Dockerfile: Add comments and include clear documentation to describe the purpose of each instruction.

## Dockerfile linter

I use Haskell Dockerfile Linter. According to its [documentation](https://github.com/hadolint/hadolint#:~:text=A%20smarter%20Dockerfile%20linter%20that%20helps%20you%20build%20best%20practice%20Docker%20images.%20The%20linter%20parses%20the%20Dockerfile%20into%20an%20AST%20and%20performs%20rules%20on%20top%20of%20the%20AST.): "A smarter Dockerfile linter that helps you build best practice Docker images. The linter parses the Dockerfile into an AST and performs rules on top of the AST."

Usage:

```shell
docker run --rm -i hadolint/hadolint < Dockerfile
```
