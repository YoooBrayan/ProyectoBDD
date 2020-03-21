/* Crear extension dblink */

create extension dblink;

/* 1.Consolidado mensual de la cantidad de clientes nuevos a nivel nacional. */

/* Consulta desde nodo 1 (B-M) */
/*muestra por nodo*/
select clientes_BM.count
from dblink('dbname=libreria port=5432 host=127.0.0.1 password=123 user=postgres','select count(identificacion_cliente) from clientes where identificacion_cliente not in(
    select identificacion_cliente from venta 
    where fecha_compra < ''2020-03-01''
)
and fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31'' ')
as clientes_BM (count integer)
UNION
select sum(clientes_SRBC.count)
from dblink('dbname=libreria port=5434 host=127.0.0.1 password=123 user=postgres','select count(identificacion_cliente) from clientes where identificacion_cliente not in(
    select identificacion_cliente from venta 
    where fecha_compra < ''2020-03-01''
)
and fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31'' ')
as clientes_SRBC (count integer)
UNION 
select  count(identificacion_cliente)
from clientes
where identificacion_cliente not in(
    select identificacion_cliente from venta 
    where fecha_compra < '2020-03-01'
)
and fecha_compra BETWEEN '2020-03-01' and '2020-03-31';

/*Muestra a nivel nacional pero*/
select sum(n1.c1+n2.c2+n3.c3) as "clientes nuevos a nivel nacional" from
(select clientes_BM.c1
from dblink('dbname=libreria port=5432 host=127.0.0.1 password=123 user=postgres','select count(identificacion_cliente) as c1 from clientes where identificacion_cliente not in(
    select identificacion_cliente from venta 
    where fecha_compra < ''2020-03-01''
)
and fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31'' ')
as clientes_BM (c1 integer)) as n1,
(select count(identificacion_cliente) as c2
from clientes
where identificacion_cliente not in(
    select identificacion_cliente from venta 
    where fecha_compra < '2020-03-01'
)
and fecha_compra BETWEEN '2020-03-01' and '2020-03-31') as n2,
(select clientes_SRBC.c3
from dblink('dbname=libreria port=5434 host=127.0.0.1 password=123 user=postgres','select count(identificacion_cliente) as c3 from clientes where identificacion_cliente not in(
    select identificacion_cliente from venta 
    where fecha_compra < ''2020-03-01''
)
and fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31'' ')
as clientes_SRBC (c3 integer)) as n3;


/* 2.Consolidado mensual y anual de la editorial de la cual se han vendido más libros en cada sucursal */

/*Mensual*/
select editoriales_PC.*
from dblink('dbname=libreria port=5433 host=127.0.0.1 password=123 user=postgres',
'select s.nombre as sucursal, e.nombre as editorial, COUNT(e.codigo) as total
FROM editorial e INNER JOIN libro l on e.codigo = l.editorial INNER JOIN sucursal_libro sl on l.codigo = sl.codigo_libro INNER JOIN sucursal s on sl.nombre_sucursal = s.nombre INNER JOIN venta v on sl.codigo = v.codigo_sucursal_libro 
where fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31''
GROUP by e.codigo, e.nombre, s.nombre
order by sucursal'
) as editoriales_PC (sucursal varchar(50), editorial varchar(60), total integer)
UNION
select editoriales_SRBC.*
from dblink('dbname=libreria port=5434 host=127.0.0.1 password=123 user=postgres',
'select s.nombre as sucursal, e.nombre as editorial, COUNT(e.codigo) as total
FROM editorial e INNER JOIN libro l on e.codigo = l.editorial INNER JOIN sucursal_libro sl on l.codigo = sl.codigo_libro INNER JOIN sucursal s on sl.nombre_sucursal = s.nombre INNER JOIN venta v on sl.codigo = v.codigo_sucursal_libro 
where fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31''
GROUP by e.codigo, e.nombre, s.nombre
order by sucursal'
) as editoriales_SRBC (sucursal varchar(50), editorial varchar(60), total integer)
UNION
select s.nombre as sucursal, e.nombre as editorial, COUNT(e.codigo) as total
FROM editorial e INNER JOIN libro l on e.codigo = l.editorial INNER JOIN sucursal_libro sl on l.codigo = sl.codigo_libro INNER JOIN sucursal s on sl.nombre_sucursal = s.nombre INNER JOIN venta v on sl.codigo = v.codigo_sucursal_libro 
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
GROUP by e.codigo, editorial, sucursal
order by sucursal, total desc;

