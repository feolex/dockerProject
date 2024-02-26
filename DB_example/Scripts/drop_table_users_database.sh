#!/bin/bash

psql -U $POSTGRES_USER -d $POSTGRES_DB<<EOSQL
DROP TABLE IF EXISTS users_database;
EOSQL