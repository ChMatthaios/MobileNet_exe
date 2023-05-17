/*Create a view to create a report with the customers 
  who owe. The report should show the TIN, full name, 
  total outstanding balance and date of oldest 
  outstanding bill.
*/

CREATE OR REPLACE FORCE EDITIONABLE VIEW owing_cust_view_02
(
    afm,
    name,
    SUM,
    old_date
)
AS
    SELECT   c.customer_afm        AS afm,
             c.customer_name       AS name,
             SUM (b.bill_rem)      AS SUM,
             MIN (b.bill_date)     AS old_date
        FROM exe_customer c
             JOIN exe_subscription s ON s.subscription_cid = c.customer_id
             JOIN exe_billing b ON b.bill_sid = s.subscription_id
       WHERE s.subscription_end_date IS NULL
    GROUP BY c.customer_afm, c.customer_name
    ORDER BY c.customer_afm;

SELECT * FROM viewa2;
