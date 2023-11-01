# Moscow Time
- Simple app that shows the current time in MSK Timezone.

## Used technology
- HTML, CSS, JS.
- Python (packages: Flask, Gunicorn).

## Endpoints
```bash
$ flask routes
Endpoint            Methods  Rule
------------------  -------  -----------------------
home                GET      /
static              GET      /static/<path:filename>
```

## Development

`python` and `pip` are used, make sure you have them installed and available in `$PATH` then execute the following:

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

python app.py

# or
export FLASK_APP=app.py
export FLASK_ENV=development
flask run
```

## Testing

```bash
python -m pytest
```

## Unit tests
- **test_home:** A simple test that checks the availability of required components in the web app, and imitate the act of refreshing by waiting for a few seconds and requesting the same page again to see if everything works as intended.

## Docker
This full application has been uploaded to [dockerhub](https://hub.docker.com/r/iviosab/moscow_time), you can fully test it by either pulling the image from dockerhub or building the Dockerfile in this directory and then running it. 
#### Build 
```bash
# make sure you are in the app_python directory
docker build -t <name> .
```
#### Pull
```bash
docker pull iviosab/moscow_time
```
#### Run
```bash
docker run --rm -p 5000:5000 iviosab/moscow_time
```

## CI/CD
![python app workflow](https://github.com/IVIosab/core-course-labs/actions/workflows/python-app-workflow.yml/badge.svg)

Github actions has been used as CI tool. 
The workflow will trigger upon modifying anything in the `app_python` directory within a push or a pull_request.

### Jobs: 

#### Python build, lint, test
1. Check cache: Firstly we check for cached dependencies from prior runs, if found we restore them to speed up the process with the help of `actions/cache`.
2. Virtual env: We create a virtual envionrement to mimic the normal usage of the application.
3. Install dependencies: We simply ensure that we have the latest version of `pip` and then use it to install dependencies mentioned in the `requirements.txt` file.
4. Linting: we use pylint to go through all `*.py` files within the directory to check if it follows the pep8 code style.
5. Testing: we use pytest to run the unit tests. 
#### Snyk check
1. Check cache: Firstly we check for cached dependencies from prior runs, if found we restore them to speed up the process.
2. Virtual env: We create a virtual envionrement to mimic the normal usage of the application.
3. Snyk check: we simply run the `snyk test` command to check for any vulnarabilities or security issues using our `SNYK_TOKEN` which is stored as a secret in the github repo. 

#### Dockerhub
1. Login: Using the secrets `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` which are stored as secrets in the repo, we login to our dockerhub account with the help of `docker/login-action`.
2. Build-Push: After logging in, we build the docker image and push it to dockerhub with the help of `docker/build-push-action`