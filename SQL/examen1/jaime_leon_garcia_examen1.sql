-- ----------------------------------------
-- Consultas sobre una tabla (0,5 punto)
-- ----------------------------------------

-- 1.- Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados
-- por la fecha de realización, mostrando en primer lugar las compras más recientes.
select * from compra order by fecha desc;
/*
┌────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
│ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
│ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
└────┴─────────┴────────────┴───────────────┴──────────────────┘
*/
-- 2. Devuelve todos los datos de los dos compras de mayor valor.
select * from compra order by total desc limit 2;
/*
┌────┬────────┬────────────┬───────────────┬──────────────────┐
│ id │ total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼────────────┼───────────────┼──────────────────┤
│ 7  │ 5760.0 │ 2018-09-10 │ 2             │ 1                │
│ 12 │ 3045.6 │ 2020-04-25 │ 2             │ 1                │
└────┴────────┴────────────┴───────────────┴──────────────────┘
*/
-- 3. Devuelve un listado con los identificadores de los consumidores que han realizado algún compra.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select distinct id_consumidor from compra;
/*
┌───────────────┐
│ id_consumidor │
├───────────────┤
│ 5             │
│ 1             │
│ 2             │
│ 8             │
│ 7             │
│ 4             │
│ 3             │
│ 6             │
└───────────────┘
*/
-- 4. Devuelve un listado de todos las compras que se realizaron durante el año 2020,
-- cuya cantidad total sea superior a 500€.
select * from compra where fecha like '2020%' and total > 500;
/*
┌────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
└────┴─────────┴────────────┴───────────────┴──────────────────┘
*/
-- 5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.
select nombre, apellido1 from suministrador where categoria between 0.11 and 0.15;
/*
┌─────────┬───────────┐
│ nombre  │ apellido1 │
├─────────┼───────────┤
│ Daniel  │ Sáez      │
│ Juan    │ Gómez     │
│ Diego   │ Flores    │
│ Marta   │ Herrera   │
│ Antonio │ Carretero │
│ Manuel  │ Domínguez │
│ Antonio │ Vega      │
└─────────┴───────────┘
*/
-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.
select max(categoria) as comision from suministrador;
/*
┌──────────┐
│ comision │
├──────────┤
│ 0.15     │
└──────────┘
*/
-- 7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL.
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select id, nombre, apellido1 from consumidor where apellido2 is not null;
/*
┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │
│ 2  │ Adela     │ Salas     │
│ 3  │ Adolfo    │ Rubio     │
│ 5  │ Marcos    │ Loyola    │
│ 6  │ María     │ Santana   │
│ 8  │ Pepe      │ Ruiz      │
│ 9  │ Guillermo │ López     │
│ 10 │ Daniel    │ Santana   │
└────┴───────────┴───────────┘
*/
-- 8. Devuelve un listado de los nombres de los consumidores que empiezan por A o P. (Con expresioón regular)
-- El listado deberá estar ordenado alfabéticamente.
select nombre from consumidor where nombre regexp ("^A|P") order by nombre;
/*
┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adela  │
│ Adolfo │
│ Adrián │
│ Pepe   │
│ Pilar  │
└────────┘
*/
-- 9. Devuelve un listado de los nombres de los consumidores que no empiezan por M.
-- El listado deberá estar ordenado alfabéticamente.
select nombre from consumidor where nombre not like "M%" order by nombre;
/*
┌───────────┐
│  nombre   │
├───────────┤
│ Aarón     │
│ Adela     │
│ Adolfo    │
│ Adrián    │
│ Daniel    │
│ Guillermo │
│ Pepe      │
│ Pilar     │
└───────────┘
*/
-- 10. Devuelve un listado con los nombres de los suministradores que terminan en o.
-- Tenga en cuenta que se deberán eliminar los nombres repetidos.
select distinct nombre from suministrador where nombre like "%o" order by nombre;
/*
┌─────────┐
│ nombre  │
├─────────┤
│ Alfredo │
│ Antonio │
│ Diego   │
└─────────┘
*/
-- OBLIGATORIO APROBAR ESTA PARTE (INNER´S)

-- -----------------------------------------------
-- Consultas multitabla (INNER JOIN) (0,7 puntos)
-- -----------------------------------------------

