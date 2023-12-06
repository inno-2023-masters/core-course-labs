import unittest
from MoscowTime import app

class FlaskTest(unittest.TestCase):
    def test_index(self):
        tester = app.test_client(self)
        response = tester.get("/")
        status_code = response.status_code
        self.assertEqual(status_code,200)

    def test_error(self):
        tester = app.test_client(self)
        response = tester.get("/some_page")
        status_code = response.status_code
        self.assertEqual(status_code,404)

if __name__ == '__main__':
    unittest.main()


    