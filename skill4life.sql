-- DROP IF EXISTS DATABASE Skill4Life;

CREATE DATABASE Skill4Life CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use Skill4Life;
create user 'skill4life'@'localhost' identified by '!Lamp12!';
grant all on Skill4Life.* to 'skill4life'@'localhost';

-- DROP TABLE IF EXISTS `User`;

CREATE TABLE User (
	`userId` INT AUTO_INCREMENT PRIMARY KEY,
	`firstName` VARCHAR(20),
	`lastName` VARCHAR(35),
	`email` VARCHAR(255) UNIQUE,
	`password` VARCHAR(255),
	`phone` VARCHAR(14),
	`actDate` Date NOT NULL
);

-- DROP TABLE IF EXISTS `Subject`;

CREATE TABLE Subject (
    `subId` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(40),
	`description` VARCHAR(400),
	`price` DECIMAL(6,2),
	`lastUpdate` Date NOT NULL,
	`usedLang` VARCHAR(40),
	`creator` VARCHAR(50)
);

-- DROP TABLE IF EXISTS `Cart`;

CREATE TABLE Cart (
	`ctId` INT AUTO_INCREMENT PRIMARY KEY,
	`subId` INT,
	`price` INT,
	`userId` INT,
	KEY `FK_subId` (`subId`),
	CONSTRAINT `FK_subId` FOREIGN KEY (`subId`) REFERENCES `Subject` (`subId`),
	KEY `FK_price` (`price`),
	CONSTRAINT `FK_price` FOREIGN KEY (`price`) REFERENCES `Subject` (`price`),
	KEY `FK_userId` (`userId`),
	CONSTRAINT `FK_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
);

-- DROP TABLE IF EXISTS `PaymentInfo`;

CREATE TABLE PaymentInfo (
	`payId` INT AUTO_INCREMENT PRIMARY KEY,
	`nameOnCard` VARCHAR(30),
	`cardNum` VARCHAR(16),
	`expMonth` VARCHAR(2),
	`expYear` VARCHAR(2),
	`userId` INT,
	KEY `FK_userId` (`userId`),
	CONSTRAINT `FK_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
);

-- DROP TABLE IF EXISTS `BillingInfo`;

CREATE TABLE BillingInfo (
	`billId` INT AUTO_INCREMENT PRIMARY KEY,
	`firstName` VARCHAR(20),
	`lastName` VARCHAR(35),
	`email` VARCHAR(40),
	`addressLine` VARCHAR(40),
	`city` VARCHAR(40),
	`province` VARCHAR(40),
	`zip` VARCHAR(40),
	`phone` VARCHAR(14),
	`userId` INT,
	KEY `FK_userId` (`userId`),
	CONSTRAINT `FK_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
);

-- DROP TABLE IF EXISTS `CheckOut`;

CREATE TABLE CheckOut (
	`chkId` INT AUTO_INCREMENT PRIMARY KEY,	
	`orderDate` DATE NOT NULL,
	`ctId` INT,
	`payId` INT,
	`billId` INT,
	`userId` INT,
	KEY `FK_userId` (`userId`),
	CONSTRAINT `FK_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`),
	KEY `FK_ctId` (`ctId`),
	CONSTRAINT `FK_ctId` FOREIGN KEY (`ctId`) REFERENCES `Cart` (`ctId`),
	KEY `FK_payId` (`payId`),
	CONSTRAINT `FK_payId` FOREIGN KEY (`payId`) REFERENCES `PaymentInfo` (`payId`),
	KEY `FK_billId` (`billId`),
	CONSTRAINT `FK_billId` FOREIGN KEY (`billId`) REFERENCES `BillingInfo` (`billId`)
);

CREATE TABLE PasswordResets (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`email` VARCHAR(255),
	`token` VARCHAR(255) UNIQUE
);

-- Insertion of Subject Data

-- Japanese
INSERT INTO Subject (name, description, price, lastUpdate, usedLang, creator)
Values ("Japanese Beginner Course - Elementary Japanese Level", "Learners will study Japanese pronunciation and writing and in addition to simple greetings and expressions used in everyday life. ", 19.99, 2021-03-15, "English", "Tyler Woo-Davis");

-- JavaScript
INSERT INTO Subject (name, description, price, lastUpdate, usedLang, creator)
Values ("JavaScript for Beginners", "Javascript, often known as JS, is a lightweight, object-oriented language and is the best-known language for website page development. It is an open and cross-platform language.", 19.99, 2021-03-15, "English", "Krishna Patel");

-- Php
INSERT INTO Subject (name, description, price, lastUpdate, usedLang, creator)
Values ("PHP for Beginners", "PHP (recursive acronym for PHP: Hypertext Preprocessor) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML.", 19.99, 2021-03-15, "English", "Don Thomas");

-- Photoshop
INSERT INTO Subject (name, description, price, lastUpdate, usedLang, creator)
Values ("Beginners Guide to PhotoShop", "Adobe Photoshop is a raster graphics editor developed and published by Adobe Inc. for 
            Windows and macOS. It is a software application for image editing and retouching.", 19.99, 2021-03-15, "English", "Sukhmani Kaur");

-- Web Security
INSERT INTO Subject (name, description, price, lastUpdate, usedLang, creator)
Values ("Basic Guide to Learning Web Security", "You will learn how to administer various network environments, learn how to plan upgrades and implement new software, as well as optimize computer networks.", 19.99, 2021-03-15, "English", "Gaeun Sung");
