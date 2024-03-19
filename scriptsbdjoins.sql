
select * from clientes as c
inner join ordenes as o
on c.Numcliente = o.clienteid

--

select c.Numcliente as 'Numero del cliente',
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.fechaorden as 'fecha de la ordern',
o.fechaentrega as 'fecha de entrega',
o.clienteid as 'foreign key de la tabla cliente'
from Clientes as c
inner join ordenes as o
on c.Numcliente = o.clienteid

--left join (la tabla izquierda siempre es la primera que se
--pone en el join)

select c.Numcliente as 'Numero del cliente',
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.fechaorden as 'fecha de la ordern',
o.fechaentrega as 'fecha de entrega',
o.clienteid as 'foreign key de la tabla cliente'
from Clientes as c
left join ordenes as o
on c.Numcliente = o.clienteid

--aquellos clientes que nunca han hecho ordenes

select c.Numcliente as 'Numero del cliente',
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.fechaorden as 'fecha de la ordern',
o.fechaentrega as 'fecha de entrega',
o.clienteid as 'foreign key de la tabla cliente'
from Clientes as c
left join ordenes as o
on c.Numcliente = o.clienteid
where o.clienteid is null 

--seleccionar todos los datos de la tabla ordenes y la tabla
--clientes utilizando un left join

select
o.fechaorden as 'fecha de la ordern',
o.fechaentrega as 'fecha de entrega',
o.clienteid as 'foreign key de la tabla cliente',
c.Numcliente as 'Numero del cliente',
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente'
from ordenes as o
left join Clientes as c
on c.Numcliente = o.clienteid

select c.Numcliente as 'Numero del cliente',
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.fechaorden as 'fecha de la ordern',
o.fechaentrega as 'fecha de entrega',
o.clienteid as 'foreign key de la tabla cliente'
from ordenes as o
left join Clientes as c
on c.Numcliente = o.clienteid

--right join

select c.Numcliente as 'Numero del cliente',
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.fechaorden as 'fecha de la ordern',
o.fechaentrega as 'fecha de entrega',
o.clienteid as 'foreign key de la tabla cliente'
from Clientes as c
right join ordenes as o
on c.Numcliente = o.clienteid

--full join
select c.Numcliente as 'Numero del cliente',
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.fechaorden as 'fecha de la ordern',
o.fechaentrega as 'fecha de entrega',
o.clienteid as 'foreign key de la tabla cliente'
from Clientes as c
full join ordenes as o
on c.Numcliente = o.clienteid



select fechaorden, numero, Nombre, Pais from ordenes as o
inner join
(select nombre, Pais, Numcliente from Clientes) as c
on o.clienteid = c.Numcliente

select fechaorden, numero, Nombre, Pais from ordenes as o
left join
(select nombre, Pais, Numcliente from Clientes) as c
on o.clienteid = c.Numcliente

select fechaorden, numero, Nombre, Pais from ordenes as o
right join
(select nombre, Pais, Numcliente from Clientes) as c
on o.clienteid = c.Numcliente

select fechaorden, numero, Nombre, Pais from ordenes as o
full join
(select nombre, Pais, Numcliente from Clientes) as c
on o.clienteid = c.Numcliente