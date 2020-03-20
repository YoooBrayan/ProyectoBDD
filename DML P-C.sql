        /*  insercion de datos en la tabla ciudad. */

    insert into ciudad values (3, 'Pasto'), (4, 'Cali');

    /*  insercion de datos en la tabla sucursal. */

    insert into sucursal values 
                        ('Libreria Pasto', 3),
                        ('Libreria Cali', 4);

    /*  Insercion de datos en a tabla cargo. */

    insert into cargo values
        (1, 'Gerente'),
        (2, 'Vendedor');
        
    /* insercion de datos en la tabla empleado */


    insert into empleado values 
        (9000, 1036, 'Pablo', 3000000, '1990-05-12', '2020-01-01', 1, 'Libreria Pasto'),
        (1100, 1037, 'Daniel', 2000000, '1992-06-11', '2020-02-01', 2, 'Libreria Pasto'),
        (3100, 1038, 'Adrian', 3000000, '1991-05-14', '2020-01-01', 1, 'Libreria Cali'),
        (4100, 1039, 'Angela', 1500000, '1994-07-17', '2020-05-12', 2, 'Libreria Pasto'),
        (5100, 1041, 'Henry', 2000000, '1991-02-13', '2020-06-02', 2, 'Libreria Pasto'),
        (6100, 1042, 'Oliver', 1000000, '1992-06-17', '2020-03-01', 2, 'Libreria Cali'),
        (7100, 1043, 'Alejandra', 1600000, '1994-09-13', '2020-01-06', 2, 'Libreria Cali'),
        (8100, 1044, 'Simon', 1800000, '1996-12-23', '2020-01-31', 2, 'Libreria Cali');
                    

    /* insercion de datos en tabla telefono_empleado */

    insert into telefono_empleado values 
        (1234567,9000),
        (5346512,1100),
        (3219784,3100),
        (1349824,4100),
        (7981423,5100),
        (5423917,6100),
        (4312890,7100),
        (2419383,8100);

    /* Insercion  de datos en la tabla sexo*/

    insert into sexo VALUES
        (1, 'F'),
        (2, 'M');


    /* Insercion  de datos en la tabla Autor Replicar

    insert into autor values 
        (6, 'Mario Mendoza', 'MM@gmai.com', 1),
        (7, 'William Ospina', 'WO@gmai.com', 1),
        (8, 'Renán Vega', 'RV@gmai.com', 1),
        (9, 'Soledad Acosta', 'SA@gmai.com', 2),
        (10, 'Isabel Allende', 'IA@gmai.com', 2); */

    /* Insercion  de datos en la tabla editorial replicar  

    insert into editorial values    
        (1, 'Planeta'),
        (2, 'Anagrama');
        */

    /* Insercion  de datos en la tabla libro Replicar

    insert into libro values 
        (1, '9789584240002', 'Relato de un asesino', 189, 1, 1),
        (2, '9788576654629', 'Satanas', 128, 1, 1),
        (3, '9789535435532', 'La lampara maravillosa', 112, 1, 2),
        (4, '9784756345345', 'El capitaloceno', 221, 2, 3),
        (5, '9534534534542', 'Una holandesa en amarica', 125, 2, 4),
        (6, '9789583453422', 'La casa de los espiritus', 134, 2, 5),
        (7, '9789587654432', 'Hija de la fortuna', 144, 2, 5),
        (8, '9789654838452', 'La universidad de la ignorancia', 33, 1, 3);

        */

    /* Insercion  de datos en la tabla sucursal_libro */

    insert into sucursal_libro VALUES
        (17, 'Libreria Pasto', 1, 11),
        (18, 'Libreria Pasto', 2, 8),
        (19, 'Libreria Pasto', 3, 12),
        (20, 'Libreria Pasto', 4, 8),
        (21, 'Libreria Pasto', 5, 8),
        (22, 'Libreria Pasto', 6, 4),
        (23, 'Libreria Pasto', 7, 12),
        (24, 'Libreria Pasto', 8, 11),
        (25, 'Libreria Cali', 1, 11),
        (26, 'Libreria Cali', 2, 12),
        (27, 'Libreria Cali', 3, 14),
        (28, 'Libreria Cali', 4, 7),
        (29, 'Libreria Cali', 5, 9),
        (30, 'Libreria Cali', 6, 9),
        (31, 'Libreria Cali', 7, 4),
        (32, 'Libreria Cali', 8, 6);
        

    /* Insercion  de datos en la tabla cliente  Replicar*/

    insert into cliente values 
        (1050, 'Julian', 'julian@gmail.com', 3),
        (1051, 'Juliana', 'juliana@gmail.com', 4),
        (1052, 'Valentina', 'valentina@gmail.com', 4),
        (1053, 'Miguel', 'miguel@gmail.com', 3);

    /* Insercion  de datos en la tabla telefono_cliente */

    insert into telefono_cliente values 
        (1247866, 1050),
        (7886666, 1051),
        (4347766, 1052),
        (6843366, 1053);

    /* Insercion  de datos en la tabla venta(codigo, codigo_sucursal_libro, codigo_cliente) */


    insert into venta VALUES
        (1, 17, 1050, '2019-12-11');

    insert into venta VALUES
        (2, 18, 1051),
        (3, 19, 1051),
        (4, 30, 1052),
        (5, 31, 1053);
