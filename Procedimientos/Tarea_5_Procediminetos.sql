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

-- Cree una función para cada punto:
-- Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico.
DELIMITER $$ 
DROP PROCEDURE IF EXISTS subsidio_transporte$$
CREATE PROCEDURE subsidio_transporte(IN identificador CHAR(2), OUT transporte FLOAT UNSIGNED)
BEGIN
    SET transporte = (
    SELECT salario_base * 0.07
    FROM persona
    WHERE id = identificador);
END
$$

-- Función salud: La salud que corresponde al 4% al salario básico.
DELIMITER $$ 
DROP PROCEDURE IF EXISTS salud$$
CREATE PROCEDURE salud(IN identificador CHAR(2), OUT total_salud FLOAT UNSIGNED)
BEGIN
    SET total_salud = (
    SELECT salario_base * 0.04
    FROM persona
    WHERE id = identificador);
END
$$

-- Función pension: La pensión que corresponde al 4% al salario básico
DELIMITER $$ 
DROP PROCEDURE IF EXISTS pension$$
CREATE PROCEDURE pension(IN identificador CHAR(2), OUT total_pension FLOAT UNSIGNED)
BEGIN
    SET total_pension = (
    SELECT salario_base * 0.04
    FROM persona
    WHERE id = identificador);
END
$$

-- Función bono: Un bono que corresponde al 8% al salario básico.
DELIMITER $$ 
DROP PROCEDURE IF EXISTS bono$$
CREATE PROCEDURE bono(IN identificador CHAR(2), OUT total_bono FLOAT UNSIGNED)
BEGIN
    SET total_bono = (
    SELECT salario_base * 0.08
    FROM persona
    WHERE id = identificador);
END
$$

-- Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte___.
DELIMITER $$ 
DROP PROCEDURE IF EXISTS integral$$
CREATE PROCEDURE integral(IN identificador CHAR(2), OUT total_integral FLOAT UNSIGNED)
BEGIN
    SET total_integral = (
    SELECT salario_base - total_salud - total_pension + total_bono + transporte
    FROM persona
    WHERE id = identificador);
END
$$
