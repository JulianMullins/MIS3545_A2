CREATE DATABASE LemonadeStand;

USE LemonadeStand;

/*generate tables*/
CREATE TABLE Supplier(
Supplier_ID BIGINT NOT NULL PRIMARY KEY,
Company_Name TEXT NOT NULL,
Contact_Name TEXT NOT NULL,
Phone_Number BIGINT NOT NULL);

CREATE TABLE Ingredient(
Ingredient_ID BIGINT NOT NULL PRIMARY KEY,
Supplier_ID BIGINT NOT NULL,
Ingredient_Name TEXT NOT NULL,
Measurement_Type TEXT NOT NULL,
Quantity_Puchased BIGINT NOT NULL);

CREATE TABLE Product(
Product_ID BIGINT NOT NULL PRIMARY KEY,
Product_Name TEXT NOT NULL,
Price DECIMAL NOT NULL);

CREATE TABLE Ingredient_Product(
Ingredient_ID BIGINT NOT NULL,
Product_ID BIGINT NOT NULL);

CREATE TABLE Sale(
Sales_ID BIGINT NOT NULL PRIMARY KEY,
Customer_ID BIGINT NOT NULL,
Stand_ID BIGINT,
Product_ID BIGINT NOT NULL,
Quantity BIGINT NOT NULL);

CREATE TABLE Customer(
Customer_ID BIGINT NOT NULL PRIMARY KEY,
Customer_Name TEXT NOT NULL,
Phone_Number BIGINT NOT NULL);

CREATE TABLE Stand(
Stand_ID BIGINT NOT NULL PRIMARY KEY,
Salesperson_Name TEXT NOT NULL,
Annual_Salary DECIMAL NOT NULL,
Start_Date DATE NOT NULL,
End_Date DATE,
Location TEXT NOT NULL);

/*Create table relationships*/
ALTER TABLE Ingredient ADD CONSTRAINT FK_Ingredients_Supplier
FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID);
ALTER TABLE Ingredient_Product ADD CONSTRAINT FK_IngredientProduct_Ingredient
FOREIGN KEY (Ingredient_ID) REFERENCES Ingredient(Ingredient_ID);
ALTER TABLE Ingredient_Product ADD CONSTRAINT FK_IngredientProduct_Product
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID);
ALTER TABLE Sale ADD CONSTRAINT FK_Sales_Products
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID);
ALTER TABLE Sale ADD CONSTRAINT FK_Sales_Customers
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID);
ALTER TABLE Sale ADD CONSTRAINT FK_Sales_Stand
FOREIGN KEY (Stand_ID) REFERENCES Stand(Stand_ID);
ALTER TABLE Sale ADD CONSTRAINT FK_Sales_Product
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID);

/*Insert Data*/
INSERT INTO Supplier(Supplier_ID, Company_Name, Contact_Name, Phone_Number) VALUES
(1, 'Oxnard Lemon Company', 'Jack', 8590931389),
(2, 'Franklin Honey Inc', 'Frank', 9475925543),
(3, 'Grace Tea Company', 'Grace', 9984650012),
(4, 'Katsiroubas Produce', 'Kate', 8472947222),
(5, 'Imperial Sugar Company', 'Intouch', 6378368821),
(6, 'Gingers Oil Company Inc', 'Elva', 9984245641),
(7, 'Grey Goose', 'Sidney', 6173846263),
(8, 'Corona', 'Patrick', 7384967111),
(9, 'Patron', 'Mary', 9485224112),
(10, 'Salt Bae', 'Nusret', 7462345121),
(11, 'Poland Springs', 'Mr. Poland', 8971239872);

