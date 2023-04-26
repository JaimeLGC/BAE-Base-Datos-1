-- Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:
-- Salario base.
-- Base reguladora.
-- Salario bruto.
-- Salario neto.
-- Etc.

Teniendo en cuenta esta información se pide:
-- Crea una base datos llamada salario.
    -- Crear BBDD en MySql
create database donación;

-- Crea una tabla llamada persona con los siguientes campos:
    -- Identificador. (Texto)__(PK)__.
    -- Nombre (Texto).
    -- Salario_base. (Escoge el tipo de dato). 

create table persona( 
id CHAR(2) NOT NULL,  
nombre TEXT NOT NULL,  
salario_base FLOAT DEFAULT NULL, 
PRIMARY KEY(id)
);

INSERT INTO persona VALUES('1A', 'Ana', 2000);

-- Cree una función para cada punto:
-- Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico.
DELIMITER $$ 
DROP FUNCTION IF EXISTS subsidio_transporte$$
CREATE FUNCTION subsidio_transporte(identificador CHAR(2)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN (
    SELECT p.salario_base * 0.07 FROM persona AS p
    WHERE id = identificador);
END
$$

SELECT subsidio_transporte('1A');

-- Función salud: La salud que corresponde al 4% al salario básico.
DELIMITER $$ 
DROP FUNCTION IF EXISTS salud$$
CREATE FUNCTION salud(identificador CHAR(2)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_salud FLOAT;
    DECLARE salario_base FLOAT;
    RETURN (
    SELECT p.salario_base * 0.04 FROM persona AS p
    WHERE id = identificador);
END
$$

SELECT salud('1A');

-- Función pension: La pensión que corresponde al 4% al salario básico
DELIMITER $$ 
DROP FUNCTION IF EXISTS pension$$
CREATE FUNCTION pension(identificador CHAR(2)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_pension FLOAT;
    DECLARE salario_base FLOAT;
    RETURN (
    SELECT p.salario_base * 0.04 FROM persona AS p
    WHERE id = identificador);
END
$$

SELECT pension('1A');

-- Función bono: Un bono que corresponde al 8% al salario básico.
DELIMITER $$ 
DROP FUNCTION IF EXISTS bono$$
CREATE FUNCTION bono(identificador CHAR(2)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_bono FLOAT;
    DECLARE salario_base FLOAT;
    RETURN  (
    SELECT p.salario_base * 0.08 FROM persona AS p
    WHERE id = identificador);
END
$$

SELECT bono('1A');

-- Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte___.
DELIMITER $$ 
DROP FUNCTION IF EXISTS integral$$
CREATE FUNCTION integral(identificador CHAR(2)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_integral FLOAT;
    RETURN (
    SELECT p.salario_base - salud(identificador) - pension(identificador) + bono(identificador) + 
            subsidio_transporte(identificador)
    FROM persona AS p
    WHERE id = identificador);
END
$$

SELECT integral('1A');