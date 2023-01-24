/*Create a view to create a report with the customers 
  who owe. The report should show the TIN, full name, 
  total outstanding balance and date of oldest 
  outstanding bill.
*/
SELECT
    C.CUSTOMER_AFM AS AFM,
    C.CUSTOMER_NAME AS NAME,
    SUM(B.BILL_REM) AS SUM,
    MIN(B.BILL_DATE) AS OLD_DATE
FROM CUSTOMER C
    JOIN SUBSCRIPTION S
        ON S.SUBSCRIPTION_CID = C.CUSTOMER_ID
    JOIN BILLING B
        ON B.BILL_SID = S.SUBSCRIPTION_ID
WHERE
    S.SUBSCRIPTION_END_DATE IS NULL
GROUP BY
    C.CUSTOMER_AFM,
    C.CUSTOMER_NAME
ORDER BY
    C.CUSTOMER_AFM;
/*
AFM       NAME		SUM			OLD_DATE          
--------- -------	----------	------------------
123456789 ALFA		30			01-DEC-22 00.00.00
345678912 GAMMA		100			01-DEC-22 00.00.00
567891234 EPSILON	35			01-DEC-22 00.00.00
678912345 ZETA		131			01-DEC-22 00.00.00
789123456 ITTA		100			01-DEC-22 00.00.00
891234567 THETA		140			01-DEC-22 00.00.00
912345678 GIWTA		30			01-DEC-22 00.00.00
*/