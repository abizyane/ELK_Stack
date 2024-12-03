FROM alpine:3.20

RUN apk add --no-cache nginx openssl \
    && mkdir -p /run/nginx /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
       -keyout /etc/nginx/ssl/cert.key \
       -out /etc/nginx/ssl/cert.crt \
       -subj "/CN=abizyane.42.fr/O=42/OU=1337/C=MO/L=KHOURIBGA"

RUN apk add --no-cache wget && \
    mkdir -p /tmp/filebeat && \
    chown -R $(id -u):$(id -g) /tmp/filebeat && \
    wget -P /tmp/filebeat https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.11.4-linux-x86_64.tar.gz && \
    tar -xzvf /tmp/filebeat/filebeat-8.11.4-linux-x86_64.tar.gz -C /tmp/filebeat && \
    mv /tmp/filebeat/filebeat-8.11.4-linux-x86_64/filebeat /usr/bin/filebeat && \
    rm -rf /tmp/filebeat
 
COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf
COPY ./conf/filebeat.yml /etc/filebeat/filebeat.yml

RUN filebeat -e -c /etc/filebeat/filebeat.yml &

CMD ["nginx", "-g", "daemon off;"]