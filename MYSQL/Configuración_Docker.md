# Creación de un contenedor Docker con MySQL Server

## Creación de un contenedor sin persistencia de datos

Para lanzar un contenedor sin persistencia de Docker con MySQL lanzamos un comando como este, sin especificar parámetros:

    sudo docker run -d --rm --name mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 mysql:8.0

## Cambio del plugin de autenticación en las versiones superiores a la 8.0

Para realizar este paso primero tendremos que detener mysql con:

    sudo service mysql status
    sudo service mysql stop

Ahora podremos cambia rel plugin de autorizacion lanzando un comando como este sin especificar parámetros:

    sudo docker run -d --rm --name mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 mysql:8 --default-authentication-plugin=mysql_native_password

## Creación de un contenedor con persistencia de datos

Antes de crear el contenedor 

Para esto utilizaremos el parámetro -v para crear un volumen de tipo bind_mount:

    docker -v /home/jpexposito/data:/var/lib/mysql