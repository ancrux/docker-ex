#!/bin/bash

# docker build --rm -t grafana -f graphite.el6.docker .
docker build -t grafana .

# remove untagged/unused images
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
