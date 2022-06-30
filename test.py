import pytest
from app import app

def test_root_route():
    response = app.test_client().get('/')
    assert response.status_code == 200
def test_rate():
    response = app.test_client().get('/rates')
    assert response.status_code == 200