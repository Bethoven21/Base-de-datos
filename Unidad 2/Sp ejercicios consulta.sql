use NORTHWND

--Realizar un sp para Calcular el total de una orden 

select * from Orders

create proc CalcularTotalOrden
@ID int
as
begin
select od.OrderID as 'Orden', sum(UnitPrice * Quantity) as 'Total de una orden' from Orders as o
inner join [Order Details] as od on od.OrderID = o.OrderID
where @ID = od.OrderID
group by od.OrderID
end
go

exec CalcularTotalOrden '10254'

--Realizar un sp para Actualizar la Cantidad de Productos en Stock

select * from Products

alter proc CantidadProductosStock
@Stock smallint, @id int 
as
begin
update Products
set UnitsInStock = @Stock
where ProductID = @id
end
go

exec CantidadProductosStock 40 , 1
select * from Products

--Realizar un SP para Calcular el Total de Ventas de un Empleado

select * from Employees

create proc TotalVentasEmpleado
@empleadoid int
as
begin
select e.EmployeeID as 'Empleado', e.FirstName as 'Nombre', sum(UnitPrice * Quantity) as 'Total de ventas' from Employees as e
inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on o.OrderID = od.OrderID
where @empleadoid = e.EmployeeID
group by e.EmployeeID, e.FirstName
end
go

exec TotalVentasEmpleado '1'

--Realizar un SP para Actualizar el Nombre de un Empleado

Select * from Employees

create proc ActualizarNombreEmpleado
@nombre nvarchar(40), @id int 
as
begin
update Employees
set FirstName = @nombre
where EmployeeID = @id
end
go

exec ActualizarNombreEmpleado Ariadna , 1

--Realizar un SP para Obtener el Total de Ventas por País

select * from Customers

Alter proc TotalVentasPais
@country nvarchar (20)
as
begin
select c.Country as 'Pais', sum(UnitPrice * Quantity) as 'Total de ventas' from Customers as c
inner join Orders as o on c.CustomerID = o.CustomerID
inner join [Order Details] as od on o.OrderID = od.OrderID
where @country = c.Country
group by c.Country
end
go

exec TotalVentasPais 'Sweden'

--Realizar un SP para Obtener el Número de Órdenes por Cliente

select *  from Customers
select * from [Order Details]

alter proc NumeroOrdenesCliente
@id nchar(5)
as
begin
select COUNT (od.Quantity) as 'Numero de ordenes por cliente' from Customers as c
inner join Orders as o on c.CustomerID = o.CustomerID
inner join [Order Details] as od on o.OrderID = od.OrderID
where @id = c.CustomerID
end
go

exec NumeroOrdenesCliente 'ALFKI'

--Realizar un SP para Calcular el Total de Productos Vendidos por Categoría

select * from Categories

alter proc TotalProductosVendidosCategoria
@id int
as
begin
select SUM(od.UnitPrice * od.Quantity) from Categories as c
inner join Products as p on c.CategoryID = p.CategoryID
inner join [Order Details] as od on p.ProductID = od.ProductID
where @id = c.CategoryID
end
go

exec TotalProductosVendidosCategoria '2'

--SP para Calcular el Total de Ventas por Año

select * from Orders

create proc TotalVentasAño
@fecha nchar(4) 
as
begin
select SUM(od.UnitPrice * od.Quantity) from Orders as o
inner join [Order Details] as od on o.OrderID = od.OrderID
where year (o.OrderDate) = @fecha
end 
go

exec TotalVentasAño '1996'