#!/bin/bash

sudo docker run \
  --rm \
  --name=cadvisor \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --privileged=true \
  --volume=/cgroup:/cgroup:ro \
  google/cadvisor:latest \
  -storage_driver=influxdb \
  -storage_driver_host=172.16.33.101:8086 \
  -storage_driver_db=cadvisor \
  -storage_driver_user=root \
  -storage_driver_password=root \
  -storage_driver_secure=false
