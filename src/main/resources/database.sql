CREATE TABLE USER
(
  USER_ID        INT          AUTO-INCREMENT PRIMARY KEY,
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


CREATE TABLE Product
(
    PRODUCT_ID int PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT NOT NULL,
    QUANTITY LONG DEFAULT 0 NOT NULL,
    PRICE FLOAT DEFAULT 1.0 NOT NULL,
    IMAGE_URL VARCHAR(255) NOT NULL
);

INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Soap', 'Pears baby soap for Kids', 1, 35.75, "images/pic.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Tooth Brush', 'Signal Tooth Brushes Size in (L, M, S)', 5, 34.50, "images/pic1.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Shirt', 'Casual Shirt imported from France', 3, 1500.00, "images/pic2.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Office Bag', 'Leather bag imported from USA', 40, 1000.00, "images/pic3.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Bottle', 'Hot Water Bottles', 80, 450.45, "images/pic4.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Wrist Watch', 'Imported wrist watches from swiss', 800, 2500.00, "images/pic4.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Mobile Phone', '3G/4G capability', 700, 45000.00, "images/pic5.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Shampoo', 'Head and Shoulders Shampoo', 500, 300.00, "images/pic6.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Leather Wallets', 'Imported Leather Wallets from AUS', 1000, 500.00, "images/pic7.jpg");
INSERT INTO PRODUCT (name, description, quantity, price, IMAGE_URL)
VALUES ('Camera', 'Imported Canon camera from USA', 10, 85000.00, "images/pic8.jpg");