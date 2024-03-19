--Mostrar el total de ordenes de cada cliente mostrando el nombre de compañia

select  CompanyName	, COUNT(*) as 'Total de Pedidos' 
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
group by CompanyName

--Seleccionar el numero de producto, el nombre del producto y el nombre de la categoria, ordenado de forma ascendente
--con respecto al nombre de la categira.
select ProductID,ProductName, categoryName 
from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID
order by 3 asc