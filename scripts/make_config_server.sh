#!/bin/bash

echo "********** make_config_server.sh **********"

echo make_config_server.sh time now: `date +"%T" `
mongosh --host configsvr:${CONFIG_SERVER_PORT} <<EOF

rs.initiate(
   {
      _id: "rs-config-server",
      configsvr: true,
      version: 1,
      members: [
         { _id: 0, host : "configsvr:${CONFIG_SERVER_PORT}" },
      ]
   }
)

EOF
