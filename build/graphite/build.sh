#!/bin/bash

#docker build --rm -t graphite -f graphite.el6.docker .
docker build -t graphite .

# remove untagged/unused images
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
