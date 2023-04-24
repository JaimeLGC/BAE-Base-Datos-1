-- Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:

--     Salario base.
--     Base reguladora.
--     Salario bruto.
--     Salario neto.
--     Etc.

-- Teniendo en cuenta esta información se pide:

--     Crea una base datos llamada salario.
--         Crear BBDD en MySql.

--     Crea una tabla llamada persona con los siguientes campos:
--         Identificador. (Texto)(PK).
--         Nombre (Texto).
--         Salario_base. (Escoge el tipo de dato).
--         Subsidio(Escoge el tipo de dato).
--         Salud(Escoge el tipo de dato).
--         Pensión(Escoge el tipo de dato).
--         Bono(Escoge el tipo de dato).
--         Integral(Escoge el tipo de dato).

create table persona( 
id CHAR(2) NOT NULL,  
nombre TEXT NOT NULL,  
salario_base FLOAT NOT NULL,
subsidio FLOAT DEFAULT NULL,
salud FLOAT DEFAULT NULL,
pension FLOAT DEFAULT NULL,
bono FLOAT DEFAULT NULL,
integral FLOAT DEFAULT NULL,
PRIMARY KEY(id)
);

INSERT INTO persona VALUES('1A', 'Ana', 2000);

-- Creación de un procedimiento de forma aleatoria con las siguientes características:
--     Parámetro de entrada el número de registros (Mínimo 10, y realiza la prueba varias veces).

-- Cree una función para cada punto teniendo en cuenta que:
--     Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico. Actualiza el valor en la tabla.
DELIMITER $$
CREATE FUNCTION subsidio_transporte (identificador CHAR(2)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE subsidio_transporte FLOAT;
    SET subsidio_transporte = (SELECT salario_base * 0.07 FROM persona where id = identificador);
    UPDATE persona SET subsidio = subsidio_transporte WHERE identificador = id;
    RETURN subsidio;
END
$$

SELECT * FROM persona WHERE id = '1A';

--     Función salud: La salud que corresponde al 4% al salario básico. Actualiza el valor en la tabla.
DELIMITER $$
CREATE FUNCTION salud (identificador CHAR(2)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_salud FLOAT;
    SET total_salud = (SELECT salario_base * 0.04 FROM persona where id = identificador);
    UPDATE persona SET salud = total_salud WHERE identificador = id;
    RETURN salud;
END
$$

SELECT * FROM persona WHERE id = '1A';

--     Función pension: La pensión que corresponde al 4% al salario básico. Actualiza el valor en la tabla.
DELIMITER $$
CREATE FUNCTION pension (identificador CHAR(2)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_pension FLOAT;
    SET total_pension = (SELECT salario_base * 0.04 FROM persona where id = identificador);
    UPDATE persona SET pension = total_pension WHERE identificador = id;
    RETURN pension;
END
$$

SELECT * FROM persona WHERE id = '1A';

--     Función bono: Un bono que corresponde al 8% al salario básico. Actualiza el valor en la tabla.
DELIMITER $$
CREATE FUNCTION bono (identificador CHAR(2)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_bono FLOAT;
    SET total_bono = (SELECT salario_base * 0.08 FROM persona where id = identificador);
    UPDATE persona SET bono = total_bono WHERE identificador = id;
    RETURN bono;
END
$$

SELECT * FROM persona WHERE id = '1A';

--     Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte. Actualiza el valor en la tabla.
-- DELIMITER $$ 
-- DROP FUNCTION IF EXISTS integral$$
-- CREATE FUNCTION integral(identificador CHAR(2)) RETURNS FLOAT
-- DETERMINISTIC
-- BEGIN
--     DECLARE total_integral FLOAT;
--     UPDATE persona SET integral = (
--     SELECT p.salario_base - salud(identificador) - pension(identificador) + bono(identificador) + 
--             subsidio_transporte(identificador)
--     FROM persona AS p
--     WHERE id = identificador)
--     WHERE id = identificador
-- END
-- $$


--     Crea cada uno de las funciones anteriores para una persona en específico.

--     El parámetro de entrada debe de ser un identificar de la persona.
