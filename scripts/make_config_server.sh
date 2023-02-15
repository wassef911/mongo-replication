#!/bin/bash

echo "********** make_config_server.sh **********"

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

echo make_config_server.sh time now: `date +"%T" `
mongosh --host configsvr:${CONFIG_SERVER_PORT} <<EOF

rs.initiate(
   {
      _id: "${REPLICA_SET_NAME_1}",
      "configsvr": true,
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
   }
)

EOF
