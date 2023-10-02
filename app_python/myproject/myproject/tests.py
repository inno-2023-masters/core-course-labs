from django.test import TestCase, Client
from django.urls import reverse
from datetime import datetime, timezone, timedelta

class CurrentMskTimeTest(TestCase):
    def setUp(self):
        self.client = Client()

    def test_current_msk_time(self):
        url = reverse('display_time')
        response = self.client.get(url)
        moscow_tz = timezone(timedelta(hours=3))
        now = datetime.now(moscow_tz)
        expected = f"Current time is: {now.strftime('%Y-%m-%d %H:%M:%S')}"
        self.assertEqual(response.content.decode(), expected)
