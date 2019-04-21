CREATE TABLE USER
(
  USER_ID        INT          AUTO_INCREMENT PRIMARY KEY,
  NAME      VARCHAR(60)  NOT NULL,
  ACTIVE    TINYINT(1)   NOT NULL,
  PASSWORD  VARCHAR(255) NOT NULL,
  USERNAME  VARCHAR(60)  NOT NULL,
  EMAIL     VARCHAR(60)  NOT NULL,
  ADDRESS   VARCHAR(255) NULL,
  CONSTRAINT USER_EMAIL_UINDEX
  UNIQUE (EMAIL),
  CONSTRAINT USER_USERNAME_UINDEX
  UNIQUE (USERNAME)
);

CREATE TABLE ROLE
(
  ROLE_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  ROLE    VARCHAR(10) NOT NULL,
  CONSTRAINT ROLE_ROLE_UINDEX
  UNIQUE (ROLE)
);

CREATE TABLE USER_ROLE
(
    USER_ID INT,
    ROLE_ID INT,
    CONSTRAINT USER_ROLE_ROLE_ROLE_ID_FK FOREIGN KEY (ROLE_ID) REFERENCES ROLE (ROLE_ID),
    CONSTRAINT USER_ROLE_USER_USER_ID_FK FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)
);

INSERT INTO ROLE (role_id, role)
VALUES (1, 'ROLE_ADMIN');
INSERT INTO ROLE (role_id, role)
VALUES (2, 'ROLE_USER');

DROP TABLE IF EXISTS `CATEGORY`;
CREATE TABLE `CATEGORY` (
                          `CATEGORY_ID` INTEGER NOT NULL AUTO_INCREMENT,
                          `CATEGORY_NAME` varchar(255) DEFAULT NULL,
                          `CATEGORY_URL` varchar(255) DEFAULT NULL,
                          `CATEGORY_STATUS` bit(1) NOT NULL,
                          PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `category` VALUES ('0', 'Men', 'men', 1);
INSERT INTO `category` VALUES ('1', 'Women', 'women', 1);
INSERT INTO `category` VALUES ('2', 'Kids', 'kids', 1);
INSERT INTO `category` VALUES ('3', 'Sport', 'sport', 1);
INSERT INTO `category` VALUES ('4', 'Other', 'other', 1);


CREATE TABLE PRODUCT
(
    PRODUCT_ID integer PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT NOT NULL,
    QUANTITY LONG NOT NULL,
    PRICE FLOAT DEFAULT 1.0 NOT NULL,
    IMAGE_URL VARCHAR(255) NOT NULL,
    CATEGORY_ID integer NOT NULL
    CONSTRAINT `FK_3yn5ilgef5phy6r8spvvwcmqs` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;;

INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 0)
VALUES ('Soap', 'Pears baby soap for Kids', 1, 35.75, "/images/pic.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 0)
VALUES ('Tooth Brush', 'Signal Tooth Brushes Size in (L, M, S)', 5, 34.50, "/images/pic1.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 1)
VALUES ('Shirt', 'Casual Shirt imported from France', 3, 1500.00, "/images/pic2.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 1)
VALUES ('Office Bag', 'Leather bag imported from USA', 40, 1000.00, "/images/pic3.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 2)
VALUES ('Bottle', 'Hot Water Bottles', 80, 450.45, "/images/pic4.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 2)
VALUES ('Wrist Watch', 'Imported wrist watches from swiss', 800, 2500.00, "/images/pic4.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 3)
VALUES ('Mobile Phone', '3G/4G capability', 700, 45000.00, "/images/pic5.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 3)
VALUES ('Shampoo', 'Head and Shoulders Shampoo', 500, 300.00, "/images/pic6.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 4)
VALUES ('Leather Wallets', 'Imported Leather Wallets from AUS', 1000, 500.00, "/images/pic7.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL, 4)
VALUES ('Camera', 'Imported Canon camera from USA', 10, 85000.00, "/images/pic8.jpg");


DROP TABLE IF EXISTS `RECEIPT`;
CREATE TABLE `RECEIPT` (
  `RECEIPT_ID` integer NOT NULL AUTO_INCREMENT,
  `RECEIPT_ADDRESS` varchar(255) DEFAULT NULL,
  `RECEIPT_DATE` datetime DEFAULT NULL,
  `RECEIPT_NAME` varchar(255) DEFAULT NULL,
  `RECEIPT_STATUS` bit(1) NOT NULL,
  PRIMARY KEY (`RECEIPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `receipt_item`;
CREATE TABLE `RECEIPT_ITEM` (
  `RECEIPT_ITEM_ID` integer NOT NULL AUTO_INCREMENT,
  `RECEIPT_ID` integer DEFAULT NULL,
  `PRODUCT_ID` integer DEFAULT NULL,
  `RECEIPT_ITEM_QUANTITY` int(11) NOT NULL,
  `RECEIPT_ITEM_PRICE` double NOT NULL,
  PRIMARY KEY (`RECEIPT_ITEM_ID`),
  KEY `FK_807jrvftoia0tobfc4xwbf25v` (`PRODUCT_ID`),
  KEY `FK_n2k3k70859hidhf6411s7j80a` (`RECEIPT_ID`),
  CONSTRAINT `FK_807jrvftoia0tobfc4xwbf25v` FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (PRODUCT_ID),
  CONSTRAINT `FK_n2k3k70859hidhf6411s7j80a` FOREIGN KEY (RECEIPT_ID) REFERENCES RECEIPT (RECEIPT_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
