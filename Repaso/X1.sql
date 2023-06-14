-- Crea una base datos llamada donación.

drop database if exists donacion;
create database donacion;
use donacion;

-- Crea una tabla llamada persona con los siguientes campos:

drop table if exists persona;
create table persona (
    Identificador VARCHAR(9),
    peso INT DEFAULT NULL,
    admitido ENUM("Si", "No") DEFAULT "Si",
    sexo ENUM("H","M") DEFAULT "H",
    fecha_ultima_donacion DATE DEFAULT "2022-12-12",
    PRIMARY KEY (Identificador)
);

-- - Realiza los siguientes procedimientos:

-- (1) Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. 
-- El procedimiento debe de recibir como parámetro de entrada el número de registros que se desea insertar y se debe de 
-- lanzar, al menos, en dos ocasiones, para verificar su correcto funcionamiento. Los datos deben de ser aleatorios, es decir, 
-- en cada inserción de debe de autogenerar o seleccionar uno al azar, de los campos requeridos.

DELIMITER //
DROP PROCEDURE IF EXISTS insert_data//
CREATE PROCEDURE insert_data (IN num_registros INT)
BEGIN
    DECLARE num_iteraciones INT DEFAULT 0;
    DECLARE nuevo_id VARCHAR(9);
    DECLARE nuevo_peso INT;
    WHILE num_iteraciones < num_registros DO
        SELECT CONCAT(LPAD(CAST(SUBSTRING(MAX(Identificador), 1, 8) AS UNSIGNED) + 1, 8, '0'),'J') 
        INTO nuevo_id FROM persona;
            IF nuevo_id IS NULL THEN
                SET nuevo_id = "00000000J";
            END IF;  
        SET num_iteraciones = num_iteraciones + 1;
        SET nuevo_peso = FLOOR(30 + (RAND() * 100));
        INSERT INTO persona(Identificador, peso) VALUES (nuevo_id, nuevo_peso);
    END WHILE;
END
//

CALL insert_data(10)//
CALL insert_data(5)//

-- (2) Realiza un procedimiento que permita actualizar el la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona, y una fecha.

DELIMITER //
DROP PROCEDURE IF EXISTS update_date//
CREATE PROCEDURE update_date (IN id VARCHAR(9), IN fecha_nueva DATE)
BEGIN
    UPDATE persona
    SET fecha_ultima_donacion = fecha_nueva
    WHERE Identificador = id;
END
//

CALL update_date("00000000J", "2023-01-01")//

-- (3) Realiza un procedimiento que permita actualizar el la fecha de última donación y el valor de admitido de una persona, 
-- teniendo como parámetro de entrada el identificador de la persona, y una fecha.

DELIMITER //
DROP PROCEDURE IF EXISTS update_date_and_admitted//
CREATE PROCEDURE update_date_and_admitted (IN id VARCHAR(9), IN fecha_nueva DATE)
BEGIN 
    DECLARE es_admitido VARCHAR(2);
    SET es_admitido = (SELECT admitido FROM persona WHERE Identificador = id);
    IF es_admitido = "Si" THEN
        SET es_admitido = "No";
    ELSE
        SET es_admitido = "Si";
    END IF;
    UPDATE persona
    SET fecha_ultima_donacion = fecha_nueva, admitido = es_admitido
    WHERE Identificador = id;
END
//

CALL update_date_and_admitted("00000001J", "2023-05-25")//

-- Realizar cada una de las siguientes funciones:

-- (1) Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una donación. 
-- Para ello la función recibe como parámetro de entrada el identificador de esta persona, y una fecha de donación. 
-- Los campos a tener en cuenta para determinar, si puede o no, será el peso. 
-- Posteriormente actualice el valor de la última donación de la persona indicada con el parámetro de entrada.
DELIMITER //
DROP FUNCTION IF EXISTS puede_donar//
CREATE FUNCTION puede_donar(id VARCHAR(9), fecha_donacion DATE) RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE peso_actual INT;
    SET peso_actual = (SELECT peso FROM persona WHERE Identificador = id);
    IF peso_actual < 50 THEN
        UPDATE persona
        SET admitido = "No"
        WHERE Identificador = id;
    ELSE
        UPDATE persona
        SET admitido = "Si"
        WHERE Identificador = id;
    END IF;
    RETURN (SELECT admitido FROM persona WHERE Identificador = id);
END
//

SELECT puede_donar("00000001J", "2023-05-25")//
SELECT puede_donar("00000004J", "2022-12-12")//

-- (2) Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una donación. 
-- Para ello la función recibe como parámetro de entrada el identificador de esta. 
-- Los campos a tener en cuenta son peso, el sexo y la fecha de la última donación, teniendo en cuento los requerimientos que se indican en la descripción del ejercicio.
-- Para poder donar sangre se deben cumplir varias condiciones:
    -- Tener un peso superior a 50Kg.
    -- No haber donado en un periodo anterior a 90 días en caso de ser hombre y 120 días en caso de mujer.

DELIMITER //
DROP FUNCTION IF EXISTS puede_donar//
CREATE FUNCTION puede_donar(id VARCHAR(9), fecha_donacion DATE) RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE fecha_nueva DATE;
    DECLARE peso_actual INT;
    DECLARE sexo_actual VARCHAR(1);
    DECLARE fecha_ultima DATE;
    SET peso_actual = (SELECT peso FROM persona WHERE Identificador = id);
    SET sexo_actual = (SELECT sexo FROM persona WHERE Identificador = id);
    SET fecha_ultima = (SELECT fecha_ultima_donacion FROM persona WHERE Identificador = id);
    SET fecha_nueva = (SELECT TIMESTAMPDIFF(DAY, fecha_ultima, fecha_donacion));
        IF peso_actual > 50 and sexo_actual = "H" and fecha_nueva > 90 THEN
            RETURN "Si";
        ELSE IF peso_actual > 50 and sexo_actual = "M" and fecha_nueva > 120 THEN
            RETURN "Si";
        ELSE
            RETURN "No";
        END IF;
END
//
