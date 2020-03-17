create database libreria;

\c libreria;

create table ciudad(
    codigo int not null,
    ciudad varchar(25) not null,
    primary key(codigo)
);

create table sucursal(
    nombre varchar(50) not null,
    ciudad int not null,
    primary key(nombre),
	foreign key(ciudad) references ciudad(codigo)
);

create table telefono_sucursal(
    telefono varchar(20) unique not null,
    nombre_sucursal varchar(50) not null,
    foreign key(nombre_sucursal) references sucursal(nombre),
    primary key(telefono, nombre_sucursal)
);

create table cargo(
    codigo int not null,
    cargo varchar(40) not null,
    primary key(codigo)
);

create table empleado(
    codigo int not null,
    documento int not null unique,
    nombre varchar(30) not null,
    salario real not null,
	fecha_de_nacimiento date not null,
    fecha_de_contratacion date not null,
    codigo_cargo int not null,
    nombre_sucursal varchar(40) not null,
    foreign key(nombre_sucursal) references sucursal(nombre),
    primary key(codigo)
);

create table telefono_empleado(
    telefono varchar(20) unique not null,
    codigo_empleado int not null,
    foreign key(codigo_empleado) references empleado(codigo),
    primary key(telefono,codigo_empleado)
);

create table sexo(
    codigo int not null,
    sexo varchar(2) not null,
    primary key(codigo)
);

create table autor(
    identificacion int not null,
    nombre varchar(50) not null,
    e_mail varchar(50),
    codigo_sexo int,
    foreign key(codigo_sexo) references sexo(codigo),
    primary key(identificacion)
);

create table telefono_autor(
    telefono varchar(20) unique not null,
    identificacion_autor int not null,
    foreign key(identificacion_autor) references autor(identificacion),
    primary key(telefono,identificacion_autor)
);

create table editorial(
    codigo int not null,
    nombre varchar(60) not null,
    primary key(codigo)
);

create table libro(
    codigo int not null,
    isbn varchar(13) not null unique,
    titulo text not null,
    nro_paginas int not null,
    editorial int not null,
    identificacion_autor int not null, 
    foreign key(editorial) references editorial(codigo),
    foreign key(identificacion_autor) references autor(identificacion),
    primary key(codigo)
);

create table sucursal_libro(
	codigo int not null,
	nombre_sucursal varchar(50) not null,
	codigo_libro int not null,
    cantidad_ejemplares int not null,
	primary key(codigo),
	foreign key(nombre_sucursal) references sucursal(nombre),
	foreign key(codigo_libro) references libro(codigo)
);


create table cliente(
    identificacion int not null,
    nombre varchar(50) not null,
    e_mail varchar(30),
    codigo_ciudad_residencia int not null,
    foreign key(codigo_ciudad_residencia) references ciudad(codigo),
    primary key(identificacion)
);

create table venta(
	codigo int not null,
	codigo_sucursal_libro int not null,
	identificacion_cliente int not null,
	fecha_compra date not null DEFAULT CURRENT_DATE, 
	primary key(codigo),
	foreign key(codigo_sucursal_libro) references sucursal_libro(codigo),
	foreign key(identificacion_cliente) references cliente(identificacion)
);

create table telefono_cliente(
    telefono varchar(20) not null,
    identificacion_cliente int not null,
    foreign key(identificacion_cliente) references cliente(identificacion),
    primary key(telefono,identificacion_cliente) 
);







/*Modificar columna de una tabla*/
alter table libro alter column isbn type  int using isbn::integer;
alter table libro alter column isbn set data type text;

alter table libro DROP column cantidad_ejemplares;
alter table cliente drop column fecha_primera_compra;
alter table cliente drop column codigo_libro;