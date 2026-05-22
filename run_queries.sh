export $(grep -v '^#' .env | xargs)

set -e

PSQL="psql --username=$PGUSER --dbname=$PGDATABASE"

export PGPASSWORD=$PGPASSWORD

echo "running sql queries"
$PSQL -f sql_queries.sql