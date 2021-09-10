FROM mysql:latest

COPY ./db/regedit-create-mysql.sql /docker-entrypoint-initdb.d/
COPY ./db/regedit-data.sql /docker-entrypoint-initdb.d/
