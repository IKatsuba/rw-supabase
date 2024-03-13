FROM supabase/postgres:15.1.0.147

COPY ./realtime.sql /docker-entrypoint-initdb.d/migrations/99-realtime.sql
COPY ./webhooks.sql /docker-entrypoint-initdb.d/init-scripts/98-webhooks.sql
COPY ./roles.sql /docker-entrypoint-initdb.d/init-scripts/99-roles.sql
COPY ./jwt.sql /docker-entrypoint-initdb.d/init-scripts/99-jwt.sql
COPY ./logs.sql /docker-entrypoint-initdb.d/migrations/99-logs.sql
