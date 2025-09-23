-- Lunes 22 de Septiembre de 2025

-- Realiza las siguientes consultas, utilizando la Base de Datos Northwind
-- Sentencia GROUP BY

-- 1. Visualizar el m�xima y m�nimo precio de los productos por categor�a, 
-- mostrar el nombre de la Categor�a.
SELECT 
    Categories.CategoryName,
    MAX(Products.UnitPrice) AS PrecioMaximo,
    MIN(Products.UnitPrice) AS PrecioMinimo
FROM Products 
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName
ORDER BY Categories.CategoryName ASC

-- 2. Seleccionar las categor�as que tengan m�s de 5 productos, mostrar el nombre de la
-- categor�a y n�mero de productos.
SELECT
    Categories.CategoryName,
    COUNT(Products.ProductID) AS NoDeProductos
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
HAVING COUNT(Products.ProductID) > 5
ORDER BY NoDeProductos DESC

-- 3. Calcular cu�ntos clientes existen en cada pa�s.
SELECT 
    Country,
    COUNT(CustomerID) AS NoDeClientes
FROM Customers
GROUP BY Country
ORDER BY Country ASC

-- 4. Calcular cu�ntos proveedores existen en cada ciudad y pa�s.
SELECT 
    City, 
    Country,
    COUNT(SupplierID) AS NoDeProveedores
FROM Suppliers
GROUP BY City, Country
ORDER BY City, Country ASC

-- 5. Calcular el stock total de los productos por cada categor�a, mostrar el nombre de la
-- categor�a y el stock por categor�a.
SELECT
    Categories.CategoryName,
    SUM(Products.UnitsInStock) AS StockTotal
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
ORDER BY Categories.CategoryName ASC

-- 6. Calcular el stock total de los productos por categor�a, mostrar el nombre de la categor�a
-- y el stock por categor�a, solamente las categor�as 2, 5 y 8.
SELECT
    Categories.CategoryID,
    Categories.CategoryName,
    SUM(Products.UnitsInStock) AS StockTotal
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryID IN(2,5,8)
GROUP BY Categories.CategoryID, Categories.CategoryName
ORDER BY Categories.CategoryName ASC

-- 7. Mostrar el n�mero de ordenes realizadas de cada uno de los clientes por a�o.
SELECT
    Customers.CustomerID,
    Customers.CompanyName,
    YEAR(Orders.OrderDate) AS Anio,
    COUNT(Orders.OrderDate) AS NoDeOrdenes
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.CompanyName, YEAR(Orders.OrderDate)
ORDER BY Customers.CustomerID ASC, Anio DESC

-- 8. Contar el n�mero de ordenes que se han realizado por a�os y meses.
SELECT
    YEAR(OrderDate) AS A�o,
    MONTH(OrderDate) AS Mes,
    COUNT(*) AS NoDeOrdenes
FROM Orders
GROUP BY MONTH(OrderDate), YEAR(OrderDate)
ORDER BY A�o, Mes ASC

SELECT
    YEAR(OrderDate) AS A�o,
    DATENAME(MONTH, OrderDate) AS Mes,
    COUNT(*) AS NoDeOrdenes
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate), DATENAME(MONTH, OrderDate)
ORDER BY A�o, MONTH(OrderDate);