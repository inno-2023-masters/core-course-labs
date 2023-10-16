import re
import unittest
import main
from dateutil.parser import parse


def is_date(string, fuzzy=False):
    """
    Return whether the string can be interpreted as a date.

    :param string: str, string to check for date
    :param fuzzy: bool, ignore unknown tokens in string if True
    """
    try:
        parse(string, fuzzy=fuzzy)
        return True

    except ValueError:
        return False


class TestCase(unittest.TestCase):
    def setUp(self):
        main.app.config['TESTING'] = True
        main.app.config['CSRF_ENABLED'] = False
        self.app = main.app.test_client()

    def test_status_code(self):
        landing = self.app.get("/")
        assert landing.status_code == 200

    def test_title(self):
        landing = self.app.get("/")
        html = landing.data.decode()
        assert "<title>Time app</title>" in html

    def test_time(self):
        landing = self.app.get("/")
        html = landing.data.decode()
        tag = "h1"
        reg_str = "<" + tag + ">(.*?)</" + tag + ">"
        res = re.findall(reg_str, html)
        assert is_date(res[0], True)


if __name__ == '__main__':
    unittest.main()
