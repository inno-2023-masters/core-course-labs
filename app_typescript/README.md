![workflow](https://github.com/ShohKhan-dev/core-course-labs/actions/workflows/app_typescript-ci.yml/badge.svg)


# Portfolio and Comics Viewer


Using Svelte-kit framework in TypeScipt


```
$ git clone https://github.com/ShohKhan-dev/core-course-labs
$ cd core-course-labs
$ cd app_typescript
```

## Running the Application

1. pull the Docker Image from existing repo on Docker hub:

   ```
   docker pull rametago/my-first-repo:svelte
   ```

2. Run the Docker Container:

   ```
   docker run -d -p 5173:5173 rametago/my-first-repo:svelte
   ```

The application will be accessible at http://localhost:5173 in your web browser.


# CI Workflow
it works as follows:
- setting up python and enviroment
- install dependencies
- linting code
- run some tests to check application
- install and test project with Snyk
- docker login
- build and push image to dockerhub

**Used Secrets for Token and login information**
