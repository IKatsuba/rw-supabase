#!/bin/bash

chown -R postgres "$PGDATA"

# Call the entrypoint script with the
# approriate PGHOST & PGPORT
/usr/local/bin/docker-entrypoint.sh "$@"
