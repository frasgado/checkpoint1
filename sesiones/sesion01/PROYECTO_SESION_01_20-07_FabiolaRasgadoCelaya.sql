########################################
-- PROYECTO SESION 01 
-- Realizado por: Fabiola Rasgado Celaya
########################################
-- No. 01
-- Dentro del mismo servidor de bases de datos, conéctate al esquema classicmodels.
use classicmodels;
describe employees;

-- No. 02
-- Dentro de la tabla employees, obtén el apellido de todos los empleados.
select lastName as "Apellido" 
from employees;

-- No. 03
-- Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos los empleados.
select lastName as "Apellido", 
firstName as "Nombre", 
jobTitle as "Puesto"
from employees;

-- No. 04
-- Dentro de la tabla employees, obtén todos los datos de cada empleado.
select * from employees order by employeeNumber;

-- No. 05
-- Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos los empleados que tengan el puesto Sales Rep.
select lastName as "Apellido", 
firstName as "Nombre", 
jobTitle as "Puesto" 
from employees 
where jobTitle = 'Sales Rep';

-- No. 06
-- Dentro de la tabla employees, obtén el apellido, nombre, puesto y código de oficina de 
-- todos los empleados que tengan el puesto Sales Rep y código de oficina 1.
select lastName as "Apellido", 
firstName as "Nombre", 
jobTitle as "Puesto", 
officeCode as "Código de Oficina"
from employees 
where 
jobTitle = 'Sales Rep' 
and officeCode = 1;

-- No. 07
-- Dentro de la tabla employees, obtén el apellido, nombre, puesto y 
-- código de oficina de todos los empleados que tengan el puesto Sales Rep o código de oficina 1.
select lastName as "Apellido", 
firstName as "Nombre", 
jobTitle as "Puesto", 
officeCode as "Código de Oficina" 
from employees 
where 
jobTitle = 'Sales Rep' 
or officeCode = 1;

-- No. 08
-- Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados que tenga código de oficina 1, 2 o 3.
select lastName as "Apellido", 
firstName as "Nombre", 
officeCode as "Código de Oficina" 
from employees 
where 
officeCode in (1,2,3);

-- No. 09
-- Dentro de la tabla employees, obten el apellido, nombre y puesto de todos los empleados 
-- que tengan un puesto distinto a Sales Rep.
select lastName as "Apellido", 
firstName as "Nombre", 
jobTitle as "Puesto" 
from employees 
where 
jobTitle <> 'Sales Rep';

-- No. 10
-- Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos 
-- los empleados cuyo código de oficina sea mayor a 5.
select lastName as "Apellido", 
firstName as "Nombre", 
officeCode as "Código de Oficina"
from employees 
where 
officeCode > 5;

-- No. 11
-- Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados 
-- cuyo cdigo de oficina sea menor o igual 4.
select lastName as "Apellido", 
firstName as "Nombre", 
officeCode as "Código de Oficina"
from employees 
where 
officeCode <= 4;

-- No. 12
-- Dentro de la tabla customers, obtén el nombre, país y estado de todos los clientes 
-- cuyo país sea USA y cuyo estado sea CA.
select customerName as "Nombre", 
country as "País", 
state as "Estado"
from customers 
where 
country = "USA" 
and state = "CA";

-- No. 13
-- Dentro de la tabla customers, obtén el nombre, país, estado y límite de crédito de todos los clientes 
-- cuyo país sea, USA, cuyo estado sea CA y cuyo límite de crédito sea mayor a 100000.
select customerName as "Nombre", 
country as "País", 
state as "Estado", 
creditLimit as "Límite de Crédito" 
from customers 
where 
country = "USA" 
and state = "CA" 
and creditLimit> 100000;

-- No. 14
-- Dentro de la tabla customers, obtén el nombre y país de todos los clientes cuyo país sea USA o France.
select customerName as "Nombre", 
country as "País"
from customers 
where country in ('USA', 'France') 
order by country;

-- No. 15
-- Dentro de la tabla customers, obtén el nombre, país y límite de crédito de todos los clientes 
-- cuyo país sea USA o France y cuyo límite de crédito sea mayor a 100000. Para este ejercicio ten cuidado con los paréntesis.
select customerName as "Nombre", 
country as "País", 
creditLimit as "Límite de Crédito" 
from customers 
where country in ('USA', 'France')  
and creditLimit> 100000 
order by country, creditLimit desc;

-- No. 16
-- Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país 
-- de aquellas oficinas que se encuentren en USA o France.
select officeCode as "Código de la Oficina", 
city as "Ciudad", 
phone as "Teléfono", 
country as "País"
from offices 
where country in ('USA', 'France'); 

-- No. 17
-- Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país 
-- de aquellas oficinas que no se encuentren en USA o France.
select officeCode as "Código de la Oficina", 
city as "Ciudad", 
phone as "Teléfono", 
country as "Páis" 
from offices 
where 
country not in ('USA', 'France'); 

-- No. 18
-- Dentro de la tabla orders, obtén el número de orden, número de cliente, estado y fecha 
-- de envío de todas las órdenes con el número 10165, 10287 o 10310.
select orderNumber as "Número de Orden", 
customerNumber as "Número de Cliente", 
status as "Estado", 
shippedDate as "Fecha de Envío" 
from orders 
where 
orderNumber in (10165, 10287, 10310);

-- No. 19
-- Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena 
-- los resultados por apellido de forma ascendente.
select contactLastName as "Apellido", 
contactFirstName as "Nombre del Cliente" 
from customers 
order by contactLastName;

-- No. 20
-- Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena 
-- los resultados por apellido de forma descendente.
select contactLastName as "Apellido", 
contactFirstName as "Nombre del Cliente" 
from customers 
order by contactLastName desc;

-- No. 21
-- Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena 
-- los resultados por apellido de forma descendente y luego por nombre de forma ascendente.
select contactLastName as "Apellido", 
contactFirstName as "Nombre del Cliente"
from customers 
order by contactLastName desc, contactFirstName asc;

-- No. 22
-- Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de crédito 
-- de los cinco clientes con el límite de crédito más alto (top 5).
select customerNumber as "Número del Cliente", 
customerName as "Nombre de Cliente", 
creditLimit  as "Límite de Crédito" 
from customers 
order by creditLimit desc limit 5;


-- No. 23
-- Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más bajo.
select customerNumber as "Número de Cliente", 
customerName as "Nombre del Cliente", 
creditLimit as "Límite de Crédito" 
from customers 
order by creditLimit asc limit 5;
