import unittest
from app import app
import time


class TestApp(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_url(self):
        response = self.app.get("/")
        self.assertEqual(response.status_code, 200)

    def test_time_updates_on_refresh(self):
        response_1 = self.app.get("/")
        time.sleep(2)
        response_2 = self.app.get("/")

        content_1 = response_1.get_data(as_text=True)
        content_2 = response_2.get_data(as_text=True)

        self.assertNotEqual(content_1, content_2)


if __name__ == "__main__":
    unittest.main()
