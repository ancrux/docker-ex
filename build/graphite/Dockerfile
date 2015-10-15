# docker build -t <name>:<tag> -f <filename> <working_directory>
# e.g docker build -t test -f test.docker .
FROM centos:6.7
MAINTAINER Angus <angus_liu@trend.com.tw>
LABEL version=1.0

# update existing packages
#RUN \
# yum update -y; \
# yum clean all;

# install packages
RUN \
 yum install -y openssh-clients openssh-server; \
 yum install -y epel-release; \
 yum install -y python-pip; \
 yum install -y supervisor graphite-web python-carbon; \
 pip install --upgrade graphite-beacon; \
 yum clean all;

# init sshd
RUN \
 echo "root:12#\$56" | chpasswd; \
 service sshd start && service sshd stop;

# init graphite
RUN \
 python /usr/lib/python2.6/site-packages/graphite/manage.py syncdb --noinput; \
 chown apache:apache /var/lib/graphite-web/graphite.db;
 
# init graphite-beacon
RUN \
 mkdir -p /etc/graphite-beacon;

# setup configuration
COPY usr/bin/setup.sh /usr/bin/
COPY etc/supervisord.conf /etc/
COPY etc/carbon/carbon.conf /etc/carbon/
COPY etc/httpd/conf.d/graphite-web.conf /etc/httpd/conf.d/
COPY etc/graphite-beacon/config.json /etc/graphite-beacon/

# port in use
EXPOSE 22 80 2003 2003/udp 2004 7002

# volumes
VOLUME ["/var/log", "/var/lib/carbon"]

# command
CMD /usr/bin/supervisord
