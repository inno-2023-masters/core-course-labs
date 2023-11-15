"""Python devops tests"""
import re
import time
import requests
from fastapi.testclient import TestClient
from app_python.app.main import app

client = TestClient(app)


def test_main():
    """Checks if it's working"""
    response = requests.get('http://127.0.0.1:8000/')
    assert response.status_code == 200
    assert 'current time in moscow' in response.text.lower()
    assert len(re.findall(r'\d\d:\d\d:\d\d', response.text)) > 0


def test_update():
    """Checks if time can update"""
    response1 = requests.get('http://127.0.0.1:8000/')
    time.sleep(1)
    response2 = requests.get('http://127.0.0.1:8000/')

    print(response1)
    print(response2)

    assert response1.content != response2.content
