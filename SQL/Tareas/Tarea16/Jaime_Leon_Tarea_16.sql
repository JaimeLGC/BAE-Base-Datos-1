-- Tablas

CREATE TABLE oficina (
  codigo_oficina TEXT NOT NULL,
  ciudad TEXT NOT NULL,
  pais TEXT NOT NULL,
  region TEXT DEFAULT NULL,
  codigo_postal TEXT NOT NULL,
  telefono TEXT NOT NULL,
  linea_direccion1 TEXT NOT NULL,
  linea_direccion2 TEXT DEFAULT NULL,
  PRIMARY KEY (codigo_oficina)
);
CREATE TABLE empleado (
  codigo_empleado INTEGER NOT NULL,
  nombre TEXT NOT NULL,
  apellido1 TEXT NOT NULL,
  apellido2 TEXT DEFAULT NULL,
  extension TEXT NOT NULL,
  email TEXT NOT NULL,
  codigo_oficina TEXT NOT NULL,
  codigo_jefe INTEGER DEFAULT NULL,
  puesto TEXT DEFAULT NULL,
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)
);
CREATE TABLE gama_producto (
  gama TEXT NOT NULL,
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen TEXT,
  PRIMARY KEY (gama)
);
CREATE TABLE cliente (
  codigo_cliente INTEGER NOT NULL,
  nombre_cliente TEXT NOT NULL,
  nombre_contacto TEXT DEFAULT NULL,
  apellido_contacto TEXT DEFAULT NULL,
  telefono TEXT NOT NULL,
  fax TEXT NOT NULL,
  linea_direccion1 TEXT NOT NULL,
  linea_direccion2 TEXT DEFAULT NULL,
  ciudad TEXT NOT NULL,
  region TEXT DEFAULT NULL,
  pais TEXT DEFAULT NULL,
  codigo_postal TEXT DEFAULT NULL,
  codigo_empleado_rep_ventas INTEGER DEFAULT NULL,
  limite_credito REAL DEFAULT NULL,
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);
CREATE TABLE pedido (
  codigo_pedido INTEGER NOT NULL,
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado TEXT NOT NULL,
  comentarios TEXT,
  codigo_cliente INTEGER NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);
CREATE TABLE producto (
  codigo_producto TEXT NOT NULL,
  nombre TEXT NOT NULL,
  gama TEXT NOT NULL,
  dimensiones TEXT NULL,
  proveedor TEXT DEFAULT NULL,
  descripcion text NULL,
  cantidad_en_stock SMALLINT NOT NULL,
  precio_venta REAL NOT NULL,
  precio_proveedor REAL DEFAULT NULL,
  PRIMARY KEY (codigo_producto),
  FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);
CREATE TABLE detalle_pedido (
  codigo_pedido INTEGER NOT NULL,
  codigo_producto TEXT NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unidad REAL NOT NULL,
  numero_linea SMALLINT NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);
CREATE TABLE pago (
  codigo_cliente INTEGER NOT NULL,
  forma_pago TEXT NOT NULL,
  id_transaccion TEXT NOT NULL,
  fecha_pago date NOT NULL,
  total REAL NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);


-- Consultas sobre una tabla

