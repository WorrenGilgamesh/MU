/* 
EJECUTAR ESTO CONECTADO A LA BASE DE DATOS DE INTERÉS.

Desde la consola de psql se puede seleccionar 
a que base de datos conectarse usando el comando:

    \c nombre_bd

 */


/* Creación de roles */




/* Definimos permisos y privilegios para nuestros roles. */

alter default privileges revoke execute on functions from public;

grant usage on schema futuro to futuro_anonimo, futuro_usuario,futuro_pgql;

GRANT ALL PRIVILEGES ON futuro.requests_request_volunteer TO futuro_usuario;
grant select on table futuro.requests_request_volunteer to  futuro_usuario;
grant update, delete on table futuro.requests_request_volunteer to futuro_usuario;

GRANT ALL PRIVILEGES ON futuro.items_type TO futuro_usuario;
grant select on table futuro.items_type to futuro_usuario;
grant update, delete on table futuro.items_type to futuro_usuario;

GRANT ALL PRIVILEGES ON futuro.rysk_type TO futuro_usuario;
grant select on table futuro.rysk_type to futuro_usuario;
grant update, delete on table futuro.rysk_type to futuro_usuario;

GRANT ALL PRIVILEGES ON futuro.itemsRequest TO futuro_usuario;
grant select on table futuro.itemsRequest to futuro_usuario;
grant update, delete on table futuro.itemsRequest to futuro_usuario;

GRANT ALL PRIVILEGES ON futuro.countries_state TO futuro_usuario;
grant select on table futuro.countries_state to futuro_usuario;
grant update, delete on table futuro.countries_state to futuro_usuario;

GRANT ALL PRIVILEGES ON futuro.risk_points_riskpoint TO futuro_usuario;
grant select on table futuro.risk_points_riskpoint to futuro_usuario;
grant update, delete on table futuro.risk_points_riskpoint to futuro_usuario;

GRANT ALL PRIVILEGES ON futuro.requests_request TO futuro_usuario;
grant select on table futuro.requests_request to futuro_usuario;
grant update, delete on table futuro.requests_request to futuro_usuario;

GRANT ALL PRIVILEGES ON futuro.requests_item TO futuro_usuario;
grant select on table futuro.requests_item to futuro_usuario;
grant update, delete on table futuro.requests_item to futuro_usuario;

GRANT ALL PRIVILEGES ON futuro.requests_request_ocupation TO futuro_usuario;
grant select on table futuro.requests_request_ocupation to futuro_usuario;
grant update, delete on table futuro.requests_request_ocupation to futuro_usuario;

GRANT ALL PRIVILEGES ON futuro.requests_request_volunteer TO futuro_usuario;
grant select on table futuro.requests_request_volunteer to futuro_usuario;
grant update, delete on table futuro.requests_request_volunteer to futuro_usuario;


/* Designamos politicas de seguridad por tuplas*/


/* Un usuario registrado puede unicamente alterar sus propios datos.*/
alter table futuro.usuarios enable row level security;

CREATE POLICY ver_todos ON futuro.usuarios FOR SELECT to futuro_usuario USING (true);

create policy modifica_usuario on futuro.usuarios for update to futuro_usuario
  using (id = current_setting('jwt.claims.id_usuario')::integer);

create policy elimina_usuario on futuro.usuarios for delete to futuro_usuario
  using (id = current_setting('jwt.claims.id_usuario')::integer);
