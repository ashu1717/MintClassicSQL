
/*1. Where are items stored and if they were rearranged, could a warehouse be eliminated?
-- The total quantity of items in each warehouse: */


/* Query to find the total no. of products in each warehouse woth warehouse Code and Name */
Select W.warehouseCode,W.warehouseName,sum(P.quantityInStock) AS total_products From warehouses W 
Left Join products P
On W.warehouseCode=P.warehouseCode
Group By W.warehouseCode;

/*Joining 4 tables to find out the countries where the items are shipped from warehouse d to understand the geographic implications of eliminating a warehouse */

Select Distinct(c.Country),Count(c.Country) From Customers c 
Join orders O
On c.customerNumber = O.customernumber
Join Orderdetails Od On
O.orderNumber = Od.Ordernumber
Join Products P on
od.ProductCode = P.ProductCode
where WarehouseCode = "d"
Group By c.Country;

/*2.  Total quantity ordered vs Quantity in Stock for each item in warehouse d */
Select P.productCode,P.productName,P.quantityInStock,O.quantityOrdered From Products P
Join orderdetails O On
P.productCode=O.productCode
Where P.warehouseCode = "d"
Order by quantityOrdered Desc ;

/* 3.  Query to find out the total quantity of products in  stock vs products ordered in all the warehouses */
Select P.productCode,p.productName,SUM(P.quantityInStock)As InStock,SUM(O.quantityOrdered)As Ordered From Products P
Join orderdetails O 
On P.productCode=O.productCode
Group by P.productCode
Order By InStock;


/* 4. Are we storing items that are not moving? Are any items candidates for being dropped from the product line? */

Drop Table If Exists NotShippedOrders;
Create Table IF not exists NotShippedOrders As
Select
	n.productCode,
	n.productname,
	n.totalOrdersNotShipped_AllReasons,
	c.TotalOrders_Cancelled
From
(
		Select Od.productCode,P.productName,Sum(Od.quantityOrdered) As totalOrdersNotShipped_AllReasons
		From products P
        Join orderdetails od 
        On Od.ProductCode=P.productCode
        JOin Orders O
        On O.ordernumber = Od.ordernumber
		where 
			lower(O.status) Not like "shipped"
		group by  od.productCode, P.productName 
) n
Join
(
	Select Od.productCode,P.productName,Sum(Od.quantityOrdered) As TotalOrders_Cancelled
	From products P
        Join orderdetails od 
        On Od.ProductCode=P.productCode
        JOin Orders O
        On O.ordernumber = Od.ordernumber
		where 
			lower(O.status) like "cancelled"
		group by  od.productCode, P.productName 
) c

On
n.productCode = c.productCode
Order By TotalOrdersNotShipped_AllReasons Desc;

SELECT * FROM NotShippedOrders; 
  


/*5.  Fast and slow moving product lines  */


Select P.productLine,Sum(p.quantityInStock)As TotalInSTock,Sum(O.quantityOrdered)As Totalorders , ((Sum(O.quantityOrdered)/Sum(P.quantityInStock))*100)As Percentage from products P
Join Orderdetails O
On p.productCode=O.productCode
Group by p.productLine
Order by 4 Desc;





