-- ¿Sabías que la mayoría de los adultos sanos pueden ser donantes? Aunque existen ciertas condiciones que debes cumplir para realizar con éxito una donación. Descubre los requisitos básicos para donar sangre.

-- Para la poder donar sangre se deben cumplir varias condicones:

--     Tener un peso superior a 50Kg.
--     Ser apto para donar sangre.
--     No haber donado en un periodo anterior a 90 días en caso de ser hombre y 120 días en caso de mujer.

-- Teniendo en cuenta esta información se pide:

--     Crea una base datos llamada donacion.
create database donación;

--     Crea una tabla llamada persona con los siguientes campos:
--         Peso. (Entero)
--         Admitido. Texto(Si/No).
--         Sexo. Texto (H/M).
--         Fecha Última Donación. DateTime.

create table persona( 
dni CHAR(2) NOT NULL,  
nombre VARCHAR(20) NOT NULL,  
peso INTEGER NOT NULL,  
admitido BOOLEAN DEFAULT 0, 
sexo CHAR(1) NOT NULL, 
fecha_ultima_donacion DATETIME DEFAULT NULL, 
PRIMARY KEY(dni)
);

--     Realiza al menos 10 insert en la tabla, con datos aleatorios, generados por el usuario.
insert into persona values(01, 'Juan', '87', 1, 'M', '2018-04-05');
insert into persona values(02, 'Ana', '83', 1, 'F', '2021-06-05');
insert into persona values(03, 'Juana', '73', 1, 'F', '2015-08-08');
insert into persona values(04, 'Pedro', '79', 1, 'M', '2019-08-23');
insert into persona values(05, 'Miguel', '99', 1, 'M', '2020-12-13');
insert into persona values(06, 'Jose', '68', 1, 'M', '2006-11-13');
insert into persona values(07, 'Carmen', '72', 1, 'F', '2010-01-03');
insert into persona values(08, 'Carlos', '82', 1, 'M', '2011-11-03');
insert into persona values(09, 'Luis', '90', 1, 'M', '2001-11-03');
insert into persona values(10, 'Domingo', '49', 0, 'M', NULL);

--     Realice un procedimiento para determinar si la persona puede donar sangre de acuerdo a las siguientes condiciones:
--         Si el peso es menor a 50 kg guarde en estado adminito "NO", en caso contrario seria "SI".

DELIMITER $$ 
CREATE PROCEDURE no_admitido_por_defecto
BEGIN
    UPDATE persona SET admitido = 0 WHERE id = NOT NULL;
END
$$

DELIMITER $$ 
DROP PROCEDURE IF EXISTS comprobar_peso$$
CREATE PROCEDURE comprobar_peso
BEGIN
        UPDATE persona SET admitido=1 WHERE peso > 50
END
$$


-- prueba