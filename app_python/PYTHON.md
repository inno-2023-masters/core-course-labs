# Python web application 

## Description

Here I developed small Python web application that displays the current time in Moscow.

### Why FastAPI framework?
FastAPI was chosen as a framework for this application due to 
its speed, safety and simplicity. Also, FastAPI framework
helps to create web applications that are fast, reliable,
and easy to understand, even for simple projects like 
this given task. 

### Best practices
- Using `requirements.txt` for easy installation of the necessary libraries
- Following PEP 8 standard for more readable code
- Adding test for checking the application

## Tests

For this application the first test I created is the 
unit test which checks if the server is working 
(`response.status_code == 200`) and matches the format of time.


Another test for this application checks that time updates.
### Best practices
- Meaningful names for the tests functions
- Keeping tests in another directory dedicated for tests
- Each test should not depend on another test
- No using `if` in the tests
- Arrange-Act-Assert structure

### References:
https://fastapi.netlify.app/ru/tutorial/path-params/