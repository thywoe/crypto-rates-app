#!/bin/sh
# gunicorn --chdir app app:app -b 0.0.0.0:5000
gunicorn -b 0.0.0.0:5000 app:app --timeout 90