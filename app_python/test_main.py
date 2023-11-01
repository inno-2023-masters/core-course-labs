import unittest
from main import app


class TestApp(unittest.TestCase):
    def setUp(self):
        app.testing = True
        self.app = app.test_client()

    def test_current_time(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b"The current time in Moscow is:", response.data)


if __name__ == '__main__':
    unittest.main()
