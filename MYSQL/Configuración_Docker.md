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

Antes de crear el contenedor tenemos que parar el contenedor sin persistencia que hemos creado anteriormente usando: 

    sudo docker ps -a
    sudo docker stop "Código del contenedor"


Para la creación primero utilizaremos el parámetro -v para crear un volumen de tipo bind_mount:

    docker -v /home/jpexposito/data:/var/lib/mysql

Tras esto lanzaremos un contenedor con permanecia utilizando un comando como este:

    sudo docker run -d --rm --name mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v mysql_data:/var/lib/mysql mysql:8.0

(Solución aprtada no ha funcionado)