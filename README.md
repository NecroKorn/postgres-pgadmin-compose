# Postgresql & PgAdmin (Configurado)

## Requerimientos:
* docker >= 17.12.0+
* docker-compose

## Quick Start
* Run this command to install `docker-compose up -d`
* Run this command to uninstall `docker-compose down -v`

## Variables de entorno
Las variables de ntorno se encuentran en el archivo **.env**, el contenido es el siguiente:
* `POSTGRES_USER` el valor por defecto es **postgres**
* `POSTGRES_PASSWORD` el valor por defecto es **postgres**
* `POSTGRES_DATABASE_NAME` el valor por defecto es **dockerdb**
* `POSTGRES_SCHEMA` el valor por defecto es **public**
* `PGADMIN_PORT` el valor por defecto es is **5050**
* `PGADMIN_DEFAULT_EMAIL` el valor por defecto es **pgadmin4@pgadmin.org**
* `PGADMIN_DEFAULT_PASSWORD` el valor por defecto es **admin**

## Acceso a Postgres: 
* `localhost:5432`
* **Username:** postgres (valor por defecto)
* **Password:** postgres (valor por defecto)

## Acceso a PgAdmin: 
* **URL:** `http://localhost:5050`
* **Username:** pgadmin4@pgadmin.org (valor por defecto)
* **Password:** admin (valor por defecto)

## configuracion inicial de PgAdmin:
El archivo **servers.json** contiene la configuracion inicial de PgAdmin, la cual consiste en lo siguiente
* `Name` Nombre del contenedor de postgres en PgAdmin, el valor por defecto es **docker_postgres**
* `Group` Nombre del grupo de contenedores en PgAdmin, el valor por defecto es **docker_postgres_group**
* `Host` Nombre del Host, el valor por defecto es **host.docker.internal**
* `Port` Puerto para acceder a PgAdmin, el valor por defecto es **5432**
* `MaintenanceDB` Nombre de la base de datos de mantenimiento, el valor por defecto es **postgres**
* `Username` Nombre del Usuario de la base de datos, el valor por defecto es **postgres** (este valor corresponde al valor del parámetro `POSTGRES_USER`, si cambia en el archivo **.env**, debe ser modificado manualmente en el archivo **servers.json**)
* `PassFile` Cnfiguracion de acceso de PgAdmin a la base Postgres, el valor por defecto es **/pgpass**
* `SSLMode` el valor por defecto es **prefer**

## configuracion de PgAdmin para acceder a Postgres:
Los valores en el archivo **pgpass.conf** deben ser los mismos que estan definidos en el archivo **.env** y en el archivo **servers.json**
* `hostname:port:database:username:password` los valores que debe modificar son los siguientes:
* `hostname` =  **servers.json:Host**
* `port` = **.env:PGADMIN_PORT**
* `database` = **.env:POSTGRES_DATABASE_NAME**
* `username` = **.env:POSTGRES_USER**
* `password` = **.env:POSTGRES_PASSWORD**

* ejemplo con los valores por defecto : `host.docker.internal:5050:dockerdb:postgres:postgres` 

## configuracion inicial de base de datos:
El archivo **init_db.sh** contiene la configuracion inicial para la creacion de una base de datos, utilizar este archivo para definir la creacion de tablas u otros objetos necesarios

## Logging

There are no easy way to configure pgadmin log verbosity and it can be overwhelming at times. It is possible to disable pgadmin logging on the container level.

Add the following to `pgadmin` service in the `docker-compose.yml`:

```
logging:
  driver: "none"
```

## Basado en el proyecto
[referencia](https://github.com/khezen/compose-postgres/blob/master/README.md)