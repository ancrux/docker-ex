#!/bin/bash

docker run \
  -i \
  --rm \
  --name=grafana \
  -p 3000:3000 \
  -p 22002:22 \
  -e "GF_SECURITY_ADMIN_PASSWORD=admin" \
  grafana

