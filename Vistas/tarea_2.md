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
```sql
    DROP TABLE IF EXISTS alumno;
    Query OK, 0 rows affected (0,00 sec)

```
- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
inscripción).
```sql
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

```
- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
        ```sql
        ALTER TABLE alumno ADD UNIQUE domicilio (domicilio);
        Query OK, 0 rows affected (0,01 sec)
        Records: 0  Duplicates: 0  Warnings: 0
        ```
    - Vea los índices de la tabla.
        ```sql
        SHOW INDEX FROM alumno;
        +--------+------------+-----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name  | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+-----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY   |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY   |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | domicilio |            1 | domicilio          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+-----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0,00 sec)

        ```
        
- Genera un procedimiento que realice la inserción de 5 registros, al menos 2 veces, de forma aleatoria.
    ```sql

    ```
- Intente ingresar un alumno con clave primaria repetida.
    ```sql

    ```
- Intente ingresar un alumno con documento repetido.
    ```sql
    
    ```
- Ingrese varios alumnos de la misma ciudad y provincia.
    ```sql
    
    ```
- Elimina los indices creados, y muestra que ya no se encuentran.
    ```sql
    
    ```

</div>