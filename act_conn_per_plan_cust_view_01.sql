/*Create a view to create a report with the number of 
  active connections per user program and customer type.
*/

CREATE OR REPLACE FORCE EDITIONABLE VIEW act_conn_per_plan_cust_view_01
(
    count_subs,
    plan_name,
    type_name
)
AS
    SELECT   COUNT (s.subscription_id)     count_subs,
             sp.splan_name                 plan_name,
             ct.ctype_name                 type_name
        FROM exe_subscription s
             JOIN exe_subs_pl_relation spr ON subs_id = s.subscription_id
             JOIN exe_subscription_plan sp ON spr.subs_pl_id = sp.splan_id
             JOIN exe_customer c ON s.subscription_cid = c.customer_id
             JOIN exe_customer_type ct ON c.customer_tid = ct.ctype_id
       WHERE s.subscription_end_date IS NULL
    GROUP BY sp.splan_name, ct.ctype_name
    ORDER BY ct.ctype_name;

SELECT * FROM viewa1;
