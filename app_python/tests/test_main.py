def test_get_time(app_client):
    response = app_client.get("/")
    assert response.status_code == 200
    assert "time" in response.json()


def test_invalid_path(app_client):
    response = app_client.get("/invalid")
    assert response.status_code == 404
