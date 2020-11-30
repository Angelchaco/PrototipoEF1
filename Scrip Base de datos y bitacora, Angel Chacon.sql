use hotel;

create table usuarios(
Usuario varchar(30) not null,
Contrasenia varchar(30) not null
)engine = InnoDB default charset = latin1;

insert into usuarios values ("ADM","123");
select * from usuarios;

create table BitacoraAcciones(
idbitacora int primary key not null auto_increment,
Operacion varchar(50) not null,
fecha datetime not null
)engine = InnoDB default charset = latin1;

select * from BitacoraAcciones;

#drop trigger Bitacora_Acciones;

CREATE TRIGGER Bitacora_Guardar AFTER INSERT ON inventario FOR EACH ROW INSERT INTO BitacoraAcciones values (0, "Nuevo Registro Guardado", now());

CREATE TRIGGER Bitacora_Modificar AFTER UPDATE ON inventario FOR EACH ROW INSERT INTO BitacoraAcciones values (0, "Registro Modificado", now());

CREATE TRIGGER Bitacora_Borrado AFTER DELETE ON inventario FOR EACH ROW INSERT INTO BitacoraAcciones values (0, "Registro Eliminado", now());