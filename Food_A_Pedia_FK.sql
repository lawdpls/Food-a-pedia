DROP DATABASE IF EXISTS Chinook;


/*******************************************************************************
   Create database - this is a special way of creating the database for mysql only!
********************************************************************************/
use mysql;
call mysql.CreateAppDB('Chinook','yzhang19');

USE Chinook;

DROP Table IF EXISTS `Restaurant`;
DROP Table IF EXISTS `Dish`;
DROP Table IF EXISTS `Customer`;
DROP Table IF EXISTS `Ingredient`;
DROP Table IF EXISTS `Rating`;
DROP Table IF EXISTS `Offer`;
DROP Table IF EXISTS `Menu`;
/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE `Restaurant`
(
    `R_Id` INT NOT NULL AUTO_INCREMENT,
    `Name` NVARCHAR(80) NOT NULL,
    `Address` NVARCHAR(70) NOT NULL,
    `PhoneNo` NVARCHAR(24) NOT NULL,
    `Dilivery` NVARCHAR(20),
    `Parking` NVARCHAR(40),
	`Wi-Fi` NVARCHAR(20),
    `Website` NVARCHAR(70),
    `MonToFri_OpenHourStart` NVARCHAR(20) NOT NULL,
    `MonToFri_OpenHourEnd` NVARCHAR(20) NOT NULL,
    `SatToSun_OpenHourStart` NVARCHAR(20) NOT NULL,
    `SatToSun_OpenHourEnd` NVARCHAR(20) NOT NULL,
     CONSTRAINT `PK_Restaurant` PRIMARY KEY  (`R_Id`)
);

CREATE TABLE `Dish`
( 
    `Dish_Id` INT NOT NULL AUTO_INCREMENT,
    `Name` NVARCHAR(120),
    `Genre` NVARCHAR(40),
     CONSTRAINT `PK_Dish` PRIMARY KEY  (`Dish_Id`)
);

CREATE TABLE `Customer`
(
    `Customer_Id` INT NOT NULL AUTO_INCREMENT,
    `CustomerAccount` NVARCHAR(70) NOT NULL,
    `FirstName` NVARCHAR(40),
    `LastName` NVARCHAR(20),
    `Address` NVARCHAR(70),
    `City` NVARCHAR(40),
    `State` NVARCHAR(40),
    `Country` NVARCHAR(40),
    `PostalCode` NVARCHAR(10),
    `Phone` NVARCHAR(24),
    `Email` NVARCHAR(60) NOT NULL,
    CONSTRAINT `PK_Customer` PRIMARY KEY  (`Customer_Id`)
);


CREATE TABLE `Ingredient`
(
    `Ingredient_Id` INT NOT NULL AUTO_INCREMENT,
    `Name` NVARCHAR(40),
    `Origins` NVARCHAR(40),
     CONSTRAINT `PK_Ingredient` PRIMARY KEY  (`Ingredient_Id`)
);

CREATE TABLE `Rating`
(
    `Offer_Id` INT NOT NULL,
    `Customer_Id` INT NOT NULL,
    `CustomerRate` INT NOT NULL,    
     CHECK (CustomerRate > 0 AND CustomerRate < 5),
     CONSTRAINT `PK_Rating` PRIMARY KEY  (`Offer_Id`,`Customer_Id`)
    );


CREATE TABLE `Offer`
(
    `Offer_Id` INT NOT NULL AUTO_INCREMENT,
    `Dish_Id` INT NOT NULL,
    `R_Id` INT NOT NULL,
    `Price` FLOAT NOT NULL,
     CONSTRAINT `PK_Offer` PRIMARY KEY  (`Offer_Id`)
);

CREATE TABLE `Cuisine`
(
    `Dish_Id` INT NOT NULL,
    `Ingredient_Id` INT NOT NULL,
     CONSTRAINT `PK_Cuisine` PRIMARY KEY  (`Dish_Id`,`Ingredient_Id`)
);

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE `Rating` ADD CONSTRAINT `FK_Offer_Id`
    FOREIGN KEY (`Offer_Id`) REFERENCES `Offer` (`Offer_Id`);

