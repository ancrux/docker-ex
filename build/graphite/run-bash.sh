#!/bin/bash

docker run \
 --rm \
 --name=graphite \
 --privileged=true \
 -p 80:80 \
 -p 2003:2003 \
 -p 2004:2004 \
 -p 7002:7002 \
 -p 2222:22 \
 -v /opt/carbon:/var/lib/carbon:Z \
 -ti \
 graphite \
 bash -s
	
