CREATE DATABASE bdlocal;

\c bdlocal

create table empleado(
    id int not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    cargo varchar(50) not null,
    salario real NULL,
    ciudad varchar(50) not null,
    PRIMARY KEY(id)
);


// registros en local

insert into empleado(id, nombre, apellido, cargo, salario, ciudad) values (1, 'Pepe', 'Perez', 'Vendedor', 1000000, 'Bogota');
insert into empleado(id, nombre, apellido, cargo, salario, ciudad) values (2, 'Juana', 'Gonzalez', 'Gerente', 2000000, 'Bogota');


// registros en Remota

insert into empleado(id, nombre, apellido, cargo, salario, ciudad) values (1, 'Maria', 'Castillo', 'Vendedor', 1000000, 'Medellin');
insert into empleado(id, nombre, apellido, cargo, salario, ciudad) values (1, 'Juan', 'Garcia', 'Gerente', 2000000, 'Medellin');