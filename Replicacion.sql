/*Pasos:
1. Modificar postresql.conf  en Maestro y esclavo --> wal-level replica --> reiniciar servicios
2. añadir la ip a ph_hba
3. Crear rol replica con permisos de replication
4. otorgarle permisos al rol replica sobre la tabla a la que se le va hacer replicada
*/


/* Creae Rol */

create role replica REPLICATION LOGIN PASSWORD '123456';


/* Publicaciones Maestro */

/* Publicacion de autor */
GRANT all on autor to replica;
CREATE PUBLICATION public_autor FOR TABLE autor;


/* Publicacion de libro */
GRANT all on libro to replica; --> esto se hace con el usuario postgres
CREATE PUBLICATION public_libro FOR TABLE libro


/* Publicacion de editorial */
GRANT all on editorial to replica;
CREATE PUBLICATION public_editorial FOR TABLE editorial;


/* Publicaciones Esclavo */










/* Subscripciones Esclavo */

/* Subscripcion de autor  5433*/
create subscription sub_autor
connection 'host=127.0.0.1 port=5432 user=replica dbname=libreria password=123456'
publication public_autor;


/* Subscripcion de autor  5434*/
create subscription subs_autor
connection 'host=127.0.0.1 port=5432 user=replica dbname=libreria password=123456'
publication public_autor;


/* Subscripcion de editorial 5434*/
create subscription subs_editorial
connection 'host=127.0.0.1 port=5432 user=replica dbname=libreria password=123456'
publication public_editorial;

/* Subscripcion de editorial */
create subscription sub_libro
connection 'host=127.0.0.1 port=5432 user=replica dbname=libreria password=123456'
publication public_libro;

/* Subscripcion de editorial 5434*/
create subscription subs_libro
connection 'host=127.0.0.1 port=5432 user=replica dbname=libreria password=123456'
publication public_libro;




/* Subscripciones Maestro */