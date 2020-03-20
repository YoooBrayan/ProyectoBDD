        /*  insercion de datos en la tabla ciudad. */

    insert into ciudad values (5, 'Santa Marta'), (6, 'Riohacha'), (7, 'Barranquilla'), (8, 'Cartagena');

    /*  insercion de datos en la tabla sucursal. */

    insert into sucursal values 
                        ('Libreria Santa Marta', 5),
                        ('Libreria Riohacha', 6),
                        ('Libreria Barranquilla', 7),
                        ('Libreria Cartagena', 8);

    /*  Insercion de datos en a tabla cargo. */

    insert into cargo values
        (1, 'Gerente'),
        (2, 'Vendedor');
        
    /* insercion de datos en la tabla empleado */


    insert into empleado values 
        (9001, 1045, 'Elena', 3000000, '1990-05-12', '2019-12-01', 1, 'Libreria Santa Marta'),
        (1101, 1046, 'Alicia', 2000000, '1992-06-11', '2019-12-21', 2, 'Libreria Santa Marta'),
        (3101, 1047, 'Eduardo', 3000000, '1991-05-14', '2019-11-01', 1, 'Libreria Riohacha'),
        (4101, 1048, 'Emilio', 1500000, '1994-07-17', '2019-11-12', 2, 'Libreria Riohacha'),
        (5101, 1049, 'Alejandra', 2000000, '1991-02-13', '2020-02-02', 1, 'Libreria Barranquilla'),
        (6101, 1051, 'Esteban', 1000000, '1992-06-17', '2020-03-01', 2, 'Libreria Barranquilla'),
        (7101, 1052, 'Eva', 1200000, '1994-09-13', '2020-01-16', 2, 'Libreria Cartagena'),
        (8101, 1053, 'Aleja', 1800000, '1996-12-23', '2020-01-11', 1, 'Libreria Cartagena');
                    

    /* insercion de datos en tabla telefono_empleado */

    insert into telefono_empleado values 
        (1456267,9001),
        (5337812,1101),
        (3222284,3101),
        (2229824,4101),
        (3331423,5101),
        (4443917,6101),
        (8888890,7101),
        (8889383,8101);

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
        (40, 'Libreria Santa Marta', 1, 7),
        (33, 'Libreria Santa Marta', 2, 3),
        (34, 'Libreria Santa Marta', 3, 2),
        (35, 'Libreria Santa Marta', 4, 6),
        (36, 'Libreria Santa Marta', 5, 6),
        (37, 'Libreria Santa Marta', 6, 4),
        (38, 'Libreria Santa Marta', 7, 12),
        (39, 'Libreria Santa Marta', 8, 11),
        (41, 'Libreria Riohacha', 1, 15),
        (42, 'Libreria Riohacha', 2, 7),
        (43, 'Libreria Riohacha', 3, 7),
        (44, 'Libreria Riohacha', 4, 15),
        (45, 'Libreria Riohacha', 5, 23),
        (46, 'Libreria Riohacha', 6, 21),
        (47, 'Libreria Riohacha', 7, 9),
        (48, 'Libreria Riohacha', 8, 11),
        (17, 'Libreria Barranquilla', 1, 23),
        (33, 'Libreria Barranquilla', 2, 9),
        (34, 'Libreria Barranquilla', 3, 8),
        (35, 'Libreria Barranquilla', 4, 7),
        (36, 'Libreria Barranquilla', 5, 7),
        (37, 'Libreria Barranquilla', 6, 4),
        (38, 'Libreria Barranquilla', 7, 15),
        (39, 'Libreria Barranquilla', 8, 15),
        (41, 'Libreria Cartagena', 1, 14),
        (42, 'Libreria Cartagena', 2, 14),
        (43, 'Libreria Cartagena', 3, 12),
        (44, 'Libreria Cartagena', 4, 8),
        (45, 'Libreria Cartagena', 5, 12),
        (46, 'Libreria Cartagena', 6, 11),
        (47, 'Libreria Cartagena', 7, 16),
        (48, 'Libreria Cartagena', 8, 16);
        

    /* Insercion  de datos en la tabla cliente  Replicar*/

    insert into cliente values 
        (1054, 'Elisa', 'elisa@gmail.com', 5),
        (1055, 'Elias', 'elias@gmail.com', 5),
        (1056, 'Elsa', 'elsa@gmail.com', 6),
        (1057, 'Emilio', 'emilio@gmail.com', 6),
        (1058, 'Enrique', 'enrique@gmail.com', 7),
        (1059, 'Maria', 'maria@gmail.com', 7),
        (1061, 'Valentina', 'valentina@gmail.com', 8),
        (1062, 'Juana', 'juana@gmail.com', 8);

    /* Insercion  de datos en la tabla telefono_cliente */

    insert into telefono_cliente values 
        (1111866, 1054),
        (5556666, 1054),
        (4557766, 1056),
        (67773366, 1057),
        (1288866, 1058),
        (2232666, 1059),
        (8888766, 1061),
        (2368466, 1062);

    /* Insercion  de datos en la tabla venta(codigo, codigo_sucursal_libro, codigo_cliente) */


    insert into venta VALUES
        (1, 17, 1054, '2019-12-03'),
        (2, 18, 1055),
        (3, 19, 1056),
        (4, 30, 1057),
        (5, 31, 1058),
        (1, 17, 1059, '2019-12-03'),
        (2, 18, 1061),
        (3, 19, 1062),
        (4, 30, 1054),
        (5, 31, 1058);
