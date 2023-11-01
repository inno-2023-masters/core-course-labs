# Moscow Time Web Application
This is a simple Python web application that displays the current time in Moscow.

## Installation and usage
To run this application, please follow these steps:

1. Clone the repository and navigate to the `app_python` folder.
2. (Optional) Create and activate a virtual environment.
3. Install the Flask library using `pip install Flask`.
4. Execute the `main.py` file using `python main.py`.
5. Open your browser and go to `http://localhost:5000` to view the current time in Moscow.

## Built and deployment
To build the app and deploy to the remote server please follow the instructions https://flask-docs.readthedocs.io/en/latest/tutorial/deploy/


## Dependencies
- Python 3.x
- Flask
- pytz

Flask is perfect production-ready framework to develop simple web applications in Python.

## Unit Tests

There are unit tests for this application with `unittest` framework. These tests ensure that the application functions correctly.

### Test Cases

**test_current_time** - Checks if the index ('/') route returns the current time in Moscow, Russia.

Expected Outcome: The response status code should be 200, and the response data should contain "The current time in Moscow is:".

### Running Tests

You can run the unit tests using the following command:

```bash
python test_main.py


## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

