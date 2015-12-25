FROM postgres-x2_base
MAINTAINER c2j<chenjj.yz@gmail.com>

USER postgres

RUN initdb -D $PG_DATA_DIR/datanode --nodename dn
RUN sed -i "s/#gtm_host = 'localhost'/gtm_host = 'gtm'/g" $PG_DATA_DIR/datanode/postgresql.conf

EXPOSE 5432
VOLUME $PG_DATA_DIR/datanode

ENTRYPOINT postgres --datanode -D $PG_DATA_DIR/datanode -i
