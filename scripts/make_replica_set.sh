#!/bin/bash

echo "********** make_replica_set.sh **********"
if [ "$#" -lt 7 ]; then
  echo "Error: 7 parameters are required, $# were passed."
  exit 1
fi

REPLICA_SET_NAME=$1
PRIMARY=$2
PRIMARY_PORT=$3
SECONDARY_1=$4
SECONDARY_1_PORT=$5
SECONDARY_2=$6
SECONDARY_2_PORT=$7

echo "********** Setting up the " $REPLICA_SET_NAME " **********"

until curl http://${PRIMARY}:${PRIMARY_PORT}/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
  printf '.'
  sleep 1
done

echo make_replica_set.sh time now: `date +"%T" `
mongosh --host ${PRIMARY}:${PRIMARY_PORT} <<EOF
var cfg = {
  "_id": "${REPLICA_SET_NAME}",
  "protocolVersion": 1,
  "members": [
    {
      "_id": 0,
      "host": "${PRIMARY}:${PRIMARY_PORT}",
      "priority": 2
    },
    {
      "_id": 1,
      "host": "${SECONDARY_1}:${SECONDARY_1_PORT}",
      "priority": 0
    },
    {
      "_id": 2,
      "host": "${SECONDARY_2}:${SECONDARY_2_PORT}",
      "priority": 0
    }
  ]
};
rs.initiate(cfg);
rs.reconfig(cfg, {force: true});
rs.status();
EOF

echo "********** Replica set :" $REPLICA_SET_NAME "is done! 🚀🚀🚀🚀🚀🚀🚀🚀🚀 **********"