## Environment variable set up ##
### You can modify the env var in .env file. here is the example ###
```
MYSQL_HOST=yourmysqlhostname
MYSQL_USER=yourmysqlhuser
MYSQL_PASSWORD=yourmysqlhpassword
MYSQL_PORT=yourmysqlport
MYSQL_DB=yourmysqlDB
PSQL_HOST=yourpysqlhost
PSQL_USER=yourpysqluser
PSQL_PORT=yourpysqlport
PSQL_DB=yourpysqldb
IMPORT_TO_TABLE=yourmysqltable
CSV_DELIMETER=yourcsvdelimeter
CSV_DIRECTORY=yourcsvlocation
```

## How to run ##
1. Pull scripts from this github repository
    ```
    git pull https://github.com/yosephfernando/importtosqlfromcsv
    ```
2. Make importtomysql.sh and importtopsql.sh executeable
    ```
    chmod +x importtomysql.sh
    chmod +x importtopsql.sh
    ```
3. Execute importtomysql.sh 
    ```
    ./importtomysql.sh
    ```
4. Execute importtopsql.sh 
    ```
    ./importtopsql.sh
    ```
*Note : Don't forget to put your CSV file in datacsv folder before run the command*

## Sample CSV file ##
msisdn,user,imei,location <br />
123,1234,123432,1231241

