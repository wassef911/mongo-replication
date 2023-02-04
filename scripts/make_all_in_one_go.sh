#!/bin/bash


# CONFIGURE ALL REPLICA SETS
bash /scripts/make_replica_set.sh "${REPLICA_SET_NAME_1}" "mongo1_rs1" "${DB1_RS1_PORT}" "mongo2_rs1" "${DB2_RS1_PORT}" "mongo3_rs1" "${DB3_RS1_PORT}" &&

# bash /scripts/make_replica_set.sh $REPLICA_SET_NAME_2 "mongo1_rs2" $DB1_RS2_PORT "mongo2_rs2" $DB2_RS2_PORT "mongo3_rs3" $DB3_RS2_PORT

# bash /scripts/make_replica_set.sh $REPLICA_SET_NAME_3 "mongo1_rs3" $DB1_RS3_PORT "mongo2_rs3" $DB2_RS3_PORT "mongo3_rs3" $DB3_RS3_PORT

# CONFIGURE ALL CONFIG SERVERS
bash /scripts/make_config_server.sh && 

# CONFIGURE ALL ROUTERS
bash /scripts/make_router.sh;

