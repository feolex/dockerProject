#!/bin/bash

echo "DROP SCHEMA taxcar"
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f ./initialMigration/BDDrop_all_tables.sql