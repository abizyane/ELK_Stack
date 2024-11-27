#!/bin/sh

until pg_isready -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER
do
    echo "Waiting for postgres..."
    sleep 2
done

python manage.py makemigrations
python manage.py migrate

exec python manage.py runserver 0.0.0.0:8000