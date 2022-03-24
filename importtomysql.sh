#!/bin/bash

eval "$(grep ^MYSQL_PORT= .env)"
eval "$(grep ^MYSQL_USER= .env)"
eval "$(grep ^MYSQL_PASSWORD= .env)"
eval "$(grep ^MYSQL_DB= .env)"
eval "$(grep ^MYSQL_HOST= .env)"
eval "$(grep ^MYSQL_IMPORT_TO_TABLE= .env)"
eval "$(grep ^CSV_DELIMETER= .env)"
eval "$(grep ^CSV_DIRECTORY= .env)"

fileName=""
for entry in "$CSV_DIRECTORY"/*
do
  fileName=$entry
done

echo "START IMPORT !!!"
mysql --user $MYSQL_USER --host $MYSQL_HOST --port $MYSQL_PORT --database $MYSQL_DB -p$MYSQL_PASSWORD --local-infile=1 <<showtbl
CREATE TABLE IF NOT EXISTS $MYSQL_IMPORT_TO_TABLE (
    msisdn VARCHAR(100),
    user VARCHAR(100),
    imei VARCHAR(100),
    location VARCHAR(100),
    INDEX (location)
);

LOAD DATA LOCAL INFILE './$fileName' 
INTO TABLE $MYSQL_IMPORT_TO_TABLE
FIELDS TERMINATED BY '$CSV_DELIMETER' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
showtbl 
echo "IMPORT DONE !!!"