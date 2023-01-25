-- Tarea 4 Bases de datos relacionales

-- Se pide: 

-- Crear la base de datos: BD_EMPLEADO.

-- Realiza la inserción de, al menos, 10 empleados.

-- Obtener los apellidos de los empleados.

SELECT apellido FROM Empleado

-- Obtener los apellidos de los empleados sin repeticiones.

SELECT DISTINCT apellido FROM Empleado

-- Obtener todos los datos de los empleados que se apellidan López.

SELECT * FROM Empleado WHERE apellido = 'López'

-- Obtener todos los datos de los empleados que se apellidan López y los que se apellidan Pérez.

SELECT * FROM Empleado WHERE apellido = 'López' or apellido = 'Pérez'

-- Obtener todos los datos de los empleados que trabajan para el departamento 10.

SELECT * FROM Empleado WHERE id = '10'

-- Obtener todos los datos de los empleados que trabajan para el departamento 8 y para el departamento 5.

SELECT * FROM Empleado WHERE id = '8' or id = '5'

-- Obtener todos los datos de los empleados cuyo apellido comience por P.

SELECT * FROM Empleado WHERE apellido like 'P%'

-- Obtener el presupuesto total de todos los departamentos.

SELECT presupuesto FROM Departamento

-- Obtener el número de empleados en cada departamento.

SELECT id, count(*) FROM Empleado GROUP BY id

-- Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.



-- Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento.



-- Obtener los nombres y apellido de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €.



-- Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.



-- Obtener los nombres (únicamente los nombres) de los departamentos que tiene más de dos empleados.



-- Añadir un nuevo departamento: “Calidad”, con presupuesto de 40.000 € y código 11.



-- Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI:00000000.



-- Calcular un recorte presupuestario del 10 % a todos los departamentos.



-- Despedir a todos los empleados que trabajan para el departamento de informática (código 2).



-- Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €.



-- Despedir a todos los empleados.



INSERT INTO Empleado VALUES ('11','Juan','López');
INSERT INTO Empleado VALUES ('12','Jose','López');
INSERT INTO Empleado VALUES ('13','Miguel','Martin');
INSERT INTO Empleado VALUES ('14','Luis','López');
INSERT INTO Empleado VALUES ('15','Sara','Padrón');
INSERT INTO Empleado VALUES ('16','Marta','Martínez');
INSERT INTO Empleado VALUES ('17','Juan','García');
INSERT INTO Empleado VALUES ('18','Juan','Pérez');
INSERT INTO Empleado VALUES ('19','Jose','Pérez');
INSERT INTO Empleado VALUES ('10','Luis','Pérez');
INSERT INTO Empleado VALUES ('00000000','Esther','Vazquez');