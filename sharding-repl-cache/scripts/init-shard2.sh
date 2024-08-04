#!/bin/bash

docker exec -it shard2 mongosh --port 27021 <<EOF
rs.initiate(
  {
    _id : "shard2",
    members: [
      { _id : 0, host : "shard2a:27021" },
      { _id : 1, host : "shard2b:27022" },
      { _id : 2, host : "shard2c:27023" }
    ]
  }
)
EOF