-- ¿Sabías que la mayoría de los adultos sanos pueden ser donantes? Aunque existen ciertas condiciones que debes cumplir para realizar con éxito una donación. Descubre los requisitos básicos para donar sangre.

-- Para la poder donar sangre se deben cumplir varias condiciones:

--     Tener un peso superior a 50Kg.
--     No haber donado en un periodo anterior a 90 días en caso de ser hombre y 120 días en caso de mujer.

-- Teniendo en cuenta esta información se pide:

-- Crea una base datos llamada donación.
CREATE DATABASE donación;

-- Crea una tabla llamada persona con los siguientes campos:

--     Identificador (Texto)
--     Peso. (Entero)
--     Admitido. Texto(Si/No).(Valores de dominio:Si/No)
--     Sexo. Texto (H/M).(Valores de dominio:H/M)
--     Fecha Última Donación. DateTime.

DELIMITER $$
CREATE TABLE persona(
    identificador VARCHAR(8) NOT NULL,
    peso INT NOT NULL,
    admitido CHAR(2) NOT NULL,
    sexo CHAR(1) NOT NULL,
    fecha_última_donación DATE,
    PRIMARY KEY (identificador)
)$$

-- Se pide:

-- - Realiza los siguientes procedimientos:

-- 	- (1) Realizar un procedimiento que realice la inserción de datos 
-- aleatorios en la tabla. El procedimiento debe de recibir como parámetro de entrada el número de registros que se desea insertar y se debe de lanzar, al menos, en dos acociones, para verificar su correcto funcionamiento. Los datos deben de ser aleatorios, es decir, en cada inserción de debe de autogenerar o seleccionar uno al azar, de los campos requeridos.
DELIMITER $$
DROP PROCEDURE IF EXISTS insercion_personas$$
CREATE PROCEDURE insercion_personas(IN inserciones INT)
BEGIN
    DECLARE contador_inserciones INT;
    DECLARE numero_identificador INT;
    DECLARE peso INT;
    DECLARE id TEXT;
    SET peso = 40;
    SET contador_inserciones = 0;
    SET numero_identificador = (SELECT COUNT(*) FROM persona);
    SET id = CONCAT('A', numero_identificador);
    WHILE contador_inserciones < inserciones do
        contador_inserciones = contador_inserciones + 1;
        INSERT INTO persona VALUES(id, peso, 'No', 'M', '2001-11-03');
    END WHILE;
END
$$

-- 	- (2) Realiza un procedimiento que permita actualizar el la fecha de última donación, 
-- teniendo como parámetro de entrada el identificador de la persona, y una fecha.
DELIMITER $$
DROP PROCEDURE IF EXISTS cambio_fecha$$
CREATE PROCEDURE cambio_fecha(IN id VARCHAR(8), IN nueva_fecha DATE)
BEGIN
    UPDATE persona 
    SET fecha_última_donación = nueva_fecha
    WHERE identificador = id;
END
$$

-- - (3) Realiza un procedimiento que permita actualizar el la fecha de última donación y 
-- el valor de admitido de una persona, teniendo como parámetro de entrada el 
-- identificador de la persona, y una fecha.
DELIMITER $$
DROP PROCEDURE IF EXISTS cambio_fecha$$
CREATE PROCEDURE cambio_fecha(IN id VARCHAR(8), IN nueva_fecha DATE)
BEGIN
    UPDATE persona 
    SET fecha_última_donación = nueva_fecha
    WHERE identificador = id;
    IF admitido = 'No' THEN
        UPDATE persona 
        SET admitido = 'Si'
        WHERE identificador = id;
    END IF;
END
$$

-- - Realizar cada una de las siguientes funciones:

-- 	- (1) Realiza una función que determine si una persona almacenada en la 
-- tabla persona puede realizar una donación. Para ello la función recibe como 
-- parámetro de entrada el identificador de esta persona, y una fecha de donación. 
-- Los campos a tener en cuenta para determinar, si puede o no, será el peso. 
-- Posteriormente actualice el valor de la última donación de la persona indicada con el 
-- parámetro de entrada.
DELIMITER $$
DROP FUNCTION IF EXISTS determinar_validez_peso$$
CREATE FUNCTION determinar_validez_peso(id TEXT, fecha DATE) RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE peso_mínimo INT;
    DECLARE peso_persona INT;
    DECLARE admision TEXT;
    SET peso_mínimo = 50;
    SET admision = 'No';
    SET peso_persona = (SELECT peso FROM persona WHERE identificador = id);
    IF peso_persona >= peso_mínimo THEN -- se cambia la fecha si está admitido
        UPDATE persona 
        SET admitido = 'Si', fecha_última_donación = fecha
        WHERE identificador = id;
        SET admision = 'Si';
    END IF;
    RETURN admision;
END
$$

-- 	- (2) Realiza una función que determine si una persona almacenada en la tabla 
-- persona puede realizar una donación. Para ello la función recibe como parámetro de 
-- entrada el identificador de esta. Los campos a tener en cuenta son peso, el sexo y la 
-- fecha de la última donación, teniendo en cuento los requerimientos que se 
-- indican en la descripción del ejercicio.
DELIMITER $$
DROP FUNCTION IF EXISTS determinar_validez_peso$$
CREATE FUNCTION determinar_validez_peso(id TEXT) RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE peso_mínimo INT;
    DECLARE peso_persona INT;
    DECLARE sexo_persona CHAR(2);
    DECLARE ultima_donacion DATE;
    DECLARE fecha_actual DATE;
    DECLARE dias_pasados INT;
    DECLARE admision TEXT;
    SET dias_pasados = fecha_actual - fecha_última_donación;
    SET fecha_actual = '2023-04-26';
    SET peso_mínimo = 50;
    SET admision = 'No';
    SET peso_persona = (SELECT peso FROM persona WHERE identificador = id);
    SET sexo_persona = (SELECT sexo FROM persona WHERE identificador = id);
    SET ultima_donacion = (SELECT fecha_última_donación FROM persona WHERE identificador = id);
    IF peso_persona >= peso_mínimo THEN
        IF sexo = 'M' AND dias_pasados >= 120 THEN
            UPDATE persona SET admitido = 'Si' WHERE identificador = id;
            SET admision = 'Si';
        END IF;
        IF sexo = 'H' AND dias_pasados >= 90 THEN
            UPDATE persona SET admitido = 'Si' WHERE identificador = id;
            SET admision = 'Si';
        END IF;
    END IF;
    RETURN admision;
END
$$

-- - Rúbrica:

-- 	- Procedimientos:

-- 		- 1.

-- 			- Realiza la inserción correcta en, al menos dos ocaciones. 1 punto.

-- 			- Todos los datos de la tabla se auto generan o seleccionan de forma aleatorio. 2 Puntos.

-- 		- 2. El procedimiento permite actualizar el dato de forma correcta. 1 puntos.

-- 		- 3. El procedimiento permite actualizar el dato de forma correcta. 1 puntos.

-- 	- Funciones:

-- 		- 1. La función funciona correctamente. 1 punto.

-- 		- 2. La función funciona correctamente. 2 puntos.

-- 		- Optimización:- Teniendo en cuenta el correcto funcionamiento de las funciones 1, y 2. La optimización de la solución valdrá dos puntos.