/*Anual*/
select editoriales_PC.*
from dblink('dbname=libreria port=5433 host=127.0.0.1 password=123 user=postgres',
'select s.nombre as sucursal, e.nombre as editorial, COUNT(e.codigo) as total
FROM editorial e INNER JOIN libro l on e.codigo = l.editorial INNER JOIN sucursal_libro sl on l.codigo = sl.codigo_libro INNER JOIN sucursal s on sl.nombre_sucursal = s.nombre INNER JOIN venta v on sl.codigo = v.codigo_sucursal_libro 
where fecha_compra BETWEEN ''2019-01-01'' and ''2019-12-31''
GROUP by e.codigo, e.nombre, s.nombre
order by sucursal'
) as editoriales_PC (sucursal varchar(50), editorial varchar(60), total integer)
UNION
select editoriales_SRBC.*
from dblink('dbname=libreria port=5434 host=127.0.0.1 password=123 user=postgres',
'select s.nombre as sucursal, e.nombre as editorial, COUNT(e.codigo) as total
FROM editorial e INNER JOIN libro l on e.codigo = l.editorial INNER JOIN sucursal_libro sl on l.codigo = sl.codigo_libro INNER JOIN sucursal s on sl.nombre_sucursal = s.nombre INNER JOIN venta v on sl.codigo = v.codigo_sucursal_libro 
where fecha_compra BETWEEN ''2019-01-01'' and ''2019-12-31''
GROUP by e.codigo, e.nombre, s.nombre
order by sucursal'
) as editoriales_SRBC (sucursal varchar(50), editorial varchar(60), total integer)
UNION
select s.nombre as sucursal, e.nombre as editorial, COUNT(e.codigo) as total
FROM editorial e INNER JOIN libro l on e.codigo = l.editorial INNER JOIN sucursal_libro sl on l.codigo = sl.codigo_libro INNER JOIN sucursal s on sl.nombre_sucursal = s.nombre INNER JOIN venta v on sl.codigo = v.codigo_sucursal_libro 
where fecha_compra BETWEEN '2019-01-01' and '2019-12-31'
GROUP by e.codigo, editorial, sucursal
order by sucursal, total desc;


/* 3. Datos de los clientes nuevos. Estos datos organizados por sucursal en un mes particular. */
select clientesN_PC.*
from dblink('dbname=libreria port=5433 host=127.0.0.1 password=123 user=postgres', 
'select c.identificacion as identificacion, c.nombre as nombre, s.nombre as sucursal
from cliente c INNER JOIN ciudad ci on c.codigo_ciudad_residencia = ci.codigo INNER JOIN venta v on v.identificacion_cliente = c.identificacion JOIN sucursal_libro sl on sl.codigo = v.codigo_sucursal_libro JOIN sucursal s on s.nombre = sl.nombre_sucursal
where identificacion not in(
    select identificacion from cliente c join venta v on v.identificacion_cliente = c.identificacion 
    where fecha_compra < ''2020-03-01''
)
and fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31''
order by sucursal'
) as clientesN_PC (identificacion integer, nombre varchar(50), sucursal varchar(50))
UNION
select clientesN_SRBC.*
from dblink('dbname=libreria port=5434 host=127.0.0.1 password=123 user=postgres', 
'select c.identificacion as identificacion, c.nombre as nombre, s.nombre as sucursal
from cliente c INNER JOIN ciudad ci on c.codigo_ciudad_residencia = ci.codigo INNER JOIN venta v on v.identificacion_cliente = c.identificacion JOIN sucursal_libro sl on sl.codigo = v.codigo_sucursal_libro JOIN sucursal s on s.nombre = sl.nombre_sucursal
where identificacion not in(
    select identificacion from cliente c join venta v on v.identificacion_cliente = c.identificacion 
    where fecha_compra < ''2020-03-01''
)
and fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31''
order by sucursal'
) as clientesN_SRBC (identificacion integer, nombre varchar(50), sucursal varchar(50))
UNION
select c.identificacion as identificacion, c.nombre as nombre, s.nombre as sucursal
from cliente c INNER JOIN ciudad ci on c.codigo_ciudad_residencia = ci.codigo INNER JOIN venta v on v.identificacion_cliente = c.identificacion JOIN sucursal_libro sl on sl.codigo = v.codigo_sucursal_libro JOIN sucursal s on s.nombre = sl.nombre_sucursal
where identificacion not in(
    select identificacion from cliente c join venta v on v.identificacion_cliente = c.identificacion 
    where fecha_compra < '2020-03-01'
)
and fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
order by sucursal;



