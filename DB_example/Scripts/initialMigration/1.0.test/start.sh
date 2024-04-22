#!/bin/bash

#1.0.test version

this_version="1.0.test"

cd ..

#Guard

need_base_version="1.0.0"
if [ -d ./$need_base_version ];
 then
  cd ./"$need_base_version"
  if [ -f start.sh ]
  then
      chmod +rx $PWD/start.sh
      $PWD/start.sh
  else echo "Start.sh inside($PWD/$need_base_version) doesn't exist!"; exit 2
    fi
    else echo "This directory($PWD/$need_base_version) doesn't exist!"; exit 1
fi

cd ..

cd ./"$this_version"

echo "PWD3.0=$PWD"
echo "Start migration to 1.0.test version "
exit 0
#Set seed of generation(0.6)

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<EOSQL
select setseed(0.6);
EOSQL

#Generate drivers
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_drivers.sql

#Add new tariff
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f add_new_tariff.sql

#Add new generated autoservices(+ 15)
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_autoservices.sql

#Add new automarks
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f add_new_automark.sql

#Add new Generated auto (+10 000)
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_auto.sql

#Add new Generated routes to Route table(+50 000)
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_routes.sql

#Add new mode { CarsharingMod } to Mode table
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f add_new_mode.sql

#Add new mode to PayWay
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f add_new_payway.sql

#Add new generated users(+100 000) to User table
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_users.sql

#Add new generated orders(+ 1 000 000) to Order table - check creating Route_Order table
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_orders.sql

echo "Migrated to 1.0.test version"
