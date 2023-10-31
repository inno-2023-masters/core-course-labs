# JS

## Framework Justification

Node.js is a standard for js web serer development with practically zero competitors.
Express is a framework built upon node js.
It is the most popular solution for quick server development.
It adds several useful features to node.JS,
like Middleware, Routing, Templating and DB integration.
Other solutions are less popular, so I chose Express.
TypeScript makes maintaining code easier.
It is a superset of JavaScript, so it is easy to learn.

## Applied JS Best Practices

- **Linter**: ESLint is used for code style checking
- **Project structure**: Application of approved project structures
- **Gitignore**: Keeping repository clean
- **Autotests**: Async tests using Jest

## Applied Unit Tests Best Practices

- **Test One Thing at a Time**: This makes it easier to understand the cause of a test failure.

- **Test Isolation**: Each test should be independent of other tests.
  This means that tests should not share state, and should not depend on each other.

- **Test Naming**: Test names should be descriptive and should follow a consistent pattern.

- **Test Coverage**: Test coverage is a measure of how much of your code is covered by tests.
  It is important to have high test coverage to ensure that your code is well tested.

- **Fixture use**: Fixtures help to reduce code duplication and improve test readability.

- **Mocking**: Mocking allows to test code in isolation.
