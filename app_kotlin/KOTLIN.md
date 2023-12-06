# Project information

## Best practices applied
1. Document and Comment Your Code Properly. Example: The project has documented functions.
2. Write Readable Code.
3. Test Your Code. Example: The project has two tests.
4. Use logging. I have used `kotlin-logging-jvm` library that provided logger.
5. Keep the unified file structure that matches conventions.
6. Use `.editorconfig` to keep code style unified.
7. Use `.gitignore` to keep project files clean.
8. Use code linter that is injected in application building process. I have used `detekt` formatter.
9. Use [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) for commit naming.
10. Use MVC pattern for code architecture.
11. Use Spring Dependency Injection and Inversion of Control patterns.


## Framework selection
I have used Spring production framework because it is the most popular and used framework that provides Dependency Injection and Web for Java/Kotlin. Also, I have already had experience with it.


## Linter
I have used code linter named [`detekt`](https://detekt.dev/) for Kotlin. For linting I have used default `detekt` rules with some overriding. The changes could be found here: `./app_kotlin/config/detekt.yml`.


## Unit tests

### What is tested?
There are only two logical components in the service: controller, service.
Therefore, there are only two main tests for these components:
1. **Controller**: test for page availability and page's text correctness. **Spring WebMvcTest** is used for test web client.
2. **Service**: test that time will increase after page refresh (new request is received).
### Tools
* [SpringBoot Starter Test](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-test)
* [Kotlin Test](https://kotlinlang.org/api/latest/kotlin.test/)
* [Mockk](https://mockk.io/)
* [SpringMockk](https://github.com/Ninja-Squad/springmockk)

### Best practices applied for testing:
Best practices was taken from here:
[for Kotlin](https://phauer.com/2018/best-practices-unit-testing-kotlin/),
[for Java](https://phauer.com/2019/modern-best-practices-testing-java/)
* Use **JUnit5** framework.
* Put the test method names in backticks and use spaces.
* Initialize the required objects in the constructor.
* Use **MockK** to create mocks in a convenient and idiomatic way.
* Write dumb tests by avoiding the reuse of production code and focusing on comparing output values with hard-coded values.
* **KISS** > **DRY**.
* A test should contain three blocks which are separated by one empty line: *Given*, *When*, *Then*.