-- 11. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select distinct c.id, c.nombre, c.apellido1, c.apellido2 from consumidor as c join compra as co on c.id = co.id_consumidor where id_consumidor is not null; 
/*
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
│ 4  │ Adrián │ Suárez    │           │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 6  │ María  │ Santana   │ Moreno    │
└────┴────────┴───────────┴───────────┘
*/
-- 12. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
select distinct c.id, c.nombre, c.apellido1, c.apellido2 from consumidor as c join compra as co on c.id = co.id_consumidor where id_consumidor is not null order by nombre, apellido1, apellido2;
/*
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 4  │ Adrián │ Suárez    │           │
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 6  │ María  │ Santana   │ Moreno    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
└────┴────────┴───────────┴───────────┘
*/
-- 13. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
select co.*, s.id, s.nombre, s.apellido1, s.apellido2, s.categoria from suministrador as s join compra as co on s.id = co.id_suministrador where co.id_suministrador is not null order by s.nombre;
/*
┌────┬─────────┬────────────┬───────────────┬──────────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼────────────┼───────────────┼──────────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
└────┴─────────┴────────────┴───────────────┴──────────────────┴────┴─────────┴───────────┴───────────┴───────────┘
*/
-- 14. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.

-- 15. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
select c.* from consumidor as c join compra as co on c.id = co.id_consumidor where co.fecha like '2020%' and co.total between 300 and 1000;
/*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
*/
-- 16. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
select distinct s.nombre, s.apellido1 from suministrador as s join compra as co join consumidor as c on s.id = co.id_suministrador and co.id_consumidor = c.id where c.nombre = 'María' and c.apellido1 = 'Santana' and c.apellido2 = 'Moreno'; 
/*
┌────────┬───────────┐
│ nombre │ apellido1 │
├────────┼───────────┤
│ Daniel │ Sáez      │
└────────┴───────────┘
*/
-- 17. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
select distinct c.nombre, c.apellido1 from suministrador as s join compra as co join consumidor as c on s.id = co.id_suministrador and co.id_consumidor = c.id where s.nombre = 'Daniel' and s.apellido1 = 'Sáez' and s.apellido2 = 'Vega'; 
/*
┌────────┬───────────┐
│ nombre │ apellido1 │
├────────┼───────────┤
│ Adela  │ Salas     │
│ Pilar  │ Ruiz      │
│ María  │ Santana   │
└────────┴───────────┘
*/

-- ----------------------------------------------------------
-- Consultas multitabla (LEFT JOIN y RIGHT JOIN) (0,3 puntos)
-- ----------------------------------------------------------

-- 18. Devuelve un listado con todos los consumidores junto con los datos de las compras que han realizado.
-- Este listado también debe incluir los consumidores que no han realizado ningún compra.
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los consumidores.
select c.*, co.* from consumidor as c left join compra as co on c.id = co.id_consumidor order by apellido1, apellido2, nombre;
/*
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │    │         │            │               │                  │
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
│ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │    │         │            │               │                  │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ 4  │ Adrián    │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┘
*/
-- 19. Devuelve un listado con todos los suministradores junto con los datos de las compras que han realizado.
-- Este listado también debe incluir los suministradores que no han realizado ningún compra.
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los suministradores.
select s.*, co.* from suministrador as s left join compra as co on s.id = co.id_suministrador order by apellido1, apellido2, nombre;
/*
┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │    │         │            │               │                  │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │    │         │            │               │                  │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
└────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┘
*/
-- 20. Devuelve un listado que solamente muestre los consumidores que no han realizado ningún compra.
select c.*, co.* from consumidor as c left join compra as co on c.id = co.id_consumidor where co.id_consumidor is null order by apellido1, apellido2, nombre;
/*
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┬────┬───────┬───────┬───────────────┬──────────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │ total │ fecha │ id_consumidor │ id_suministrador │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┼────┼───────┼───────┼───────────────┼──────────────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │    │       │       │               │                  │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │    │       │       │               │                  │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┴────┴───────┴───────┴───────────────┴──────────────────┘
*/

-- ---------------------------
-- Consultas resumen (1 punto)
-- ---------------------------

-- 21. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.
select avg(total) as media from compra;
/*
┌─────────────┐
│    media    │
├─────────────┤
│ 1312.051875 │
└─────────────┘
*/
-- 22. Calcula el número total de suministradores distintos que aparecen en la tabla compra.
select count(distinct id_suministrador) from compra;
/*
┌──────────────────────────────────┐
│ count(distinct id_suministrador) │
├──────────────────────────────────┤
│ 6                                │
└──────────────────────────────────┘
*/
-- 23. Calcula el número total de consumidores que aparecen en la tabla consumidor.
select count(id) from consumidor;
/*
┌───────────┐
│ count(id) │
├───────────┤
│ 10        │
└───────────┘
*/
-- 24. Calcula cuál es la mayor cantidad que aparece en la tabla compra.
select max(total) from compra;
/*
┌────────────┐
│ max(total) │
├────────────┤
│ 5760.0     │
└────────────┘
*/
-- 25. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.
select max(categoria) from consumidor group by ciudad; 
/*
┌────────────────┐
│ max(categoria) │
├────────────────┤
│ 200            │
│ 100            │
│ 225            │
│ 200            │
│ 300            │
│ 300            │
└────────────────┘
*/
-- 26. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores.
-- Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra.
-- Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.

