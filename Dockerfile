# Image with Linux Oracle instant client. 

FROM centos
MAINTAINER Hans Rune Bergheim <hansbergheim@gmail.com>

ADD . /tmp/

RUN yum install -y libaio.i686 glibc.i686
RUN yum -y localinstall /tmp/oracle* --nogpgcheck
RUN mkdir /usr/lib/oracle/12.1/client/network/admin -p
COPY ./tnsnames.ora /usr/lib/oracle/12.1/client/network/admin/tnsnames.ora

ENV ORACLE_HOME=/usr/lib/oracle/12.1/client
ENV PATH=$PATH:$ORACLE_HOME/bin
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib
ENV TNS_ADMIN=$ORACLE_HOME/network/admin

ENTRYPOINT /bin/bash