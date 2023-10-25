"""Testing module for checking if page is up"""
import pytest
from flaskr import create_app


@pytest.fixture()
def app():
    """App fixture for starting up the app factory"""
    cur_app = create_app()
    cur_app.config.update({
        "TESTING": True,
    })

    # other setup will go here

    yield cur_app

    # clean up / reset resources here


# Note that linter dislike redefining of app/client in fictures.
# However, this is how flask fixtures seem to work - tests will
# need matching fictures for their args.
@pytest.fixture()
def client(app):
    """Fixture for creating a virtual client"""
    return app.test_client()


@pytest.fixture()
def runner(app):
    """Fixture for setting up CLI runner"""
    return app.test_cli_runner()


def test_code200(client):
    """Testing returned status code"""
    response = client.get("/")
    assert response.status_code == 200
