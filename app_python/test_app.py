import unittest
from unittest.mock import patch
from app import app
from datetime import datetime


class FlaskAppTestCase(unittest.TestCase):

    def setUp(self):
        app.testing = True
        self.app = app.test_client()

    def test_display_time_route(self):
        # Test if the / route returns a 200 status code
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)

    @patch('app.datetime')
    def test_display_time_content(self, mock_datetime):
        # Set a fixed datetime for the test
        fixtime = datetime(2023, 1, 1, 12, 0, 0)
        mock_datetime.now.return_value = fixtime

        # Test if the content of the / route includes the expected time
        response = self.app.get('/')
        expect = fixtime.strftime('%Y-%m-%d %H:%M:%S')
        self.assertIn(
            f'Current time in Moscow: {expect}',
            response.get_data(as_text=True)
        )


if __name__ == '__main__':
    unittest.main()
