FROM docker.elastic.co/elasticsearch/elasticsearch:8.17.0

USER root

COPY ./tools/script.sh /script.sh

RUN mkdir -p /usr/share/elasticsearch/config/certs &&\
	chmod +x /script.sh

ENTRYPOINT [ "/script.sh" ]