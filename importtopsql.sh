#!/bin/bash

eval "$(grep ^PSQL_PORT= .env)"
eval "$(grep ^PSQL_USER= .env)"
eval "$(grep ^PSQL_DB= .env)"
eval "$(grep ^PSQL_HOST= .env)"
eval "$(grep ^IMPORT_TO_TABLE= .env)"
eval "$(grep ^CSV_DELIMETER= .env)"
eval "$(grep ^CSV_DIRECTORY= .env)"

fileName=""
for entry in "$CSV_DIRECTORY"/*
do
  fileName=$entry
done

echo "START IMPORT !!!"
psql -U $PSQL_USER -d $PSQL_DB -p $PSQL_PORT -W <<showtbl
CREATE TABLE IF NOT EXISTS $IMPORT_TO_TABLE (
    "msisdn" VARCHAR(100),
    "user" VARCHAR(100),
    "imei" VARCHAR(100),
    "location" VARCHAR(100)
);

CREATE INDEX IF NOT EXISTS idx_location ON $IMPORT_TO_TABLE("location");

COPY $IMPORT_TO_TABLE("msisdn", "user", "imei", "location")
FROM '$fileName' 
DELIMITER '$CSV_DELIMETER' 
CSV HEADER; 
showtbl
echo "IMPORT DONE !!!"