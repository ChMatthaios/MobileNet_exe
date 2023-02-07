/*Create a view to create a report with the number of 
  active connections per user program and customer type.
*/
CREATE OR REPLACE FORCE EDITIONABLE VIEW act_conn_per_plan_cust_view_01 (
    count_subs,
    plan_name,
    type_name
) AS
    SELECT
        COUNT(subscription_id) AS count_subs,
        splan_name             AS plan_name,
        ctype_name             AS type_name
    FROM
             exe_subscription
        JOIN exe_subs_pl_relation ON subs_id = subscription_id
        JOIN exe_subscription_plan ON subs_pl_id = splan_id
        JOIN exe_customer ON subscription_cid = customer_id
        JOIN exe_customer_type ON customer_tid = ctype_id
    WHERE
        subscription_end_date IS NULL
    GROUP BY
        splan_name,
        ctype_name
    ORDER BY
        ctype_name;

SELECT
    *
FROM
    viewa1;
