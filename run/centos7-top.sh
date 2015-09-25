#!/bin/bash

sudo docker run \
  -d \
  --name=centos7-top \
  centos:7 \
  top -b
