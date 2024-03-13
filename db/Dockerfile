FROM supabase/postgres:15.1.0.147

# Install OpenSSL and sudo
RUN apt-get update && apt-get install -y openssl sudo

# Allow the postgres user to execute certain commands as root without a password
RUN echo "postgres ALL=(root) NOPASSWD: /usr/bin/mkdir, /bin/chown" > /etc/sudoers.d/postgres

# Add init scripts
COPY init-ssl.sh /docker-entrypoint-initdb.d/
COPY wrapper.sh /usr/local/bin/wrapper.sh

# Set permissions
RUN chmod +x /docker-entrypoint-initdb.d/init-ssl.sh
RUN chmod +x /usr/local/bin/wrapper.sh

COPY ./realtime.sql /docker-entrypoint-initdb.d/migrations/99-realtime.sql
COPY ./webhooks.sql /docker-entrypoint-initdb.d/init-scripts/98-webhooks.sql
COPY ./roles.sql /docker-entrypoint-initdb.d/init-scripts/99-roles.sql
COPY ./jwt.sql /docker-entrypoint-initdb.d/init-scripts/99-jwt.sql
COPY ./logs.sql /docker-entrypoint-initdb.d/migrations/99-logs.sql

ENTRYPOINT ["wrapper.sh"]
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
