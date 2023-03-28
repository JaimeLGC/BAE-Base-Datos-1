# Creación de un contenedor Docker con MariaDB

## Creación de un contenedor sin persistencia de datos

Para lanzar un contenedor sin persistencia con Docker de MariaDB lanzamos un comando como este, sin especificar parámetros:

    docker run -d --rm --name mariabd -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v mariadb_data:/var/lib/mysql mariadb

Para comprobar que nuestor contenedor se está ejecutando podemos lanzar el siguiente comando:

    docker ps

Nos devolverá una salida como esta:

    CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                       NAMES
    6422029f9025   mariadb   "docker-entrypoint.s…"   2 minutes ago   Up 2 minutes   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp   mariabd

## Conectar con Maria BD

Una vez que MariaBD está en ejecución podemos conectarnos con cualquier cliente, introduciendo los siguientes datos:

    Host: 127.0.0.1
    Puerto: 3306
    Usuario: root
    Password: root

## Detener el contenedor

Para detener el contenedor bstará con lanzar este comando con la ID del dicho, la cual ya hemos visto como encontrar en el paso anterior.

    sudo docker stop <Código del contenedor>