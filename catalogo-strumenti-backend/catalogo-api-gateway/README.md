[![Build Status](https://travis-ci.org/istat-methodology/regedit-backend.svg?branch=main)](https://travis-ci.org/istat-methodology/regedit-backend) 
[![Docker hub](https://img.shields.io/docker/cloud/automated/mecdcme/regedit-api-gateway.svg?label=regedit-api-gateway%20docker)](https://hub.docker.com/r/mecdcme/regedit-api-gateway)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=istat-methodology_regedit-backend&metric=alert_status)](https://sonarcloud.io/dashboard?id=istat-methodology_regedit-backend)
# RegEdit API Gateway Service (ZUUL+Eureka+JWT)

A EUREKA server that acts as a central authentication unit, ZUUL proxy server for redirection..


## What you’ll need
In order to build the application, your environment should fulfill the following requirements:

* A favorite text editor or IDE;
* JDK 11+; 
* Maven 3.0+;
* Mysql Server 8.0+ or PostgreSQL 9.6+ ;  


## How to build
Download and unzip the source code in your developing folder `RegEditAPI_PATH`.

Before building the application you must create and popolulate the RegEdit database.

You can create a MySQL database using the script `regedit-api-gateway-create-mysql.sql` stored in the [RegEditAPI_PATH/db](db/regedit-api-gateway-create-mysql.sql) folder.
Also you can create a PostgreSQL database using the script `regedit-api-gateway-create-postgres.sql` stored in the [RegEditAPI_PATH/db](db/regedit-api-gateway-create-postgres.sql) folder.

Then yo can load the metadata and the test data, using the script `regedit-api-gateway-init.sql` stored in the [RegEditAPI_PATH/db](db/regedit-api-gateway-init.sql) folder.


The script will populate the `USER/ROLES` tables with the user:
```
Username: admin@is2.it
Password: istat
``` 

As a first step, configure the database connection in the 'application.yml' file, located in the path `[RegEditAPI_PATH]/src/main/resources`:

Postgres connection
```
spring.datasource.url=jdbc:postgresql://localhost:5432/postgres?currentSchema=regedit_gateway&charset=UTF-8
spring.datasource.username=db_username
spring.datasource.password=db_password
spring.datasource.driverClassName=org.postgresql.Driver
```
MySQL connection
```
spring.datasource.url=jdbc:mysql://localhost:3306/regedit_gateway?useSSL=false&useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
spring.datasource.username=db_username
spring.datasource.password=db_password
spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver
```

Now you can perform your first build of the application using Maven comand:
```
[RegEditAPI_PATH]> mvn package
```
If the build process ends successfully, you are ready to run the application:
The application is built using the open source framework Spring Boot, which generates an 
executable jar (that can be run from the command line). Spring Boot creates a stand-alone Spring 
based Applications, with an embedded Tomcat, that you can "just run".
```
[RegEditAPI_PATH]> java –jar target/regedit-api-gateway.jar
```
or using Maven comand:
```
[RegEditAPI_PATH]> mvn spring-boot:run 
```
## Docker compose
You can run the RegEdit API Gateway as Docker containers using docker compose: 
```
[RegEditAPI_PATH]> docker-compose up
```

## Test the application 
You can test the application and explore the available services, linking to API documentation  by Swagger tools:

[http://localhost:8080/swagger-ui/index.html/](http://localhost:8080/swagger-ui/index.html) 

and EUREKA services at:

[http://localhost:8080/](http://localhost:8080) 


## License
RegEdit Service is EUPL-licensed

