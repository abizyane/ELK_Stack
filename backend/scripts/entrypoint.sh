#!/bin/sh

mkdir -p /app/logs
chmod -R 777 /app/logs

filebeat -e -c /etc/filebeat/filebeat.yml &

until pg_isready -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER
do
    echo "Waiting for postgres..."
    sleep 5
done

python manage.py makemigrations
python manage.py migrate

exec python manage.py runserver 0.0.0.0:8000