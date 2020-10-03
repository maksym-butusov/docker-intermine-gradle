FROM postgres:9.3
LABEL maintainer="Ank"

COPY ./postgres/init_postgresql.sh /docker-entrypoint-initdb.d/
COPY ./postgres/postgresql.conf /opt/postgresql.conf
COPY ./postgres/docker-healthcheck /usr/local/bin/

HEALTHCHECK CMD ["docker-healthcheck"]
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432

RUN chmod 777 /opt

CMD ["postgres", "-c", "config_file=/opt/postgresql.conf", "-p", "5432"]
