#!/usr/bin/bash

PSQL="psql --username=postgres --dbname=superstore"

echo "Creating tables from schema..."
$PSQL -f SQL/sql_schema.sql