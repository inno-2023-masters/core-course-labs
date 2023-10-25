from datetime import datetime
import time
import pytz


URL_TEMPLATE = "/api/time"


def test_show_time(test_client):
    response1 = test_client.get(URL_TEMPLATE)
    assert response1.status_code == 200

    moscow_tz = pytz.timezone('Europe/Moscow')
    initial_time = datetime.now(moscow_tz).strftime('%Y-%m-%d %H:%M:%S')

    time.sleep(1)  # wait for 1 second to ensure the time changes

    response2 = test_client.get(URL_TEMPLATE)
    assert response2.status_code == 200

    new_time = datetime.now(moscow_tz).strftime('%Y-%m-%d %H:%M:%S')

    assert response1.json()["Current time in Moscow"] != response2.json()["Current time in Moscow"]
    assert initial_time != new_time
