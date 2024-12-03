FROM postgres:17.2-alpine3.20

RUN apk add --no-cache wget && \
    mkdir -p /tmp/filebeat && \
    chown -R $(id -u):$(id -g) /tmp/filebeat && \
    wget -P /tmp/filebeat https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.11.4-linux-x86_64.tar.gz && \
    tar -xzvf /tmp/filebeat/filebeat-8.11.4-linux-x86_64.tar.gz -C /tmp/filebeat && \
    mv /tmp/filebeat/filebeat-8.11.4-linux-x86_64/filebeat /usr/bin/filebeat && \
    rm -rf /tmp/filebeat

COPY ./scripts/entrypoint.sh /entrypoint.sh
COPY ./conf/filebeat.yml /etc/filebeat/filebeat.yml

RUN chmod +x /entrypoint.sh && \
    chown postgres:postgres /entrypoint.sh

USER postgres

ENTRYPOINT ["/entrypoint.sh"]
