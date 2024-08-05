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
sh ./init-config-server.sh
sleep 5
sh ./init-shard1.sh
sleep 5
sh ./init-shard2.sh
sleep 5
sh ./init-router.sh

