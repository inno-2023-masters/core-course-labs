## Framework choice

I decided to use Spring framework for this project, because it is wide-used, well-documented, powerful and has initial project generation feature - https://start.spring.io/ that makes it easy to start. Also, it supports both Java and Kotlin.

## Used best practices
- Regular Commits (used isolated commits for each step of the project).
- Descriptive Commit Messages (each commit has clear and full description of what was done).

## Testing and code quality
- For testing, I deployed an application every time using `Intellij IDEA` "Run" button and opened page http://127.0.0.1:8080 in my web browser.
- Also, I implemented an easy-to-understand, single-responsible (different features in different controllers), consistent, easy testable and free of bugs code to ensure code quality.

## Unit tests and best practices

I added 6 unit tests for my functionality:

`CurrentTimeControllerTest` contains 3 tests for current time page:
1. `timeControllerReturnsParsableTime` checks that time controller returns string that can be parsed as time.
2. `timeControllerReturnsCorrectZoneOffset` checks that time controller returns time with correct Moscow zone offset. 
3. `timeControllerReturnsAccurateTime` checks that time controller returns accurate time with error of one second.

`PageCounterControllerTest` contains 3 tests for page counter page:
1. `pageCounterReturnsIntTest` checks that page counter controller returns string that can be parsed as Int.
2. `pageCounterReturnsOneOnFirstOpeningTest` checks that page counter controller returns message with value `1` on the first call.
3. `pageCounterIncrementsResponsesOnEachCall` checks that page counter increments number in its responses on each call.

I also have `Lab1ApplicationTests` which checks that context of my application is loading correctly.

For my unit tests I followed the following practices:
- Every test method name describes what functionality it tests
- Every method tests single part of the functionality
- Every test is simple and readable
- Tests has no combined assessments
- Test methods combined to test cases logically by functionality
