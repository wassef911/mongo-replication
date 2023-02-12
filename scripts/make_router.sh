#!/bin/bash

echo "********** make_router.sh **********"

echo make_replica_set.sh time now: `date +"%T" `
mongosh --host configsvr:${CONFIG_SERVER_PORT} <<EOF

sh.addShard("rs-shard-01/mongo1_rs1:${DB1_RS1_PORT}");
sh.addShard("rs-shard-01/mongo2_rs1:${DB2_RS1_PORT}");
sh.addShard("rs-shard-01/mongo3_rs1:${DB3_RS1_PORT}");

EOF


# TODO 
# sh.addShard("rs-shard-02/mongo1_rs2:${DB1_RS2_PORT}")
# sh.addShard("rs-shard-02/mongo2_rs2:${DB2_RS2_PORT}")
# sh.addShard("rs-shard-02/mongo3_rs2:${DB3_RS2_PORT}")

# sh.addShard("rs-shard-03/mongo1_rs3:${DB1_RS3_PORT}")
# sh.addShard("rs-shard-03/mongo2_rs3:${DB2_RS3_PORT}")
# sh.addShard("rs-shard-03/mongo3_rs3:${DB3_RS3_PORT}")