-- Consultal simples con Select - SQL-LMD
Use NORTHWND
--Consulta numero 1 Seleccionar todos los clientes

select * from Customers

--Seleccionar el nombre del cliente, nombre del contacto y la ciudad

select CompanyName, ContactName, City from Customers

--Selccionar todos los paises de los clientes (distinct)

select country from Customers

select distinct country from Customers /*quita valores repetidos*/

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

--seleccionar todos los clientes con una ciudad que comience con L y
--seguido de tres cualquiera caracteres y que termine con la palabra on 
select * from customers 
where city like 'l%___%on' 


--seleccionar

use NORTHWND
select * from Products


--seleccionar todos los productos que comiencen con la a, c , t

select * from Products
where ProductName like '[act]%'

--seleccionar todos los productos que comiencen de la letra b, a la g
select * from Products
where ProductName like '[b-g]%'


--clausula in()

--seleccionar todos los clientes de alemania, francia, espana y reino unido
select * from Customers
where Country in('Germany','spain', 'uk')

select * from Customers
where Country = 'germany' or Country = 'spain' or Country = 'uk'

-- not in
--seleccionar todos los clientes que no son de alemania, espana y reino unido

select * from Customers
where Country not in('Germany','spain', 'uk')

select * from Customers
where not Country = 'germany' or Country = 'spain' or Country = 'uk'

--intruccion betwween es para un rango
--seleccionar todos los productos con un precio entre 10 y 20 dolares
select * from Products
where UnitPrice between 10 and 20

select * from Products
where UnitPrice >= 10 and UnitPrice <=20

--alias de columnas y alias de tablas

--seleccionar el nombre del producto, su stock y su precio
select ProductName as 'nombre del producto' , UnitsInStock as existencia, UnitPrice precio from Products

select  ProductName as 'nombre del producto' , UnitsInStock as existencia, p.UnitPrice precio from Products as p inner join [Order Details] as od on p.ProductID = od.ProductID