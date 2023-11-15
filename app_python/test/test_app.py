import pytz
import json
from freezegun import freeze_time
from datetime import datetime
from fastapi.testclient import TestClient
from src.app import app

tz = pytz.timezone('Europe/Moscow')
client = TestClient(app)


def test_time():
    ts = datetime.now()
    with freeze_time(ts):
        res = client.get('/')
        assert res.status_code == 200, f'The server responded with \
            status_code={res.status_code}, expected 200'
        expected = tz.localize(ts).isoformat()
        assert res.json()['timestamp'] == expected, f'Timestamps dont match'
