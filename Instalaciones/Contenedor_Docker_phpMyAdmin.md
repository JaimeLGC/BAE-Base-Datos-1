# Creación de un contenedor Docker con phpMyAdmin

## Enlace de phpMyAdmin con un contenedor Docker con MySQL o MariaDB

Se usará la imagen oficial de phpmyadmin.

## Utilización de una user-defined bridge network

En primer lugar creamos una user-defined bridge network con el siguiente comando:

    docker network create my-net

Nos devolverá un código como este:

    7091f274af3c8a07f64efc744dc840a56862658f71e69846262e888ecaaf78bd

Creación de un contenedor con MySQL indicando la red --network my-net: 

    docker run -d \
    --rm \
    --name mysqlc \
    --network my-net \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=root \
    -v mysql_data:/var/lib/mysql \
    mysql:8.0

Creación de un contenedor con phpMyAdmin indicando la red --network my-net: 

    docker run -d \
    --rm \
    --name phpmyadminc \
    --network my-net \
    -e PMA_HOST=mysqlc \
    -p 8080:80 \
    phpmyadmin

Nos devolverá las sigueintes lineas seguidas de una lista de pulls: 

    Unable to find image 'phpmyadmin:latest' locally
    latest: Pulling from library/phpmyadmin

## Comprobar que los contenedores están en ejecución

Una vez iniciados, podemos comprobar que los contenedores se están ejecutando con el siguiente comando:

    sudo docker ps

Obtendremos uns salida como esta:

    CONTAINER ID   IMAGE        COMMAND                  CREATED          STATUS          PORTS                                                  NAMES
    c42dcb3337e4   phpmyadmin   "/docker-entrypoint.…"   19 minutes ago   Up 19 minutes   0.0.0.0:8080->80/tcp, :::8080->80/tcp                  phpmyadminc
    d5c5912312a0   mysql:8.0    "docker-entrypoint.s…"   22 minutes ago   Up 22 minutes   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   mysqlc

## Detener los contenedores

Para detener un contenedor en primer lugar tenemos que conocer cuál es su ID, esto lo haremos lanzando el comando ya visto:

    sudo docker ps

Para detener los contenedores tendremos que lanzar el siguiente comando:

    docker stop <código del contenedor>