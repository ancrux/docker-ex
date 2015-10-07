# docker build -t <name>:<tag> -f <filename> <working_directory>
# e.g docker build -t test -f test.docker .
FROM centos:6.7
MAINTAINER Angus <angus_liu@trend.com.tw>
LABEL version=1.0

# install packages
RUN \
 yum install -y openssh-clients openssh-server; \
 yum install -y epel-release; \
 yum install -y graphite-web python-carbon; \
 yum clean all; \
 echo "root:12#\$56" | chpasswd; \
 python /usr/lib/python2.6/site-packages/graphite/manage.py syncdb --noinput; \
 chown apache:apache /var/lib/graphite-web/graphite.db;

# port in use
EXPOSE 22 80 2003 2003/udp 2004 7002

# command
CMD service carbon-cache start && service sshd start; /usr/sbin/httpd -D FOREGROUND;