--     Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select codigo_oficina, ciudad from oficina;
/*
┌────────────────┬──────────────────────┐
│ codigo_oficina │        ciudad        │
├────────────────┼──────────────────────┤
│ BCN-ES         │ Barcelona            │
│ BOS-USA        │ Boston               │
│ LON-UK         │ Londres              │
│ MAD-ES         │ Madrid               │
│ PAR-FR         │ Paris                │
│ SFC-USA        │ San Francisco        │
│ SYD-AU         │ Sydney               │
│ TAL-ES         │ Talavera de la Reina │
│ TOK-JP         │ Tokyo                │
└────────────────┴──────────────────────┘
*/
--     Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select ciudad, telefono from oficina where pais = 'España';
/*
┌──────────────────────┬────────────────┐
│        ciudad        │    telefono    │
├──────────────────────┼────────────────┤
│ Barcelona            │ +34 93 3561182 │
│ Madrid               │ +34 91 7514487 │
│ Talavera de la Reina │ +34 925 867231 │
└──────────────────────┴────────────────┘
*/
--     Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
select nombre, apellido1, apellido2, email from empleado where codigo_jefe = 7;
/*
┌─────────┬───────────┬───────────┬──────────────────────────┐
│ nombre  │ apellido1 │ apellido2 │          email           │
├─────────┼───────────┼───────────┼──────────────────────────┤
│ Mariano │ López     │ Murcia    │ mlopez@jardineria.es     │
│ Lucio   │ Campoamor │ Martín    │ lcampoamor@jardineria.es │
│ Hilario │ Rodriguez │ Huertas   │ hrodriguez@jardineria.es │
└─────────┴───────────┴───────────┴──────────────────────────┘
*/
--     Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select puesto, nombre, apellido1, apellido2, email from empleado where codigo_jefe is null;
/*
┌──────────────────┬────────┬───────────┬───────────┬──────────────────────┐
│      puesto      │ nombre │ apellido1 │ apellido2 │        email         │
├──────────────────┼────────┼───────────┼───────────┼──────────────────────┤
│ Director General │ Marcos │ Magaña    │ Perez     │ marcos@jardineria.es │
└──────────────────┴────────┴───────────┴───────────┴──────────────────────┘
*/
--     Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
select nombre, apellido1, apellido2, puesto from empleado where puesto not in ('Representante Ventas');
/*
┌──────────┬────────────┬───────────┬───────────────────────┐
│  nombre  │ apellido1  │ apellido2 │        puesto         │
├──────────┼────────────┼───────────┼───────────────────────┤
│ Marcos   │ Magaña     │ Perez     │ Director General      │
│ Ruben    │ López      │ Martinez  │ Subdirector Marketing │
│ Alberto  │ Soria      │ Carrasco  │ Subdirector Ventas    │
│ Maria    │ Solís      │ Jerez     │ Secretaria            │
│ Carlos   │ Soria      │ Jimenez   │ Director Oficina      │
│ Emmanuel │ Magaña     │ Perez     │ Director Oficina      │
│ Francois │ Fignon     │           │ Director Oficina      │
│ Michael  │ Bolton     │           │ Director Oficina      │
│ Hilary   │ Washington │           │ Director Oficina      │
│ Nei      │ Nishikori  │           │ Director Oficina      │
│ Amy      │ Johnson    │           │ Director Oficina      │
│ Kevin    │ Fallmer    │           │ Director Oficina      │
└──────────┴────────────┴───────────┴───────────────────────┘
*/
--     Devuelve un listado con el nombre de los todos los clientes españoles.
select nombre_cliente from cliente where pais = 'Spain';
/*
┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ Lasas S.A.                     │
│ Beragua                        │
│ Club Golf Puerta del hierro    │
│ Naturagua                      │
│ DaraDistribuciones             │
│ Madrileña de riegos            │
│ Lasas S.A.                     │
│ Camunas Jardines S.L.          │
│ Dardena S.A.                   │
│ Jardin de Flores               │
│ Flores Marivi                  │
│ Flowers, S.A                   │
│ Naturajardin                   │
│ Golf S.A.                      │
│ Americh Golf Management SL     │
│ Aloha                          │
│ El Prat                        │
│ Sotogrande                     │
│ Vivero Humanes                 │
│ Fuenla City                    │
│ Jardines y Mansiones Cactus SL │
│ Jardinerías Matías SL          │
│ Agrojardin                     │
│ Top Campo                      │
│ Jardineria Sara                │
│ Campohermoso                   │
│ Flores S.L.                    │
└────────────────────────────────┘
*/
--     Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select distinct estado from pedido;
/*
┌───────────┐
│  estado   │
├───────────┤
│ Entregado │
│ Rechazado │
│ Pendiente │
└───────────┘
*/
--     Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.
select codigo_cliente from pago where fecha_pago like '2008%';
/*
┌────────────────┐
│ codigo_cliente │
├────────────────┤
│ 1              │
│ 1              │
│ 13             │
│ 14             │
│ 26             │
└────────────────┘
*/
--     Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
select codigo_pedido, c.codigo_cliente, fecha_esperada, fecha_entrega from cliente as c join pedido as p on p.codigo_cliente=c.codigo_cliente where fecha_esperada < fecha_entrega;
/*
┌───────────────┬────────────────┬────────────────┬───────────────┐
│ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │
├───────────────┼────────────────┼────────────────┼───────────────┤
│ 9             │ 1              │ 2008-12-27     │ 2008-12-28    │
│ 13            │ 7              │ 2009-01-14     │ 2009-01-15    │
│ 16            │ 7              │ 2009-01-07     │ 2009-01-15    │
│ 17            │ 7              │ 2009-01-09     │ 2009-01-11    │
│ 18            │ 9              │ 2009-01-06     │ 2009-01-07    │
│ 22            │ 9              │ 2009-01-11     │ 2009-01-13    │
│ 28            │ 3              │ 2009-02-17     │ 2009-02-20    │
│ 31            │ 13             │ 2008-09-30     │ 2008-10-04    │
│ 32            │ 4              │ 2007-01-19     │ 2007-01-27    │
│ 38            │ 19             │ 2009-03-06     │ 2009-03-07    │
│ 39            │ 19             │ 2009-03-07     │ 2009-03-09    │
│ 40            │ 19             │ 2009-03-10     │ 2009-03-13    │
│ 42            │ 19             │ 2009-03-23     │ 2009-03-27    │
│ 43            │ 23             │ 2009-03-26     │ 2009-03-28    │
│ 44            │ 23             │ 2009-03-27     │ 2009-03-30    │
│ 45            │ 23             │ 2009-03-04     │ 2009-03-07    │
│ 46            │ 23             │ 2009-03-04     │ 2009-03-05    │
│ 49            │ 26             │ 2008-07-22     │ 2008-07-30    │
│ 55            │ 14             │ 2009-01-10     │ 2009-01-11    │
│ 60            │ 1              │ 2008-12-27     │ 2008-12-28    │
│ 68            │ 3              │ 2009-02-17     │ 2009-02-20    │
│ 92            │ 27             │ 2009-04-30     │ 2009-05-03    │
│ 96            │ 35             │ 2008-04-12     │ 2008-04-13    │
│ 103           │ 30             │ 2009-01-20     │ 2009-01-24    │
│ 106           │ 30             │ 2009-05-15     │ 2009-05-20    │
│ 112           │ 36             │ 2009-04-06     │ 2009-05-07    │
│ 113           │ 36             │ 2008-11-09     │ 2009-01-09    │
│ 114           │ 36             │ 2009-01-29     │ 2009-01-31    │
│ 115           │ 36             │ 2009-01-26     │ 2009-02-27    │
│ 123           │ 30             │ 2009-01-20     │ 2009-01-24    │
│ 126           │ 30             │ 2009-05-15     │ 2009-05-20    │
│ 128           │ 38             │ 2008-12-10     │ 2008-12-29    │
└───────────────┴────────────────┴────────────────┴───────────────┘
*/
--     Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

