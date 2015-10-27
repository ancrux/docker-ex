#!/bin/bash

docker tag graphite:latest registry-int1.twops.co/platform/graphite:latest
docker push registry-int1.twops.co/platform/graphite
