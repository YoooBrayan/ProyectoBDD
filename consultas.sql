/* 1.Consolidado mensual de la cantidad de clientes nuevos a nivel nacional. */

create view clientes as
select identificacion_cliente, fecha_compra from venta GROUP BY identificacion_cliente, fecha_compra;


select COUNT(identificacion_cliente)
from clientes
where identificacion_cliente not in(
    select identificacion_cliente from venta 
    where fecha_compra < '2020-03-01'
)
and fecha_compra BETWEEN '2020-03-01' and '2020-03-31';

/*select COUNT(identificacion)
from cliente c INNER JOIN ciudad ci on c.codigo_ciudad_residencia = ci.codigo INNER JOIN venta v on v.identificacion_cliente = c.identificacion
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
GROUP BY identificacion, ciudad, fecha_compra
order by fecha_compra
limit 1;

select identificacion from (select identificacion, fecha_compra from cliente c join venta v on v.identificacion_cliente = c.identificacion order by fecha_compra limit 1) as nuevo
GROUP by idetif


select identificacion, fecha_compra from cliente c join venta v on v.identificacion_cliente = c.identificacion
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
GROUP by identificacion, fecha_compra
order by fecha_compra limit 1*/


/* 2.Consolidado mensual y anual de la editorial de la cual se han vendido más libros en cada sucursal */

select e.codigo, e.nombre, COUNT(e.codigo) as total
FROM editorial e INNER JOIN libro l on e.codigo = l.editorial INNER JOIN sucursal_libro sl on l.codigo = sl.codigo_libro INNER JOIN sucursal s on sl.nombre_sucursal = s.nombre INNER JOIN venta v on sl.codigo = v.codigo_sucursal_libro 
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31' and s.nombre = 'Libreria Medellin'
GROUP by e.codigo, e.nombre
 order by total desc;

/* 2.Consolidado mensual y anual de la editorial de la cual se han vendido más libros en cada sucursal */
select s.nombre, e.nombre, COUNT(e.codigo) as total
FROM editorial e INNER JOIN libro l on e.codigo = l.editorial INNER JOIN sucursal_libro sl on l.codigo = sl.codigo_libro INNER JOIN sucursal s on sl.nombre_sucursal = s.nombre INNER JOIN venta v on sl.codigo = v.codigo_sucursal_libro 
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
GROUP by e.codigo, e.nombre, s.nombre
order by s.nombre;

/*select e.codigo, e.nombre, COUNT(e.codigo) as total
from venta v join sucursal_libro sl on v.codigo_sucursal_libro = sl.codigo join libro l on sl.codigo_libro = l.codigo join editorial e on e.codigo = l.editorial
 GROUP by e.codigo, e.nombre
 order by total desc;


 select sl.codigo
 from sucursal_libro sl join libro l on sl.codigo_libro = l.codigo join editorial e on e.codigo = l.editorial 
 where e.codigo = 1;*/


 /* 3. Datos de los clientes nuevos. Estos datos organizados por sucursal en un mes particular. */

select c.identificacion, c.nombre, s.nombre
from cliente c INNER JOIN ciudad ci on c.codigo_ciudad_residencia = ci.codigo INNER JOIN venta v on v.identificacion_cliente = c.identificacion JOIN sucursal_libro sl on sl.codigo = v.codigo_sucursal_libro JOIN sucursal s on s.nombre = sl.nombre_sucursal
where identificacion not in(
    select identificacion from cliente c join venta v on v.identificacion_cliente = c.identificacion 
    where fecha_compra < '2020-03-01'
)
and fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
order by s.nombre;

/* 4.Libros más comprados en un mes particular a nivel nacional por cada sucursal. */

/* Libros más comprados a nivel nacional */
select l.titulo, COUNT(l.titulo) as Vendidos
from libro l join sucursal_libro sl on l.codigo = sl.codigo_libro join venta v on v.codigo_sucursal_libro = sl.codigo join sucursal s on s.nombre = sl.nombre_sucursal
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
GROUP BY l.titulo
order by vendidos desc;

/* Libros más comprados por sucursal */
select l.titulo, COUNT(l.titulo) as Vendidos
from libro l join sucursal_libro sl on l.codigo = sl.codigo_libro join venta v on v.codigo_sucursal_libro = sl.codigo join sucursal s on s.nombre = sl.nombre_sucursal
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31' and s.nombre = 'Libreria Medellin'
GROUP BY l.titulo
order by vendidos desc;


/* Libros más comprados a nivel nacional organizados por sucursal*/
select l.titulo, s.nombre, COUNT(l.titulo) as Vendidos
from libro l join sucursal_libro sl on l.codigo = sl.codigo_libro join venta v on v.codigo_sucursal_libro = sl.codigo join sucursal s on s.nombre = sl.nombre_sucursal
where fecha_compra BETWEEN '2020-03-01' and '2020-03-31'
GROUP BY l.titulo, s.nombre
order by s.nombre, vendidos desc;

/* 5.Datos de los empleados a   nivel nacional organizados por sucursal y   por cargo de tal forma que sea posible identificar el empleado con mayor y   menor antigüedad. */

select e.codigo, e.documento, e.nombre, e.salario, e.fecha_de_nacimiento, e.fecha_de_contratacion, c.cargo, s.nombre
from empleado e join cargo c on e.codigo_cargo = c.codigo join sucursal s on e.nombre_sucursal = s.nombre 
GROUP BY e.codigo, s.nombre, c.cargo
ORDER BY s.nombre, fecha_de_contratacion ASC;