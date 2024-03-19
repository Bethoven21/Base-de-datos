

--seleccionar todas las ordenes compra
--mostrando las fechas ordenes de compra
--nombre del shipper y el nombre al cliente
--al que se le vendio (inner join- a tres tablas)

select c.CompanyName as 'Cliente', 
o.OrderDate as 'Fecha de orden', 
s.CompanyName as 'Nombre flete' from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join Shippers as s
on o.ShipVia = s.ShipperID

select c.CompanyName as 'Cliente', 
o.OrderDate as 'Fecha de orden', 
s.CompanyName as 'Nombre flete' from
Customers as c
join Orders as o
on c.CustomerID = o.CustomerID
join Shippers as s
on o.ShipVia = s.ShipperID


--seleccionar el nombre del producto y su categoria
select * from Products
select p.ProductName as 'Nombre del prudcto', 
c.CategoryID 'categoria' 
from Products as p
join Categories as c
on p.ProductID = c.CategoryID

select * from Products
select ProductName, CategoryName from Products as p
join Categories as c
on p.ProductID = c.CategoryID

--listar el nombre del cliente, la fecha de la orden,
--los nombres de los productos que fueron vendidos

select c.CompanyName, o.OrderDate, p.ProductName from Customers as c
inner join orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

--seleccionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad de ellos
--y calcular el importe

select * from Employees

select FirstName, LastName from Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on o.EmployeeID = od.ProductID
inner join Products as p
on p.CategoryID = od.ProductID

select CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre completo',
p.ProductName as 'descripcion',
od.Quantity as 'cantidad', (od.Quantity * od.UnitPrice) as 'importe'
from Employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p 
on p.ProductID = od.ProductID

--seleccionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad de ellos
--y calcular el importe, pero solo enviados a suiza, alemania y francia

select CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre completo',
p.ProductName as 'descripcion',
od.Quantity as 'cantidad', (od.Quantity * od.UnitPrice) as 'importe',
s.Country as 'Pais'
from Employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p 
on p.ProductID = od.ProductID
inner join Suppliers as s
on s.SupplierID = p.SupplierID
where s.Country in ('sweden','france','germany')

select CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre completo',
p.ProductName as 'descripcion',
od.Quantity as 'cantidad', (od.Quantity * od.UnitPrice) as 'importe',
o.ShipCountry as 'Pais'
from Employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p 
on p.ProductID = od.ProductID
where o.ShipCountry in ('sweden','france','germany')

--seleccionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad de ellos
--y calcular el importe, pero solo enviados a suiza, alemania y francia
--agrupados por la cantidad total de ordenes hechas por los empleados


--total de ordenes enviadas a francias alemania y suiza
select CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre completo',
o.ShipCountry, p.ProductName as 'descripcion',
count (*) as 'total de ordenes'
from Employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p 
on p.ProductID = od.ProductID
where o.ShipCountry in ('sweden','france','germany')
group by CONCAT(e.FirstName, ' ', e.LastName),o.ShipCountry, p.ProductName
order by 1 desc

--seleccionar el numero de ordenes enviadas a alemania, suiza y francia
--agrupadas por el empleado

use NORTHWND

-- Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')


-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes', CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName)


-- Seleccionar el numero de ordenes enviadas a alemania,
-- suiza y francia, agrupadas por el empleado y el pais de envio
select CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo',o.ShipCountry ,count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry
order by 1




select CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo',o.ShipCountry ,count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland') and e.FirstName in ('Andrew')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry
order by 1


--seleccionar el total de dinero que se le han vendido a cada uno
--de los clientes de 1996

select * from Customers
select c.CompanyName as 'clientes', sum(od.UnitPrice * od.Quantity) as 'Total' 
from Customers as c
inner join Orders as o
on o.CustomerID = c.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
where year(o.OrderDate) = '1996'
Group by CompanyName
order by 2

--seleccionar el total de dinero que se le han vendido a cada uno
--de los clientes por cada año

select * from Orders

select c.CompanyName as 'clientes', sum(od.UnitPrice * od.Quantity) as 'Total' 
from Customers as c
inner join Orders as o
on o.CustomerID = c.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
where year(o.OrderDate) between '1996' and '1998'
Group by CompanyName
order by 2

select c.CompanyName as 'clientes', sum(od.UnitPrice * od.Quantity) as 'Total',
o.OrderDate as 'Años'
from Customers as c
inner join Orders as o
on o.CustomerID = c.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
Group by CompanyName, OrderDate
order by 3 desc

select c.CompanyName as 'clientes', sum(od.UnitPrice * od.Quantity) as 'Total',
year(OrderDate) as 'Años'
from Customers as c
inner join Orders as o
on o.CustomerID = c.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
Group by CompanyName, year(OrderDate)
order by 1 asc 

--seleccionar el importe total que se ha vendido por categoria de producto

select * from Categories

select CategoryName, Sum(od.UnitPrice * od.Quantity) as 'importe' from Categories as c
inner join Products as p
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by CategoryName
order by 2 desc

--cual de los productos que me proporiciona es el que mas vendo


--seleccionar el importe total que se ha vendido pro categoria y nombre de producto, que permita
--visualizar el producto mas vendido

select ProductName ,CategoryName, Sum(od.UnitPrice * od.Quantity) as 'importe' from Categories as c
inner join Products as p
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by CategoryName, ProductName
order by 3 desc

--de la consulta anterior solamente mostrar, aquellos totales que son 
--mayores a 20 mil

select ProductName ,CategoryName, Sum(od.UnitPrice * od.Quantity) as 'importe' 
from Categories as c
inner join Products as p
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by CategoryName, ProductName
having Sum(od.UnitPrice * od.Quantity)>20000
order by 2 desc

--seleccionar el numero de clientes por cada pais, en donde solo sean
--incluidos los que tengan mas de 5 clientes y ordenados de forma
--descendente por el numero de clientes

select * from Customers
select Country as 'pais', count(CompanyName) as 'Numero de clientes' 
from Customers
group by Country
having count(CompanyName)>5
order by 2 desc

select country, count(*) from Customers
where Country <> 'Brazil'
group by Country
having count(*)>5

select country, count(*) from Customers
where Country not in ('Brazil')
group by Country
having count(*)>5

select country, count(*) from Customers
where not Country = 'Brazil'
group by Country
having count(*)>5

--seleccionar los clientes que han realizado pedidos en mas de un 
--pais, que muestre el customerid, el nombre del cliente, usando shipcountry
--ademas la suma total de las ordenes

select * from Customers
select Country from Customers



select p.ProductID, p.ProductName, c.CategoryName
from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
Order by c.CategoryName asc

--left join

select c.CompanyName, o.OrderID from Customers as c
left outer join 
orders as o
on c.CustomerID = o.CustomerID
where o.OrderID is null