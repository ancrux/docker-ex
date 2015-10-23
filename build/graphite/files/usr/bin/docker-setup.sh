#!/bin/bash

chown -R carbon:carbon /var/lib/carbon

service sshd start
