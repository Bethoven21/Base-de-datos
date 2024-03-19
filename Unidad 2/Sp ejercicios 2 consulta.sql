
use NORTHWND

--Crear un SP que permite eliminar registro en la tabla customers, por CustormeID

select * from Customers

alter proc EliminarRegistroCliente
@id nchar(5)
as
begin
delete from Customers
where @id = CustomerID
end
go

exec EliminarRegistroCliente 'ALFKJ'

--Crear un sp que permite eliminar un producto de una orden dada

select * from Products
select * from [Order Details]
select * from Orders

alter proc EliminarProducto
@id int, @pid int
as
begin
delete from [Order Details]
where @id = OrderID and @pid = ProductID
end
go

exec EliminarProducto '10258', '2'
exec EliminarProducto '10258', '5'

--Crear un sp que permita eliminar un producto de una orden, y modificar el stock (unitstock del producto)

select * from Products
select * from [Order Details]
select * from Orders

alter proc EliminarProductoyStock
@id int, @pid int, @stock smallint, @nombre int
as
begin
update Products 
set UnitsInStock = @stock
delete from [Order Details]
where @id = OrderID and @pid = ProductID and @idpr = ProductID
end
go

Create proc EliminarModificar
@ID int, @OrID int
as 
begin 
declare @Cantidad int 
select @Cantidad = Quantity from [Order Details]
where OrderID = @OrID and ProductID = @ID
--Update
Update Products
	set UnitsInStock = UnitsInStock - @Cantidad
	where ProductID = @ID
--Delete
Delete from [Order Details]
where OrderID = @OrID and ProductID = @ID
end
go

exec EliminarProductoyStock OrderID = 10255, ProductID = 2, '1', '41'

CREATE PROCEDURE sp_EliminarProductoYActualizarStock
    @ProductoID INT,
    @CantidadEliminada INT
AS
BEGIN
    -- Eliminar el producto de la orden (supongamos que tienes una tabla llamada OrdenProductos)
    DELETE FROM [Order Details]
    WHERE ProductID = @ProductoID;

    -- Actualizar el stock del producto (supongamos que tienes una tabla llamada Productos)
    UPDATE Products
    SET UnitsInStock = UnitsInStock - @CantidadEliminada
    WHERE ProductID = @ProductoID;
END


--Crear un SP que permitre insertar registro en la tabla customers

select * from Customers

alter proc InsertarRegistro
@id nchar(5), @companyname nvarchar(40), @country nvarchar(15), @city nvarchar(15)
as
begin
insert into Customers(CustomerID,CompanyName, Country, City)
values (@id,@companyname, @country, @city)
end
go

exec InsertarRegistro 'ALFKJ','Bimboñuelos', 'Mexico', 'Singapure'