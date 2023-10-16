## Choice of the framework
To design my web app I chose **Flask** framework for the following reasons:
1. Simplicity. The task for implementing the web app was pretty simple, so I decided to use Flask, 
   because it is suitable for working with small projects, but if the app will need future expansion, it will be easier 
   to understand.
2. Flexibility. I need to be sure that in the future development that the project structure will not collapse 
   if any part of it is changed.
3. Popularity. In case of difficulties it would be easy to find ways to fix the problems.

## Best practices:
My code follows the following best coding practices:
1. Meaningful names. For example, variable moscow_time contains current time in Moscow
2. Simplicity. This code is pretty simple and can be easily understated by random programmer
3. Unified responsibility. Every single function has only one functional
4. Functions and arguments. The functions have small number of arguments that ensures that the function 
   should not be divided into smaller once 
5. Magic numbers. The code doesn't have some random numbers


## Tests' description:
For the testing of my web app I wrote 3 tests:

- First test checks that the page is loading with http code 200
- Second test confirms that the title of the page is loading
- Third test checks that the page display the time

## The best practices for code testing
- Fast: my unit tests take little time to run.
- Isolated: unit tests are standalone, can be run in isolation, and have no dependencies on any outside factors.
- Self-Checking: the tests automatically detect its result without any human interaction.
- Repeatable: unit tests return the same result without changing anything in between runs