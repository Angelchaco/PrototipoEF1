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

<<<<<<< HEAD
drop trigger Bitacora_Guardar;

insert into inventario values(0,1,1,1,1,"comida","A",250,150,100,"prueba bitacora",5/11/19);

delimiter //

create trigger Bitacora_Guardar after insert on inventario
for each row
begin
	if new.id_inventario > 1 then
		insert into BitacoraAcciones values (0, "Nuevo Registro Guardado", now());
    end if;
end;

//
=======
#drop trigger Bitacora_Acciones;

CREATE TRIGGER Bitacora_Guardar AFTER INSERT ON inventario FOR EACH ROW INSERT INTO BitacoraAcciones values (0, "Nuevo Registro Guardado", now());
>>>>>>> master

CREATE TRIGGER Bitacora_Modificar AFTER UPDATE ON inventario FOR EACH ROW INSERT INTO BitacoraAcciones values (0, "Registro Modificado", now());

CREATE TRIGGER Bitacora_Borrado AFTER DELETE ON inventario FOR EACH ROW INSERT INTO BitacoraAcciones values (0, "Registro Eliminado", now());