--     Nota: Argumenta el camino para la solución.

--     Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
select * from pedido where estado='Rechazado';
/*
┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬───────────────────────────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                                  comentarios                                  │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼───────────────────────────────────────────────────────────────────────────────┼────────────────┤
│ 3             │ 2008-06-20   │ 2008-06-25     │               │ Rechazado │ Limite de credito superado                                                    │ 5              │
│ 14            │ 2009-01-02   │ 2009-01-02     │               │ Rechazado │ mal pago                                                                      │ 7              │
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                                      │ 9              │
│ 23            │ 2008-12-30   │ 2009-01-10     │               │ Rechazado │ El pedido fue anulado por el cliente                                          │ 5              │
│ 25            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada                              │ 1              │
│ 26            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto                      │ 3              │
│ 29            │ 2008-08-01   │ 2008-09-01     │ 2008-09-01    │ Rechazado │ El cliente no está conforme con el pedido                                     │ 14             │
│ 31            │ 2008-09-04   │ 2008-09-30     │ 2008-10-04    │ Rechazado │ El cliente ha rechazado por llegar 5 dias tarde                               │ 13             │
│ 33            │ 2007-05-20   │ 2007-05-28     │               │ Rechazado │ El pedido fue anulado por el cliente                                          │ 4              │
│ 35            │ 2008-03-10   │ 2009-03-20     │               │ Rechazado │ Limite de credito superado                                                    │ 4              │
│ 40            │ 2009-03-09   │ 2009-03-10     │ 2009-03-13    │ Rechazado │                                                                               │ 19             │
│ 46            │ 2009-04-03   │ 2009-03-04     │ 2009-03-05    │ Rechazado │                                                                               │ 23             │
│ 56            │ 2008-12-19   │ 2009-01-20     │               │ Rechazado │ El cliente a anulado el pedido el dia 2009-01-10                              │ 13             │
│ 65            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada                              │ 1              │
│ 66            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto                      │ 3              │
│ 74            │ 2009-01-14   │ 2009-01-22     │               │ Rechazado │ El pedido no llego el dia que queria el cliente por fallo del transporte      │ 15             │
│ 81            │ 2009-01-18   │ 2009-01-24     │               │ Rechazado │ Los producto estaban en mal estado                                            │ 28             │
│ 101           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                                        │ 16             │
│ 105           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad                           │ 30             │
│ 113           │ 2008-10-28   │ 2008-11-09     │ 2009-01-09    │ Rechazado │ El producto ha sido rechazado por la tardanza de el envio                     │ 36             │
│ 117           │ 2008-08-25   │ 2008-10-01     │               │ Rechazado │ El pedido ha sido rechazado por la acumulacion de pago pendientes del cliente │ 38             │
│ 120           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                                        │ 16             │
│ 125           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad                           │ 30             │
│ 128           │ 2008-11-10   │ 2008-12-10     │ 2008-12-29    │ Rechazado │ El pedido ha sido rechazado por el cliente por el retraso en la entrega       │ 38             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴───────────────────────────────────────────────────────────────────────────────┴────────────────┘
*/
--     Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
select * from pedido where fecha_entrega like '%-01-%';
/*
┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬───────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                        comentarios                        │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼───────────────────────────────────────────────────────────┼────────────────┤
│ 1             │ 2006-01-17   │ 2006-01-19     │ 2006-01-19    │ Entregado │ Pagado a plazos                                           │ 5              │
│ 13            │ 2009-01-12   │ 2009-01-14     │ 2009-01-15    │ Entregado │                                                           │ 7              │
│ 15            │ 2009-01-09   │ 2009-01-12     │ 2009-01-11    │ Entregado │                                                           │ 7              │
│ 16            │ 2009-01-06   │ 2009-01-07     │ 2009-01-15    │ Entregado │                                                           │ 7              │
│ 17            │ 2009-01-08   │ 2009-01-09     │ 2009-01-11    │ Entregado │ mal estado                                                │ 7              │
│ 18            │ 2009-01-05   │ 2009-01-06     │ 2009-01-07    │ Entregado │                                                           │ 9              │
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                  │ 9              │
│ 22            │ 2009-01-11   │ 2009-01-11     │ 2009-01-13    │ Entregado │                                                           │ 9              │
│ 32            │ 2007-01-07   │ 2007-01-19     │ 2007-01-27    │ Entregado │ Entrega tardia, el cliente puso reclamacion               │ 4              │
│ 55            │ 2008-12-10   │ 2009-01-10     │ 2009-01-11    │ Entregado │ Retrasado 1 dia por problemas de transporte               │ 14             │
│ 58            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                             │ 3              │
│ 64            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                             │ 1              │
│ 75            │ 2009-01-11   │ 2009-01-13     │ 2009-01-13    │ Entregado │ El pedido llego perfectamente                             │ 15             │
│ 79            │ 2009-01-12   │ 2009-01-13     │ 2009-01-13    │ Entregado │                                                           │ 28             │
│ 82            │ 2009-01-20   │ 2009-01-29     │ 2009-01-29    │ Entregado │ El pedido llego un poco mas tarde de la hora fijada       │ 28             │
│ 95            │ 2008-01-04   │ 2008-01-19     │ 2008-01-19    │ Entregado │                                                           │ 35             │
│ 100           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                             │ 16             │
│ 102           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                            │ 16             │
│ 103           │ 2009-01-15   │ 2009-01-20     │ 2009-01-24    │ Pendiente │                                                           │ 30             │
│ 113           │ 2008-10-28   │ 2008-11-09     │ 2009-01-09    │ Rechazado │ El producto ha sido rechazado por la tardanza de el envio │ 36             │
│ 114           │ 2009-01-15   │ 2009-01-29     │ 2009-01-31    │ Entregado │ El envio llego dos dias más tarde debido al mal tiempo    │ 36             │
│ 119           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                             │ 16             │
│ 121           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                            │ 16             │
│ 123           │ 2009-01-15   │ 2009-01-20     │ 2009-01-24    │ Pendiente │                                                           │ 30             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴───────────────────────────────────────────────────────────┴────────────────┘
*/
--     Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
select * from pago where fecha_pago like '2008-%' and forma_pago = 'PayPal';
/*
┌────────────────┬────────────┬────────────────┬────────────┬─────────┐
│ codigo_cliente │ forma_pago │ id_transaccion │ fecha_pago │  total  │
├────────────────┼────────────┼────────────────┼────────────┼─────────┤
│ 1              │ PayPal     │ ak-std-000001  │ 2008-11-10 │ 2000.0  │
│ 1              │ PayPal     │ ak-std-000002  │ 2008-12-10 │ 2000.0  │
│ 13             │ PayPal     │ ak-std-000014  │ 2008-08-04 │ 2246.0  │
│ 14             │ PayPal     │ ak-std-000015  │ 2008-07-15 │ 4160.0  │
│ 26             │ PayPal     │ ak-std-000020  │ 2008-03-18 │ 18846.0 │
└────────────────┴────────────┴────────────────┴────────────┴─────────┘
*/
--     Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
select distinct forma_pago from pago;
/*
┌───────────────┐
│  forma_pago   │
├───────────────┤
│ PayPal        │
│ Transferencia │
│ Cheque        │
└───────────────┘
*/
--     Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

