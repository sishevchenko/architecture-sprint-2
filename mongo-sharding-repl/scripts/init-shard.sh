sudo docker exec -i shard1 mongosh --port 27018 <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "shard1:27018" },
        { _id : 1, host : "shard1-repl1:27021" },
        { _id : 2, host : "shard1-repl2:27023" },
      ]
    }
);
exit();
EOF
printf "shard1 инициализирована\n"


sudo docker exec -i shard2 mongosh --port 27019 <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "shard2:27019" },
        { _id : 1, host : "shard2-repl1:27022" },
        { _id : 2, host : "shard2-repl2:27024" },
      ]
    }
  );
exit();
EOF
printf "shard2 инициализирована\n"
