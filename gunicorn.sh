#!/bin/sh
gunicorn -b 0.0.0.0:5000 app:app --timeout 90 --workers 3