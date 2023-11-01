# Moscow Time
- Simple app that shows the current time in MSK Timezone.

## Used technology
- GoLang

## Development

`golang` is used, make sure you have it installed then execute the following:

```bash
go mod download # although not necessary, because there are no external dependencies
go run main.go # you can access the website on http://localhost:8080/
```

## Testing

```bash
go test
```
## Unit tests
- **main_test:** A simple test that checks the availability of required components in the web app and return code of the request.


## Docker
This full application has been uploaded to [dockerhub](https://hub.docker.com/r/iviosab/moscow_time_go), you can fully test it by either pulling the image from dockerhub or building the Dockerfile in this directory and then running it. 
#### Build 
```bash
# make sure you are in the app_golang directory
docker build -t <name> .
```
#### Pull
```bash
docker pull iviosab/moscow_time_go
```
#### Run
```bash
docker run --rm -p 8080:8080 iviosab/moscow_time_go
```
## CI/CD
![golang app workflow](https://github.com/IVIosab/core-course-labs/actions/workflows/golang-app-workflow.yml/badge.svg)

Github actions has been used as CI tool. 
The workflow will trigger upon modifying anything in the `app_golang` directory within a push or a pull_request.

### Jobs: 

#### Golang build, test
1. Check cache: Firstly we check for cached dependencies from prior runs, if found we restore them to speed up the process with the help of `actions/cache`.
2. Build: we simply build the go app and specifying where the binary should be.
3. Test: we test the go app by simply using `go test` 
#### Snyk check
1. Check cache: Firstly we check for cached dependencies from prior runs, if found we restore them to speed up the process.
2. Build: we simply build the go app and specifying where the binary should be.
3. Snyk check: we simply run the `snyk test` command to check for any vulnarabilities or security issues using our `SNYK_TOKEN` which is stored as a secret in the github repo. 
#### Dockerhub
1. Login: Using the secrets `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` which are stored as secrets in the repo, we login to our dockerhub account with the help of `docker/login-action`.
2. Build-Push: After logging in, we build the docker image and push it to dockerhub with the help of `docker/build-push-action`