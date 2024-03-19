Create database Practica5
go

use Practica5 
go

create table pruebaCalculado(
id int not null identity(1,1),
nombre varchar(50),
precio decimal(10,2) not null,
existencia int not null,
importe as
(precio * existencia),
constraint pk_pruebacalculo
primary key(id)
)

select * from pruebaCalculado

insert into pruebaCalculado
values('chanclotas', 345, 4)
