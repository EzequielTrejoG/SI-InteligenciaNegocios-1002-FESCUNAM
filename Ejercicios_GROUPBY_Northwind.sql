-- Lunes 22 de Septiembre de 2025

-- Realiza las siguientes consultas, utilizando la Base de Datos Northwind
-- Sentencia GROUP BY

-- 1. Visualizar el máxima y mínimo precio de los productos por categoría, 
-- mostrar el nombre de la Categoría.
SELECT 
    Categories.CategoryName,
    MAX(Products.UnitPrice) AS PrecioMaximo,
    MIN(Products.UnitPrice) AS PrecioMinimo
FROM Products 
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName
ORDER BY Categories.CategoryName ASC

-- 2. Seleccionar las categorías que tengan más de 5 productos, mostrar el nombre de la
-- categoría y número de productos.
SELECT
    Categories.CategoryName,
    COUNT(Products.ProductID) AS NoDeProductos
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
HAVING COUNT(Products.ProductID) > 5
ORDER BY NoDeProductos DESC

-- 3. Calcular cuántos clientes existen en cada país.
SELECT 
    Country,
    COUNT(CustomerID) AS NoDeClientes
FROM Customers
GROUP BY Country
ORDER BY Country ASC

-- 4. Calcular cuántos proveedores existen en cada ciudad y país.
SELECT 
    City, 
    Country,
    COUNT(SupplierID) AS NoDeProveedores
FROM Suppliers
GROUP BY City, Country
ORDER BY City, Country ASC

-- 5. Calcular el stock total de los productos por cada categoría, mostrar el nombre de la
-- categoría y el stock por categoría.
SELECT
    Categories.CategoryName,
    SUM(Products.UnitsInStock) AS StockTotal
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
ORDER BY Categories.CategoryName ASC

-- 6. Calcular el stock total de los productos por categoría, mostrar el nombre de la categoría
-- y el stock por categoría, solamente las categorías 2, 5 y 8.
SELECT
    Categories.CategoryID,
    Categories.CategoryName,
    SUM(Products.UnitsInStock) AS StockTotal
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryID IN(2,5,8)
GROUP BY Categories.CategoryID, Categories.CategoryName
ORDER BY Categories.CategoryName ASC

-- 7. Mostrar el número de ordenes realizadas de cada uno de los clientes por año.
SELECT
    Customers.CustomerID,
    Customers.CompanyName,
    YEAR(Orders.OrderDate) AS Anio,
    COUNT(Orders.OrderDate) AS NoDeOrdenes
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.CompanyName, YEAR(Orders.OrderDate)
ORDER BY Customers.CustomerID ASC, Anio DESC

-- 8. Contar el número de ordenes que se han realizado por años y meses.
SELECT
    YEAR(OrderDate) AS Año,
    MONTH(OrderDate) AS Mes,
    COUNT(*) AS NoDeOrdenes
FROM Orders
GROUP BY MONTH(OrderDate), YEAR(OrderDate)
ORDER BY Año, Mes ASC

SELECT
    YEAR(OrderDate) AS Año,
    DATENAME(MONTH, OrderDate) AS Mes,
    COUNT(*) AS NoDeOrdenes
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate), DATENAME(MONTH, OrderDate)
ORDER BY Año, MONTH(OrderDate);