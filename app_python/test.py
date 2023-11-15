import pytest
import time

from app_python.app import app


@pytest.fixture
def client():
    app.config.update({"TESTING": True})

    with app.test_client() as client:
        yield client

 
def test_get_response(client):
    response = client.get("/")
    assert response.status_code == 200

    
def test_time_changed(client):
    time1 = client.get("/").data.decode('utf-8')
    time.sleep(1)
    time2 = client.get("/").data.decode('utf-8')
    assert time1 != time2

