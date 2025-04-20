sudo docker exec -i mongos_router mongosh --port 27020 <<EOF
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } );
EOF