--     Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

-- Consultas multitabla (JOIN´s).

--     Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
select nombre_cliente, e.nombre, e.apellido1 from cliente left join empleado as e on codigo_empleado = codigo_empleado_rep_ventas;
/*
┌────────────────────────────────┬─────────────────┬────────────┐
│         nombre_cliente         │     nombre      │ apellido1  │
├────────────────────────────────┼─────────────────┼────────────┤
│ GoldFish Garden                │ Walter Santiago │ Sanchez    │
│ Gardening Associates           │ Walter Santiago │ Sanchez    │
│ Gerudo Valley                  │ Lorena          │ Paxton     │
│ Tendo Garden                   │ Lorena          │ Paxton     │
│ Lasas S.A.                     │ Mariano         │ López      │
│ Beragua                        │ Emmanuel        │ Magaña     │
│ Club Golf Puerta del hierro    │ Emmanuel        │ Magaña     │
│ Naturagua                      │ Emmanuel        │ Magaña     │
│ DaraDistribuciones             │ Emmanuel        │ Magaña     │
│ Madrileña de riegos            │ Emmanuel        │ Magaña     │
│ Lasas S.A.                     │ Mariano         │ López      │
│ Camunas Jardines S.L.          │ Mariano         │ López      │
│ Dardena S.A.                   │ Mariano         │ López      │
│ Jardin de Flores               │ Julian          │ Bellinelli │
│ Flores Marivi                  │ Felipe          │ Rosas      │
│ Flowers, S.A                   │ Felipe          │ Rosas      │
│ Naturajardin                   │ Julian          │ Bellinelli │
│ Golf S.A.                      │ José Manuel     │ Martinez   │
│ Americh Golf Management SL     │ José Manuel     │ Martinez   │
│ Aloha                          │ José Manuel     │ Martinez   │
│ El Prat                        │ José Manuel     │ Martinez   │
│ Sotogrande                     │ José Manuel     │ Martinez   │
│ Vivero Humanes                 │ Julian          │ Bellinelli │
│ Fuenla City                    │ Felipe          │ Rosas      │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor  │
│ Jardinerías Matías SL          │ Lucio           │ Campoamor  │
│ Agrojardin                     │ Julian          │ Bellinelli │
│ Top Campo                      │ Felipe          │ Rosas      │
│ Jardineria Sara                │ Felipe          │ Rosas      │
│ Campohermoso                   │ Julian          │ Bellinelli │
│ france telecom                 │ Lionel          │ Narvaez    │
│ Musée du Louvre                │ Lionel          │ Narvaez    │
│ Tutifruti S.A                  │ Mariko          │ Kishi      │
│ Flores S.L.                    │ Michael         │ Bolton     │
│ The Magic Garden               │ Michael         │ Bolton     │
│ El Jardin Viviente S.L         │ Mariko          │ Kishi      │
└────────────────────────────────┴─────────────────┴────────────┘
*/
--     Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
select distinct c.nombre_cliente, empleado.nombre from empleado, cliente as c left join pago on c.codigo_cliente = pago.codigo_cliente where empleado.codigo_empleado = c.codigo_empleado_rep_ventas and c.codigo_cliente in (select distinct codigo_cliente from pago);
/*
┌────────────────────────────────┬─────────────────┐
│         nombre_cliente         │     nombre      │
├────────────────────────────────┼─────────────────┤
│ GoldFish Garden                │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gerudo Valley                  │ Lorena          │
│ Tendo Garden                   │ Lorena          │
│ Beragua                        │ Emmanuel        │
│ Naturagua                      │ Emmanuel        │
│ Camunas Jardines S.L.          │ Mariano         │
│ Dardena S.A.                   │ Mariano         │
│ Jardin de Flores               │ Julian          │
│ Flores Marivi                  │ Felipe          │
│ Golf S.A.                      │ José Manuel     │
│ Sotogrande                     │ José Manuel     │
│ Jardines y Mansiones Cactus SL │ Lucio           │
│ Jardinerías Matías SL          │ Lucio           │
│ Agrojardin                     │ Julian          │
│ Jardineria Sara                │ Felipe          │
│ Tutifruti S.A                  │ Mariko          │
│ El Jardin Viviente S.L         │ Mariko          │
└────────────────────────────────┴─────────────────┘
*/
--     Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
select distinct c.nombre_cliente, empleado.nombre from empleado, cliente as c left join pago on c.codigo_cliente = pago.codigo_cliente where empleado.codigo_empleado = c.codigo_empleado_rep_ventas and c.codigo_cliente not in (select distinct codigo_cliente from pago);
/*
┌─────────────────────────────┬─────────────┐
│       nombre_cliente        │   nombre    │
├─────────────────────────────┼─────────────┤
│ Lasas S.A.                  │ Mariano     │
│ Club Golf Puerta del hierro │ Emmanuel    │
│ DaraDistribuciones          │ Emmanuel    │
│ Madrileña de riegos         │ Emmanuel    │
│ Flowers, S.A                │ Felipe      │
│ Naturajardin                │ Julian      │
│ Americh Golf Management SL  │ José Manuel │
│ Aloha                       │ José Manuel │
│ El Prat                     │ José Manuel │
│ Vivero Humanes              │ Julian      │
│ Fuenla City                 │ Felipe      │
│ Top Campo                   │ Felipe      │
│ Campohermoso                │ Julian      │
│ france telecom              │ Lionel      │
│ Musée du Louvre             │ Lionel      │
│ Flores S.L.                 │ Michael     │
│ The Magic Garden            │ Michael     │
└─────────────────────────────┴─────────────┘
*/
--     Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

