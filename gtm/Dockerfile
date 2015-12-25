FROM postgres-x2_base
MAINTAINER c2j<chenjj.yz@gmail.com>

USER postgres

RUN initgtm -Z gtm -D $PG_DATA_DIR/gtm
EXPOSE 6666
VOLUME $PG_DATA_DIR/gtm

ENTRYPOINT gtm -D $PG_DATA_DIR/gtm
