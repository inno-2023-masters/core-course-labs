"""
Test that checks the initial load of the home page and after refreshing.
"""
from time import sleep
import pytest
from app import app


@pytest.fixture(name="client")
def fixture_client():
    """
    Create a test client using the Flask application configured for testing
    """
    app.config['TESTING'] = True
    with app.test_client() as testing_client:
        with app.app_context():
            yield testing_client


def test_home(client):
    """
    GIVEN a Flask application configured for testing
    WHEN the '/' page is requested (GET)
    THEN check the response is valid
    """
    # Make the initial request to get the first displayed time
    response = client.get('/')
    assert response.status_code == 200
    assert b'Current MSK Time' in response.data
    assert b'time' in response.data

    # Wait for a few seconds (you can adjust the wait time as needed)
    sleep(3)

    # Make a second request to get the time after refreshing
    response = client.get('/')
    assert response.status_code == 200
    assert b'Current MSK Time' in response.data
    assert b'time' in response.data
