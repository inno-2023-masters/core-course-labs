import datetime
import unittest
from time import sleep
from src.app import app
from src.app import create_visits_file_if_not_exists


def extract_time_from_response(response):
    """
    :param response: TestResponse
    :return: time object extracted from response
    """
    body = response.text
    time_string = body.split(": ")[-1]
    return datetime.datetime.strptime(time_string, "%H:%M:%S")


class TimeServerTests(unittest.TestCase):
    def test_page_available(self):
        """
        Check page available and response status code is 200
        """

        create_visits_file_if_not_exists()
        response = app.test_client().get("/")

        self.assertEqual(
            response.status_code, 200, msg="Response status code must be 200"
        )

    def test_time_increase_on_refresh(self):
        """
        Check time displayed on the page increases on each page refresh (new request)
        """

        create_visits_file_if_not_exists()
        response1 = app.test_client().get("/")
        sleep(1)
        response2 = app.test_client().get("/")

        time1 = extract_time_from_response(response1)
        time2 = extract_time_from_response(response2)

        self.assertGreater(time2, time1, msg="Time must increase on each new request")


if __name__ == "__main__":
    unittest.main()
