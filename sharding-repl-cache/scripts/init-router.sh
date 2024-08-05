#!/bin/bash

docker compose exec -T mongos_router mongosh --port 27024 --quiet<<EOF
sh.addShard("shard1/shard1a:27018,shard1b:27019,shard1c:27020")
sh.addShard("shard2/shard2a:27021,shard2b:27022,shard2c:27023")
sh.enableSharding("somedb")
sh.shardCollection("somedb.helloDoc", { "age": "hashed" })


db.helloDoc.countDocuments()
EOF