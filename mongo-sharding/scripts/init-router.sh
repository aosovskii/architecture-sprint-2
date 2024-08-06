#!/bin/bash

docker exec -it mongos_router mongosh --port 27020 <<EOF
sh.addShard("shard1/shard1:27018")
sh.addShard("shard2/shard2:27019")
sh.enableSharding("somedb")
sh.shardCollection("somedb.helloDoc", { "age": "hashed" })


db.helloDoc.countDocuments()
EOF