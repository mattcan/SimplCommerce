#!/bin/bash
set -e

cmd="$@"

until PGPASSWORD=$POSTGRES_PASSWORD psql -h "simpldb" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

exec $cmd