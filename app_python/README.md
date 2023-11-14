# Python web application

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h3 align="center">DevOps course labs</h3>
  <p align="center">
    An application developed within Innopolis Univeristy "DevOps Engineering" course
    <br />
    <a href="https://github.com/quiner1793/dev-ops-course-labs"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/quiner1793/dev-ops-course-labs">View Demo</a>
    ·
    <a href="https://github.com/quiner1793/dev-ops-course-labs/issues">Report Bug</a>
    ·
    <a href="https://github.com/quiner1793/dev-ops-course-labs/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

Web application developed using best practices of production development.

Includes:

* DevOps tasks
* Backend tasks

### Built With

Framework used:

* ![FastAPI][FastAPI]

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

Required software:

* python 3.10

### Installation

1. Clone the repo

   ```sh
   git clone https://github.com/quiner1793/dev-ops-course-labs.git
   ```

2. Install python packages

   ```sh
   pip install -r requirements.txt
   ```

3. Enter your variables in *.env files

   ```env
    SERVER_HOST=127.0.0.1
    SERVER_PORT=8080
   ```

### Docker

* How to build

```shell
docker build -t app-python .
```

* How to pull

```shell
docker pull quiner/app-python:latest
```

* How to run

```shell
docker run -d --env-file fastapi.env -p 8080:8080 app-python
```

### Unit Tests
```shell
pytest tests/
```

## CI workflow
* checkout: clones the repository to the GitHub Actions runner
* set up Python: initializes the Python 3.10 env
* install dependencies: installs the necessary Python packages
* linting: apply `black` linter
* tests: run unit tests using `pytest`
* vulnerability check: scan for vulnerabilities uses Snyk
* docker: login to DockerHub, build Docker image using build-cache, push to DockerHub

<!-- USAGE EXAMPLES -->
## Usage

To view current Moscow time open http://{host}:{port}/time/moscow_time

_For more examples, please refer to the [Documentation](https://example.com)_

<!-- CONTRIBUTING -->
## Contributing

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->
## Contact

Anatoliy Shvarts - a.shvarts@innopolis.university

Project Link: [https://github.com/quiner1793/dev-ops-course-labs](https://github.com/quiner1793/dev-ops-course-labs)

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [Innopolis University](https://innopolis.university/)
* [Img Shields](https://shields.io)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[FastAPI]: https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=FastAPI&logoColor=white
