#!/bin/bash

# remove untagged/unused images
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")

