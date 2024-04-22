#!/bin/bash

#cd ./docker-entrypoint-initdb.d

echo "Start init.sh"
#Create group role with privileges to create BD
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f ./initialMigration/BDCreate_and_set_role.sql

#Create Shema
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f ./initialMigration/BDCreateShema.sql

#psql -U "$POSTGRES_USER" -h 5432 -f ./initialMigration/BDCreate_and_set_role.sql

echo "Start creating DB"
#Init database - create main schema taxcar, all tables(if not exists), add indexes,
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f ./initialMigration/BDSheme_create_tables.sql
echo "End creating DB"

echo "Start migration"
#Migrate database to provided $TAXCAR_DB_VERSION
chmod +rx ./initialMigration/start.sh
./initialMigration/start.sh
echo "End migration"
echo "End initialization"
