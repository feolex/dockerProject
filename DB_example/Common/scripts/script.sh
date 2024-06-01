#!/bin/bash

psql -U $POSTGRES_USER -d $POSTGRES_DB<<EOSQL
CREATE TABLE IF NOT EXISTS users_database (
	ID serial PRIMARY KEY,
	username varchar(255),
	password varchar(255)
);
EOSQL