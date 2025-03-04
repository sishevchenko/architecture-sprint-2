printf "Инцициализируем сервер конфигурации MongoDB:\n"
source ./scripts/init-configSrv.sh

printf "Инцициализируем шарды:\n"
source ./scripts/init-shard.sh

printf "Инцициализируем роутер:\n"
source ./scripts/init-router.sh

printf "Активируем шардинг:\n"
source ./scripts/activate-shard.sh

printf "Наполняем БД данными:\n"
source ./scripts/add-data.sh

printf "Проверяем наполнение БД:\n"
source ./scripts/check-data.sh

printf "Конфигурация mongo окончена.\n"
