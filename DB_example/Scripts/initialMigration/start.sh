#!/bin/bash

cd ./docker-entrypoint-initdb.d/initialMigration

#chmod +rx $PWD/example_how_call_another_scripts.sh
#$PWD/example_how_call_another_scripts.sh

echo "$TAXCAR_DB_VERSION" | awk 'OFS'