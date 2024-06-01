#!/bin/bash
cd /patroni
docker build -t patroni .
docker compose up -d
sleep 10
PGPASSWORD="$POSTGRES_PASS" pg_dump -U "$POSTGRES_USER" -h localhost  > patroni_backup.sql
docker exec -i demo-patroni1 psql -U postgres postgres < patroni_backup.sql
docker exec -i demo-patroni2 psql -U postgres postgres < patroni_backup.sql
docker exec -i demo-patroni3 psql -U postgres postgres < patroni_backup.sql
rm patroni_backup.sql