<div align="justify">

# Tarea 1 índices

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:
 - número de inscripción, comienza desde 1 cada año,
 - año de inscripción,
 - nombre del alumno,
 - documento del alumno,
 - domicilio,
 - ciudad,
 - provincia,
 - clave primaria: número de inscripto y año de inscripción.

Se pide: 
- Elimine la tabla "alumno" si existe. 
'''sql
    DROP TABLE IF EXISTS alumno;
'''
- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
inscripción).
'''sql
    CREATE TABLE alumno(
        numero_inscripcion integer,
        año_inscripcion integer,
        nombre varchar(90),
        domicilio varchar(90),
        ciudad varchar(90),
        provincia varchar(90),
        PRIMARY KEY (numero_inscripcion, año_inscripcion)
    );
    Query OK, 0 rows affected (0,01 sec)

'''
- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
        '''sql

        '''
    - Vea los índices de la tabla.
        '''sql

        '''
        show index
- Genera un procedimiento que realice la inserción de 5 registros, al menos 2 veces, de forma aleatoria.
    '''sql

    '''
- Intente ingresar un alumno con clave primaria repetida.
    '''sql

    '''
- Intente ingresar un alumno con documento repetido.
    '''sql
    
    '''
- Ingrese varios alumnos de la misma ciudad y provincia.
    '''sql
    
    '''
- Elimina los indices creados, y muestra que ya no se encuentran.
    '''sql
    
    '''

</div>