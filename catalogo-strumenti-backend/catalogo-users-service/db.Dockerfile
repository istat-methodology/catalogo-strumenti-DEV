FROM mysql:latest

COPY ./db/catalog-create-mysql.sql /docker-entrypoint-initdb.d/
COPY ./db/catalog-data.sql /docker-entrypoint-initdb.d/
