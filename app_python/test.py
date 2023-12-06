from flask.testing import FlaskClient
from bs4 import BeautifulSoup
from datetime import datetime
import pytz

import pytest

@pytest.fixture
def client():
    from app import app
    with app.test_client() as client:
        yield client

def test_status(client):
    response = client.get('/')
    assert response.status_code == 200

def test_moscow_time(client):
    response = client.get('/')
    soup = BeautifulSoup(response.data.decode(), 'html.parser')
    time_element = soup.find(id="time").text

    cur_time = datetime.now(pytz.timezone('Europe/Moscow'))
    cur_time_str = f"Current time in Moscow: {cur_time.strftime('%Y-%m-%d %H:%M:%S')}" 
    assert  cur_time_str == time_element
