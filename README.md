# HOMEWORK

started out as homework but got out of hand.

please, make sure to set your env file correctly

I'm not going to write docs for homework because it's not worth it

## lazy quick explanation:

client.py will connect on mongod db router instance, and the redis instance

it's going to check for cache key in redis/?db=0, if cache missed it's going to query the actual database

then set the results in cache for the next time to execute the query

#### disclaimer :

please be sure to insert data in the document **mydatabase/mycollection** before running the scripts.

```sh
    ├── README.md
    ├── cache
    |  └── dump.rdb
    ├── client.py
    ├── docker-compose.rs1.yml
    ├── docker-compose.rs2.yml
    ├── docker-compose.rs3.yml
    ├── docker-compose.yml
    ├── example.png
    ├── mongo-volumes
    |  ├── mongo1_1
    |  ├── mongo2_1
    |  └── mongo3_1
    ├── requirements.txt
    ├── scripts
    |  ├── make_all_in_one_go.sh
    |  ├── make_config_server.sh
    |  ├── make_replica_set.sh
    |  └── make_router.sh
    └── venv
```

![Example](https://github.com/wassef911/mongo-replication/blob/master/example.png?raw=true)
