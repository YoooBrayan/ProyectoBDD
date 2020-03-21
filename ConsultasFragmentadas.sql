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


/* 2.Consolidado mensual y   anual de la editorial de la cual se han vendido más libros en cada sucursal */

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
GROUP by e.codigo, e.nombre, s.nombre
order by sucursal, total desc;

