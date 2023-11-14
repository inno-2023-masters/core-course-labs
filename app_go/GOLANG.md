# GO description

## Framework

I do not use any framework as everything needed to complete the task is possible with standard library.
It is my first time writing web application in Go language, I faced a lot of issues getting familiar with it, but I explored a lot of best practises and tried to follow them.

### Best practices for Go web application

1) Project structure: for a such simple project it is fine to use just main.go and go.mod files (cited from golang-standards). However, for bigger application we can follow structure described in [golang-standards](https://github.com/golang-standards/project-layout)
2) Define server startup & lifecycle: for example, use `defer` to close dependencies like the database after the startup function returns
3) Routers: allow to structure code and match endpoints to domain.

### Used Go linters

* go fmt: automatically formats Go source code.
  * Usage: go fmt .
* go vet: examines Go source code and reports suspicious constructs
  * Usage: go vet .

## Tests

For tests I use standard go library `test`

### Best practices for tests

* Keep the tests small and independent, making it easier to identify and fix any issues
* Cover edge cases and test different scenarios
* Utilize assertion libraries such as Go's testing package or third-party libraries like "testify"
* Encapsulate common setup and teardown code in test helpers to avoid code duplication
* Ensure that each test is independent and doesn't rely on any specific order of execution or shared state
