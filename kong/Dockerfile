FROM kong:2.8.1

COPY ./kong.yml /home/kong/temp.yml
COPY ./wrapper.sh /usr/local/bin/wrapper.sh

RUN chmod +x /usr/local/bin/wrapper.sh

ENTRYPOINT ["wrapper.sh"]
