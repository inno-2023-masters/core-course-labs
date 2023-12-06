#### DOCKERFILE lint

I am using this site for linting the Dockerfile https://hadolint.github.io/hadolint/.

As I have only one file it is quite easy to just check it in another source and not to 
download some additional linters

#### Docker best practices

Main and the most important - NO ROOT

I am using linter for the Dockerfile

No `chown` while copying

I am using trusted base-image (`python` is maintained by the Docker Team)

Only one port is exposed (minimum needed)

My image has version tag 0.1.0. Versioning will be easy in the future

I am using .dockerignore file