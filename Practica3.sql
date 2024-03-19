create database Bdpractica3
go

use Bdpractica3
go

create table cliente(
IDcliente int not null,
nombreC varchar(100) not null,
direccionC varchar(100) not null,
telefonoC varchar(20) not null,
constraint pk_IDcliente
primary key(IDcliente),
constraint unique_nombreC
unique(nombreC)
)
go

create table empleado(
IDempleado int not null,
nombreE varchar(50) not null,
ApellidosE varchar(80) not null,
sexo char(1) not null,
salario decimal(10,2) not null,
constraint pk_IDempleado
primary key(IDempleado),
constraint chk_salario
check (salario >= 400 and salario <= 50000)
)
go

create table venta(
IDventa int not null,
fecha date not null,
IDcliente int not null,
IDempleado int not null,
constraint pk_IDventa
primary key(IDventa),
constraint fk_IDcliente
foreign key(IDcliente)
references cliente(IDcliente),
constraint fk_IDempleado
foreign key(IDempleado)
references empleado(IDempleado)
)
go

create table Detalle_Venta(
IDventa int not null,
IDproducto int not null,
cantidad int not null,
precio decimal(10,2) not null,
constraint fk_IDventa
foreign key(IDventa)
references venta(IDventa),
constraint fk_IDproducto
foreign key(IDproducto)
references Producto(IDproducto)
)
go

create table Producto(
IDproducto int not null,
descripcion varchar (100) not null,
existencia int not null,
PrecioUnitario decimal(10,2) not null,
constraint unique_descripcion
unique (descripcion),
constraint pk_IDproducto
primary key(IDproducto)
)
go



