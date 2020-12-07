################################################
-- PROYECTO SESION 03
-- Realizo: Fabiola Rasgado Celaya
-- Sabado 14 de Noviembre de 2020
################################################

use classicmodels;

################################################
-- Para estas consultas usa RIGHT JOIN
-- No. 01
-- Obten el código de producto, nombre de producto y descripción de todos los productos.
SELECT 
p.productCode as "Codigo de Producto", 
p.productName as "Nombre del Producto",
l.textDescription as "Descripcion del Producto"
FROM products p
RIGHT JOIN productlines l
ON p.productLine = l.productLine
ORDER BY p.productCode;

-- No. 02
-- Obten el número de orden, estado y costo total de cada orden.
SELECT
o.orderNumber as "NumeroDeOrden",
o.status as "Estado",
sum((d.quantityOrdered * d.priceEach)) as CostoTotal
FROM 
orders o
RIGHT JOIN orderdetails d
ON o.orderNumber = d.orderNumber
group by o.orderNumber;

-- No. 03
-- Obten el número de orden, fecha de orden, línea de orden, nombre del producto, 
-- cantidad ordenada y precio de cada pieza que muestre los detalles de cada orden.
SELECT
o.orderNumber as "NumeroDeOrden",
o.orderDate as "FechaDeOrden",
d.orderLineNumber as "LineaDeOrden",
p.productName as "NombreDelProducto",
d.quantityOrdered as "CantidadOrdenada",
d.priceEach as "Precio por Pieza" 
FROM
orders o
RIGHT JOIN orderdetails d
ON o.orderNumber = d.orderNumber
RIGHT JOIN products p
ON d.productCode = p.productCode
ORDER BY o.orderNumber, o.orderDate, d.orderLineNumber
;


-- No. 04
-- Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
SELECT
o.orderNumber as "NumeroDeOrden",
p.productName as "NombreDelProducto",
p.MSRP as "PrecioSugeridoDeFabrica",
d.priceEach as "Precio por Pieza" 
FROM
orders o
RIGHT JOIN orderdetails d
ON o.orderNumber = d.orderNumber
RIGHT JOIN products p
ON d.productCode = p.productCode
ORDER BY o.orderNumber, p.productName
;

################################################
-- Para estas consultas usa LEFT JOIN
################################################

-- No. 05
-- Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
SELECT
c.customerNumber as "NumeroDeCliente",
c.customerName as "NombreDeCliente",
o.orderNumber as "NumeroDeOrden",
c.state as "EstadoDelCliente"
FROM
customers c
LEFT JOIN orders o 
ON c.customerNumber = o.customerNumber
ORDER BY c.customerNumber, c.customerName
;


-- No. 06
-- Obtén los clientes que no tienen una orden asociada.
SELECT
c.customerNumber as "NumeroDeCliente",
c.customerName as "NombreDeCliente",
c.state as "EstadoDelCliente", 
o.orderNumber as "NumeroDeOrden"
FROM
customers c
LEFT OUTER JOIN orders o 
ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL
ORDER BY c.customerNumber, c.customerName
;

-- No. 07
-- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, 
-- número de cheque y total, es decir, los clientes asociados a cada empleado.
-- show keys from customers;
select 
e.lastName as "Apellido del Empleado", 
e.firstName as "Nombre del Empleado", 
c.customerName as "Nombre del Cliente", 
p.checkNumber as "NumeroDeCheque",
p.amount as "Total"
from 
employees e
LEFT JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p
ON c.customerNumber = p.customerNumber 
ORDER BY e.lastName, e.firstName, c.customerName
;


################################################
-- Para estas consultas usa RIGHT JOIN
-- No. 08
-- Repite los ejercicios 5 a 7 usando RIGHT JOIN.
################################################

-- No. 08 - 05
-- Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
SELECT
c.customerNumber as "NumeroDeCliente",
c.customerName as "NombreDeCliente",
o.orderNumber as "NumeroDeOrden",
c.state as "EstadoDelCliente"
FROM
orders o 
RIGHT JOIN customers c
ON c.customerNumber = o.customerNumber
ORDER BY c.customerNumber, c.customerName
;

-- No. 08 - 06
-- Obtén los clientes que no tienen una orden asociada.
SELECT
c.customerNumber as "NumeroDeCliente",
c.customerName as "NombreDeCliente",
c.state as "EstadoDelCliente", 
o.orderNumber as "NumeroDeOrden"
FROM
orders o 
RIGHT OUTER JOIN customers c
ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL
ORDER BY c.customerNumber, c.customerName
;

-- No. 08 - 07
-- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, 
-- número de cheque y total, es decir, los clientes asociados a cada empleado.
select 
e.lastName as "Apellido del Empleado", 
e.firstName as "Nombre del Empleado", 
c.customerName as "Nombre del Cliente", 
p.checkNumber as "NumeroDeCheque",
p.amount as "Total"
from 
customers c
RIGHT JOIN employees e 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p
ON c.customerNumber = p.customerNumber 
ORDER BY e.lastName, e.firstName, c.customerName
;


################################################
-- No. 09
-- Escoge 3 consultas de los ejercicios anteriores, crea una vista 
-- y escribe una consulta para cada una.
################################################

-- No. 09 - 01
-- Vista 1
-- Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
create view FabiolaRasgado_ProyectoVista01 as
(
SELECT
c.customerNumber,
c.customerName,
o.orderNumber,
c.state
FROM
orders o 
RIGHT JOIN customers c
ON c.customerNumber = o.customerNumber
ORDER BY c.customerNumber, c.customerName
);

-- Consulta Vista 1
SELECT
customerNumber as "NumeroDeCliente",
customerName as "NombreDeCliente",
orderNumber as "NumeroDeOrden",
state as "EstadoDelCliente"
FROM
FabiolaRasgado_ProyectoVista01 ;

-- No. 09 - 02
-- Vista 2
-- Obtén los clientes que no tienen una orden asociada.
create view FabiolaRasgado_ProyectoVista02 as
(
SELECT
c.customerNumber,
c.customerName,
c.state, 
o.orderNumber
FROM
customers c
LEFT OUTER JOIN orders o 
ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL
ORDER BY c.customerNumber, c.customerName
);

-- Consulta Vista 2
SELECT
customerNumber as "NumeroDeCliente",
customerName as "NombreDeCliente",
state as "EstadoDelCliente", 
orderNumber as "NumeroDeOrden"
FROM
FabiolaRasgado_ProyectoVista02 ;

-- No. 09 - 03
-- Vista 3
-- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, 
-- número de cheque y total, es decir, los clientes asociados a cada empleado.
create view FabiolaRasgado_ProyectoVista03 as
(
select 
e.lastName, 
e.firstName, 
c.customerName, 
p.checkNumber,
p.amount 
from 
employees e
LEFT JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p
ON c.customerNumber = p.customerNumber 
ORDER BY e.lastName, e.firstName, c.customerName
);

-- Consulta Vista 3
select 
lastName as "Apellido del Empleado", 
firstName as "Nombre del Empleado", 
customerName as "Nombre del Cliente", 
checkNumber as "NumeroDeCheque",
amount as "Total"
from 
FabiolaRasgado_ProyectoVista03;
