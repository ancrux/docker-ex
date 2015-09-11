#!/bin/bash

# if use sqlite3, migrate db first
#docker run -v /tmp/prom:/tmp/prom -e DATABASE_URL=sqlite3:/tmp/prom/file.sqlite3 prom/promdash ./bin/rake db:migrate

# run promdash
docker run -p 3000:3000 --detach=true --name=promdash -v /tmp/prom:/tmp/prom -e DATABASE_URL=sqlite3:/tmp/prom/file.sqlite3 prom/promdash


