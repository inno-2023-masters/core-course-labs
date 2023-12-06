## Best practices for Python application

1. Use Virtual environments in order to avoid problems with library clashes.
2. Use formatting tools to scan code and detect stylistic errors and violations of various code conventions in it.
3. Use linters to avoid stylistic irregularities etc.
4. Use `.gitignore` to hide unnecessary files from git.

### Practices in MoscowTime application

1. Virtual environment
2. Linters
3. `.gitignore`

#### Pros:
1. Flask does not require any additional libraries or tools to run.
2. Flask has a simple and intuitive syntax, making it easy to use.
3. Flask allows to customize and extend the framework to meet specific needs.

#### Cons:
1. Flask does not have built-in security features, so it is needed to implement security measures.


## Best practices for unit tests

-  Test the routes and views of Flask application to ensure that they are working as expected.
- Flask has a built-in testing framework that makes it easy to write and run tests for your application.

## Used unit tests

Two unit tests are used:

- One test will check the existing landing page, will check status code which should be equal to 200
- The second one will check a non-existing page and should check status code which should be equal to 404


