FROM postgres-x2_base
MAINTAINER c2j<chenjj.yz@gmail.com>

USER postgres

RUN initdb -D $PG_DATA_DIR/coordinator --nodename cn
RUN sed -i "s/#gtm_host = 'localhost'/gtm_host = 'gtm'/g" $PG_DATA_DIR/coordinator/postgresql.conf
RUN echo "host    all             all             172.17.0.0/24            trust">>$PG_DATA_DIR/coordinator/pg_hba.conf
EXPOSE 5432
VOLUME $PG_DATA_DIR/coordinator

ENTRYPOINT postgres --coordinator -D $PG_DATA_DIR/coordinator -i
