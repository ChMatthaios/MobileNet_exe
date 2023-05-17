/* Formatted on 17/05/2023 14:08:24 (QP5 v5.336) */
-- Start of DDL Script for Package MOBILENET

CREATE OR REPLACE PACKAGE mobilenet
    AUTHID CURRENT_USER
AS
    PROCEDURE auto_billing;

    FUNCTION balance_search (input_str IN VARCHAR2)
        RETURN NUMBER;

    PROCEDURE payment (str_input      IN exe_customer.customer_afm%TYPE,
                       c_amt          IN exe_billing.bill_amount%TYPE);

    PROCEDURE reset_values;
END mobilenet;
/


CREATE OR REPLACE PACKAGE BODY mobilenet
AS
    FUNCTION is_number (p_string IN VARCHAR2)
        RETURN NUMBER
    IS
        v_new_num      NUMBER (10);
    BEGIN
        v_new_num := TO_NUMBER (p_string);
        RETURN 1;
    EXCEPTION
        WHEN VALUE_ERROR
        THEN
            RETURN 0;
    END is_number;

    PROCEDURE auto_billing
    IS
        l_cid          exe_customer.customer_id%TYPE;
        l_fix          exe_subscription_plan.splan_fix%TYPE;
        l_rem          exe_billing.bill_rem%TYPE;
        l_size         NUMBER := 0;
        l_date         DATE := SYSDATE;
    BEGIN
        FOR i
            IN (SELECT   s.subscription_id      AS subscription_id,
                         s.subscription_cid     AS subscription_cid,
                         sp.splan_fix           AS splan_fix
                    FROM exe_subscription s
                         INNER JOIN exe_subs_pl_relation spr
                             ON s.subscription_id = spr.subs_id
                         INNER JOIN exe_subscription_plan sp
                             ON spr.subs_pl_id = sp.splan_id
                   WHERE s.subscription_end_date IS NULL
                GROUP BY s.subscription_id, s.subscription_cid, sp.splan_fix
                ORDER BY s.subscription_id)
        LOOP
            INSERT INTO exe_billing (bill_id,
                                     bill_date,
                                     bill_amount,
                                     bill_rem,
                                     bill_cid,
                                     bill_sid)
                 VALUES (bill_seq.NEXTVAL,
                         l_date,
                         i.splan_fix,
                         i.splan_fix,
                         i.subscription_cid,
                         i.subscription_id);
        END LOOP;

        COMMIT;
    END auto_billing;

    FUNCTION balance_search (input_str IN VARCHAR2)
        RETURN NUMBER
    IS
        str_u          VARCHAR2 (20);
        l_afm          exe_customer.customer_afm%TYPE;
        l_tel          exe_subscription.subscription_number%TYPE;
        l_rem          exe_billing.bill_rem%TYPE := -1;
    BEGIN
        str_u := REGEXP_REPLACE (input_str, ' ', '');

        IF is_number (str_u) = 1
        THEN
            SELECT   SUM (b.bill_rem)
                INTO l_rem
                FROM exe_customer c
                     JOIN exe_billing b ON b.bill_cid = c.customer_id
               WHERE c.customer_afm = input_str
            GROUP BY c.customer_afm;
        END IF;

        RETURN l_rem;
    END balance_search;

    FUNCTION afm_payment (str_u IN VARCHAR2, u_amt IN NUMBER)
        RETURN NUMBER
    IS
        CURSOR analytic_view_old_first_afm IS
            SELECT   b.bill_id, b.bill_rem
                FROM exe_billing b
                     JOIN exe_customer c ON b.bill_cid = c.customer_id
               WHERE c.customer_afm = str_u AND bill_rem > 0
            ORDER BY b.bill_date ASC;

        CURSOR analytic_view_new_first_afm IS
            SELECT   b.bill_id, b.bill_rem
                FROM exe_billing b
                     JOIN exe_customer c ON b.bill_cid = c.customer_id
               WHERE c.customer_afm = str_u
            ORDER BY b.bill_date DESC;

        f_amt          NUMBER := u_amt;
        l_bid          exe_billing.bill_id%TYPE;
        l_rem          exe_billing.bill_rem%TYPE;
        l_o_bid        exe_billing.bill_id%TYPE;
        l_o_rem        exe_billing.bill_rem%TYPE;
    BEGIN
        OPEN analytic_view_new_first_afm;

        LOOP
            FETCH analytic_view_new_first_afm INTO l_bid, l_rem;

            EXIT WHEN analytic_view_new_first_afm%NOTFOUND;

            IF f_amt = l_rem AND f_amt > 0
            THEN
                UPDATE exe_billing
                   SET bill_rem = l_rem - f_amt
                 WHERE bill_id = l_bid;

                f_amt := f_amt - l_rem;
                EXIT;
            ELSIF f_amt <> l_rem AND l_rem > 0 AND f_amt > 0
            THEN
                OPEN analytic_view_old_first_afm;

                LOOP
                    FETCH analytic_view_old_first_afm INTO l_o_bid, l_o_rem;

                    EXIT WHEN analytic_view_old_first_afm%NOTFOUND;

                    IF f_amt < l_o_rem
                    THEN
                        UPDATE exe_billing
                           SET bill_rem = bill_rem - f_amt
                         WHERE bill_id = l_o_bid;

                        f_amt := f_amt - l_o_rem;
                    ELSE
                        UPDATE exe_billing
                           SET bill_rem = 0
                         WHERE bill_id = l_o_bid;

                        f_amt := f_amt - l_o_rem;
                    END IF;

                    EXIT;
                END LOOP;

                CLOSE analytic_view_old_first_afm;
            END IF;
        END LOOP;

        CLOSE analytic_view_new_first_afm;

        RETURN f_amt;
    END afm_payment;

    PROCEDURE payment (str_input      IN exe_customer.customer_afm%TYPE,
                       c_amt          IN exe_billing.bill_amount%TYPE)
    IS
        str_u          VARCHAR2 (20);
        u_amt          NUMBER := c_amt;
    BEGIN
        str_u := REGEXP_REPLACE (str_input, ' ', '');

        IF is_number (str_u) = 1 AND u_amt > 0
        THEN
            u_amt :=
                CASE LENGTH (str_u)
                    WHEN 9 THEN afm_payment (str_u, u_amt)
                    ELSE -1
                END;
        ELSE
            DBMS_OUTPUT.put_line ('INVALID INPUT');
        END IF;
    END payment;

    PROCEDURE reset_values
    IS
        l_cnt          exe_billing.bill_id%TYPE;
        l_amt          exe_billing.bill_amount%TYPE;
        l_num          NUMBER (2, 0);
        l_dat          NUMBER (3, 0);
    BEGIN
        DELETE FROM exe_billing
              WHERE bill_id > 8;

        FOR l_cnt IN 1 .. 8
        LOOP
            SELECT bill_amount
              INTO l_amt
              FROM exe_billing
             WHERE bill_id = l_cnt;

            l_num := DBMS_RANDOM.VALUE (5, l_amt);
            l_dat := DBMS_RANDOM.VALUE (0, 1825);

            UPDATE exe_billing
               SET bill_rem = l_num, bill_date = SYSDATE - l_dat
             WHERE bill_id = l_cnt;
        END LOOP;
    END reset_values;
END mobilenet;
/

-- End of DDL Script for Package MOBILENET
