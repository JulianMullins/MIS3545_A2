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
SELECT B.Product_Name, SUM(A.Quantity*B.Price)
FROM Sale AS A 
INNER JOIN Product AS B ON 
A.Product_ID=B.Product_ID
GROUP BY B.Product_Name;

/*Left Outer Join*/
SELECT A.Stand_ID, A.Location, A.Quantity
FROM Stand AS A
LEFT OUTER JOIN Sales AS B ON
A.Stand_ID=B.Stand_ID
/*Sales made at no stand in particular will not be joined. This is necessary for us to capture the true productive ability of each stand.*/

/*Subquery*/
SELECT A. Stand_ID, A.Location, SUM(B.Quantity*C.Price)-(SELECT AVG(B.Quantity*C.Price)) FROM Sales as B JOIN Product AS C ON B.Product_ID=C.Product_ID GROUP BY A.Stand_ID)
FROM Location AS A
JOIN Sales AS B ON
A.Stand_ID=B.Stand_ID
JOIN Product AS C ON
B.Product_ID=C.Product_ID
GROUP BY A.Stand_ID, A.Location
/*Shows stand IDs, their corresponding locations, and the difference between their revenues and the average of all stand revenues.*/
