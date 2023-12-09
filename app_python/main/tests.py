from flask_testing import TestCase
from main.app import app


class TestCurrentTimeMoscow(TestCase):
    def create_app(self):
        app.config["TESTING"] = True
        return app

    def test_current_time_moscow(self):
        response = self.client.get("MoscowTime/")
        self.assertEqual(response.status_code, 200)
        self.assertIn(b"Time in Moscow:", response.data)
