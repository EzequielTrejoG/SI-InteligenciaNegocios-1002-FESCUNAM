-- Viernes 26 de Septiembre de 2025
-- Gomez Trejo Ezequiel    No. Cta: 421003866

-- EJEMPLOS DE SUBCONSULTAS con BD BikeStores

--1. Encontrar los pedidos de venta de los clientes que se ubican en New York.
SELECT order_id, order_date, customer_id
FROM sales.orders
WHERE customer_id IN (
    SELECT customer_id
    FROM sales.customers
    WHERE city = 'New York')
ORDER BY order_date DESC

--2. Una subconsulta se puede anidar dentro de otra subconsulta. SQL Server admite hasta 32.
-- Listar el nombre del producto y el precio de lista de todos los productos donde el precio de lista sea
-- mayor al promedio del precio de lista de la marca Strider o de la marca Trek
SELECT product_name, list_price
FROM production.products
WHERE list_price > (
    SELECT AVG (list_price)
	FROM production.products
    WHERE brand_id IN (
        SELECT brand_id
	    FROM production.brands
		WHERE brand_name = 'Strider' OR brand_name = 'Trek'
	)
)
ORDER BY list_price

--3. Consulta 3: Obtener el Id y Fecha de la Orden, el precio de lista más caro de los productos en esa orden.
-- Ordenados por la orden más reciente
SELECT order_id, order_date, 
    (SELECT MAX(list_price) 
    FROM sales.order_items i
    WHERE i.order_id = o.order_id) AS max_list_price
FROM sales.orders o
ORDER BY order_date DESC;

--4. Busca los nombres de todos los productos de bicicletas de montaña y de 
-- carretera que venden las tiendas de bicicletas.
SELECT product_id, product_name
FROM production.products
WHERE category_id IN (
    SELECT category_id
    FROM production.categories
	WHERE category_name = 'Mountain Bikes' OR category_name = 'Road Bikes')