# docker build -t <name>:<tag> -f <filename> <working_directory>
# e.g docker build -t test -f test.docker .

# https://hub.docker.com/r/grafana/grafana/
# ENTRYPOINT &{["/usr/sbin/grafana-server" "--config=/etc/grafana/grafana.ini" "cfg:default.paths.data=/var/lib/grafana" "cfg:default.paths.logs=/var/log/grafana"]} 

FROM grafana/grafana
MAINTAINER Angus <angus_liu@trend.com.tw>
LABEL version=1.0

RUN \
 apt-get install -y openssh-server; \
 apt-get clean; \
 echo "root:12#\$56" | chpasswd;

COPY files/etc/ssh/sshd_config /etc/ssh/ 
COPY files/usr/bin/docker-entry.sh /usr/bin/
 
# port in use
EXPOSE 22 3000

# use default ENTRYPOINT
ENTRYPOINT []

# startup command
CMD "/usr/bin/docker-entry.sh"
