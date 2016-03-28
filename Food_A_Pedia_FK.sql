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
    `Dish_Id` INT NOT NULL,
    `R_Id` INT NOT NULL,
    `Customer_Id` INT NOT NULL,
    `CustomerRate` INT NOT NULL,    
     CHECK (CustomerRate > 0 AND CustomerRate < 5),
     CONSTRAINT `PK_Rating` PRIMARY KEY  (`Dish_Id`,`R_Id`,`Customer_Id`)
    );


CREATE TABLE `Offer`
(
    `Dish_Id` INT NOT NULL,
    `R_Id` INT NOT NULL,
    `Price` FLOAT NOT NULL,
     CONSTRAINT `PK_Offer` PRIMARY KEY  (`Dish_Id`,`R_Id`)
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
ALTER TABLE `Rating` ADD CONSTRAINT `FK_Dish_Id`
    FOREIGN KEY (`Dish_Id`) REFERENCES `Dish` (`Dish_Id`);

ALTER TABLE `Rating` ADD CONSTRAINT `FK_R_Id`
    FOREIGN KEY (`R_Id`) REFERENCES `Restaurant` (`R_Id`);

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
insert into Offer(R_Id,Dish_Id,Price) values(1,1,8.6);
insert into Offer(R_Id,Dish_Id,Price) values(1,2,9.3);
insert into Offer(R_Id,Dish_Id,Price) values(1,3,25.1);
insert into Offer(R_Id,Dish_Id,Price) values(1,5,18.4);
insert into Offer(R_Id,Dish_Id,Price) values(1,4,22);
insert into Offer(R_Id,Dish_Id,Price) values(2,3,18.3);
insert into Offer(R_Id,Dish_Id,Price) values(2,10,33.1);
insert into Offer(R_Id,Dish_Id,Price) values(3,7,10.3);
insert into Offer(R_Id,Dish_Id,Price) values(3,8,5.6);
insert into Offer(R_Id,Dish_Id,Price) values(3,9,5.9);
insert into Offer(R_Id,Dish_Id,Price) values(3,13,6.2);
insert into Offer(R_Id,Dish_Id,Price) values(4,7,6.8);
insert into Offer(R_Id,Dish_Id,Price) values(4,8,5.2);
insert into Offer(R_Id,Dish_Id,Price) values(4,9,4.2);
insert into Offer(R_Id,Dish_Id,Price) values(4,13,7.2);
insert into Offer(R_Id,Dish_Id,Price) values(4,12,2.2);
insert into Offer(R_Id,Dish_Id,Price) values(5,13,6.2);
insert into Offer(R_Id,Dish_Id,Price) values(6,13,7.2);
insert into Offer(R_Id,Dish_Id,Price) values(6,12,10.2);
insert into Offer(R_Id,Dish_Id,Price) values(7,13,5.2);
insert into Offer(R_Id,Dish_Id,Price) values(7,11,13.2);
insert into Offer(R_Id,Dish_Id,Price) values(7,9,6.2);
insert into Offer(R_Id,Dish_Id,Price) values(7,12,8.2);
insert into Offer(R_Id,Dish_Id,Price) values(8,1,9.2);
insert into Offer(R_Id,Dish_Id,Price) values(8,2,9.2);
insert into Offer(R_Id,Dish_Id,Price) values(8,5,11);
insert into Offer(R_Id,Dish_Id,Price) values(9,6,12);
insert into Offer(R_Id,Dish_Id,Price) values(9,8,3.2);
insert into Offer(R_Id,Dish_Id,Price) values(9,9,4.1);
insert into Offer(R_Id,Dish_Id,Price) values(9,11,12.5);
insert into Offer(R_Id,Dish_Id,Price) values(10,8,7);
insert into Offer(R_Id,Dish_Id,Price) values(10,9,6.4);
insert into Offer(R_Id,Dish_Id,Price) values(10,10,45);
insert into Offer(R_Id,Dish_Id,Price) values(10,12,15.4);
insert into Offer(Dish_Id, R_Id, Price) values (7, 11, 8.99);
insert into Offer(Dish_Id, R_Id, Price) values (8, 11, 4.69);
insert into Offer(Dish_Id, R_Id, Price) values (9, 11, 6.69);
insert into Offer(Dish_Id, R_Id, Price) values (11, 11, 48.89);
insert into Offer(Dish_Id, R_Id, Price) values (12, 11, 18.99);
insert into Offer(Dish_Id, R_Id, Price) values (13, 11, 7.00);
insert into Offer(Dish_Id, R_Id, Price) values (7, 12, 7.99);
insert into Offer(Dish_Id, R_Id, Price) values (8, 12, 5.99);
insert into Offer(Dish_Id, R_Id, Price) values (9, 12, 6.99);
insert into Offer(Dish_Id, R_Id, Price) values (11, 12, 35.99);
insert into Offer(Dish_Id, R_Id, Price) values (12, 12, 7.99);
insert into Offer(Dish_Id, R_Id, Price) values (13, 12, 8.99);
insert into Offer(Dish_Id, R_Id, Price) values (8, 13, 4.99);
insert into Offer(Dish_Id, R_Id, Price) values (9, 13, 5.99);
insert into Offer(Dish_Id, R_Id, Price) values (7, 13, 15.99);
insert into Offer(Dish_Id, R_Id, Price) values (1, 14, 19.99);
insert into Offer(Dish_Id, R_Id, Price) values (4, 14, 25.99);
insert into Offer(Dish_Id, R_Id, Price) values (5, 14, 10.99);
insert into Offer(Dish_Id, R_Id, Price) values (10, 15, 30.99);

#create rating table
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,4,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,5,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,6,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,8,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,1,9,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,2,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,5,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,6,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,7,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,9,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,8,11,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,1,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,4,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,5,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,6,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,8,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,9,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(1,14,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,2,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,3,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,5,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,6,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,9,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,1,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,1,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,3,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,4,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,5,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,6,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,7,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,2,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(2,8,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,11,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,1,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,6,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,7,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,8,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,1,10,3);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,5,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,6,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,7,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,8,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,9,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(3,2,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,4,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,8,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,1,11,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 4, 11,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 4, 3,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 4, 8,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 4, 9,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 4, 6,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,14,4,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,14,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,14,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,14,2,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,14,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(4,14,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,11,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,1,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,6,6);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,7,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,8,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,9,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,1,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,1,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,8,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,9,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,5,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,6,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,2,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,8,11,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 5, 6, 1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 5, 7, 2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 5, 8, 3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 5, 3, 4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(14, 5, 4, 5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,14,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,14,10,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,14,1,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,14,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,14,5,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(5,14,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,6,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,7,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,10,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,11,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,9,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(6,9,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,1,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,5,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,10,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,3,11,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,5,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,4,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,6,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,8,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,9,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,10,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,4,11,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,7,3,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,7,7,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,7,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,11,9,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,11,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,11,5,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,11,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,11,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,11,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,11,6,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,11,11,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,7,1,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,7,2,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,7,5,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,7,11,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,7,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,12,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,12,8,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,12,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,12,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,12,9,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,12,10,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 7, 1,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 7, 11,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 7, 5,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 7, 10,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 7, 9,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,13,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,13,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,13,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,13,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,13,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,13,8,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,8,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,9,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(7,16,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,4,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,8,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,9,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,7,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,10,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,3,11,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,5,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,4,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,1,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,2,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,8,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,9,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,6,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,4,11,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,5,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,6,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,7,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,8,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,9,11,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,6,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,8,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,10,9,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,8,1,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,8,3,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,8,6,1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,8,8,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,8,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,11,9,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,11,4,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,11,5,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,11,2,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,8,1,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,8,3,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,8,4,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,8,8,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,8,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,12,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,12,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,12,10,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,12,7,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,12,6,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 8, 1,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 8, 11,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 8, 7,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 8,10,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 8, 5,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,13,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,13,8,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,13,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,13,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,3,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,4,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,6,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,8,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,9,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,10,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(8,16,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,9,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,3,11,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,9,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,10,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,7,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,5,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,6,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,8,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,4,11,4);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,2,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,4,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,5,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,6,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,7,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,8,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,9,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,10,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,7,11,2);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,4,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,5,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,8,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,10,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,9,11,2);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,4,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,5,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,8,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,9,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,10,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,10,11,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,9,2,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,9,6,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,9,5,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,9,7,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,9,11,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,11,9,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,11,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,11,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,11,1,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,9,11,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,9,3,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,9,8,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,9,6,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,9,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,12,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,12,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,12,5,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,12,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,12,7,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 9, 2, 2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 9, 3,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 9, 4,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 9, 10, 2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(13, 9, 6, 1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,13,7,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,13,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,13,5,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,13,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(9,16,11,4);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,2,11,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,2,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,2,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,2,2,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,1,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,2,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,4,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,6,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,9,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,10,11,5);

insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(15, 10, 8, 1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(15, 10, 2, 2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(15, 10, 3, 3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(15, 10, 4, 4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(15, 10, 5, 5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,15,6,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,15,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,15,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(10,15,11,3);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,1,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,5,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,9,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,16,11,1);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,15,11,4);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,3,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,4,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,8,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,10,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,3,11,1);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,3,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,5,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,8,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,10,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,7,11,2);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,4,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,7,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,10,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,8,11,5);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,4,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,7,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,9,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(11,10,11,4);

insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,2,1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,3,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,5,1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,7,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,9,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,4,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,1,1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,6,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,8,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,11,1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,11,10,5);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,1,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,4,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,9,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,16,11,5);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,3,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,4,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,8,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,10,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,15,11,4);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,1,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,3,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,10,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,3,11,1);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,1,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,2,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,3,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,4,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,7,11,1);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,1,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,3,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,9,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,10,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,8,11,4);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,2,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,4,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,5,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,9,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(12,10,11,4);

insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,1,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,2,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,4,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,6,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,7,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,3,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,5,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,8,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,9,1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,10,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12,11,11,1);


insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,1,1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,3,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,5,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,6,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,9,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,2,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,4,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,7,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,8,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,10,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,12,11,1);

insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,13,1,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,13,3,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,13,5,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,13,6,5);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(11,13,9,2);



insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12, 13, 3,1);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12, 13, 4,2);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12, 13, 6,3);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12, 13, 8,4);
insert into Rating(R_Id,Dish_Id, Customer_Id, CustomerRate) values 	(12, 13, 9,3);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,1,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,3,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,6,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,9,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,10,11,4);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,3,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,7,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,8,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,7,11,4);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,3,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,4,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,10,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,11,11,4);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(14,16,11,4);


insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,10,11,4);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,1,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(15,8,11,2);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,7,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,8,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,9,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(16,8,11,4);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,2,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,3,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,4,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,7,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,9,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,8,11,5);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,1,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,3,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,4,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,6,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,7,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,10,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,4,11,4);

insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,1,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,2,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,3,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,4,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,5,5);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,6,4);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,7,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,8,3);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,9,2);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,10,1);
insert into Rating(Dish_Id,R_Id,Customer_id,CustomerRate) values(17,11,11,4);



