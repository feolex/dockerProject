#!/bin/bash

#1.0.0 version

#Set seed of generation(0.5)

echo "Start migration to 1.0.0 version"

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<EOSQL
select setseed(0.5);
EOSQL

#Generate drivers
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_drivers.sql

#Initialize base tariffs
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f initialize_base_tariff.sql

#Generate autoservices
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_autoservices.sql

#Initialize base list of automarks
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f initialize_base_automark.sql

#Generate auto
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_auto.sql

#Generate Route table
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_routes.sql

#Initialize Mode { UsualTaxiMod, UnmannedTaxiMod, CarsharingMod } table
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f initialize_base_mode.sql

#Initialize Status {Active, Done} table
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f initialize_base_status.sql

#Initialize Payways
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f initialize_base_payway.sql

#Generate User table
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_users.sql

#Generate Order table - check creating Route_Order table
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f insert_generated_orders.sql

echo "Migrated to 1.0.0 version"