--     Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

--     Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

--     Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

--     Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

--     Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

--     Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

--     Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

-- ## Consultas multitabla (LEFT JOIN, RIGHT JOIN)

--     Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select nombre_cliente from cliente as c left join pago as p on c.codigo_cliente=p.codigo_cliente where c.codigo_cliente not in (select codigo_cliente from pago);  
/*
┌─────────────────────────────┐
│       nombre_cliente        │
├─────────────────────────────┤
│ Lasas S.A.                  │
│ Club Golf Puerta del hierro │
│ DaraDistribuciones          │
│ Madrileña de riegos         │
│ Lasas S.A.                  │
│ Flowers, S.A                │
│ Naturajardin                │
│ Americh Golf Management SL  │
│ Aloha                       │
│ El Prat                     │
│ Vivero Humanes              │
│ Fuenla City                 │
│ Top Campo                   │
│ Campohermoso                │
│ france telecom              │
│ Musée du Louvre             │
│ Flores S.L.                 │
│ The Magic Garden            │
└─────────────────────────────┘
*/
--     Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
select nombre_cliente from cliente as c left join pedido as p on c.codigo_cliente=p.codigo_cliente where c.codigo_cliente not in (select codigo_cliente from pedido);  
/*
┌─────────────────────────────┐
│       nombre_cliente        │
├─────────────────────────────┤
│ Lasas S.A.                  │
│ Club Golf Puerta del hierro │
│ DaraDistribuciones          │
│ Madrileña de riegos         │
│ Lasas S.A.                  │
│ Flowers, S.A                │
│ Naturajardin                │
│ Americh Golf Management SL  │
│ Aloha                       │
│ El Prat                     │
│ Vivero Humanes              │
│ Fuenla City                 │
│ Top Campo                   │
│ Campohermoso                │
│ france telecom              │
│ Musée du Louvre             │
│ The Magic Garden            │
└─────────────────────────────┘
*/
--     Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
select distinct nombre_cliente from cliente as c left join pedido as p left join pago as pa on c.codigo_cliente=p.codigo_cliente and c.codigo_cliente = pa.codigo_cliente where c.codigo_cliente not in (select codigo_cliente from pedido) and c.codigo_cliente not in (select codigo_cliente from pago);  
/*
┌─────────────────────────────┐
│       nombre_cliente        │
├─────────────────────────────┤
│ Lasas S.A.                  │
│ Club Golf Puerta del hierro │
│ DaraDistribuciones          │
│ Madrileña de riegos         │
│ Flowers, S.A                │
│ Naturajardin                │
│ Americh Golf Management SL  │
│ Aloha                       │
│ El Prat                     │
│ Vivero Humanes              │
│ Fuenla City                 │
│ Top Campo                   │
│ Campohermoso                │
│ france telecom              │
│ Musée du Louvre             │
│ The Magic Garden            │
└─────────────────────────────┘
*/
--     Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

