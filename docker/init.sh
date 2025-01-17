#!/bin/bash

set -e

cd /opt/janitor

if [ "$INIT_DB" == true ]; then
    echo "Initialising the database..."
    flask db init
    flask db migrate
    flask db upgrade
fi

/usr/local/bin/gunicorn -b localhost:8000 -w 4 janitor:app --preload
