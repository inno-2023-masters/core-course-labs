# Test Python Web Application

This is a simple web application for Innopolis DevOps course by Yaroslav Kim.

## Framework

This application uses Flask. It is known for it's apparent simplicity, and use in microservices. Many templates and internet resources are already available, and the structure is intuitive.

Moreover, the framework is relatively lightweight - which is good for a small web application made during the course.

## Standards

For this web application we will use the following standards:

- [PEP 8](https://peps.python.org/pep-0008/) as guideline on python codestyle
- [Official Flask Documentation](https://flask.palletsprojects.com/en/2.3.x/) on project structure

## Testing

- [Official Flask Documentation](https://flask.palletsprojects.com/en/2.3.x/testing/) provides tutorial on how to test applications. Followed this to create testing packages.

## Unit Tests

There are 2 testing modules in `tests` directory for this application:

- `test_code200` - simple test for if the service is even functional and returns status code 200.
- `test_datetime` - test whether the time provided on the page is correct within a 2 minute margin.

## Linter

- Used [flake8](https://pypi.org/project/flake8/) as linter for the project.
- Same linter is also used in CI