--     Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

--     Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

--     Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

--     Devuelve un listado de los productos que nunca han aparecido en un pedido.

--     Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

--     Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

--     Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

--     Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

-- Consultas resumen

--     ¿Cuántos empleados hay en la compañía?
select count(codigo_empleado) from empleado;
/*
┌────────────────────────┐
│ count(codigo_empleado) │
├────────────────────────┤
│ 31                     │
└────────────────────────┘
*/
--     ¿Cuántos clientes tiene cada país?
select pais, count(codigo_cliente) from cliente group by pais;
/*
┌────────────────┬───────────────────────┐
│      pais      │ count(codigo_cliente) │
├────────────────┼───────────────────────┤
│ Australia      │ 2                     │
│ France         │ 2                     │
│ Spain          │ 27                    │
│ USA            │ 4                     │
│ United Kingdom │ 1                     │
└────────────────┴───────────────────────┘
*/
--     ¿Cuál fue el pago medio en 2009?
select round(avg(total), 2) from pago where fecha_pago like '2009-%';
/*
┌──────────────────────┐
│ round(avg(total), 2) │
├──────────────────────┤
│ 4504.08              │
└──────────────────────┘
*/
--     ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
select estado, count(codigo_pedido) from pedido group by estado;
/*
┌───────────┬──────────────────────┐
│  estado   │ count(codigo_pedido) │
├───────────┼──────────────────────┤
│ Entregado │ 61                   │
│ Pendiente │ 30                   │
│ Rechazado │ 24                   │
└───────────┴──────────────────────┘
*/
--     Calcula el precio de venta del producto más caro y más barato en una misma consulta.

