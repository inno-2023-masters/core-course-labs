import unittest

from app import app

class TestApp(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()  # Creates a test client

    def test_index_route(self):
        # Sends a GET request to the '/' route
        response = self.app.get('/')

        # Asserts that the response status code is 200 (OK)
        self.assertEqual(response.status_code, 200)

    def test_index_content(self):
        # Sends a GET request to the '/' route
        response = self.app.get('/')

        # Asserts that the response contains the string "Moscow Time"
        self.assertIn(b"Moscow Time", response.data)

if __name__ == '__main__':
    unittest.main()

