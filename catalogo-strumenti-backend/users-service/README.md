[![Build Status](https://travis-ci.org/istat-methodology/catalog-backend.svg?branch=main)](https://travis-ci.org/istat-methodology/catalog-backend) 
[![Docker hub](https://img.shields.io/docker/cloud/automated/mecdcme/catalog.svg?label=catalog%20docker)](https://hub.docker.com/r/mecdcme/catalog)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=istat-methodology_catalog-backend&metric=alert_status)](https://sonarcloud.io/dashboard?id=istat-methodology_catalog-backend)
# Users Service

A JAVA REST API service to manage catalog users table.



## What you’ll need
In order to build the application, your environment should fulfill the following requirements:

* A favorite text editor or IDE;
* JDK 11+; 
* Maven 3.0+;
* Mysql Server 8.0+ or PostgreSQL 9.6+ ;  


## How to build
Download and unzip the source code in your developing folder `UsersService_PATH`.

Before building the application you must create and popolulate the Users database.

You can create a MySQL database using the script `catalog-users-create-mysql.sql` stored in the [UsersService_PATH/db](db/catalog-users-create-mysql.sql) folder.
Also you can create a PostgreSQL database using the script `catalog-users-create-postgres.sql` stored in the [UsersService_PATH/db](db/catalog-users-create-postgres.sql) folder.

Then yo can load the metadata and the test data, using the script `catalog-users-data.sql` stored in the [UsersService_PATH/db](db/catalog-users-data.sql) folder.

As a first step, configure the database connection in the 'application.yml' file, located in the path `[UsersService_PATH]/src/main/resources`:

Postgres connection
```
spring.datasource.url=jdbc:postgresql://localhost:5432/postgres?currentSchema=catalog&charset=UTF-8
spring.datasource.username=db_username
spring.datasource.password=db_password
spring.datasource.driverClassName=org.postgresql.Driver
```
MySQL connection
```
spring.datasource.url=jdbc:mysql://localhost:3306/catalog?useSSL=false&useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
spring.datasource.username=db_username
spring.datasource.password=db_password
spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver
```

Now you can perform your first build of the application using Maven comand:
```
[UsersService_PATH]> mvn package
```
If the build process ends successfully, you are ready to run the application:
The application is built using the open source framework Spring Boot, which generates an 
executable jar (that can be run from the command line). Spring Boot creates a stand-alone Spring 
based Applications, with an embedded Tomcat, that you can "just run".
```
[UsersService_PATH]> java –jar target/catalog_users.jar
```
or using Maven comand:
```
[UsersService_PATH]> mvn spring-boot:run 
```
## Docker compose
You can run the Users Service as Docker containers using docker compose: 
```
[UsersService_PATH]> docker-compose up
```

## Test the application 
You can test the application and explore the available services, linking to API documentation  by Swagger tools:

[http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html) 


## License
Users Service is EUPL-licensed

