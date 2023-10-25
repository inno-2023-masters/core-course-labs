"""Testing module for datetime functionality"""
import pytest
from flaskr import create_app
from flaskr import util_functions as uf


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


def test_datetime(client):
    """Actual datetime testing. Allowed deviation of 2 minutes"""
    response = client.get("/")
    datetime_now = uf.get_date("Europe/Moscow", '%Y-%m-%d %H:%M:%S')
    assert uf.compare_dates(datetime_now, response.data)
