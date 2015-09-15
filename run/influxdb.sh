#!/bin/bash

sudo docker run \
  --rm \
  --name=influxdb \
  -p 8083:8083 -p 8086:8086 --expose 8090 --expose 8099 \
  tutum/influxdb:0.8.8

