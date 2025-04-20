printf "\n\nПроверяем общее количество документов\n\n"
sudo docker compose exec -T mongos_router mongosh --port 27020 <<EOF
use somedb

db.helloDoc.countDocuments()
exit();
EOF


printf "Проверяем количество документов shard1\n"
sudo docker exec -i shard1 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF


printf "Проверяем количество документов shard2\n"
sudo docker exec -i shard2 mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF
