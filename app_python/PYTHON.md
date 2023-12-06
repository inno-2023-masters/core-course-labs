## Python Web Application

#### Framework

As a web framework for python I used `Flask`. Flask is a popular web framework for Python, known for its simplicity, flexibility, and fine-grained control. It is often used to build web applications due to these reasons. Moreover, it is lightweight and highly extensible, which is important requirement to build qualitative web application. Nevertheless, it is not recommended to use it in very large web applications due to its simplicity, and sometimes it may seems that user should make too many decisions by themselves, what might be not very suitable for big projects. But for this project these problems are not threaten.

#### Best practises

There are several best practices I followed in order to build web application: 

- **Project Structure**: Organize project structure logically. Separate application into different modules based on their functionality. This keeps the codebase clean and easy to navigate.
- **Template Usage**: Use Jinja2 templates for frontend rendering. Keep logic in views and presentational aspects in templates.
- **Testing**: Write tests for application. Tests can help to catch bugs and ensure code works as expected.
- **Keep code clean**: It is important to keep codebase clean, do not use too big function. If necessary it is reasonable to split code into several logical modules.
- **Regularly use linter**: That will lead to enforcing code standards in project, catch some errors in early stage and keep code clean.

As a testing framework was used `pytest` due its simplicity and popularity. 
As a linter was used `pylint` as a standard linter for python.

#### Unit Tests

- **Use Test Framework** instead of trying to implement tests by yourself. It will reduce time spent to test your code, and provide you great testing environment and tools to build tests in the most efficient way. As a framework I have choosen `pytest` as one of the most popular and flexible Python testing framework. It allows simply build tests and generate informative reports on it.

- **Use Test Fixtures** in order to provide clean and reproduceable environment for each test. It will improve test maintainability and make it more reliable.

- **Do not make tests too big**, test should be short enough and test only the specific functionality in application. Usually there are several tests exist for one app. If there are several cases for single function in the code, the testing also should be split into several tests, one per each case.

- **Arrange, Act, Assert testing** refers to useful tactic in application testing. It is ueful to follow this scheme. It implies that there are three stages exist in single test. First - Arrange - environment setup is performed, all neccessary objects are created. Second - Act - tested functionality is invoked. And the last one - Assert - the expected results are compared with actual ones. In most languages there are special construction `assert` which syntactically simplifies performing this stage.

- **Tests should not depend on each other** and on execution order.
