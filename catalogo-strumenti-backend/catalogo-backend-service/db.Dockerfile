FROM mysql:latest

COPY ./db/catalogue-create-mysql.sql /docker-entrypoint-initdb.d/
COPY ./db/catalogue-data.sql /docker-entrypoint-initdb.d/
