#!/bin/bash

wait_for_port() {
    local port=$1
    until nc -z localhost $port
    do
        echo "Waiting for port $port to be open..."
        sleep 1
    done
    echo "Port $port is open!"
}

wait_for_port 27017
wait_for_port 27018
wait_for_port 27021
wait_for_port 27024

cd scripts
echo "Start init-config-server"
sh ./init-config-server.sh
echo "End init-config-server"
sleep 10
echo "Start init-shard1"
sh ./init-shard1.sh
echo "End init-shard1"
sleep 10
echo "Start init-shard2"
sh ./init-shard2.sh
echo "End init-shard2"
sleep 10
echo "Start init-router"
sh ./init-router.sh
echo "End init-router"
sleep 20
echo "Start mongo-init"
sh ./mongo-init.sh
echo "End mongo-init"
