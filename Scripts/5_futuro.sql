/* 
EJECUTAR ESTO CONECTADO A LA BASE DE DATOS DE INTERÉS.

Desde la consola de psql se puede seleccionar 
a que base de datos conectarse usando el comando:

    \c nombre_bd

 */


/* Creación de roles */


/* Funcion de registro de usuarios*/
create function futuro.registrar_usuario(
  mobility bit,
  email varchar(40),
  age integer,
  gender varchar(10),
  blood_type varchar(20),
  phone integer,
  ocupation_id integer    
) returns futuro.usuarios as $$
declare
  usuario futuro.usuarios;
begin
  insert into futuro.usuarios (nombre,nomusuario,apellidos, email,tipo) values
    (nombre,nomusuario,apellidos, email,tipo)
    returning * into usuario;

  insert into futuro_priv.usuarios (id_usuario,password_hash) values
    (usuario.id,futuro.crypt(password, futuro.gen_salt('bf')));
  insert into futuro.alias (cu,id_usuario) values
    (cu,usuario.id);
  return usuario;
end;
$$ language plpgsql strict security definer;

comment on function futuro.registrar_usuario(varchar(50), varchar(50), text, varchar(5),varchar(50),varchar(50),integer) is 'Registera un usuario.';


/* Funcion para formar nombre completo de un usuario */
create function futuro.nom_comp_usuario(usuario futuro.usuarios) returns text as $$
  select usuario.nombre || ' ' || usuario.apellidos
$$ language sql stable;

comment on function futuro.nom_comp_usuario(futuro.usuarios) is 'Regresa el nombre completo de un usuario dado';

/* Creamos tipo compuesto para nuestro token JWT de autenticacion. */
create type futuro.jwt_token as (
  role text,
  id_usuario integer,
  exp integer
);

/* Funcion de autenticacion de usuarios */
create function futuro.autenticacion(
  cu integer,
  password text
) returns futuro.jwt_token as $$
declare
  cuenta futuro_priv.usuarios;
begin
  select u.* into cuenta
  from futuro_priv.usuarios as u, futuro.alias as a
  where u.id_usuario = a.id_usuario and a.cu=$1;

  if cuenta.password_hash = futuro.crypt(password, cuenta.password_hash) then
    return ('futuro_usuario', cuenta.id_usuario,extract(epoch from (now() + interval '30 minutes')))::futuro.jwt_token;
  else
    return null;
  end if;
end;
$$ language plpgsql strict security definer;

comment on function futuro.autenticacion(integer, text) is 'Crea un JWT token que identificara de manera segura a un usuario registrado.' ;


/* Funcion para obtener al usuario activo */
create function futuro.usuario_activo() returns futuro.usuarios as $$
  select *
  from futuro.usuarios
  where id = current_setting('jwt.claims.id_usuario')::integer
$$ language sql stable;

comment on function futuro.usuario_activo() is 'Obtiene al usuario identificado por nuestro JWT.';


/* Triggers y funciones de ultima actualizacion de tablas */
create function futuro.set_ultima_act() returns trigger as $$
begin
  new.updated_at := current_timestamp;
  return new;
end;
$$ language plpgsql;

create trigger usuarios_ult_act before update
  on futuro.usuarios
  for each row
  execute procedure futuro.set_ultima_act();

create trigger alias_ult_act before update
  on futuro.alias
  for each row
  execute procedure futuro.set_ultima_act();

create trigger docs_ult_act before update
  on futuro.documentos
  for each row
  execute procedure futuro.set_ultima_act();

create trigger docs_us_ult_act before update
  on futuro.documento_usuarios
  for each row
  execute procedure futuro.set_ultima_act();

create trigger grupos_ult_act before update
  on futuro.grupos
  for each row
  execute procedure futuro.set_ultima_act();

create trigger grupo_us_ult_act before update
  on futuro.grupo_usuarios
  for each row
  execute procedure futuro.set_ultima_act();

create trigger llaves_ult_act before update
  on futuro.llaves
  for each row
  execute procedure futuro.set_ultima_act();

create trigger materias_ult_act before update
  on futuro.materias
  for each row
  execute procedure futuro.set_ultima_act();




/* Permisos de funciones */


grant execute on function futuro.nom_comp_usuario(futuro.usuarios) to futuro_usuario;
grant execute on function futuro.autenticacion(integer, text) to futuro_anonimo, futuro_usuario;
grant execute on function futuro.usuario_activo() to futuro_anonimo, futuro_usuario;

grant execute on function futuro.registrar_usuario(varchar(50), varchar(50), text, varchar(5),varchar(50),varchar(50),integer) to futuro_anonimo;