--Consultas de Agegado.
--Caracteristicas principales es que devuelven un solo registro

--Top y percent

--Selecciona las primeras 10 ordenes de compra
--Primeros 10
select top 10*from Orders
--Ultimos 10
select top 10*from Orders
order by OrderID desc

select top 10 CustomerID as 'Numero de cliente',
OrderDate as 'Fecha de Orden', ShipCountry as'Pais de Envio' from Orders
order by OrderID desc

--Selecciona el 50% de los registros
select top 50 percent * from Orders

select top 25 percent * from Orders

--Selecccionar los primeros 3 clientes de alemania
select top 3 Country from Customers
where Country = 'Germany'

select top 3 CompanyName as 'Cliente', Country as 'Pais', Address as 'Direccion' from Customers
where Country = 'Germany'

--Selecionar el productos con el precio mayor 
select * from Products
Order by UnitPrice desc

--Muestra el precio mas alto de los productos (max)

select max(UnitPrice) as 'Precio Maximo' from Products

--Mostrar el precio minimo de los productos
select min(UnitPrice) as 'Precio Minimo' from Products

--Seleccionar todas las ordenes de compra

select*from Orders

--Seleccionar el numero total de Ordenes

select count(*) as 'Total de ordenes' from Orders
select count(ShipRegion) as 'Total de ordenes' from Orders

--Seleccionar todas aquellas ordenes donde la region de envio no sea null

select * from Orders
where ShipRegion is not null

select COUNT(ShipRegion) from Orders

--Selecccionar de forma asendente los productos por precio

select * from Products
order by  UnitPrice asc 

-- Seleccionar el numero de  precios de los productos
select COUNT (distinct(UnitPrice)) from Products

--Seleccionar todos los diferentes paises de lo clietes
select COUNT (distinct(Country))as 'Paises' from Customers

--Seleccionar  la suma total de cantidades de las ordenes de compra
 
 select sum (quantity) from [Order Details]

 select*from[Order Details]

 --seleccionar todos los registros de order details calculando el importe

 select *, (UnitPrice*Quantity) as'Importe' from [Order Details]

 --seleccionar el total en dinero que a vendido la empresa 
  select sum (UnitPrice*Quantity) as 'Dinero vendido' from [Order Details]

  --Seleccionar el total de venta de Chang

  select*from [Order Details]

  select sum (UnitPrice*Quantity) as 'Total' from [Order Details]
 where ProductID = 2

 --Seleccionar el promedio de los precion de los productos

 select AVG ( UnitPrice)  from Products
 --seleccionar el promedio  total, el total de los productos 41,60 y 31

 select sum (UnitPrice*Quantity) as 'Total', AVG (UnitPrice*Quantity)from [Order Details]
 where ProductID in (41, 31, 60)

 select sum (UnitPrice*Quantity) as 'Total', AVG (UnitPrice*Quantity)from [Order Details]
 where ProductID = 41 or ProductID = 31 or ProductID = 60

 -- Seleccionar el numero de ordenes realizadas entre 1996 y 1997
  select *from Orders
 select COUNT (*) from Orders
 where OrderDate >= '1996-01-01' and OrderDate <='1997-12-31'

 select COUNT (*) from Orders
 where OrderDate between '1996-01-01' and '1997-12-31'

 select year (OrderDate) fROM Orders

 select COUNT (*) from Orders
 where year (OrderDate) >= '1996' and year(OrderDate) <='1997'

 select COUNT (*) from Orders
 where year (OrderDate) in ('1996', '1997')

 select count(*) from Orders
where year(OrderDate)between '1996' and '1997'

--instruccion group by
--seleccionar el numero de clientes agrupados por pais

select country, count (*) as 'total de clientes' from Customers
group by Country
order by 1 desc

select country, count (*) from Customers
group by Country


--seleccionar el numero de ordenes enviadas por el shippername

select ShipVia, count (*) from Orders
group by ShipVia

select s.CompanyName as 'nombre de compañia', count(*) as total from Orders as o inner join Shippers as s on o.ShipVia = s.ShipperID
group by s.CompanyName
