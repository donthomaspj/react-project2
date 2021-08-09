-- CREATE USER 'tyler'@'localhost' IDENTIFIED BY '!Lamp12!';

-- GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'tyler'@'localhost' WITH GRANT OPTION;

DROP IF EXISTS DATABASE Skill4Life;

CREATE DATABASE Skill4Life CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `User`;

CREATE TABLE User (
	`userId` INT AUTO_INCREMENT PRIMARY KEY,
	`firstName` VARCHAR(20),
	`lastName` VARCHAR(35),
	`email` VARCHAR(40),
	`password` VARCHAR(40),
	`phone` VARCHAR(14),
	`actDate` Date NOT NULL
);

DROP TABLE IF EXISTS `Subject`;

CREATE TABLE Subject (
    `subId` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(40),
	`description` VARCHAR(400),
	`price` DECIMAL(6,2)
);

DROP TABLE IF EXISTS `Cart`;

CREATE TABLE Cart (
	`ctkId` INT AUTO_INCREMENT PRIMARY KEY,
	KEY `FK_subId` (`subId`),
	CONSTRAINT `FK_subId` FOREIGN KEY (`subId`) REFERENCES `Subject` (`subId`)
);

DROP TABLE IF EXISTS `CheckOut`;

CREATE TABLE CheckOut (
	`chkId` INT AUTO_INCREMENT PRIMARY KEY,	
	`orderDate` DATE NOT NULL,
	KEY `FK_ctkId` (`ctkId`),
	CONSTRAINT `FK_ctkId` FOREIGN KEY (`ctkId`) REFERENCES `Subject` (`ctkId`),
	KEY `FK_payId` (`payId`),
	CONSTRAINT `FK_payId` FOREIGN KEY (`payId`) REFERENCES `Subject` (`payId`),
	KEY `FK_billId` (`billId`),
	CONSTRAINT `FK_billId` FOREIGN KEY (`billId`) REFERENCES `Subject` (`billId`),
	
);

DROP TABLE IF EXISTS `PaymentInfo`;

CREATE TABLE PaymentInfo (
	`payId` INT AUTO_INCREMENT PRIMARY KEY,
	`nameOnCard` VARCHAR(30),
	`cardNum` VARCHAR(16),
	`expMonth` VARCHAR(2),
	`expYear` VARCHAR(2),
);

DROP TABLE IF EXISTS `BillingInfo`;

CREATE TABLE BillingInfo (
	`billId` INT AUTO_INCREMENT PRIMARY KEY,
	`firstName` VARCHAR(20),
	`lastName` VARCHAR(35),
	`email` VARCHAR(40),
	`addressLine` VARCHAR(40),
	`city` VARCHAR(40),
	`province` VARCHAR(40),
	`zip` VARCHAR(40),
	`phone` VARCHAR(14)
	
);

