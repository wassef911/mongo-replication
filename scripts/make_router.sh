#!/bin/bash

echo "********** make_router.sh **********"

echo make_router.sh time now: `date +"%T" `
mongosh --host database:${DATABASE_PORT} <<EOF
sh.addShard("rs-shard-01/mongo1_rs1:${DB1_RS1_PORT},mongo2_rs1:${DB2_RS1_PORT},mongo3_rs1:${DB3_RS1_PORT}");
EOF