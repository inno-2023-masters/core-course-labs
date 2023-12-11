# Flask Web Application

## Choosing Flask Framework for the Web Application

I have chosen the Flask framework for my web application.

1. **Lightweight and Micro**: Flask is a lightweight microframework for Python. It does not come with a lot of built-in features or components that I may not need for my specific project. Making it a great choice for projects where simplicity and flexibility are important.

2. **Simplicity**: Flask is known for its simplicity and ease of use. It has a clean and intuitive API.

3. **Flexibility**: Flask doesn't impose a specific project structure or dictate how I should organize my code. This flexibility allows me to structure my application in a way that aligns with my project's needs and preferences.

4. **Scalability**: While Flask is well-suited for small to medium-sized applications, it is also scalable.

5. **Recommendation**: The course instructor recommend me to use Flask. Hence I am using it.

## Project Best Practices

This project adheres to several best practices to ensure code quality, maintainability, and ease of development. Here are some of the key practices we've implemented:

1. **Good File Structure**: The project follows a well-organized file structure.

2. **Linters for Readme and Python**: Linters are employed to maintain consistency and quality in both the Python code and the README file.

3. **Virtual Environment**: A virtual environment is used to isolate project dependencies. This practice avoids conflicts between different projects and ensures that the project uses the correct versions of libraries and packages.

4. **Gunicorn for Production**: In a production environment, Gunicorn is utilized to run the Flask application. Gunicorn is a production-ready WSGI server that enhances application performance and reliability, making it suitable for deployment.

5. **Test Cases**: The project includes test cases to verify the functionality and correctness of the code. Testing is essential for catching issues early in the development process and maintaining the project's stability.

## Tests

I used `flask_testing` package for testing. The tests are:

1. **test_current_time_moscow**: Checks if the `MoscowTime/` endpoint is working by testing the returned status code and searching for the string "Time in Moscow:" in the response.
