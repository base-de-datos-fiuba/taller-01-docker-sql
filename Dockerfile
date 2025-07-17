FROM postgres:latest
# https://hub.docker.com/_/postgres

LABEL author="BDD-Fiuba"
LABEL description="Postgres Image for BDD-FIUBA"
LABEL version="1.0"

COPY *.sql /docker-entrypoint-initdb.d/