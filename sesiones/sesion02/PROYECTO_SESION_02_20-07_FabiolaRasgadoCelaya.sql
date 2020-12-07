########################################
-- PROYECTO SESION 02 
-- Realizado por: Fabiola Rasgado Celaya
########################################
-- Todas las consultas que realices deberás mantenerlas dentro del editor de textos de MySQL Workbench. 
-- Al finalizar, guarda este archivo, llendo al menú File > Save script.
########################################
use classicmodels;
describe employees;

-- No. 01
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con a.
select employeeNumber as "Número de Empleado", 
lastName as "Apellido", 
firstName as "Nombre" 
from employees 
where firstName like 'a%';

-- No. 02
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on.
select employeeNumber as "Número de Empleado", 
lastName as "Apellido", 
firstName as "Nombre"
from employees 
where 
firstName like '%on' 
OR firstName like '%on %' 
OR firstName like '%on %on';
-- Llegué a la consulta anterior, porque consideré los escenarios donde se tenga un solo nombre, 
-- dos nombres, en ambos nombres termine con on, o el primer nombre termine con on.
-- select employeeNumber, lastName, firstName from employees where firstName like '%on';
-- select employeeNumber, lastName, firstName from employees where firstName like '%on %';

-- No. 03
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
select employeeNumber as "Número de Empleado", 
lastName as "Apellido", 
firstName as "Nombre" 
from employees 
where firstName like '%on%';

-- No. 04
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados 
-- cuyos nombres tienen tres letras e inician con T y finalizan con m.
select employeeNumber as "Número de Empleado", 
lastName as "Apellido", 
firstName as "Nombre"
from employees 
where trim(firstName) like 'T_m';

-- No. 05
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
select employeeNumber as "Número de Empleado", 
lastName as "Apellido", 
firstName as "Nombre" 
from employees 
where trim(firstName) not like 'B%';

-- No. 06
-- Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.
select productCode as "Código de Producto", 
productName as "Nombre del Producto"
from products 
where productCode like '%\_\20%';
-- La consulta anterior, contempla la cadena de forma absoluta "_20", se requirió del slash
-- Si solo se hace con '%_20%', consideraba más combinaciones a lo solicitado.
-- select productCode, productName from products where productCode like '%_20%';

-- No. 07
-- Dentro de la tabla orderdetails, obten el total de cada orden.
select orderNumber as "Número de Orden", 
sum(priceEach) as "Total por Orden" 
from orderdetails 
group by orderNumber 
order by orderNumber;

-- No. 08
-- Dentro de la tabla orders obten el número de órdenes por año.
select year(orderDate) as "Año", 
count(*) as "Número de Ordenes por Año" 
from orders 
group by year(orderDate) 
order by year(orderDate) desc;

-- No. 09
-- Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
-- OPCION 1 - CON JOINS
select a.lastName as "Apellido", 
a.firstName as "Nombre del Empleado"
from employees a, offices b 
where 
b.officeCode=a.officeCode 
and b.country='USA' 
order by a.lastName, a.firstName;


-- OPCION 2 - CON SUBCONSULTAS ANIDADAS
select lastName as "Apellido", 
firstName  as "Nombre del Empleado" 
from employees
where
officeCode in (select officeCode from offices where country='USA')
order by lastName, firstName;

-- No. 10
-- Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
select customerNumber as "Número de Cliente", 
checkNumber as "Número de Cheque", 
amount as "Cantidad del Cliente" 
from payments 
order by amount desc limit 1;

-- No. 11
-- Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
select customerNumber as "Número de Cliente", 
checkNumber as "Número de Cheque", 
amount as "Cantidad con Pago > a Pago Promedio",
round((select avg(amount) from payments),2) as "Pago Promedio" 
from payments 
where amount > (select avg(amount) from payments)
order by amount;

-- Consulta para obtener el promedio de pagos y que es considerado subconsulta
select avg(amount) from payments;
-- RESULTADO
-- AVG 32431.645531


-- No. 12
-- Obten el nombre de aquellos clientes que no han hecho ninguna orden.
select customerNumber as "Número de Cliente", 
customerName as "Nombre del Cliente" 
from customers 
where customerNumber not in (select customerNumber from orders) 
order by customerNumber;
# COMPROBACION CON ALGUNOS NUMERO DE CLIENTES
select * from orders where customerNumber in (125, 168, 169, 206, 223, 237, 247, 273, 293, 303);

-- No. 13
-- Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
select max(quantityOrdered) as "Máximo del Número de Productos", 
min(quantityOrdered) as "Mínimo del Número de Productos", 
round(avg(quantityOrdered),2) as "Promedio del Número de Productos" 
from orderdetails;

-- No. 14
-- Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
# OPCION 1 - CON JOINS
select a.state as "Estado", 
count(*) as "Número de Ordenes por Estado"
from customers a, orders b 
where 
a.customerNumber=b.customerNumber 
group by state 
order by a.state;
#RESULTADO DE CONSULTA
#NULL 	180
#BC	4
#CA	45
#CT	8
#Isle of Wight	2
#MA	23
#NH	3
#

# COMPROBACION DE LA INFORMACION OBTENIDA
select * from customers where state= 'BC'; ## customerNumber in (202, 260);
select * from orders where customerNumber in (202, 260);


-- OPCION 2 - CON SUBCONSULTAS ANIDADAS
select (select state from customers where customerNumber = a.customerNumber) as "Estado", 
count(*) as "Número de Ordenes por Estado" 
from orders a 
group by Estado 
order by Estado;
