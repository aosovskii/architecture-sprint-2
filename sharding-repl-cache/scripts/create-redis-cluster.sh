#!/bin/bash

# Ожидание доступности Redis контейнеров
until redis-cli -h redis_1 ping > /dev/null 2>&1; do
    sleep 1
done
until redis-cli -h redis_2 ping > /dev/null 2>&1; do
    sleep 1
done
until redis-cli -h redis_3 ping > /dev/null 2>&1; do
    sleep 1
done
until redis-cli -h redis_4 ping > /dev/null 2>&1; do
    sleep 1
done
until redis-cli -h redis_5 ping > /dev/null 2>&1; do
    sleep 1
done
until redis-cli -h redis_6 ping > /dev/null 2>&1; do
    sleep 1
done


docker exec -ti redis_1 bash <<EOF
echo "yes" | redis-cli --cluster create   173.17.0.2:6379   173.17.0.3:6379   173.17.0.4:6379   173.17.0.5:6379   173.17.0.6:6379   173.17.0.7:6379   --cluster-replicas 1
EOF