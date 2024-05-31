#!/bin/bash

cd docker-entrypoint-initdb.d
cd initialMigration

latest_version="1.0.1"

if [ -z "$TAXCAR_DB_VERSION" ]
  then need_version=$latest_version
  else
    major_version=$(echo "$TAXCAR_DB_VERSION" | awk -F'.' '{print $1}')
    minor_version=$(echo "$TAXCAR_DB_VERSION" | awk -F'.' '{print $2}')
    patch_version=$(echo "$TAXCAR_DB_VERSION" | awk -F'.' '{print $3}')

    export need_version="$major_version.$minor_version.$patch_version"
fi


echo "Need version to migrate: $need_version"
if [ -d "$need_version" ]
 then
  cd "$need_version"
  if [ -f start.sh ]
  then
      echo "PWD=$PWD"
      #chmod +rx "$PWD/start.sh" //Operation not permitted - file yet has right to execute
      "$PWD"/start.sh
  else echo "Start.sh doesn't exist!"; exit 2
  fi
  else echo "This directory doesn't exist!"; exit 1
fi