# Python

## Framework Justification

Flask can be a good candidate for such app because of its simplicity.
However, it lacks speed because it is single threaded.
FastAPI is a good modern alternative.
Django also can be used for such tasks.
However, it is very bulky and unnecessary for a such simple app.

Some advantages of FastAPI:

- **Performance**: FastAPI is designed for high performance, making it suitable
  for real-time applications like this one.

- **Automatic Validation**: FastAPI performs automatic data validation,
  reducing the chances of errors and making the code more robust.

- **API Documentation**: FastAPI automatically generates interactive API documentation
  using Swagger UI or ReDoc, making it easier to understand and test your API.

- **Type Hints**: FastAPI leverages Python type hints to provide better IDE support,
  fewer runtime errors, and improved code readability.

- **Async Support**: FastAPI supports asynchronous programming,
  allowing you to build efficient asynchronous endpoints when needed.

- **Ease of Use**: FastAPI's intuitive syntax and clear structure make it
  easy to develop web applications quickly.

## Applied Python Best Practices

- **PEP 8**: Follow the PEP 8 style guide for code readability and consistency.

- **Pre-commit hooks**: Linters and formatters run every time we commit a change.
  I used autoflake, isort and black for python and pymarkdown, mdformat for Markdown.

- **Environment Management**: Use of virtual environments for development.

- **Project structure**: Application of approved project structures from
  [community](https://github.com/zhanymkanov/fastapi-best-practices)

- **Gitignore**: Keeping repository clean

- **Autotests**: Async tests using pytest

## Applied Unit Tests Best Practices

- **Test One Thing at a Time**: This makes it easier to understand the cause of a test failure.

- **Test Isolation**: Each test should be independent of other tests.
  This means that tests should not share state, and should not depend on each other.

- **Test Naming**: Test names should be descriptive and should follow a consistent pattern.

- **Test Coverage**: Test coverage is a measure of how much of your code is covered by tests.
  It is important to have high test coverage to ensure that your code is well tested.

- **Fixture use**: Fixtures help to reduce code duplication and improve test readability.

- **Mocking**: Mocking allows to test code in isolation.
