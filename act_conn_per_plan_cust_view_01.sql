/*Create a view to create a report with the number of 
  active connections per user program and customer type.
*/
SELECT
	COUNT(SUBSCRIPTION_ID) AS COUNT_SUBS,
	SPLAN_NAME AS PLAN_NAME,
	CTYPE_NAME AS TYPE_NAME
FROM
	SUBSCRIPTION
    JOIN
        SUBS_PL_RELATION
        ON
        SUBS_ID = SUBSCRIPTION_ID
    JOIN
        SUBSCRIPTION_PLAN
        ON
        SUBS_PL_ID = SPLAN_ID
    JOIN
        CUSTOMER
        ON
        SUBSCRIPTION_CID = CUSTOMER_ID
    JOIN
        CUSTOMER_TYPE
        ON
        CUSTOMER_TID = CTYPE_ID
WHERE
	SUBSCRIPTION_END_DATE IS NULL
GROUP BY
	SPLAN_NAME,
	CTYPE_NAME
ORDER BY
	CTYPE_NAME;
/*
COUNT_SUBS PLAN_NAME       TYPE_NAME      
---------- --------------- ---------------
         1 LARGE           COMPANY        
         2 MEDIUM          COMPANY        
         1 EXTRA LARGE     PERSON         
         2 SMALL           PERSON         
         1 LARGE           PROFESSIONAL   
         1 SMALL           PROFESSIONAL  
*/