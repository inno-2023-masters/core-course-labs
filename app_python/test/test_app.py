import datetime
import unittest
from time import sleep

from app import app


class MyAppTests(unittest.TestCase):
    def test_index(self):
        client = app.test_client()
        response = client.get('/')

        self.assertEqual(response.status_code, 200)

        self.assertIsInstance(response.data.decode(), str)

    def test_moscow_time(self):
        client = app.test_client()
        response1 = client.get('/').data.decode()
        sleep(1)
        response2 = client.get('/').data.decode()

        time_recv1 = datetime.datetime.fromisoformat(response1)
        time_recv2 = datetime.datetime.fromisoformat(response2)
        self.assertTrue(time_recv2 > time_recv1)