--     Calcula el número de clientes que tiene la empresa.
--     ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

--     ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

--     Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

--     Calcula el número de clientes que no tiene asignado representante de ventas.

--     Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

--     Calcula el número de productos diferentes que hay en cada uno de los pedidos.

--     Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

--     Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

--     La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

--     La misma información que en la pregunta anterior, pero agrupada por código de producto.

--     La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

--     Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

--     Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

-- Subconsultas
-- Con operadores básicos de comparación

--     Devuelve el nombre del cliente con mayor límite de crédito.
select nombre_cliente from cliente where limite_credito = (select max(limite_credito) from cliente);
/*
┌────────────────┐
│ nombre_cliente │
├────────────────┤
│ Tendo Garden   │
└────────────────┘
*/
--     Devuelve el nombre del producto que tenga el precio de venta más caro.

--     Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)

--     Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

--     Devuelve el producto que más unidades tiene en stock.

--     Devuelve el producto que menos unidades tiene en stock.

--     Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.

-- Subconsultas con IN y NOT IN

--     Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

--     Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

--     Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

--     Devuelve un listado de los productos que nunca han aparecido en un pedido.

--     Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

--     Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

--     Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

-- Subconsultas con EXISTS y NOT EXISTS

--     Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

--     Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

--     Devuelve un listado de los productos que nunca han aparecido en un pedido.

--     Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

-- Subconsultas correlacionadas

--     Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

--     Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

--     Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

--     Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

--     Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

--     Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

--     Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
