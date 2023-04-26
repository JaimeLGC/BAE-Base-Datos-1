-- 1- Eliminamos la tabla, si existe y la creamos.
DELIMITER $$
DROP TABLE IF EXISTS empleado$$
CREATE TABLE 'empleado' (
    'documento' CHAR(8) NOT NULL,
    'nombre' VARCHAR(20) DEFAULT NULL, 
    'apellido' VARCHAR(20) DEFAULT NULL,
    'sueldo' DECIMAL(6,2) DEFAULT NULL,
    'cantidad_hijos' INT DEFAULT NULL,
    'seccion' VARCHAR(20) DEFAULT NULL
);

-- 2- Ingrese algunos registros.
INSERT INTO 'empleado' VALUES('22222222', 'Juan', 'Perez', 300, 2)
INSERT INTO 'empleado' VALUES('22333333', 'Luis', 'Lopez', 300, 1)
INSERT INTO 'empleado' VALUES('22444444', 'Marta', 'Perez', 500, 1)
INSERT INTO 'empleado' VALUES('22555555', 'Susana', 'Garcia', 400, 2)
INSERT INTO 'empleado' VALUES('22666666', 'Jose Maria', 'Morales', 400, 3)

-- 3- Elimine el procedimiento llamado pa_empleados_sueldo si existe.
DELIMITER $$
DROP PROCEDURE IF EXISTS pa_empleados_sueldo
$$

-- 4- Cree un procedimiento almacenado llamado pa_empleados_sueldo que seleccione los nombres.
-- 5- Ejecute el procedimiento creado anteriormente.
DELIMITER $$
CREATE PROCEDURE pa_empleados_sueldo(OUT nombre_empleado VARCHAR)
BEGIN
    SELECT nombre 
    INTO nombre_empleado
    FROM empleado
END
$$

DELIMITER $$
DROP PROCEDURE IF EXIST pa_empleados_sueldo$$
CREATE PROCEDURE pa_empleados_sueldo
BEGIN
    SELECT nombre from empleado;
END
$$

CALL pa_empleados_sueldo()

--6- Elimine el procedimiento llamado pa_empleados_hijos si existe.
DELIMITER $$
DROP PROCEDURE IF EXISTS pa_empleados_hijos
$$

-- 7- Cree un procedimiento almacenado llamado pa_empleados_hijos que seleccione los nombres apellidos y cantidad de hijos de los empleados con hijos.
-- 8- Ejecute el procedimiento creado anteriormente.
DELIMITER $$
CREATE PROCEDURE pa_empleados_hijos(OUT hijos_empleado INT)
BEGIN
    SELECT cantidad_hijos
    INTO hijos_empleado
    FROM empleado
END
$$

DELIMITER $$
DROP PROCEDURE IF EXIST pa_empleados_hijos$$
CREATE PROCEDURE pa_empleados_hijos
BEGIN
    SELECT nombre, apellido, cantidadhijos from empleado
    where cantidadhijos > 0;
END
$$

-- 9- Actualice la cantidad de hijos de algún empleado sin hijos y vuelva a ejecutar el procedimiento para verificar que ahora si aparece en la lista.
UPDATE 'empleado' SET cantidad_hijos = 0 WHERE documento = '22222222' 