USE LemonadeStand;

/*QUERIES*/

SELECT *
FROM Supplier

SELECT *
FROM Ingredient

SELECT *
FROM Ingredient_Product

SELECT *
FROM Product

SELECT *
FROM Sale

SELECT *
FROM Customer

SELECT *
FROM Stand

/*Inner Join*/
SELECT B.Product_ID, B.Product_Name, SUM(A.Quantity*B.Price) AS Total_Sales
FROM Sale AS A 
INNER JOIN Product AS B ON 
A.Product_ID=B.Product_ID
GROUP BY B.Product_ID, B.Product_Name;
/*View total sales by product ID. Notice that, because product 10 was never bought, it is excluded from the output.*/


/*Left Outer Join*/
SELECT A.Stand_ID, A.Location, B.Quantity
FROM Stand AS A
RIGHT OUTER JOIN Sale AS B ON
A.Stand_ID=B.Stand_ID;
/*Stands with no sales will not be joined. Those stands have not begun selling, so it is not necessary to look at them. For reference, stands 4, 6, 9, and 10 have no sales.*/

/*Subquery*/
SELECT A.Stand_ID, A.Location, SUM(B.Quantity*C.Price)-(SELECT AVG(B.Quantity*C.Price) FROM Sale as B JOIN Product AS C ON B.Product_ID=C.Product_ID GROUP BY A.Stand_ID)
FROM Stand AS A
JOIN Sale AS B ON
A.Stand_ID=B.Stand_ID
JOIN Product AS C ON
B.Product_ID=C.Product_ID
GROUP BY A.Stand_ID, A.Location
/*Shows stand IDs, their corresponding locations, and the difference between their revenues and the average of all stand revenues.*/
