from django.test import TestCase
from .views import index
from datetime import datetime
from zoneinfo import ZoneInfo


class MainPageTestCase(TestCase):
    def test_main_page_returns_200_response_code(self):
        self.assertEquals(index(None).status_code, 200)

    def test_main_page_returns_parsable_iso_datetime(self):
        index_response = index(None).getvalue().decode()
        try:
            datetime.fromisoformat(index_response)
        except ValueError:
            self.fail("Main page returned unparsable datetime: " + index_response)

    def test_main_page_returns_current_datetime_in_moscow_zone(self):
        actual_time = datetime.fromisoformat(index(None).getvalue().decode())
        expected_time = datetime.now(tz=ZoneInfo("Europe/Moscow"))

        # Calculating the difference between index page response and the real current datetime
        period = expected_time - actual_time

        # Test is passed if the period is less than 1 second
        self.assertLess(period.seconds, 1)
