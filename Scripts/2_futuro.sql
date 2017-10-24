/* 
EJECUTAR ESTO CONECTADO A LA BASE DE DATOS DE INTERÉS.

Desde la consola de psql se puede seleccionar 
a que base de datos conectarse usando el comando:

    \c nombre_bd

 */


/* Creación de roles */
create role futuro_admin superuser login PASSWORD 'admin';
CREATE ROLE futuro_pgql LOGIN PASSWORD 'admin';
CREATE ROLE futuro_anonimo;
CREATE ROLE futuro_usuario;
grant futuro_anonimo to futuro_pgql;
grant futuro_usuario to futuro_pgql;