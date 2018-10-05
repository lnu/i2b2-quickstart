#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER "$I2B2_DB_USER" WITH SUPERUSER PASSWORD '$I2B2_DB_PWD';
    CREATE DATABASE "$I2B2_DB";
    GRANT ALL PRIVILEGES ON DATABASE "$I2B2_DB_USER" TO "$I2B2_DB_USER";
EOSQL
