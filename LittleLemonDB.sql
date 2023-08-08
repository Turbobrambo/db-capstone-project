-- MySQL Script generated by MySQL Workbench
-- Tue Aug  8 12:10:27 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb3 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingsID` INT NOT NULL AUTO_INCREMENT,
  `TableNo` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingsID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customerid_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `Cuisine` VARCHAR(255) NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `MenuID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `menu_id_fk_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Employees` (
  `EmployeeID` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DeliveryStatus` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NOT NULL,
  `Status` VARCHAR(255) NOT NULL,
  `OrderID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `order_id_fk_idx` (`OrderID` ASC) VISIBLE,
  INDEX `employee_id_fk_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employee_id_fk`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `LittleLemonDB`.`Employees` (`EmployeeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(255) NOT NULL,
  `Starter` VARCHAR(255) NOT NULL,
  `Dessert` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuContent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuContent` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NOT NULL,
  INDEX `menu_id_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `menu_items_id_fk_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_items_id_fk`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`ContactDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`ContactDetails` (
  `ContactID` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `CustomerID` INT NULL,
  `EmployeeID` INT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `employee_id_fk_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `customer_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employee_id_fk`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `LittleLemonDB`.`Employees` (`EmployeeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customers` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `Customers_ID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`roles` (
  `RoleID` INT NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  `RoleID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `RoleID_idx` (`RoleID` ASC) VISIBLE,
  CONSTRAINT `Roles_ID`
    FOREIGN KEY (`RoleID`)
    REFERENCES `littlelemondb`.`roles` (`RoleID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`contactdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`contactdetails` (
  `ContactID` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `CustomerID` INT NOT NULL,
  `StaffID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  INDEX `Customer_ID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `Customerss_ID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Staffs_ID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `littlelemondb`.`staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menuitems` (
  `MenuItemID` INT NOT NULL,
  `Course` VARCHAR(45) NOT NULL,
  `Starter` VARCHAR(45) NOT NULL,
  `Desert` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menus` (
  `MenuID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menucontent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menucontent` (
  `MenuID` INT NOT NULL,
  `MenuItemID` INT NOT NULL,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `MenuItemID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `MenuItems_ID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `littlelemondb`.`menuitems` (`MenuItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Menuss_ID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `littlelemondb`.`menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `OrderId` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,0) NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderId`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `Customersss_ID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Menus_ID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `littlelemondb`.`menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orderdeliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orderdeliverystatus` (
  `DeliveryID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `OrderID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `Orders_ID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `littlelemondb`.`orders` (`OrderId`),
  CONSTRAINT `Staffss_ID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `littlelemondb`.`staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
