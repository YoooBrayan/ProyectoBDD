/* Crear extension dblink */

create extension dblink;

/* 1.Consolidado mensual de la cantidad de clientes nuevos a nivel nacional. */

/* Consulta desde nodo 1 (B-M) */
/*muestra por nodo*/
select sum(clientes_BM.count)
from dblink('dbname=libreria port=5432 host=127.0.0.1 password=123 user=postgres','select count(identificacion_cliente) from clientes where identificacion_cliente not in(
    select identificacion_cliente from venta 
    where fecha_compra < ''2020-03-01''
)
and fecha_compra BETWEEN ''2020-03-01'' and ''2020-03-31'' ')
as clientes_BM (count integer)
UNION 
select  count(identificacion_cliente)
from clientes
where identificacion_cliente not in(
    select identificacion_cliente from venta 
    where fecha_compra < '2020-03-01'
)
and fecha_compra BETWEEN '2020-03-01' and '2020-03-31';

/*Muestra a nivel nacional pero*/
select sum(n1.c1+n2.c2+n3.c3) from
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
