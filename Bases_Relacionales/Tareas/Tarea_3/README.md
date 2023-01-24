# Tarea 3
## Bases de datos relacionales

<img src="img/is.jpg">

- Realiza las consultas que se indican a continuación:

- Contar el número de usuarios por marca de teléfono.

- Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG4.

`SELECT nombre, telefono FROM Usuario WHERE marca NOT IN  ("LG4")`

- Listar las diferentes compañias en orden alfabético ascendentemente.


- Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL.

`SELECT sum(saldo) FROM Usuario WHERE compañia = "NEXTEL"`

- Mostrar el email de los usuarios que usan hotmail.

- Listar los nombres de los usuarios sin saldo o inactivos.

`SELECT nombre FROM Usuario WHERE saldo = 0 or activo = 0`

- Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o TELCEL.

`SELECT login, telefono FROM Usuario WHERE compañia = 'IUSACELL' or compañia = 'TELCEL'`

- Listar las diferentes marcas de celular en orden alfabético ascendentemente.

`SELECT DISTINCT marca FROM Usuario ORDER BY marca ASC`

- Listar las diferentes marcas de celular en orden alfabético aleatorio.

- Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o NEXTEL.

`SELECT login, telefono FROM Usuario WHERE compañia IN ("KINKI" or "NEXTEL")`

- Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca KINKI o MOT.

`SELECT nombre, telefono FROM Usuario WHERE marca NOT IN ("KINKI" or "MOT")`

- Calcular la suma de los saldos de los usuarios de la compañia telefónica TELCEL.

`SELECT sum(saldo) FROM Usuario WHERE marca IN ("TELCEL")`
