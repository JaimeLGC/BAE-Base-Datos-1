-- Realiza la insercición de los datos.

    INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
    INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
    INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
    INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
    INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
    INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
    INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
    INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
    INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
    INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);
    INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
    INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
    INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
    INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
    INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
    INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
    INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
    INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);
    INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
    INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
    INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
    INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
    INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
    INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
    INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
    INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
    INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
    INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
    INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
    INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
    INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
    INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
    INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
    INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);


-- Realiza las siguientes consultas.

-- Consultas sobre una tabla

    -- Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
    SELECT * from pedido ORDER BY fecha DESC;

    -- Devuelve todos los datos de los dos pedidos de mayor valor.
    SELECT * FROM pedido ORDER by total desc LIMIT 2;

    -- Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
    SELECT DISTINCT id_cliente from pedido;
        
    -- Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
    -- Con expresion regular
    SELECT * from pedido where fecha regexp "^2017" and total > 500;

    -- Con like
    SELECT * from pedido where fecha like "2017*" and total > 500;

    -- Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
    SELECT nombre, apellido1, apellido2 from comercial where categoria BETWEEN 0.05 and 0.11;

    -- Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
    SELECT max(categoria) from comercial;

    -- Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
    SELECT id, nombre, apellido1 from cliente where apellido2 is not null ORDER BY nombre;

    -- Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
    -- Combinando like y expresion regular
    SELECT nombre from cliente where nombre LIKE "A%n" or nombre REGEXP "^P" ORDER by nombre;

    -- Sólo con expresiones regulares
    SELECT nombre from cliente where nombre REGEXP "^A.*n$" or nombre REGEXP "^P" ORDER by nombre;

    -- Sólo en una expresión regular
    SELECT nombre from cliente where nombre REGEXP "(^A.*n$)|(^P.*)" ORDER by nombre;

    -- Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
    SELECT nombre from cliente where nombre not like "A%" ORDER BY nombre;

    -- Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
    SELECT DISTINCT nombre from comercial where nombre REGEXP "o$";

-- Consultas multitabla

-- Nota: Resuelva todas las consultas utilizando las cláusulas INNER JOIN.

    -- Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
    SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2 from cliente as c JOIN pedido as p on p.id_cliente=c.id ORDER by c.nombre;

    -- Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
    SELECT c.*, p.id, p.total, p.fecha, p.id_comercial from cliente as c JOIN pedido as p on p.id_cliente=c.id ORDER by c.nombre;

    -- Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
    SELECT co.*, p.id, p.fecha, p.total, p.id_cliente from comercial as co JOIN pedido as p on co.id=p.id_comercial ORDER BY co.nombre;

    -- Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
    SELECT c.*, co.*, p.id, p.fecha, p.total from cliente as c JOIN pedido as p JOIN comercial as co on p.id_cliente=c.id and p.id_comercial=co.id;

    -- Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
    SELECT c.* from cliente as c JOIN pedido as p on p.id_cliente=c.id where p.total BETWEEN 300 and 1000;

    -- Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
    SELECT co.nombre, co.apellido1, co.apellido2 from comercial as co JOIN pedido as p JOIN cliente as c on p.id_cliente=c.id and co.id=p.id_comercial where c.nombre="María";

    -- Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
    SELECT c.nombre from cliente as c JOIN pedido as p JOIN comercial as co on co.id=p.id_comercial and c.id=p.id_cliente WHERE co.nombre="Daniel" and co.apellido1="Sáez" and co.apellido2="Vega";

-- Consultas multitabla

-- Nota: Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

    -- Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
    SELECT c.*, p.id, p.total, p.fecha, p.id_comercial from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id ORDER by c.apellido1, c.apellido2, c.nombre;

    -- Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
    SELECT co.*, p.id, p.total, p.fecha, p.id_cliente from comercial as co LEFT JOIN pedido as p on co.id=p.id_comercial ORDER BY co.apellido1, co.apellido2, co.nombre;

    -- Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
    SELECT c.* from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id where p.id is null;

    -- Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
    SELECT co.* from comercial as co LEFT JOIN pedido as p on p.id_comercial=co.id where p.id is null;

    -- Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.


-- Consultas resumen

    -- Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
    SELECT sum(total) from pedido;

    -- Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
    SELECT avg(total) from pedido;

    -- Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
    SELECT count(*) from (SELECT DISTINCT id_comercial from pedido);

    -- Calcula el número total de clientes que aparecen en la tabla cliente.
    SELECT count(id) FROM cliente;

    -- Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
    SELECT max(total) from pedido;

    -- Calcula cuál es la menor cantidad que aparece en la tabla pedido.
    SELECT min(total) from pedido;

    -- Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
    SELECT max(categoria), ciudad from cliente GROUP BY ciudad;

    -- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
    SELECT c.nombre, c.apellido1, c.apellido2, p.fecha, max(p.total) FROM cliente as c JOIN pedido as p on p.id_cliente=c.id GROUP BY p.fecha;

    -- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
    SELECT c.nombre, c.apellido1, c.apellido2, p.fecha, max(p.total) FROM cliente as c JOIN pedido as p on p.id_cliente=c.id GROUP BY p.fecha HAVING max(p.total) > 2000;

    -- Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
    SELECT co.id, co.nombre, co.apellido1, co.apellido2, max(p.total) from comercial as co JOIN pedido as p on p.id_comercial=co.id WHERE p.fecha="2016-08-17" GROUP BY co.nombre;

    -- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
    SELECT c.id, c.nombre, c.apellido1, c.apellido2, count(p.id) from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id GROUP BY c.id;

    -- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
    SELECT c.id, c.nombre, c.apellido1, c.apellido2, count(p.id) from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id where p.fecha regexp "^2017" GROUP BY c.id;

    -- Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
    SELECT c.id, c.nombre, c.apellido1, c.apellido2, max(p.total) from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id GROUP BY c.id;

    -- Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
    SELECT fecha, max(total) from pedido GROUP by substr(fecha,1,4);

    -- Devuelve el número total de pedidos que se han realizado cada año.
    SELECT substr(fecha,1,4), count(*) from pedido GROUP by substr(fecha,1,4);

-- Subconsultas
-- Con operadores básicos de comparación

    -- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
    SELECT * from pedido where id_cliente=(SELECT id from cliente where nombre="Adela" and apellido1="Salas" and apellido2="Díaz");

    -- Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
    SELECT count(*) from pedido where id_comercial=(SELECT id from comercial where nombre="Daniel" and apellido1="Sáez" and apellido2="Vega");

    -- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
    SELECT * from cliente where id=(SELECT id_cliente from pedido where total=(SELECT max(total) FROM pedido where fecha regexp "^2019"));

    -- Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
    SELECT fecha, min(total) from pedido WHERE id_cliente=(SELECT id from cliente where nombre="Pepe" and apellido1="Ruiz" AND apellido2="Santana");

    -- Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
    SELECT c.*, p.* from cliente as c JOIN pedido as p on p.id_cliente=c.id where p.total >=(SELECT avg(total) from pedido where fecha regexp "^2017") and p.fecha regexp "^2017";

-- Subconsultas con IN y NOT IN

    -- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
    SELECT * from cliente where id not in (SELECT id_cliente from pedido);

    -- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
    SELECT * from comercial where id not in (SELECT id_comercial from pedido);

-- Subconsultas con EXISTS y NOT EXISTS

    -- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
    SELECT * from cliente where not EXISTS (SELECT id_cliente from pedido where cliente.id=pedido.id_cliente);

    -- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
    SELECT * from comercial where not EXISTS (SELECT id_comercial from pedido where comercial.id=pedido.id_comercial);