#!/bin/bash

sudo docker run \
  -d \
  --name=centos7 \
  centos:7 \
  top -b
