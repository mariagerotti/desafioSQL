--/A)/-----------------------------------------------------------------------------------------
CREATE TABLE COSTUMER(
CDCOSTUMER INT IDENTITY(1,1)NOT NULL,
NMCOSTUMER VARCHAR(100),
NRFONE NUMERIC(11),
DSADRESS VARCHAR(100),
);

CREATE TABLE REQUEST(
CDREQUEST INT IDENTITY(1,1) NOT NULL,
DTREQUEST DATETIME,
DTDELIVER DATETIME,
VLTOTAL NUMERIC(10,2),
CDCOSTUMER INT NOT NULL,
);

CREATE TABLE SUPPLIER(
CDSUPPLIER INT IDENTITY(1,1) NOT NULL,
NMSUPPLIER VARCHAR(100),
NRFONE NUMERIC(11)
);

CREATE TABLE PRODUCT(
CDPRODUCT INT IDENTITY(1,1) NOT NULL, 
NMPRODUCT VARCHAR(100),
CDSUPPLIER INT NOT NULL,
VLPRICE NUMERIC(10,2),
QTSTOCK INT,
);

CREATE TABLE PRODUCTREQUEST(
CDREQUEST INT NOT NULL,
CDPRODUCT INT NOT NULL,
QTAMOUNT INT,
VLUNITARY NUMERIC(10,2),
);
--/B)/------------------------------------------------------------------------------------
ALTER TABLE COSTUMER ADD PRIMARY KEY (CDCOSTUMER);
ALTER TABLE REQUEST ADD PRIMARY KEY (CDREQUEST);
ALTER TABLE SUPPLIER ADD PRIMARY KEY (CDSUPPLIER);
ALTER TABLE PRODUCT ADD PRIMARY KEY (CDPRODUCT);
ALTER TABLE PRODUCTREQUEST ADD PRIMARY KEY (CDREQUEST, CDPRODUCT);
--deu certo :)
--/C)/-------------------------------------------------------------------------------------
ALTER TABLE REQUEST ADD FOREIGN KEY (CDCOSTUMER) REFERENCES COSTUMER(CDCOSTUMER);
ALTER TABLE PRODUCT ADD FOREIGN KEY (CDSUPPLIER) REFERENCES SUPPLIER(CDSUPPLIER);
ALTER TABLE PRODUCTREQUEST ADD FOREIGN KEY (CDREQUEST) REFERENCES REQUEST(CDREQUEST);
ALTER TABLE PRODUCTREQUEST ADD FOREIGN KEY (CDPRODUCT) REFERENCES PRODUCT(CDPRODUCT);
--deu certo :)
--/D)/-------------------------------------------------------------------------------------
CREATE INDEX IDX_CDSUPPLIER ON PRODUCT(CDSUPPLIER);
--deu certo :)
--/E)/-------------------------------------------------------------------------------------
CREATE INDEX IDX_CDCOSTUMER ON REQUEST(CDCOSTUMER);
--deu certo :)
--/F)/-------------------------------------------------------------------------------------
ALTER TABLE SUPPLIER ADD DSADRESS varchar(150);
--deu certo :)
--/G)/-------------------------------------------------------------------------------------
INSERT INTO COSTUMER (NMCOSTUMER, NRFONE, DSADRESS)
VALUES ('Fabiano', 99879375, 'Rua Tijucas, 110, Centro, Joinville – S.C');
--deu certo :)
--/H)/-------------------------------------------------------------------------------------
INSERT INTO REQUEST(DTREQUEST, DTDELIVER, VLTOTAL, CDCOSTUMER) VALUES ('2008-01-31 14:30:15', '2008-02-05 16:38:41', 54.00, 1);
--deu certo :)
--/I)/-------------------------------------------------------------------------------------
UPDATE COSTUMER SET NRFONE = 99012567 WHERE CDCOSTUMER = 1;
--deu certo :)
--/J)/-------------------------------------------------------------------------------------
DELETE FROM COSTUMER 
DELETE FROM REQUEST
--deu certo :)
--/K)/-------------------------------------------------------------------------------------
DROP TABLE COSTUMER
DROP TABLE REQUEST
DROP TABLE SUPPLIER
DROP TABLE PRODUCT 
DROP TABLE PRODUCTREQUEST
--deu certo :)