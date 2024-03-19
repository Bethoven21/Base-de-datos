create database Bdpractica4
go

use Bdpractica4
go

create table categoria(
categoriaID int not null,
numeroInventario int not null,
descripcion varchar (100) not null,
constraint pk_categoriaID
primary key(categoriaID,numeroInventario)
)
go

create table producto(
productoID int not null,
descripcion varchar (100) not null,
precio decimal(10,2) not null,
cantidad int not null,
categoriaID int not null,
numeroInventario int not null,
constraint pk_productoID
primary key(productoID),
constraint fk_producto_categoria
foreign key(categoriaID,numeroInventario)
references categoria(categoriaID,numeroInventario)
)
go