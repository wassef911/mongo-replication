#!/bin/bash


# CONFIGURE ALL REPLICA SETS
bash /scripts/make_replica_set.sh "${REPLICA_SET_NAME_1}" "mongo1_rs1" "${DB1_RS1_PORT}" "mongo2_rs1" "${DB2_RS1_PORT}" "mongo3_rs1" "${DB3_RS1_PORT}" &&

# CONFIGURE ALL CONFIG SERVERS
bash /scripts/make_config_server.sh "${REPLICA_SET_NAME_1}" "mongo1_rs1" "${DB1_RS1_PORT}" "mongo2_rs1" "${DB2_RS1_PORT}" "mongo3_rs1" "${DB3_RS1_PORT}"  && 

# CONFIGURE ALL ROUTERS
bash /scripts/make_router.sh;

