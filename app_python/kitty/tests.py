# Create your tests here.
from django.test import TestCase
from django.urls import reverse
import time


class TimeUpdateTestCase(TestCase):
    def test_url_status_code(self):
        url = reverse("get_time")
        response = self.client.get(url)

        # Check if the status code is 200 (OK)
        self.assertEqual(response.status_code, 200)

    def test_time_updates_on_refresh(self):
        # Access the initial page
        response_1 = self.client.get(reverse("get_time"))
        time.sleep(3)  # Wait for 3 seconds

        # Access the page again
        response_2 = self.client.get(reverse("get_time"))

        # Extract the content of the responses
        content_1 = response_1.content.decode("utf-8")
        content_2 = response_2.content.decode("utf-8")

        # Assert that the content is not equal
        self.assertNotEqual(content_1, content_2)
