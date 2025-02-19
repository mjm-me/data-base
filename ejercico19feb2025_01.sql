use northwind;

CREATE VIEW ventas AS
SELECT
CONCAT_WS(' ', FirstName, LastName) AS Nombre,
o.OrderID,
od.ProductID,
p.ProductName,
p.Unit,
od.Quantity,
p.Price,
FORMAT (od.Quantity * p.Price, 0) as Total
FROM employees e 
JOIN orders o
USING (EmployeeID)
JOIN orderdetails od
ON o.OrderID = od.OrderID
JOIN products p
ON od.ProductID = p.ProductID 
ORDER BY e.LastName
;

SELECT Nombre, FORMAT (sum(total),0) as TOTAL FROM ventas GROUP BY(Nombre) order by sum(TOTAL);
SELECT round(sum(TOTAL),2) FROM ventas GROUP BY Nombre;
SELECT round(avg(t)) FROM (select round(sum(TOTAL),2) AS T FROM ventas GROUP BY Nombre) AS ccc;

SELECT Nombre, FORMAT(sum(total),0) TOTAL FROM ventas GROUP BY(Nombre) HAVING sum(TOTAL) < 
(SELECT round(avg(t)) FROM (select round(sum(TOTAL),2) AS T FROM ventas GROUP BY Nombre) AS n)
ORDER BY sum(TOTAL);
