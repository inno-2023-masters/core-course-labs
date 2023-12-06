import time
import unittest

from fastapi.testclient import TestClient

from app_python.src.main import app


class ClientTest(unittest.TestCase):
    def testClient(self):
        client = TestClient(app)

        first = client.get("/")
        self.assertEqual(first.status_code, 200)

        time.sleep(0.01)

        second = client.get("/")
        self.assertEqual(second.status_code, 200)

        self.assertNotEqual(first.json(), second.json())


if __name__ == '__main__':
    unittest.main()
