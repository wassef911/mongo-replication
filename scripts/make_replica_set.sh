#!/bin/bash

echo "********** make_replica_set.sh **********"
echo ${MONGODB1}
until curl http://${MONGODB1}:${MONGODB1_PORT}/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
  printf '.'
  sleep 1
done

echo make_replica_set.sh time now: `date +"%T" `
mongosh --host ${MONGODB1}:${MONGODB1_PORT} <<EOF
var cfg = {
  "_id": "${REPLICA_SET_NAME}",
  "members": [
    {
      "_id": 0,
      "host": "${MONGODB1}:${MONGODB1_PORT}",
      "priority": 2
    },
    {
      "_id": 1,
      "host": "${MONGODB2}:${MONGODB2_PORT}",
      "priority": 0
    },
    {
      "_id": 2,
      "host": "${MONGODB3}:${MONGODB3_PORT}",
      "priority": 0
    }
  ]
};
rs.initiate(cfg);
rs.reconfig(cfg, {force: true});
rs.secondaryOk();
rs.conf();
EOF

echo "It's Done!"