-- Un instituto de enseñanza guarda los siguientes datos de sus alumnos:

--     número de inscripción, comienza desde 1 cada año,
--     año de inscripción,
--     nombre del alumno,
--     documento del alumno,
--     domicilio,
--     ciudad,
--     provincia,
--     clave primaria: número de inscripto y año de inscripción.

CREATE TABLE alumno(
    numero_inscripcion: 
    año_inscripcion

);

-- Se pide:

    --     Elimine la tabla "alumno" si existe.
DELIMITER $$ 
DROP TABLE IF EXISTS alumno$$
    --     Nota:Muestra el comando y la salida.

    -- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).

    --     Nota:Muestra el comando y la salida.

    -- Define los siguientes indices:
    --     Un índice único por el campo "documento" y un índice común por ciudad y provincia.

    --         Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario.

    --     Vea los índices de la tabla.

    --         Nota:Muestra el comando y la salida "show index".

    -- Genera un procedimiento que realice la inserción de 5 registros, al menos 2 veces, de forma aleatoria.

    --     Nota:Muestra el comando y la salida.

    -- Intente ingresar un alumno con clave primaria repetida.

    --     Nota:Muestra el comando y la salida.

    -- Intente ingresar un alumno con documento repetido.

    --     Nota:Muestra el comando y la salida.

    -- Ingrese varios alumnos de la misma ciudad y provincia.

    --     Nota:Muestra el comando y la salida.

    -- Elimina los indices creados, y muestra que ya no se encuentran.

    --     Nota:Muestra el comando y la salida.

