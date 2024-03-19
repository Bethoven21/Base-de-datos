--SQL-LDD--
--Crear la base de datos Practica1.1

CREATE DATABASE Practica1uno
go

-- cambiar a la base de datos
USE Practica1uno
go

--Crear una tabla contacto
Create table Contacto  (
	contactoId int not null ,
	descripcion varchar (100) not null,
	constraint pk_tblcontacto
	primary key (categoriaId),
	constraint unique_descripcion
	unique(descripcion)
)
go