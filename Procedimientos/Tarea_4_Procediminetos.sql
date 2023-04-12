-- Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:
--  Salario base.
--  Base reguladora.
--  Salario bruto.
--  Salario neto.
--  Etc.

-- Teniendo en cuenta esta información se pide:
--  Crea una base datos llamada salario.
create database salario;

-- Crea una tabla llamada persona con los siguientes campos:
--      Identificador. (Texto)__(PK)__.
--      Nombre (Texto).
--      Salario_base. (__Escoge el tipo de dato__). 

create table persona( 
id CHAR(2) NOT NULL,  
nombre VARCHAR(20) NOT NULL,  
salario_base FLOAT NOT NULL,
PRIMARY KEY(id)
);

-- Cree una función para cada punto:
--  Función subsidio_transporte: El subsidio de transporte equivale al __7%__ al salario básico.

DELIMITER $$ 
DROP PROCEDURE IF EXISTS subsidio_transporte$$
CREATE PROCEDURE subsidio_transporte(IN identificador TEXT, OUT transporte FLOAT UNSIGNED)
BEGIN
  SET transporte = (
    SELECT salario_base * 0,07
    FROM persona
    WHERE id = identificador)
END
$$ 

--  Función __salud__: La salud que corresponde al __4%__ al salario básico.

DELIMITER $$ 
DROP PROCEDURE IF EXISTS salud$$
CREATE PROCEDURE salud(IN identificador TEXT, OUT total_salud FLOAT UNSIGNED)
BEGIN
  SET total_salud = (
    SELECT salario_base * 0,04
    FROM persona
    WHERE id = identificador)
END
$$ 

--  Función __pension__: La pensión que corresponde al __4%__ al salario básico

DELIMITER $$ 
DROP PROCEDURE IF EXISTS pension$$
CREATE PROCEDURE pension(IN identificador TEXT, OUT total_pension FLOAT UNSIGNED)
BEGIN
  SET total_pension = (
    SELECT salario_base * 0,04
    FROM persona
    WHERE id = identificador)
END
$$ 

--  Función __bono__: Un bono que corresponde al __8%__ al salario básico.

DELIMITER $$ 
DROP PROCEDURE IF EXISTS bono$$
CREATE PROCEDURE bono(IN identificador TEXT, OUT total_bono FLOAT UNSIGNED)
BEGIN
  SET total_bono = (
    SELECT salario_base * 0,08
    FROM persona
    WHERE id = identificador)
END
$$ 

--  Función __integral__: El salario integral es la ___suma del salario básico - salud - pension + bono + sub de transporte___.

DELIMITER $$ 
DROP PROCEDURE IF EXISTS integral$$
CREATE PROCEDURE integral(IN identificador TEXT, OUT salario_integral FLOAT UNSIGNED)
BEGIN
  SET salario_integral = (
    SELECT salario_base - total_salud - total_pension + total_bono + transporte
    FROM persona
    WHERE id = identificador)
END
$$ 
