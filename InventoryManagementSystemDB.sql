CREATE TABLE BRANDS(
	ID smallint IDENTITY(1,1) NOT NULL,
	PRODUCTID int NULL,
	BRAND varchar(100) NULL,
CONSTRAINT [PK_BRANDS] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE CATEGORIES(
	ID smallint IDENTITY(1,1) NOT NULL,
	PRODUCTID int NULL,
	CATEGORY varchar(50) NULL,
CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE USERS(
	ID smallint IDENTITY(1,1) NOT NULL,
	USERNAME_ varchar(50) NOT NULL,
	PASSWORD_ varchar(50) NOT NULL,
	USERROLE bit NOT NULL,
	NAMESURNAME varchar(100) NULL,
	EMAIL varchar(100) NULL,
	PHONENUMBER varchar(15) NULL,
	CREATEDAT datetime NULL,
CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE PRODUCTS(
	ID int IDENTITY(1,1) NOT NULL,
	GTIN varchar(13) NULL,
	STOCKCODE varchar(50) NULL,
	COLOR varchar(15) NOT NULL,
	PRODUCTDETAIL varchar(1000) NULL,
	PRODUCTIMAGES varchar(1000) NULL,
	CREATEDAT datetime NULL,
	UPDATEDAT datetime NULL,
CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE ITEMS(
	ID int IDENTITY(1,1) NOT NULL,
	PRODUCTID int NULL,
	QUANTITY int NULL,
	CREATEDAT datetime NULL,
	UPDATEDAT datetime NULL,
CONSTRAINT [PK_ITEMS] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE ORDERS(
	ID int IDENTITY(1,1) NOT NULL,
	ITEMID int NULL,
	WHOLESALERID int NULL,
	DATE_ datetime NULL,
	AMOUNT int NULL,
	UNITPRICE float NULL,
	LINETOTAL float NULL,
	TOTALPRICE float NULL,
	CARGOFICHENO varchar(20) NULL,
	PAYMENTTYPE tinyint NULL,
	INVOICE varchar(1000) NULL,
CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE WHOLESALERS(
	ID int IDENTITY(1,1) NOT NULL,
	COMPANYNAME varchar(50) NULL,
	NAMESURNAME varchar(100) NULL,
	EMAIL varchar(100) NULL,
	PHONENUMBER1 varchar(15) NULL,
	PHONENUMBER2 varchar(15) NULL,
	CREATEDAT datetime NULL,
CONSTRAINT [PK_WHOLESALERS] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE ADDRESSES(
	ID int IDENTITY(1,1) NOT NULL,
	WHOLESALERID int NULL,
	COUNTRYID tinyint NULL,
	CITYID smallint NULL,
	TOWNID int NULL,
	DISTRICTID int NULL,
	POSTALCODE varchar(10) NULL,
	ADDRESSDETAIL varchar(500) NULL,
CONSTRAINT [PK_ADDRESSES] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE COUNTRIES(
	ID tinyint IDENTITY(1,1) NOT NULL,
	COUNTRY varchar(50) NULL,
CONSTRAINT [PK_COUNTRIES] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE CITIES(
	ID smallint IDENTITY(1,1) NOT NULL,
	COUNTRYID tinyint NULL,
	CITY varchar(50) NULL,
CONSTRAINT [PK_CITIES] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE TOWNS(
	ID int IDENTITY(1,1) NOT NULL,
	CITYID smallint NULL,
	TOWN varchar(50) NULL,
CONSTRAINT [PK_TOWNS] PRIMARY KEY CLUSTERED ( ID ASC ))

CREATE TABLE DISTRICTS(
	ID int IDENTITY(1,1) NOT NULL,
	TOWNID int NULL,
	DISTRICT varchar(50) NULL,
CONSTRAINT [PK_DISTRICTS] PRIMARY KEY CLUSTERED ( ID ASC ))
GO

ALTER TABLE TOWNS ADD  CONSTRAINT [FK_TOWNS_CITIES] FOREIGN KEY(CITYID)
REFERENCES CITIES (ID)
GO

ALTER TABLE ORDERS ADD  CONSTRAINT [FK_ORDERS_ITEMS] FOREIGN KEY(ITEMID)
REFERENCES ITEMS (ID)
GO

ALTER TABLE ORDERS ADD  CONSTRAINT [FK_ORDERS_WHOLESALERS] FOREIGN KEY(WHOLESALERID)
REFERENCES WHOLESALERS (ID)
GO

ALTER TABLE ITEMS ADD  CONSTRAINT [FK_ITEMS_PRODUCTS] FOREIGN KEY(PRODUCTID)
REFERENCES PRODUCTS (ID)
GO

ALTER TABLE DISTRICTS ADD  CONSTRAINT [FK_DISTRICTS_TOWNS] FOREIGN KEY(TOWNID)
REFERENCES TOWNS (ID)
GO

ALTER TABLE CITIES ADD  CONSTRAINT [FK_CITIES_COUNTRIES] FOREIGN KEY(COUNTRYID)
REFERENCES COUNTRIES (ID)
GO

ALTER TABLE CATEGORIES ADD  CONSTRAINT [FK_CATEGORIES_PRODUCTS] FOREIGN KEY(PRODUCTID)
REFERENCES PRODUCTS (ID)
GO

ALTER TABLE ADDRESSES ADD  CONSTRAINT [FK_ADDRESSES_CITIES] FOREIGN KEY(CITYID)
REFERENCES CITIES (ID)
GO

ALTER TABLE ADDRESSES ADD  CONSTRAINT [FK_ADDRESSES_COUNTRIES] FOREIGN KEY(COUNTRYID)
REFERENCES COUNTRIES (ID)
GO

ALTER TABLE ADDRESSES ADD  CONSTRAINT [FK_ADDRESSES_DISTRICTS] FOREIGN KEY(DISTRICTID)
REFERENCES DISTRICTS (ID)
GO

ALTER TABLE ADDRESSES  ADD  CONSTRAINT [FK_ADDRESSES_TOWNS] FOREIGN KEY(TOWNID)
REFERENCES TOWNS (ID)
GO

ALTER TABLE ADDRESSES  ADD  CONSTRAINT [FK_ADDRESSES_WHOLESALERS] FOREIGN KEY(WHOLESALERID)
REFERENCES WHOLESALERS (ID)
GO

ALTER TABLE BRANDS  ADD  CONSTRAINT [FK_BRANDS_PRODUCTS] FOREIGN KEY(PRODUCTID)
REFERENCES PRODUCTS (ID)
GO