INSERT INTO Ingredient(Ingredient_ID, Supplier_ID, Ingredient_Name, Measurement_Type, Quantity_Puchased) VALUES 
(1, 1, 'Lemon', '1 whole lemon', 666),
(2, 2, 'Honey', '1 spoonful', 55),
(3, 3, 'Green Tea', '1 bag', 45),
(4, 4, 'Raspberries', '½ cup', 74),
(5, 5, 'Sugar', '½ cup', 500),
(6, 6, 'Ginger Extract', '1 tablespoon', 50),
(7, 7, 'Vodka', '1 shot', 100),
(8, 8, 'Beer', '1 bottle', 5000),
(9, 9, 'Tequila', '1 shot', 100),
(10, 10, 'Salt', '1 teaspoon', 10000),
(11, 11, 'Water', '1 cup', 10000),
(12, 11, 'Sparkling Water', '1 cup', 500);

INSERT INTO Ingredient_Product(Ingredient_ID, Product_ID) VALUES
(1, 1),
(9, 1),
(10, 1),
(11, 1),
(1, 2),
(2, 2),
(5, 2),
(11, 2),
(1, 3),
(11, 3),
(1, 4),
(2, 4),
(3, 4),
(11, 4),
(1, 5),
(2, 5),
(5, 5),
(4, 5),
(1, 6),
(2, 6),
(5, 6),
(6, 6),
(1, 7),
(8, 7),
(7, 8),
(1, 8),
(11, 8),
(1, 9),
(7, 9),
(10, 9),
(12, 10),
(1, 10),
(2, 10),
(5, 10);

INSERT INTO Product(Product_ID, Product_Name, Price)
VALUES
(1, 'Margarita', 8),
(2, 'Original Lemonade', 2.5),
(3, 'Unsweetened Lemonade', 2),
(4, 'Half Lemonade Half Tea', 3.5),
(5, 'Raspberry Lemonade', 3.5),
(6, 'Ginger Lemonade', 4),
(7, 'Lemonade Beer', 6.5),
(8, 'Lemon on the Beach', 8),
(9, 'Lemon Tequila Shot', 3),
(10, 'Sparkling Lemonade', 4);

INSERT INTO Sale(Sales_ID, Customer_ID, Stand_ID, Product_ID, Quantity)
VALUES
(1, 1, 1, 1, 5),
(2, 1, 1, 9, 3),
(3, 2, 3, 3, 2),
(4, 5, 2, 7, 9),
(5, 4, 2, 6, 1),
(6, 9, 7, 2, 1),
(7, 4, 8, 5, 2),
(8, 3, 5, 8, 4),
(9, 8, 2, 6, 3),
(10, 8, 2, 7, 10);

INSERT INTO Customer(Customer_ID, Customer_Name, Phone_Number) VALUES
(1, 'Paul', 6172239384),
(2, 'Brandon', 3748482764),
(3, 'Julian', 9489284612),
(4, 'Peter', 2341118754),
(5, 'Louis', 9841238974),
(6, 'Lisa', 9041238888),
(7, 'Lauren', 3427775811),
(8, 'Jack', 9090903333),
(9, 'Jae', 2123435758),
(10, 'Clark', 1232312254);

INSERT INTO Stand(Stand_ID, Salesperson_Name, Annual_Salary, Start_Date, End_Date, Location)
VALUES
(1, 'Tom', 40000, '2017-05-01', Null, 'Boston'),
(2, 'Mac', 38000, '2017-03-04', Null, 'Boston'),
(3, 'Sara', 42000, '2017-04-01', Null, 'New York'),
(4, 'Mike', 45000, '2017-06-12', '2018-02-14', 'New York'),
(5, 'Mary', 45000, '2018-02-14', Null, 'New York'),
(6, 'Madrid', 28000, '2017-02-01', Null, 'Chicago'),
(7, 'Waydi', 35000, '2018-01-01', Null, 'Chicago'),
(8, 'Bam', 34500, '2018-01-01', Null, 'Chicago'),
(9, 'John', 20000, '2017-01-01', Null, 'New York'),
(10, 'Paulina', 60000, '2018-01-11', Null, 'Los Angeles');