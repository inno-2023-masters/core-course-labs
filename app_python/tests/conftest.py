from fastapi.testclient import TestClient
import pytest

from app_python.app import app


@pytest.fixture(scope="module")
def test_client():
    client = TestClient(app)
    return client
