FROM supabase/postgres:15.1.0.147

COPY wrapper.sh /usr/local/bin/wrapper.sh

RUN chmod +x /usr/local/bin/wrapper.sh

ENTRYPOINT ["wrapper.sh"]
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
