#!/bin/sh
# wait-for-postgres.sh

set -e

shift

echo >&2 "$(date +%Y%m%dt%H%M%S) Waiting for Postgres host=$PGHOST port=$PGPORT"

# until psql -h "$host" -p "$port" -U "postgres" -c '\q' > /dev/null 2>&1; do
#  >&2 echo "Postgres is unavailable - sleeping..."
#  sleep 1
# done

until psql -c '\q'; do
  echo >&2 "$(date +%Y%m%dt%H%M%S) Postgres is unavailable - sleeping"
  sleep 1
done


  
echo >&2 "$(date +%Y%m%dt%H%M%S) Postgres is up - executing command $1"

exec $1