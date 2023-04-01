CREATE TABLE `productlines` (
  `ProductLine` int PRIMARY KEY,
  `textDescription` text,
  `htmlDescription` text,
  `image` varchar(255)
);

CREATE TABLE `products` (
  `ProductCode` int PRIMARY KEY,
  `productName` varchar(255),
  `productLine` varchar(255),
  `productScale` varchar(255),
  `productVendor` varchar(255),
  `productDescription` text,
  `quantityInstock` varchar(255),
  `buyPrice` int,
  `MSRP` varchar(255)
);

CREATE TABLE `orderDetails` (
  `orderNumber` int PRIMARY KEY,
  `productCode` int,
  `quantityOrdered` int,
  `priceEach` int,
  `orderLineNumber` int
);

CREATE TABLE `order` (
  `orderNumber` int PRIMARY KEY,
  `orderDate` int,
  `requiredDate` int,
  `shippedDate` int,
  `status` varchar(255),
  `comments` varchar(255),
  `customerNumber` int
);

CREATE TABLE `payment` (
  `customerNumber` int PRIMARY KEY,
  `checkNumber` int,
  `paymentDate` int,
  `amount` int
);

CREATE TABLE `customers` (
  `customerNumber` int PRIMARY KEY,
  `customerName` varchar(255),
  `contactLastName` int,
  `contactFirstName` int,
  `phone` int,
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `postalCode` int,
  `country` varchar(255),
  `salesRepEmployeeNumber` int,
  `creditLimit` int
);

CREATE TABLE `ewmployees` (
  `employeeNumber` int PRIMARY KEY,
  `lastName` varchar(255),
  `firstName` varchar(255),
  `extension` varchar(255),
  `email` varchar(255),
  `officeCode` int,
  `reportsTo` varchar(255),
  `jobTitle` varchar(255)
);

CREATE TABLE `offices` (
  `officeCode` int PRIMARY KEY,
  `city` varchar(255),
  `phone` int,
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `state` varchar(255),
  `country` varchar(255),
  `postalCode` int,
  `territory` varchar(255)
);

ALTER TABLE `products` ADD FOREIGN KEY (`productLine`) REFERENCES `productlines` (`htmlDescription`);

ALTER TABLE `orderDetails` ADD FOREIGN KEY (`quantityOrdered`) REFERENCES `products` (`productLine`);

ALTER TABLE `order` ADD FOREIGN KEY (`orderNumber`) REFERENCES `orderDetails` (`orderLineNumber`);

ALTER TABLE `order` ADD FOREIGN KEY (`status`) REFERENCES `customers` (`customerName`);

ALTER TABLE `payment` ADD FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`postalCode`);

ALTER TABLE `ewmployees` ADD FOREIGN KEY (`employeeNumber`) REFERENCES `ewmployees` (`reportsTo`);

ALTER TABLE `customers` ADD FOREIGN KEY (`contactLastName`) REFERENCES `ewmployees` (`jobTitle`);

ALTER TABLE `ewmployees` ADD FOREIGN KEY (`firstName`) REFERENCES `offices` (`addressLine2`);
