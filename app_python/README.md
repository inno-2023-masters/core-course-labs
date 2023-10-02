## Python web app

This is a web application which displays current time in moscow time zone. It is written using Django as a framework.

### To install
1. Clone the repository
2. Install django:

     `pip3 install django`
3. Run the app:

    `python manage.py runserver`

Go to http://localhost:8000/display_time/ to see current time

### To test
1. Run tests using the following command:

`python manage.py test myproject.tests.CurrentMskTimeTest`