ALTER TABLE `Rating` ADD CONSTRAINT `FK_Customer_Id`
    FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`);


ALTER TABLE `Offer` ADD CONSTRAINT `FK_Dish_Id2`
    FOREIGN KEY (`Dish_Id`) REFERENCES `Dish` (`Dish_Id`);

ALTER TABLE `Offer` ADD CONSTRAINT `FK_R_Id2`
    FOREIGN KEY (`R_Id`) REFERENCES `Restaurant` (`R_Id`);

ALTER TABLE `Cuisine` ADD CONSTRAINT `FK_Dish_Id3`
    FOREIGN KEY (`Dish_Id`) REFERENCES `Dish` (`Dish_Id`);

ALTER TABLE `Cuisine` ADD CONSTRAINT `FK_Ingredient_Id`
    FOREIGN KEY (`Ingredient_Id`) REFERENCES `Ingredient` (`Ingredient_Id`);


/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO `Restaurant` (`Name`,`Address`,`PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Chuan Shabu', '301 Park Ave, Worcester','(508)556-7301','Yes','Private Lot','No','http://shabuworcester.com','11:30am','11:00pm','12:00pm','12:30am');

INSERT INTO `Restaurant` (`Name`,`Address`,`PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('BaBa Restaurant & Sushi Bar', '309 Park Ave, Worcester', '(508)556-1498','No','Private Lot','Paid','http://www.babasushi.com','11:30am','11:00pm','2:30am','12:30am');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Lucky Cafe', '102 Grove St, Worcester', '(508)756-5014','No','Street','No','http://www.luckyscafeworcester.com','8:00am','2:30pm','8:00am','1:30pm');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Boynton Restaurant & Spirits', '117 Highland St, Worcester', '(508)756-5432','No','Private Lot, Street','No','http://www.boyntonrestaurant.com','11:00am','1:30am','11:00am','2:00am');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('The Sole Proprietor', '118 Highland St, Worcester', '(508)798-3474','No','Private Lot','No','http://www.thesole.com','11:30am','1:30am','12:00am','1:30am');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Ralph Chadwick Square Dinner', '148 Grove St, Worcester', '(508)753-9543','No','Private Lot','No','http://www.ralphsrockdiner.com','4:00pm','2:00am','4:00pm','2:00am');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Boomers Pizza Sub & Deli', '93 Highland St, Worcester', '(508)791-5551','Yes','Private Lot, Street','No','http://www.boomerspizzeria.com','10:00am','11:00pm','10:00am','12:00am');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Dragon Dynasty', '104 Highland St, Worcester', '(508)755-5588','No','Private Lot, Street','No','http://www.dragondynastytakeout.com','11:00am','10:00pm','11:00am','11:00pm');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Thai Time', '107 Highland St, Worcester', '(508)756-7267','Yes','Street','Yes','http://www.thaitimeworcester.com','10:00am','11:00pm','10:00am','12:00am');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('New England Roast Beef', '33 Park Ave, Worcester', '(508)756-1991','No','Private Lot','No','http://www.eatatnerb.com','10:00am','10:00pm','10:00am','9:00pm');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Figs & Pigs', '50 Foster St, Worcester', '(508)929-0701','Yes','Private Lot, Street','No','http://www.boomerspizzeria.com','10:00am','11:00pm','10:00am','12:00am');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Shawarma Palace', '3 Pleasant St, Worcester', '(508)755-6500','No','Street','Yes',Null,'9:00am','7:00pm','10:00am','5:00pm');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Ernies Pizza', '80 West St, Worcester', '(508)755-3203','Yes','Street','No',Null,'11:00am','2:00am','12:00pm','2:00am');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('Gourmet Dumpling House', '52 Beach St, Boston', '(617)338-6223','No','Street', 'No', Null,'11:00am','11:00pm','11:00am','11:00pm');
 
INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('New Jumbo Seafood Restaurant', '5 Hudson St, Boston', '(617)542-2823', 'No', 'Street', 'No', Null,'11:00am','2:00am','11:00am','2:00am');

INSERT INTO `Restaurant` (`Name`,`Address`, `PhoneNo`,`Dilivery`,`Parking`,`Wi-Fi`,`Website`, `MonToFri_OpenHourStart`,`MonToFri_OpenHourEnd`,`SatToSun_OpenHourStart`,`SatToSun_OpenHourEnd`) 
VALUES ('The Plough and Stars', '912 Massachusetts Ave, Boston', '(617)576-0032', 'No', 'Street', 'Yes', 'http://www.ploughandstars.com','11:30am','1:00am','11:00am','2:00am');

#Customer:
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('wendy','Liyan','Huang','34 Wachusett','Worcester', 'MA', 'USA', '01609', '7744440928','hli@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('cali','Liyun','Wang','19 Wachusett','Worcester', 'MA', 'USA', '01609', '7744449372','huyli@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('suny','Jinjin','Lan','27 Wachusett','Worcester', 'MA', 'USA', '01609', '7744444820','hllki@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('snoe','Liang','Zhou','33 fruit','Worcester', 'MA', 'USA', '01609', '7744439203','yski@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('joe','Haiyan','Shu','26 Shusett','Worcester', 'MA', 'USA', '01609', '7744440999','kahs@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('jin','Hanya','Zhang','39 Lhusett','Worcester', 'MA', 'USA', '01609', '7744445689','kan@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('jim','Jianguo','Liang','27 Wchusett','Worcester', 'MA', 'USA', '01609', '7744441524','kjaa@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('san','Haru','Zhou','3 Ksett','Worcester', 'MA', 'USA', '01609', '7744441625','kas@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('sea','Xing','Wu','3 Muhusett','Worcester', 'MA', 'USA', '01609', '7744442647','usha@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('rau','Xin','Zheng','19 Lasy','Worcester', 'MA', 'USA', '01609', '7744449182','oals@gmail.com');
insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ('rall','Xing','Liang','29 Lasy','Worcester', 'MA', 'USA', '01609', '7724449182','oass@gmail.com');
#Dish:
insert into Dish(Name,Genre) values ('Kongbao Chicken','Chuan Food');
insert into Dish(Name,Genre) values ('Flavored pork','Chuan Food');
insert into Dish(Name,Genre) values ('Fish Filets in Hot Chili Oil','Chuan Food');
insert into Dish(Name,Genre) values ('Steamed barbecued pork buns','Chinese Food');
insert into Dish(Name,Genre) values ('Dumpling','Chinese Food');
insert into Dish(Name,Genre) values ('Naan bread','Indian Food');
insert into Dish(Name,Genre) values ('Pizza','Fast Food');
insert into Dish(Name,Genre) values ('Pita Chips','Fast Food');
insert into Dish(Name,Genre) values ('Curly Fries','Fast Food');
insert into Dish(Name,Genre) values ('Oysters and steamed mussels','Sea Food');
insert into Dish(Name,Genre) values ('Grilled salmon with asparagus','Italian Food');
insert into Dish(Name,Genre) values ('Cake','Dissert');
insert into Dish(Name,Genre) values ('Sandwich','Fast Food');
insert into Dish(Name,Genre) values ('Cheese Burger','Fast Food');
insert into Dish(Name,Genre) values ('Hot Dog','Fast Food');
insert into Dish(Name,Genre) values ('Taco','Italian Food');
insert into Dish(Name,Genre) values ('Salad','Fast Food');


#Ingredient:
insert into Ingredient(name) values ('Chicken');
insert into Ingredient(name) values ('Pepper');
insert into Ingredient(name) values ('Peanut');
insert into Ingredient(name) values ('Carrot');
insert into Ingredient(name) values ('Black Fungus');
insert into Ingredient(name) values ('Fish');
insert into Ingredient(name) values ('Lettuce');
insert into Ingredient(name) values ('Pork');
insert into Ingredient(name) values ('Flour');
insert into Ingredient(name) values ('Cheese');
insert into Ingredient(name) values ('Onion');
insert into Ingredient(name,Origins) values ('Oyster','Boston');
insert into Ingredient(name,Origins) values ('Mussel','Boston');
insert into Ingredient(name,Origins) values ('Salmon','Boston');
insert into Ingredient(name) values ('Asparagus');
insert into Ingredient(name) values ('Shallot');
insert into Ingredient(name) values ('mashroom');
insert into Ingredient(name) values ('Photo');
insert into Ingredient(name) values ('Egg');

#Cuisine:
insert into Cuisine(Dish_Id, Ingredient_Id) values (1,1);
insert into Cuisine(Dish_Id, Ingredient_Id) values (1,2);
insert into Cuisine(Dish_Id, Ingredient_Id) values (1,3);
insert into Cuisine(Dish_Id, Ingredient_Id) values (2,8);
insert into Cuisine(Dish_Id, Ingredient_Id) values (2,4);
insert into Cuisine(Dish_Id, Ingredient_Id) values (2,5);
insert into Cuisine(Dish_Id, Ingredient_Id) values (3,6);
insert into Cuisine(Dish_Id, Ingredient_Id) values (3,7);
insert into Cuisine(Dish_Id, Ingredient_Id) values (4,8);
insert into Cuisine(Dish_Id, Ingredient_Id) values (4,7);
insert into Cuisine(Dish_Id, Ingredient_Id) values (5,8);
insert into Cuisine(Dish_Id, Ingredient_Id) values (5,9);
insert into Cuisine(Dish_Id, Ingredient_Id) values (5,4);
insert into Cuisine(Dish_Id, Ingredient_Id) values (5,7);
insert into Cuisine(Dish_Id, Ingredient_Id) values (6,9);
insert into Cuisine(Dish_Id, Ingredient_Id) values (6,10);
insert into Cuisine(Dish_Id, Ingredient_Id) values (6,16);
insert into Cuisine(Dish_Id, Ingredient_Id) values (7,9);
insert into Cuisine(Dish_Id, Ingredient_Id) values (7,10);
insert into Cuisine(Dish_Id, Ingredient_Id) values (7,1);
insert into Cuisine(Dish_Id, Ingredient_Id) values (7,8);
insert into Cuisine(Dish_Id, Ingredient_Id) values (7,11);
insert into Cuisine(Dish_Id, Ingredient_Id) values (8,18);
insert into Cuisine(Dish_Id, Ingredient_Id) values (8,9);
insert into Cuisine(Dish_Id, Ingredient_Id) values (9,11);
insert into Cuisine(Dish_Id, Ingredient_Id) values (9,9);
insert into Cuisine(Dish_Id, Ingredient_Id) values (10,12);
insert into Cuisine(Dish_Id, Ingredient_Id) values (10,13);
insert into Cuisine(Dish_Id, Ingredient_Id) values (11,15);
insert into Cuisine(Dish_Id, Ingredient_Id) values (11,14);
insert into Cuisine(Dish_Id, Ingredient_Id) values (12,19);
insert into Cuisine(Dish_Id, Ingredient_Id) values (12,9);
insert into Cuisine(Dish_Id, Ingredient_Id) values (13,9);
insert into Cuisine(Dish_Id, Ingredient_Id) values (13,19);
insert into Cuisine(Dish_Id, Ingredient_Id) values (13,14);
insert into Cuisine(Dish_Id, Ingredient_Id) values (13,1);
insert into Cuisine(Dish_Id, Ingredient_Id) values (13,6);
insert into Cuisine(Dish_Id, Ingredient_Id) values (13,7);
insert into Cuisine(Dish_Id, Ingredient_Id) values (13,10);


#create offer table
insert into Offer(Dish_Id,R_Id,Price) values(1,1,8.6);
insert into Offer(Dish_Id,R_Id,Price) values(1,8,9.3);
insert into Offer(Dish_Id,R_Id,Price) values(1,14,25.1);
insert into Offer(Dish_Id,R_Id,Price) values(2,1,18.4);
insert into Offer(Dish_Id,R_Id,Price) values(2,8,22);
insert into Offer(Dish_Id,R_Id,Price) values(3,1,18.3);
insert into Offer(Dish_Id,R_Id,Price) values(3,2,33.1);
insert into Offer(Dish_Id,R_Id,Price) values(4,1,10.3);
insert into Offer(Dish_Id,R_Id,Price) values(4,14,5.6);
insert into Offer(Dish_Id,R_Id,Price) values(5,1,5.9);
insert into Offer(Dish_Id,R_Id,Price) values(5,8,6.2);
insert into Offer(Dish_Id,R_Id,Price) values(5,14,6.8);
insert into Offer(Dish_Id,R_Id,Price) values(6,9,5.2);
insert into Offer(Dish_Id,R_Id,Price) values(7,3,4.2);
insert into Offer(Dish_Id,R_Id,Price) values(7,4,7.2);
insert into Offer(Dish_Id,R_Id,Price) values(7,11,2.2);
insert into Offer(Dish_Id,R_Id,Price) values(7,12,6.2);
insert into Offer(Dish_Id,R_Id,Price) values(7,13,7.2);
insert into Offer(Dish_Id,R_Id,Price) values(7,16,10.2);
insert into Offer(Dish_Id,R_Id,Price) values(8,3,5.2);
insert into Offer(Dish_Id,R_Id,Price) values(8,4,13.2);
insert into Offer(Dish_Id,R_Id,Price) values(8,9,6.2);
insert into Offer(Dish_Id,R_Id,Price) values(8,10,8.2);
insert into Offer(Dish_Id,R_Id,Price) values(8,11,9.2);
insert into Offer(Dish_Id,R_Id,Price) values(8,12,9.2);
insert into Offer(Dish_Id,R_Id,Price) values(8,13,11);
insert into Offer(Dish_Id,R_Id,Price) values(8,16,12);
insert into Offer(Dish_Id,R_Id,Price) values(9,3,3.2);
insert into Offer(Dish_Id,R_Id,Price) values(9,4,4.1);
insert into Offer(Dish_Id,R_Id,Price) values(9,7,8.4);
insert into Offer(Dish_Id,R_Id,Price) values(9,9,16.9);
insert into Offer(Dish_Id,R_Id,Price) values(9,10,6.4);
insert into Offer(Dish_Id,R_Id,Price) values(9,11,26.4);
insert into Offer(Dish_Id,R_Id,Price) values(9,12,8.9);
insert into Offer(Dish_Id,R_Id,Price) values(9,13,9.99);
insert into Offer(Dish_Id,R_Id,Price) values(9,16,5.4);
insert into Offer(Dish_Id,R_Id,Price) values(10,10,45);
insert into Offer(Dish_Id,R_Id,Price) values(10,12,15.4);
insert into Offer(Dish_Id,R_Id,Price) values(10,15,12.5);
insert into Offer(Dish_Id,R_Id,Price) values(11,3,7);
insert into Offer(Dish_Id, R_Id, Price) values (11, 7, 8.99);
insert into Offer(Dish_Id, R_Id, Price) values (11, 8, 4.69);
insert into Offer(Dish_Id, R_Id, Price) values (11, 10, 6.69);
insert into Offer(Dish_Id, R_Id, Price) values (11, 11, 48.89);
insert into Offer(Dish_Id, R_Id, Price) values (11, 12, 18.99);
insert into Offer(Dish_Id, R_Id, Price) values (11, 15, 7.00);
insert into Offer(Dish_Id, R_Id, Price) values (11, 16, 7.99);
insert into Offer(Dish_Id, R_Id, Price) values (12, 3, 5.99);
insert into Offer(Dish_Id, R_Id, Price) values (12, 7, 6.99);
insert into Offer(Dish_Id, R_Id, Price) values (12, 8, 35.99);
insert into Offer(Dish_Id, R_Id, Price) values (12, 10, 7.99);
insert into Offer(Dish_Id, R_Id, Price) values (12, 11, 8.99);
insert into Offer(Dish_Id, R_Id, Price) values (12, 15, 4.99);
insert into Offer(Dish_Id, R_Id, Price) values (12, 16, 5.99);
insert into Offer(Dish_Id, R_Id, Price) values (13, 11, 15.99);
insert into Offer(Dish_Id, R_Id, Price) values (13, 12, 19.99);
insert into Offer(Dish_Id, R_Id, Price) values (14, 7, 25.99);
insert into Offer(Dish_Id, R_Id, Price) values (14, 10, 10.99);
insert into Offer(Dish_Id, R_Id, Price) values (14, 11, 30.99);
insert into Offer(Dish_Id, R_Id, Price) values (14, 16, 20.99);
insert into Offer(Dish_Id, R_Id, Price) values (15, 8, 20.99);
insert into Offer(Dish_Id, R_Id, Price) values (15, 10, 20.99);
insert into Offer(Dish_Id, R_Id, Price) values (16, 8, 20.99);
insert into Offer(Dish_Id, R_Id, Price) values (17, 4, 30.99);
insert into Offer(Dish_Id, R_Id, Price) values (17, 8, 20.99);
insert into Offer(Dish_Id, R_Id, Price) values (17, 11, 30.99);

#create rating table
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,4,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,5,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,6,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,8,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,10,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,11,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(1,9,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,2,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,5,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,6,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,7,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,9,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(2,11,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,1,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,4,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,5,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,6,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,8,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,9,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,10,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(3,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,2,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,3,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,5,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,6,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,9,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(4,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,1,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,3,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,4,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,10,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,5,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,6,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,7,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,2,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(5,8,3);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,11,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,1,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,6,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,7,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,8,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(6,10,3);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,5,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,6,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,7,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,8,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,9,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,10,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(7,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,1,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,4,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,10,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,8,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(8,11,2);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(9, 11,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(9, 3,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(9, 8,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(9, 9,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(9, 6,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(9,4,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(9,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(9,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(9,2,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(9,1,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(9,10,3);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,11,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,1,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,6,6);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,7,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,8,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,9,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(10,10,2);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,1,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,8,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,9,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,5,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,6,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,2,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(11,11,3);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(12, 6, 1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(12, 7, 2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(12, 8, 3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(12, 3, 4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(12, 4, 5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(12,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(12,10,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(12,1,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(12,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(12,5,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(12,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,6,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,7,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,10,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,11,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,9,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(13,8,3);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,1,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,5,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,10,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(14,11,3);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,5,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,4,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,6,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,8,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,9,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,10,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(15,11,2);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(16,3,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(16,7,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(16,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(16,9,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(16,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(16,5,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(16,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(16,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(16,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(16,6,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(16,11,4);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(17,1,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(17,2,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(17,5,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(17,11,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(17,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(17,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(17,8,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(17,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(17,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(17,9,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(17,10,2);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(18, 1,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(18, 11,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(18, 5,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(18, 10,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(18, 9,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(18,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(18,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(18,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(18,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(18,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(18,8,5);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,8,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,9,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(19,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,4,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,8,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,9,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,7,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,10,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(20,11,2);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,5,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,4,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,1,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,2,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,8,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,9,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,6,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,10,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(21,11,1);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,1,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,5,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,6,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,7,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,8,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(22,11,5);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,6,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,10,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,8,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,11,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(23,9,5);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(24,1,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(24,3,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(24,6,1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(24,8,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(24,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(24,9,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(24,4,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(24,5,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(24,2,4);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(25,1,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(25,3,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(25,4,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(25,8,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(25,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(25,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(25,11,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(25,10,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(25,7,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(25,6,4);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(26, 1,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(26, 11,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(26, 7,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(26,10,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(26, 5,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(26,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(26,8,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(26,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(26,2,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,3,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,4,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,6,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,8,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,9,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,10,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(27,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,9,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(28,11,2);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,9,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,10,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,7,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,1,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,5,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,6,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,8,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(29,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,1,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,2,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,4,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,5,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,6,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,7,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,8,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,9,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,10,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(30,11,2);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,1,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,4,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,5,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,8,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,10,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(31,11,2);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,4,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,5,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,8,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,9,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,10,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(32,11,2);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(33,2,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(33,6,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(33,5,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(33,7,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(33,11,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(33,9,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(33,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(33,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(33,1,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(33,8,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(33,10,3);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(34,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(34,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(34,5,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(34,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(34,7,4);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(35, 2, 2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(35, 3,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(35, 4,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(35, 10, 2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(35, 6, 1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(35,7,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(35,1,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(35,5,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(35,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(36,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,1,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,2,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,4,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,6,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,9,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,10,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(37,11,5);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(38,4,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(38,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(38,6,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(38,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(38,8,3);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(39, 8, 1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(39, 2, 2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(39, 3, 3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(39, 4, 4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(39, 5, 5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(39,6,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(39,1,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(39,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(39,11,3);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,3,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,4,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,8,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,10,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(40,11,1);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,3,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,5,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,8,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,10,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(41,11,2);


insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,4,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,7,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,10,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(42,11,5);


insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,4,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,7,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,9,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(43,11,4);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,2,1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,3,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,5,1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,7,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,9,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,4,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,1,1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,6,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,8,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,11,1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(44,10,5);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,1,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,2,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,4,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,6,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,7,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,3,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,5,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,8,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,9,1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,10,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(45,11,1);


insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(46,11,4);


insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,1,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,5,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,9,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(47,11,1);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,1,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,3,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,10,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(48,11,1);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,1,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,2,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,3,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,4,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(49,11,1);


insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,1,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,3,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,9,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,10,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(50,11,4);


insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,2,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,4,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,5,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,9,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(51,11,4);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,1,1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,3,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,5,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,6,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,9,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,2,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,4,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,7,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,8,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,10,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(52,11,1);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,3,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,4,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,8,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,10,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(53,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,1,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,4,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,9,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(54,11,5);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(55,1,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(55,3,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(55,5,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(55,6,5);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(55,9,2);

insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(56, 3,1);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(56, 4,2);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(56, 6,3);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(56, 8,4);
insert into Rating(Offer_Id, Customer_Id, CustomerRate) values 	(56, 9,3);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,3,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,7,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,8,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(57,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,1,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,3,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,6,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,9,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(58,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,3,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,4,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,10,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(59,11,4);


insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(60,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,1,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(61,11,2);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(62,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,7,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,8,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,9,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(63,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,1,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,3,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,4,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,6,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,7,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(64,11,4);

insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,2,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,3,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,4,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,7,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,9,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,10,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(65,11,5);



insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,1,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,2,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,3,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,4,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,5,5);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,6,4);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,7,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,8,3);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,9,2);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,10,1);
insert into Rating(Offer_Id,Customer_Id,CustomerRate) values(66,11,4);




