#!/bin/bash

mkdir -p /opt/carbon/
docker run \
 --rm \
 --name=graphite \
 --privileged=true \
 -p 80:80 \
 -p 2003:2003 \
 -p 2003:2003/udp \
 -p 2004:2004 \
 -p 7002:7002 \
 -p 22001:22 \
 -v /opt/carbon:/var/lib/carbon:Z \
 graphite
	
