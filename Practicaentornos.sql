--lenguaje sql de manipulacion de datos (sql md)(insert, delete, update, delete)

--seleccionar todos los datos de la tabla categoria

select * from Categoria

--agregar una sola fila a una tabla (Categoria) 

insert into Categoria
values (1,'carnes frias')

insert into Categoria
values (2,'lacteos')

insert into Categoria
values (3,'vinos y licores')

insert into Categoria
values (4, 'ropa')

insert into Categoria(idcategoria, descripcion)
value (5,'linea blanca')


--insertar varios registros a la vex
insert into Categoria
values(7, 'carnes buenas'),
(8, 'dulces'),
(9, 'panaderia'),
(10, 'salchichoneria')

--insertar apartir de una consulta

select idCategoria, Descripcion from Categoria

create categoriaCopia(
categoriaid not null primary key,
nombre varchar (100) not null
)

use pruebaentornos

--insertar datos a partir de una consulta

select * from categoriaCopia

insert into categoriaCopia (categoriaid, nombre)
select idCategoria, descripcion from categoria

--actualizacion de datos sql-lmd

select * from producto

insert into Producto
values(1, 'Salchicha', 600, 12)

insert into Producto
values(2, 'paleta de pollo', 22, 56, 8)

insert into Producto
values(3, 'refrigerador', 300, 22, 5)
      (3, 'chilindrina', 23, 43, 9),
	  (3, 'terrible mexcal', 200, 12, 3).
	  (3, 'leche de burra', 2350, 3, 2)

insert into Producto
values(1, 'Salchicha', 600, 12)


update producto 
set idproducto = 2
where nombre = 'Paleta de pollo'

update producto
set idproducto = 4
where nombre = 'chilindrina'

update producto
set idproducto = 5
where nombre = 'terrible mezcal'

update producto
set idproducto = 6
where nombre = 'leche de burra'

update producto
set nombre = 'salchicha grande',
existencia = 20
where idProducto = 1

alter table producto
add constraint pk_producto2
primary key (idproducto)


--eliminar registros de una tabla

/*

delete from tabla
where expresion
*/

select * from producto

delete from producto
where idProducto = 4

delete from producto
where nombre = 'salchicha grande'

delete from  producto
where precio >=3 and precio<=22

delete from  producto
where existencia >=3 and existencia<=12





-- Consultal simples con Select - SQL-LMD
Use NORTHWND
--Consulta numero 1 Seleccionar todos los clientes

select * from Customers

--Seleccionar el nombre del cliente, nombre del contacto y la ciudad

select CompanyName, ContactName, City from Customers

--Selccionar todos los paises de los clientes (distinct)

select country from Customers

select distinct country from Customers /quita valores repetidos/

--seleciona el mumero de paises de donde son mis clientes (count)
select COUNT(*) from Customers

select COUNT(Country) from Customers

select COUNT(distinct country) from Customers

--Seleccionar el cliente que tenga un id Anton

select * from Customers
where CustomerID = 'ANTON'

--seleccionar todos los clientes de Mexico

select * from Customers
where Country = 'Mexico'

--seleccionar todos los registros de los clientes de Berlin

select * from Customers
where City = 'Berlin'

select CompanyName, city, country from Customers
where city = 'Berlin'

--Order by  asc/desc
--seleccionar todos los producto por precio

select * from Products
order by UnitPrice 

--seleccionar todos los productos ordenados por el precio de mayor a menor

select * from Products
order by  UnitPrice desc

--seleccionar todos los productos alfabeticamente

select * from Products
order by  ProductName 

--seleccionar todos los clientes por pais y dentro por nombre de forma ascedente

select   Country,City,CompanyName from Customers
order by  country desc, CompanyName asc

--Operador and
--Seleccionar todos los clientes de España y que su nombre comience con G

select Country, city, CompanyName from Customers
where Country= 'Spain'and CompanyName like 'G%'

--seleccionar todos los clientes de Berlin, Alemania con un codigo postal mayor a 2200
select* from Customers
select country, city, PostalCode from Customers
where city= 'Berlin'  and  PostalCode > 2200

--seleccionar todos los clientes de España y que su nombre comience con G o con R
select Country, city, CompanyName from Customers
where Country= 'Spain'and( CompanyName like 'G%' or CompanyName like 'R%')

--Clausula or 
--Seleccionar todos cliente de Alemania o España

select Country, city, CompanyName from Customers
where Country= 'Spain' or Country= 'Germany'

--Seleccionar todo los clientes de Berlin o de Nouega o que comience su nombre con G

select Country, city, CompanyName from Customers
where City = 'Berlin' or Country= 'Norway' or CompanyName like 'G%'



--seleccionar solo los clientes que no son de españa

select * from customers
where not country = 'spain'

--seleccionar todos los productos que no tengan un precio entre 18 y 20 dolares
select * from Products 
where not (UnitPrice >= 18 and UnitPrice <=20) 

select * from Products
where UnitPrice not between 18 and 20

--seleccionar todos los clientes que no son de paris o de londres

select * from Country
where City not between 'paris' and 'london'

select * from Customers
where not (City = 'paris' or city = 'london')

select * from customers
where city not in ('paris', 'london')

--seleccionar todos los productos que no tienen precios mayores a 30
select * from Products
where not unitprice >= 30

--seleccionar todos los productos que no tienen precios menores a 30
select * from Products
where not unitprice <= 30

--instruccion like 

--seleccionar todos los clientes que comienzan con la letra a

select * from customers
where companyname like 'a%'

--seleccionar todos los clientes que finalizan con la palabra "es"
select * from customers
where companyname like '%es'


--seleccionar todos los clientes que contengan la palabra "mer"
select * from customers
where companyname like '%mer%'


--seleccionar todos los clientes con una ciudad que comience con cualqueir caracter seguido de la palabra ondon
select * from customers
where city like '_ondon'

