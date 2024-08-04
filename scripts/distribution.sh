#!/bin/bash

# Ожидание доступности mongos
until mongosh --port 27020 --eval "print(\"waited for connection\")"
do
    sleep 1
done

# Проверка распределения данных по шардам
mongosh --port 27020 <<EOF
use somedb
db.helloDoc.getShardDistribution()
EOF