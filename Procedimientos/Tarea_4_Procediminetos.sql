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

--- Procedimiento para realizar insetar infromación en la base de datos:

DELIMITER $$
drop procedure nuevo_cliente $$
create procedure nuevo_cliente(
    IN u_dni VARCHAR(9), 
    IN u_nombre VARCHAR(55), 
    IN u_apellido1 VARCHAR(55), 
    IN u_apellido2 VARCHAR(55), 
    IN u_peso INTEGER, 
    IN u_sexo VARCHAR(1)
)
BEGIN
    declare anterior INT default 0;
    set anterior = select id from persona where dni = u_dni
    if (anterior == 0) then
        INSERT INTO persona VALUES(u_dni, u_nombre, u_apellido1, u_apellido2, u_peso, u_sexo);
END

--     Que actualice el nombre de un cliente. Ayuda (recibe dos parámetros, el identificador aactualizar y el nuevo nombre).

DELIMITER $$
DROP PROCEDURE IF EXISTS cambiar_nombre $$
CREATE PROCEDURE cambiar_nombre(IN identificador CHAR(8), IN persona_nombre VARCHAR(20))
BEGIN
    UPDATE persona
    SET nombre = persona_nombre
    WHERE id = identificador;
END
$$

--     Que elimine un cliente. Ayuda (recibe un parámetro, identificador se va eliminar.
DELIMITER $$
DROP PROCEDURE IF EXISTS eliminar_cliente $$
CREATE PROCEDURE eliminar_cliente(IN identificador CHAR(8))
BEGIN
    DELETE FROM personas 
    WHERE id = identificador;
END
$$

--     Investigar procedimientos con paramentaros de salida.
DELIMITER $$
create procedure muestra_peso(
    IN dni_cliente VARCHAR(9),
    OUT peso_cliente INT
)0
BEGIN
    select peso from persona where dni = dni_cliente INTO peso_cliente;
END
$$

DELIMITER ;
CALL muestra_peso('11111111A', @peso_cliente);
select @peso_cliente;

--     Investigar cómo hacer un ciclo (while).
