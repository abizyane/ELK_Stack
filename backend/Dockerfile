FROM python:3.12.7-alpine3.20

WORKDIR /app

COPY app/. .

RUN apk add --no-cache postgresql-dev\
    postgresql-client \
    gcc\
    python3-dev\
    musl-dev\
    zlib-dev &&\
    pip install --no-cache-dir setuptools && \
    pip install --no-cache-dir -r requirements.txt
    
COPY scripts/entrypoint.sh /entrypoint.sh 

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
