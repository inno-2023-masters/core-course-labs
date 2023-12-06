from datetime import datetime

from fastapi.testclient import TestClient

from main import app

test_client = TestClient(app)


def test_root():
    response = test_client.get("/")
    assert response.status_code == 200

    body = response.json()
    try:
        datetime.strptime(body, "%d-%m-%Y %H:%M:%S")
    except Exception as e:
        raise AssertionError(e)


if __name__ == "__main__":
    test_root()
