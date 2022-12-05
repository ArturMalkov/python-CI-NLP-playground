from fastapi.testclient import TestClient

from main import app


client = TestClient(app)


def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json()["message"] == "Wikipedia API: use /search or /wiki"


def test_phrase():
    response = client.get("/phrase/Barack%20Obama")
    assert response.status_code == 200
    assert "44th president" in response.json()["result"]