/* 4.Libros más comprados en un mes particular a nivel nacional por cada sucursal. */
/*Libros mas vendidos a nivel nacional*/
select librosV_PC.*
from dblink('dbname=libreria port=5434 host=127.0.0.1 password=123 user=postgres',
'select  l.titulo as titulo, COUNT(l.titulo) as Vendidos
from libro l join sucursal_libro sl on l.codigo = sl.codigo_libro join venta v on v.codigo_sucursal_libro = sl.codigo join sucursal s on s.nombre = sl.nombre_sucursal
where fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31''
GROUP BY l.titulo
order by vendidos desc;'
) as librosV_PC (titulo text, vendidos integer)
UNION
select librosV_SRBC.*
from dblink('dbname=libreria port=5433 host=127.0.0.1 password=123 user=postgres',
'select l.titulo as titulo, COUNT(l.titulo) as Vendidos
from libro l join sucursal_libro sl on l.codigo = sl.codigo_libro join venta v on v.codigo_sucursal_libro = sl.codigo join sucursal s on s.nombre = sl.nombre_sucursal
where fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31''
GROUP BY l.titulo
order by vendidos desc;'
) as librosV_SRBC (titulo text, vendidos integer)
UNION
select l.titulo as titulo, COUNT(l.titulo) as Vendidos
from libro l join sucursal_libro sl on l.codigo = sl.codigo_libro join venta v on v.codigo_sucursal_libro = sl.codigo join sucursal s on s.nombre = sl.nombre_sucursal
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
GROUP BY l.titulo
order by vendidos desc;

/*Por sucursal*/
select librosV_PC.*
from dblink('dbname=libreria port=5434 host=127.0.0.1 password=123 user=postgres',
'select s.nombre as sucursal, l.titulo as titulo, COUNT(l.titulo) as Vendidos
from libro l join sucursal_libro sl on l.codigo = sl.codigo_libro join venta v on v.codigo_sucursal_libro = sl.codigo join sucursal s on s.nombre = sl.nombre_sucursal
where fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31''
GROUP BY l.titulo, sucursal
order by sucursal, vendidos desc;'
) as librosV_PC (sucursal varchar(50), titulo text, vendidos integer)
UNION
select librosV_SRBC.*
from dblink('dbname=libreria port=5433 host=127.0.0.1 password=123 user=postgres',
'select s.nombre as sucursal, l.titulo as titulo, COUNT(l.titulo) as Vendidos
from libro l join sucursal_libro sl on l.codigo = sl.codigo_libro join venta v on v.codigo_sucursal_libro = sl.codigo join sucursal s on s.nombre = sl.nombre_sucursal
where fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31''
GROUP BY l.titulo, sucursal
order by sucursal, vendidos desc;'
) as librosV_SRBC (sucursal varchar(50), titulo text, vendidos integer)
UNION
select s.nombre as sucursal, l.titulo as titulo, COUNT(l.titulo) as Vendidos
from libro l join sucursal_libro sl on l.codigo = sl.codigo_libro join venta v on v.codigo_sucursal_libro = sl.codigo join sucursal s on s.nombre = sl.nombre_sucursal
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
GROUP BY l.titulo, sucursal
order by sucursal, vendidos desc;