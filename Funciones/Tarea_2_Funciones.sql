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

DELIMITER $$
drop procedure if exist insertar_persona$$
create procedure insertar_persona(IN nombre VARCHAR(55), IN inserts int)
BEGIN
    declare total int;
    declare contador int;
    set total = (select count(*) from persona);
    set contador = 0;
    while contador < inserts do
        set total=total+1;
        INSERT INTO persona(identificador, nombre, salario_base) VALUES(LPAD(CONCAT(total, 'A'), 12, 0), CONCAT(nombre, total), total + 1000.50);
        set contador = contador+1;
    end while;
END
$$

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

-- integral

DELIMITER //
CREATE FUNCTION integral(id_persona VARCHAR(55)) RETURNS FLOAT;
DETERMINISTIC
BEGIN
    declare salario float;
    declare subsidio float;
    declare salud float;
    declare pension float;
    declare bono float;
    declare integral float;
    set salario = (select salario_base from persona where identificador = id_persona);
    set subsidio = subsidio(id_persona);
    set salud = salud(id_persona);
    set pension = pension(id_persona);
    set bono = bono(id_persona);
    set integral = salario - pension - salud + bono + subsidio;
    UPDATE persona set integral = integral;
    return integral;
END

--- Todo en una función:
DELIMITER //
CREATE FUNCTION integral(id_persona VARCHAR(55)) RETURNS FLOAT;
DETERMINISTIC
BEGIN
    declare salario float;
    declare subsidio float;
    declare salud float;
    declare pension float;
    declare bono float;
    declare integral float;
    set salario = (select salario_base from persona where identificador = id_persona);
    set subsidio = salario * 0.07;
    set salud = salario * 0.04;
    set pension = salario * 0.04;
    set bono = salario * 0.08;
    set integral = salario - pension - salud + bono + subsidio;
    UPDATE persona set integral = integral;
    return integral;
END
//