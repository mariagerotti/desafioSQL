--/A)/------------------------------------------------------------------------
SELECT NMCUSTOMER,IDFONE FROM CUSTOMER WHERE IDFONE LIKE '4%'
--/B)/------------------------------------------------------------------------
SELECT * FROM CUSTOMER WHERE IDFONE = NULL
--/C)/------------------------------------------------------------------------
SELECT NMSUPPLIER,IDFONE FROM SUPPLIER WHERE LEN(IDFONE) < 11
--/D)/------------------------------------------------------------------------
SELECT NMPRODUCT,VLPRICE, QTSTOCK,
  CASE 
  WHEN QTSTOCK > 2000 THEN (QTSTOCK - (QTSTOCK * 0.1))
  WHEN QTSTOCK < 2000 THEN QTSTOCK
  END 
  FROM PRODUCT
--/E)/------------------------------------------------------------------------
SELECT NMPRODUCT,VLPRICE
  FROM PRODUCT
  WHERE VLPRICE BETWEEN
        10 AND 20;
--/F)/------------------------------------------------------------------------
SELECT NMPRODUCT,VLPRICE,(VLPRICE * QTSTOCK) AS TOTALSTOCKPROD FROM PRODUCT WHERE QTSTOCK > 50
--/G)/------------------------------------------------------------------------
SELECT NMPRODUCT, SUPPLIER.NMSUPPLIER, SUPPLIER.IDFONE 
FROM PRODUCT JOIN SUPPLIER 
ON PRODUCT.CDSUPPLIER = SUPPLIER.CDSUPPLIER 
WHERE VLPRICE > 20 AND QTSTOCK > 1500
--/H)/------------------------------------------------------------------------
SELECT CUSTOMER.NMCUSTOMER,DTREQUEST,VLTOTAL 
FROM REQUEST JOIN CUSTOMER 
ON REQUEST.CDCUSTOMER = CUSTOMER.CDCUSTOMER
WHERE DTREQUEST BETWEEN '2003-06-01' AND '2003-07-31'
--/I)/------------------------------------------------------------------------
SELECT 
CUSTOMER.NMCUSTOMER,
PRODUCT.NMPRODUCT, 
REQUEST.DTREQUEST,
QTAMOUNT,
VLUNITARY,
QTAMOUNT * VLUNITARY AS VLTOTALPRODRESQ

FROM PRODUCTREQUEST 

JOIN REQUEST
ON REQUEST.CDREQUEST = PRODUCTREQUEST.CDREQUEST

JOIN CUSTOMER
ON CUSTOMER.CDCUSTOMER = REQUEST.CDCUSTOMER

JOIN PRODUCT
ON PRODUCT.CDPRODUCT = PRODUCTREQUEST.CDPRODUCT

WHERE QTAMOUNT>500
