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

-- 3. Obtener el numero de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto).


-- 4. Obtener el número de horas de dedicación de cada científico.


-- 5. Obtener el DNI y nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada proyecto sea superior a un número de horas superior a 10, por ejemplo 11 horas.

DELIMITER //
CREATE PROCEDURE hardest_working_scientists
BEGIN
    SELECT c.id, c.nombre 
    FROM cientifico AS c JOIN proyecto AS p JOIN cientifico_proyecto AS cp 
    ON c.id = cp.ref_cientifico AND cp.ref_proyecto = p.id
    WHERE p.horas > (SELECT avg(horas) FROM proyecto GROUP BY id HAVING avg(horas) > 10);
END 
//