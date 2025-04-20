printf "\n\nПроверяем общее количество документов\n\n"
sudo docker compose exec -T mongos_router mongosh --port 27020 <<EOF
use somedb

db.helloDoc.countDocuments()
exit();
EOF

printf "Проверяем реплики shard1\n"
sudo docker exec -i shard1 mongosh --port 27018 <<EOF
rs.status()
exit();
EOF


printf "Проверяем реплики shard2\n"
sudo docker exec -i shard2 mongosh --port 27019 <<EOF
rs.status()
exit();
EOF


printf "Проверяем количество документов shard1\n"
sudo docker exec -i shard1 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF


printf "Проверяем количество документов в shard1-repl1\n"
sudo docker exec -i shard1-repl1 mongosh --port 27021 <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF


printf "Проверяем количество документов в shard1-repl2\n"
sudo docker exec -i shard1-repl2 mongosh --port 27023 <<EOF
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


printf "Проверяем количество документов в shard2-repl1\n"
sudo docker exec -i shard2-repl1 mongosh --port 27022 <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF


printf "Проверяем количество документов в shard2-repl2\n"
sudo docker exec -i shard2-repl2 mongosh --port 27024 <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF
