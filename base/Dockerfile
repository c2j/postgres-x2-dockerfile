#FROM opensuse
FROM centos
MAINTAINER c2j<chenjj.yz@gmail.com>
#RUN zypper --non-interactive install git-core cmake gcc bison flex readline-devel zlib-devel libopenssl-devel
RUN yum -y install git cmake gcc bison flex readline-devel zlib-devel libopenssl-devel gcc-c++
RUN mkdir /src; cd /src; env GIT_SSL_NO_VERIFY=true git clone https://github.com/postgres-x2/postgres-x2.git
ENV PG_HOME /opt/local/postgresql
ENV PG_DATA_DIR /data/PGDATA
RUN yum -y install make
RUN yum -y install perl-ExtUtils-Embed
RUN yum -y install openssl-devel
RUN cd /src/postgres-x2; ./configure --prefix=$PG_HOME --enable-thread-safety --with-wal-blocksize=64 --with-wal-segsize=64 --with-blocksize=32 --with-segsize=2 --enable-debug --with-openssl --without-ldap --with-perl; make; make install

RUN userdel postgres ;\
    groupdel postgres ;\
    /usr/sbin/groupadd postgres ;\
    useradd -g postgres -d /home/postgres -m postgres ;\
    mkdir -p $PG_DATA_DIR ;\
    chown postgres:postgres $PG_DATA_DIR
USER postgres
ENV PATH $PG_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $PG_HOME/lib:$LD_LIBRARY_PATH
