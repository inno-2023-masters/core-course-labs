import pytest
from fastapi.testclient import TestClient
from src.main import app


@pytest.fixture
def app_client():
    with TestClient(app=app, base_url="http://test") as client:
        yield client
