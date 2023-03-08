## Instalación de mysql en sistema Ubuntu

En esta guía veremos los paso para la instalación de mysql en un sistema ubuntu a 08 de marzo de 2023.

Podreis ver todos los pasos acompañados de las las líneas a escribir y unas líneas de código que nos servirán para comprar los resultados obtenidos y comprobar que la instalación es correcta.

El primer paso será actualizar el indice de paquetes de nuestro servidor

- `sudo apt update`

Te debería devolver estas líneas al final:

    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    228 packages can be upgraded. Run 'apt list --upgradable' to see them.

Ahora instalamos el paquete mysql-server

'sudo apt install mysql-server'

Te debería devolver estas líneas al final:

    Setting up mysql-server (8.0.32-0ubuntu0.22.04.2) ...
    Processing triggers for man-db (2.10.2-1) ...
    Processing triggers for libc-bin (2.35-0ubuntu3.1) ...

'sudo su'

'mysql -u root'

Comprueba que se ha abierto correctamente:

    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 8
    Server version: 8.0.32-0ubuntu0.22.04.2 (Ubuntu)

'exit;'

    Bye

'sudo mysql_secure_installation'

Nos explicará el medio de validación de contraseñas y nos preguntará si queremos proceder

    Securing the MySQL server deployment.

    Connecting to MySQL using a blank password.

    VALIDATE PASSWORD COMPONENT can be used to test passwords
    and improve security. It checks the strength of password
    and allows the users to set only those passwords which are
    secure enough. Would you like to setup VALIDATE PASSWORD component?

'Y o y'

    There are three levels of password validation policy:

    LOW    Length >= 8
    MEDIUM Length >= 8, numeric, mixed case, and special characters
    STRONG Length >= 8, numeric, mixed case, special characters and dictionary                  file

    Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: 

'2'

    Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) :

'Y'