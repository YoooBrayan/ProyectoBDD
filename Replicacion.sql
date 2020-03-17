/* Creae Rol */

create role replica REPLICATION LOGIN PASSWORD '123456';

GRANT all on autor to replica;

/* Publicaciones Maestro */

/* Publicacion de autor */
CREATE PUBLICATION public_autor FOR TABLE autor


/* Publicaciones Esclavo */










/* Subscripciones Esclavo */

/* Subscripcion de autor */
create subscription sub_autor
connection 'host=192.168.0.15 port=5433 user=replica dbnama=libreria password=123456'
publication public_autor;


/* Subscripciones Maestro */