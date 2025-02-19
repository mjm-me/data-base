SELECT * FROM products;

SELECT ProductID, ProductName, SupplierName, CategoryName
 from products p 
 join suppliers s on p.SupplierID = s.SupplierID
 join categories c on p.CategoryID = c.CategoryID;