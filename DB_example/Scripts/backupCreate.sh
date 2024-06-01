#!/bin/bash

backup_path=PG_Backup
backup_prefix_name=Backup_
date_suffix=$(date +%F-%H-%M-%S | sed 's/-/_/g')

let border_count_of_backups=$BACKUP_COUNT-1

pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" > $backup_path/$backup_prefix_name$date_suffix.sql
a=($(ls -l $backup_path | awk '/$backup_prefix_name/{print $9}' | sort -r))
if [[ ${#a[@]} -eq "$BACKUP_COUNT" ]]
then
rm ${a["$border_count_of_backups"]}
fi
