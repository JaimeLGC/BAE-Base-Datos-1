-- Teniendo en cuenta lo que se ha trabajado en la tarea 3 (donación de sangre), se pretende crear una BBDD y una tabla persona. Para ello debe existir una campo, identificador (podría ser el dni como campo único) y quedando la estrucura similar a:
-- Crea una base datos llamada clientes.
create database clientes;

-- Crea una tabla llamada persona con los siguientes campos indicados y decidiendo los tipos de datos.
create table persona( 
dni CHAR(8) NOT NULL,  
nombre VARCHAR(20) NOT NULL,  
apellido1 VARCHAR(20) NOT NULL,
apellido2 VARCHAR(20) DEFAULT NULL,
peso FLOAT NOT NULL,  
sexo CHAR(1) NOT NULL, 
PRIMARY KEY(dni)
);

-- Realiza al menos 10 insert en la tabla, con datos aleatorios, generados por el usuario.
INSERT INTO persona  VALUES('22222222', 'Juan', 'Perez', 70, 'H')
INSERT INTO persona VALUES('22333333', 'Luis', 'Lopez', 90, 'H')
INSERT INTO persona VALUES('22444444', 'Marta', 'Perez', 76, 'M')
INSERT INTO persona VALUES('22555555', 'Susana', 'Garcia', 49, 'M')
INSERT INTO persona VALUES('22666666', 'Jose Maria', 'Morales', 66, 'H')
INSERT INTO persona VALUES('02222222', 'Juan', 'Perez', 61, 'H')
INSERT INTO persona VALUES('02333333', 'Luis', 'Lopez', 80, 'H')
INSERT INTO persona VALUES('02444444', 'Marta', 'Perez', 50, 'M')
INSERT INTO persona VALUES('02555555', 'Susana', 'Garcia', 99, 'M')
INSERT INTO persona VALUES('02666666', 'Jose Maria', 'Morales', 100, 'H')


-- Realice los siguientes procedimientos: Cree procedimientos para los siguientes casos:
--     Que inserte información en la tabla clientes. Ayuda(recibe los parámetros a insertar).
DELIMITER $$
DROP PROCEDURE IF EXISTS insertar $$
CREATE PROCEDURE insertar(IN identificador CHAR(8), persona_nombre VARCHAR(20), persona_apellido1 VARCHAR(20) persona_apellido2 VARCHAR(20), persona_peso FLOAT, persona_sexo CHAR(1))
BEGIN
INSERT INTO persona VALUES(identificador, persona_nombre, persona_apellido1, persona_apellido2, persona_peso, persona_sexo)
END
$$

--     Que actualice el nombre de un cliente. Ayuda (recibe dos parámetros, el identificador aactualizar y el nuevo nombre).
DELIMITER $$
DROP PROCEDURE IF EXISTS cambiar_nombre $$
CREATE PROCEDURE insertar(IN identificador CHAR(8), persona_nombre VARCHAR(20))
BEGIN
UPDATE persona
SET nombre = persona_nombre
WHERE id = identificador
END
$$

--     Que elimine un cliente. Ayuda (recibe un parámetro, identificador se va eliminar.
DELIMITER $$
DROP PROCEDURE IF EXISTS eliminar_cliente $$
CREATE PROCEDURE eliminar_cliente(IN identificador CHAR(8))
BEGIN
DELETE FROM personas 
WHERE id = identificador
END
$$

--     Investigar procedimientos con paramentaros de salida.
--     Investigar cómo hacer un ciclo (while).
