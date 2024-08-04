#!/bin/bash

sh ./init-config-server.sh
sh ./init-shard1.sh
sh ./init-shard2.sh
sh ./init-router.sh
sh ./create-redis-cluster.sh

