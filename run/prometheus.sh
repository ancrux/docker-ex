#!/bin/bash

docker run --rm --name=prometheus -p 9999:9999 \
    -v /opt/prom/prometheus.yml:/prometheus/prometheus.yml \
    -v /opt/prom/alert.rules:/prometheus/alert.rules \
    -v /opt/prom/data:/prometheus/data \
    prom/prometheus -log.level=debug -config.file=/prometheus/prometheus.yml -web.listen-address ":9999" -alertmanager.url="http://172.16.33.31:9093"
