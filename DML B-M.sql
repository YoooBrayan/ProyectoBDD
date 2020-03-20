    /*  insercion de datos en la tabla ciudad. */

    insert into ciudad values (1, 'Bogota'), (2, 'Medellin');

    /*  insercion de datos en la tabla sucursal. */

    insert into sucursal values 
                        ('Libreria Bogotá', 1),
                        ('Libreria Medellin', 2);

    /*  Insercion de datos en a tabla cargo. */

    insert into cargo values
        (1, 'Gerente'),
        (2, 'Vendedor');
        
    /* insercion de datos en la tabla empleado */


    insert into empleado values 
        (1000, 1024, 'Pepe', 3000000, '1990-05-12', '2020-01-15', 1, 'Libreria Bogotá'),
        (2000, 1025, 'Juan', 2000000, '1992-06-11', '2020-02-15', 2, 'Libreria Bogotá'),
        (3000, 1026, 'Maria', 3000000, '1991-05-14', '2020-01-18', 1, 'Libreria Medellin'),
        (4000, 1027, 'Laura', 1500000, '1994-07-17', '2020-05-15', 2, 'Libreria Bogotá'),
        (5000, 1028, 'Camio', 2000000, '1991-02-13', '2020-06-15', 2, 'Libreria Bogotá'),
        (6000, 1029, 'Diego', 1000000, '1992-06-17', '2020-03-15', 2, 'Libreria Medellin'),
        (7000, 1034, 'Isabell', 1600000, '1994-09-13', '2020-01-23', 2, 'Libreria Medellin'),
        (8000, 1035, 'Carlos', 1800000, '1996-12-23', '2020-01-25', 2, 'Libreria Medellin');
                    

    /* insercion de datos en tabla telefono_empleado */

    insert into telefono_empleado values 
        (1234567,1000),
        (5346512,2000),
        (3219784,3000),
        (1349824,4000),
        (7981423,5000),
        (5423917,6000),
        (4312890,7000),
        (2419383,8000);

    /* Insercion  de datos en la tabla sexo*/

    insert into sexo VALUES
        (1, 'F'),
        (2, 'M');

    /* Insercion  de datos en la tabla Autor*/

    insert into autor values 
        (7, 'Dante', 'dante@gmai.com', 1),
        (2, 'William Ospina', 'WO@gmai.com', 1),
        (3, 'Renán Vega', 'RV@gmai.com', 1),
        (4, 'Soledad Acosta', 'SA@gmai.com', 2),
        (5, 'Isabel Allende', 'IA@gmai.com', 2);

    /* Insercion  de datos en la tabla editorial*/

    insert into editorial values    
        (1, 'Planeta'),
        (2, 'Anagrama');

    /* Insercion  de datos en la tabla libro*/

    insert into libro values 
        (1, '9789584240002', 'Relato de un asesino', 189, 1, 1),
        (2, '9788576654629', 'Satanas', 128, 1, 1),
        (3, '9789535435532', 'La lampara maravillosa', 112, 1, 2),
        (4, '9784756345345', 'El capitaloceno', 221, 2, 3),
        (5, '9534534534542', 'Una holandesa en amarica', 125, 2, 4),
        (6, '9789583453422', 'La casa de los espiritus', 134, 2, 5),
        (7, '9789587654432', 'Hija de la fortuna', 144, 2, 5),
        (8, '9789654838452', 'La universidad de la ignorancia', 33, 1, 3);

    /* Insercion  de datos en la tabla sucursal_libro */

    insert into sucursal_libro VALUES
        (1, 'Libreria Bogotá', 1, 11),
        (2, 'Libreria Bogotá', 2, 8),
        (3, 'Libreria Bogotá', 3, 12),
        (4, 'Libreria Bogotá', 4, 8),
        (5, 'Libreria Bogotá', 5, 8),
        (6, 'Libreria Bogotá', 6, 4),
        (7, 'Libreria Bogotá', 7, 12),
        (8, 'Libreria Bogotá', 8, 11),
        (9, 'Libreria Medellin', 1, 11),
        (10, 'Libreria Medellin', 2, 12),
        (11, 'Libreria Medellin', 3, 14),
        (12, 'Libreria Medellin', 4, 7),
        (13, 'Libreria Medellin', 5, 9),
        (14, 'Libreria Medellin', 6, 9),
        (15, 'Libreria Medellin', 7, 4),
        (16, 'Libreria Medellin', 8, 6);
        

    /* Insercion  de datos en la tabla cliente */

    insert into cliente values 
        (1044, 'Pepito', 'pepito@gmail.com', 1),
        (1045, 'Claudia', 'Claudia@gmail.com', 1),
        (1046, 'Sofia', 'sofia@gmail.com', 2),
        (1047, 'Felipe', 'felipe@gmail.com', 2),
        (1048, 'Karen', 'karen@gmail.com', 2),
        (1049, 'Juana', 'juana@gmail.com', 1);

    /* Insercion  de datos en la tabla telefono_cliente */

    insert into telefono_cliente values 
        (1244566, 1044),
        (7889566, 1045),
        (4344566, 1046),
        (6844566, 1047),
        (9244566, 1048),
        (8444566, 1049);

    /* Insercion  de datos en la tabla venta */


    insert into venta VALUES
        (1, 1, 1044, '2019-12-12');
        
    insert into venta VALUES
        (2, 2, 1044),
        (3, 3, 1045),
        (4, 9, 1048),
        (5, 12, 1048),
        (6, 11, 1046);

    insert into venta VALUES
        (7, 13, 1047, '2019-12-24');

    insert into venta values (8, 1, 1046);
    insert into venta values (9, 14, 1045);
    insert into venta values (10, 12, 1049);
    
    insert into venta values (11, 14, 1044);
    insert into venta values (12, 12, 1047);
    insert into venta values (13, 14, 1045);
    insert into venta values (14, 12, 1049);

    insert into venta values (16, 1, 1045);
    insert into venta values (17, 4, 1049);

    insert into venta values (18, 2, 1045);
    insert into venta values (19, 3, 1049);
    insert into venta values (20, 16, 1046);