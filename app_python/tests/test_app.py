import time

import pytest

from app.main import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    client = app.test_client()
    yield client

def test_time_updates_on_refresh(client):
    response1 = client.get('/')
    html1 = response1.data.decode('utf-8')

    time.sleep(2)

    response2 = client.get('/')
    html2 = response2.data.decode('utf-8')

    assert html1 != html2
