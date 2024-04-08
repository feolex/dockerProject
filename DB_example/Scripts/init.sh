#!/bin/bash

cd ./docker-entrypoint-initdb.d


#Init database - create main schema taxcar, all tables(if not exists), add indexes, FK and references with contstraints
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f YourSqlFile.sql

#Migrate database to provided $TAXCAR_DB_VERSION
chmod +rx "$PWD"/initialMigration/start.sh
"$PWD"/initialMigration/start.sh