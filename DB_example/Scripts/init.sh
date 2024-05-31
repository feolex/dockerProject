#!/bin/bash

cd ./docker-entrypoint-initdb.d


echo "Start init.sh"
echo "$PWD"
#Create group role with privileges to create BD

path=$PWD/initialMigration

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f $path/BDCreate_and_set_role.sql

#Create Shema
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f $path/BDCreateShema.sql

echo "Start creating DB"
#Init database - create main schema taxcar, all tables(if not exists), add indexes,
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f $path/BDSheme_create_tables.sql
echo "End creating DB"

echo "Start migration"
#Migrate database to provided $TAXCAR_DB_VERSION
#chmod +rx $path/start.sh #Operation not permitted - and file yet still right to execute
$path/start.sh
echo "End migration"
echo "End initialization"
