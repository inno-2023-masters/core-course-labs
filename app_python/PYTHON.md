# Moscow Time Website 

## Flask Framework
 Why Flask?
1. Easy to learn and use
2. Single-page applications (SPA)
3. Jinja2 Templating
4. RESTful by Design
5. Pythonic

## Best Practices, coding standards

**PEP 8** - a document describing the convention on how to write code in Python.
1. Indents of 4 spaces to indicate code blocks.
2. Spaces around assignment operators (=) and binary operators (+) to improve readability and after commas in imports
3. Comments start with single space and after the code in the same line and separate from the code with at least two spaces. 

**CSS Styling**

For better presentation I applied CSS styles to my website. 

**HTML Templates**

Instead of embedding HTML directly in my Python code, I used HTML templates to separate the presentation from the application logic.

**Project Structure** 

Organized my project with a clear directory structure. 

**Documentation** 

I documented my code with comments to make it more understandable for others. 

## Manual testing of a web application 

**Introduction**

The purpose of this document is to describe the procedure for manual testing of a web application that displays the current time in Moscow using Flask.

**Description Of The Application Under Test**

The Flask web application displays the current time in Moscow on the main page.

**Preparing for Testing**

1. Make sure that the web application is running and accessible by URL (for example, http://127.0.0.1:5000).

**Testing Steps**

1. Open a web browser and navigate to the application URL.
2. View the current time on the page.
3. Refresh the page.
4. Check that the time has been updated correctly.

**Expected Results**

- After the page is refreshed, the time is expected to be updated and displayed on the page.

**Conclusion**

The testing was successfully completed. All the steps have been completed and the expected results have been achieved.

## Unit Tests

In this project, I have implemented unit tests for my Moscow Time application using the built-in `unittest` framework. Tests are designed to ensure the correctness and reliability of my codebase.

### Test 1: `test_index_route`

- **Purpose:** This test ensures that the '/' route returns a 200 (OK) status code.
- **Expected Outcome:** The response status code should be 200.

### Test 2: `test_index_content`

- **Purpose:** This test checks if the '/' route contains the string "Moscow Time."
- **Expected Outcome:** The response content should include the text "Moscow Time."

To run the unit tests, follow these steps:

1. Navigate to the project's root directory.
2. Run the following command:
python tests/test_app.py

## Best Practices for Code Testing

Clear and Descriptive Test Names
I followed the best practice of giving clear and descriptive names to test cases, making it easy to understand what each test is checking.

Isolation and Independence
Each test case is designed to be independent of others, ensuring that the tests can be run in any order without dependencies on previous tests.

Assertions
I've used assertion methods provided by unittest, such as self.assertEqual and self.assertIn, to perform checks within test cases.

Test Client
I've created a test client using app.test_client() to simulate HTTP requests and test application routes.

Main Guard
I included the if __name__ == '__main__': block to allow running the tests when executing this script directly.
