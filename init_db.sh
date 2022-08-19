#!/bin/bash
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d "$POSTGRES_DATABASE_NAME"  <<-EOSQL
    GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DATABASE_NAME TO $POSTGRES_USER;
    CREATE SCHEMA IF NOT EXISTS $POSTGRES_SCHEMA;
    CREATE TABLE $POSTGRES_SCHEMA.todos (
        id serial primary key,
        done boolean not null default false,
        task text not null,
        due timestamptz
    );
EOSQL