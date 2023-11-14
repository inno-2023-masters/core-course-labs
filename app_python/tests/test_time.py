from fastapi.testclient import TestClient

from src.server import app


client = TestClient(app)


def test_moscow_time():
    response = client.get("/time/moscow_time")
    assert response.status_code == 200


def test_root():
    response = client.get("/")
    assert response.status_code == 404