-- 27. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores,
-- teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.

-- 28. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17.
-- Muestra el identificador del suministrador, nombre, apellidos y total.
select s.id, s.nombre, s.apellido1, s.apellido2, max(co.total) from suministrador as s, compra as co where co.id_suministrador = s.id and fecha = '2020-08-17' group by s.id;

-- 29. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores.
-- Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra.
-- Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.
select c.id, c.nombre, c.apellido1, c.apellido2, count(co.id) from consumidor as c left join compra as co on c.id = co.id_consumidor group by c.id;
/*
┌────┬───────────┬───────────┬───────────┬──────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ count(co.id) │
├────┼───────────┼───────────┼───────────┼──────────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │ 3            │
│ 2  │ Adela     │ Salas     │ Díaz      │ 3            │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ 1            │
│ 4  │ Adrián    │ Suárez    │           │ 1            │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ 2            │
│ 6  │ María     │ Santana   │ Moreno    │ 2            │
│ 7  │ Pilar     │ Ruiz      │           │ 1            │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ 3            │
│ 9  │ Guillermo │ López     │ Gómez     │ 0            │
│ 10 │ Daniel    │ Santana   │ Loyola    │ 0            │
└────┴───────────┴───────────┴───────────┴──────────────┘
*/
-- 30. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.
select c.id, c.nombre, c.apellido1, c.apellido2, count(co.id) from consumidor as c left join compra as co on c.id = co.id_consumidor group by c.id having co.fecha like '2020%';
/*
┌────┬────────┬───────────┬───────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ count(co.id) │
├────┼────────┼───────────┼───────────┼──────────────┤
│ 4  │ Adrián │ Suárez    │           │ 1            │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2            │
│ 6  │ María  │ Santana   │ Moreno    │ 2            │
└────┴────────┴───────────┴───────────┴──────────────┘
*/
-- 31. Devuelve cuál ha sido el compra de máximo valor que se ha realizado cada año.

-- OBLIGATORIO APROBAR ESTA PARTE (SUBCONSULTAS)

-- ---------------------
-- Subconsultas(1 punto)
-- ---------------------

--- Con operadores básicos de comparación

-- 32. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select distinct co.* from compra as co, consumidor as c where co.id_consumidor = (select id from consumidor where nombre = 'Adela' and apellido1 = 'Salas' and apellido2 = 'Díaz');
/*
┌────┬────────┬────────────┬───────────────┬──────────────────┐
│ id │ total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼────────────┼───────────────┼──────────────────┤
│ 3  │ 65.26  │ 2020-10-05 │ 2             │ 1                │
│ 12 │ 3045.6 │ 2020-04-25 │ 2             │ 1                │
│ 7  │ 5760.0 │ 2018-09-10 │ 2             │ 1                │
└────┴────────┴────────────┴───────────────┴──────────────────┘
*/
-- 33. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.
select distinct co.fecha, min(co.total) from compra as co, consumidor as c where co.id_consumidor = (select id from consumidor where nombre = 'Pepe' and apellido1 = 'Ruiz' and apellido2 = 'Santana');
/*
┌────────────┬───────────────┐
│   fecha    │ min(co.total) │
├────────────┼───────────────┤
│ 2019-08-17 │ 110.5         │
└────────────┴───────────────┘
*/
-- 34. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)
select count(co.id) from compra as co, suministrador as s where s.id = co.id_suministrador and s.nombre = 'Daniel' and s.apellido1 = 'Sáez';
/*
┌──────────────┐
│ count(co.id) │
├──────────────┤
│ 6            │
└──────────────┘
*/
-- 35. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)
select c.* from consumidor as c, compra as co where co.id_consumidor = c.id and co.total = (select max(total) from compra where fecha like '2021%');

-- 36. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.
select c.id, c.apellido1, c.apellido2, c.ciudad, c.categoria, co.* from consumidor as c, compra as co where c.id = co.id_consumidor and co.fecha like '2020%' and co.total >= (select avg(total) from compra group by fecha having fecha like '2020%');
/*
┌────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 5  │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 5  │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 4  │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 2  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 6  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
└────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┘
*/
-- 37. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).
select distinct c.* from consumidor as c, compra as co where c.id not in (select id_consumidor from compra);
/*
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
*/
-- 38. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).
select distinct s.* from suministrador as s, compra as co where s.id not in (select id_suministrador from compra);
/*
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
*/
-- 39. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).

-- 40. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
