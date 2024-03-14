#!/bin/bash

# add to pg_hba.conf to allow connect from any IP address
# host all all      ::1/128      md5
# host all postgres 127.0.0.1/32 md5
echo "
host all all      ::1/128      md5
host all postgres 127.0.0.1/32 md5
" >> "/etc/postgresql/pg_hba.conf"


# unset PGHOST to force psql to use Unix socket path
# this is specific to Railway and allows
# us to use PGHOST after the init
unset PGHOST

## unset PGPORT also specific to Railway
## since postgres checks for validity of
## the value in PGPORT we unset it in case
## it ends up being empty
unset PGPORT

# Call the entrypoint script with the
# approriate PGHOST & PGPORT
/usr/local/bin/docker-entrypoint.sh "$@"
