-- Dadas las siguientes tablas : cientifico:

--     id: texto
--     nombre: texto
--     apellido1: texto
--     apellido2: texto

-- cientifico_proyecto

--     ref_cientifico: texto
--     ref_proyecto: texto

-- proyecto:

--     id: texto
--     nombre: texto
--     horas: entero

-- Se pide:

-- Crea la estrucuta de tablas en función de las propiedades y sus nombres para determinar las claves primarias, claves foraneas.

CREATE TABLE "fabricante" (
"id" TEXT NOT NULL,
"nombre" TEXT NOT NULL,
"apellido1" TEXT NOT NULL,
"apellido2" TEXT DEFAULT NULL,
PRIMARY KEY("id")
);

CREATE TABLE "proyecto" (
"id" TEXT NOT NULL,
"nombre" TEXT NOT NULL,
"horas" INTEGER NOT NULL,
PRIMARY KEY("id")
);

CREATE TABLE "científico_proyecto" (
ref_cientifico TEXT,
ref_proyecto TEXT,
FOREIGN KEY("ref_cientifico") REFERENCES "cientifico"("id"),
FOREIGN KEY("ref_proyecto") REFERENCES "proyecto"("id"),,
);

-- Genera en pseudocódigo el procedimiento para cada una de las consultas que se plantean, definiciendo las distintas tablas, y en pseudocódigo el procedimiento, especificando:

-- Nombre del procedimiento/s por consulta.
-- Valores de entrada.
-- Valores de salida.
-- Llamadas entre distintos procedimientos

-- Realiza las siguientes consultas:

-- 1. Sacar una relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del científico, identificador del proyecto y nombre del proyecto.
DELIMITER //
CREATE PROCEDURE relación_cientifico_proyecto
BEGIN
  SELECT c.*, p.id, p.nombre
  FROM proyecto AS p JOIN cientifico AS c JOIN cientifico_proyecto AS cp 
  ON c.id = cp.ref_cientifico AND cp.ref_proyecto = p.id;
END 
//

DELIMITER //
CREATE PROCEDURE scientists_with_their_project
BEGIN
    Select c. *, p. * 
    from proyecto as p JOIN científico as c JOIN cientifico_proyecto as cp on cp.ref_científico = c.DNI and cp.ref_proyecto = p.id;
END 
//

-- 2. Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre).
DELIMITER $$
CREATE PROCEDURE cantidad_proyectos(IN referencia_cientifico INT UNSIGNED, OUT cantidad INT UNSIGNED)
BEGIN
  SELECT COUNT(ref_proyecto)
  INTO cantidad
  FROM cientifico_proyecto
  WHERE cientifico_proyecto.ref_cientifico = referencia_cientifico
END 
$$

DELIMITER $$
CREATE PROCEDURE asigned_projects(IN scientistdni VARCHAR(12), OUT num_projects INT unsigned)
BEGIN
    SELECT count(p.id) 
    INTO num_projects, c.dni, c.nombre 
    from científico as c JOIN científico_proyecto as cp JOIN proyecto as p on c.dni = cp.ref_científico and p.id = cp.ref_proyecto 
    where c.dni = scientistdni
END 
$$

DELIMITER ;
Call asigned_projects('12345678A', @num_projects)
SELECT @num_projects;

-- 3. Obtener el numero de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto).
DELIMITER $$
CREATE PROCEDURE scientist_into_project (IN IDPROJECT VARCHAR(12), OUT num_scientist INT UNSIGNED)
BEGIN
    SELECT count(c.dni) 
    INTO num_scientist, p.id, p.nombre 
    from científico as c JOIN científico_proyecto as cp JOIN proyecto as p on c.dni = cp.ref_científico and p.id = cp.ref_proyecto 
    where p.id = IDPROJECT;
END 
$$

DELIMITER ;
Call asigned_projects('1', @num_scientist)
SELECT @num_scientist;

-- 4. Obtener el número de horas de dedicación de cada científico.
DELIMITER //
CREATE PROCEDURE horas_por_cientifico(IN ref_cientifico VARCHAR, OUT cantidad INT)
BEGIN
SELECT SUM(p.horas)
INTO suma_horas
FROM cientifico AS c
LEFT JOIN cientifico_proyecto AS cp ON c.id = cp.ref_cientifico INNER JOIN proyecto AS p ON cp.ref_proyecto = p.id
GROUP BY c.id
END
//

DELIMITER $$
CREATE PROCEDURE scientist_into_project (IN scientistdni VARCHAR(12), OUT total_hours INT UNSIGNED)
BEGIN
    SELECT c.nombre, sum(p.horas) INTO total_hours FROM cientifico as c JOIN proyecto as p JOIN cientifico_proyecto as cp on c.id=cp.ref_científico and p.id=cp.ref_proyecto where c.dni = scientistdni GROUP BY c.dni
END 
$$

DELIMITER ;
Call asigned_projects('12345678A', @scientistdni)
SELECT @scientistdni

-- 5. Obtener el DNI y nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada proyecto sea superior a un número de horas superior a 10, por ejemplo 11 horas.

DELIMITER //
CREATE PROCEDURE cientificos_con_mas_horas
BEGIN
    SELECT c.id, c.nombre 
    FROM cientifico AS c JOIN proyecto AS p JOIN cientifico_proyecto AS cp 
    ON c.id = cp.ref_cientifico AND cp.ref_proyecto = p.id
    WHERE p.horas > (SELECT avg(horas) FROM proyecto GROUP BY id HAVING avg(horas) > 10);
END 
//

DELIMITER $$
CREATE PROCEDURE hardest_working_scientists(IN valor INT)
BEGIN
    SELECT c.id, c.nombre from cientifico as c join proyecto as p join cientifico_proyecto as cp on cp.ref_cientifico=c.id and p.id=cp.ref_proyecto where p.horas > (SELECT avg(horas) from proyecto group by id having avg(horas) > valor);
END 
$$