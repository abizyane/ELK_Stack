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
    
RUN apk add --no-cache wget && \
    mkdir -p /tmp/filebeat && \
    chown -R $(id -u):$(id -g) /tmp/filebeat && \
    wget -P /tmp/filebeat https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.11.4-linux-x86_64.tar.gz && \
    tar -xzvf /tmp/filebeat/filebeat-8.11.4-linux-x86_64.tar.gz -C /tmp/filebeat && \
    mv /tmp/filebeat/filebeat-8.11.4-linux-x86_64/filebeat /usr/bin/filebeat && \
    rm -rf /tmp/filebeat
    
COPY scripts/entrypoint.sh /entrypoint.sh 
COPY conf/filebeat.yml /etc/filebeat/filebeat.yml

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
