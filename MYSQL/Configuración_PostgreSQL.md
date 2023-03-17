# Creación de un contenedor Docker con PostgreSQL

## Creación de un contenedor sin persistencia de datos

Para lanzar un contenedor sin persistencia con Docker de MySQL lanzamos un comando como este, sin especificar parámetros:

    docker run -d --rm --name postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 postgres

## Conectar con el contenedor que está ejecutando PostgreSQL usando psql

Creado el contenedor podemos conectarnos a él para utilizar la herramienta psql con el siguiente comando:

    docker run -it --rm --link postgres:postgres postgres psql -h postgres -U postgres

## Conectar con el contenedor que está ejecutando PostgreSQL usando adminer

Para crear un contenedor con Adminer para utilizar una interfaz web que nos permite conectar con PostgreSQL, podemos lanzar el siguiente comando:

    docker run -d --rm  --link postgres:db -p 8080:8080 adminer

## Comprobar que los contenedores están en ejecución

Podemos comprobar que se están ejecutando con el siguiente comando:

    docker ps

## Detener el contenedor

Para detener el contenedor bstará con lanzar este comando con la ID del dicho, la cual ya hemos visto como encontrar en el paso anterior.

    sudo docker stop <Código del contenedor>