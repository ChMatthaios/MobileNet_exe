--------------------------------------------------------
--  DDL for Package Body MOBILENET
--------------------------------------------------------

CREATE OR REPLACE EDITIONABLE PACKAGE BODY mobilenet AS

    FUNCTION is_number ( p_string IN VARCHAR2 ) RETURN NUMBER IS
        v_new_num NUMBER(10);
    BEGIN
        v_new_num := TO_NUMBER ( p_string );
        RETURN 1;
    EXCEPTION
        WHEN value_error THEN
            RETURN 0;
    END is_number;

    PROCEDURE auto_billing IS

        l_cid  exe_customer.customer_id%TYPE;
        l_sid  exe_subscription.subscription_id%TYPE;
        l_fix  exe_subscription_plan.splan_fix%TYPE;
        l_rem  exe_billing.bill_rem%TYPE;
        l_size NUMBER := 0;
        l_date DATE := sysdate;
    BEGIN
        FOR i IN (
            SELECT
                s.subscription_id AS subscription_id,
                sp.splan_fix      AS splan_fix
            FROM
                     exe_subscription s
                INNER JOIN exe_subs_pl_relation  spr ON s.subscription_id = spr.subs_id
                INNER JOIN exe_subscription_plan sp ON spr.subs_pl_id = sp.splan_id
            WHERE
                s.subscription_end_date IS NULL
            GROUP BY
                s.subscription_id,
                sp.splan_fix
            ORDER BY
                s.subscription_id
        ) LOOP
            SELECT
                c.customer_id
            INTO l_cid
            FROM
                     exe_customer c
                INNER JOIN exe_subscription s ON s.subscription_cid = c.customer_id
            WHERE
                s.subscription_id = i.subscription_id;

            INSERT INTO exe_billing (
                bill_id,
                bill_date,
                bill_amount,
                bill_rem,
                bill_cid,
                bill_sid
            ) VALUES (
                bill_seq.NEXTVAL,
                l_date,
                i.splan_fix,
                i.splan_fix,
                l_cid,
                l_sid
            );

        END LOOP;

        COMMIT;
    END auto_billing;

    FUNCTION balance_search ( input_str IN VARCHAR2 ) RETURN NUMBER IS

        str_u VARCHAR2(20);
        l_afm exe_customer.customer_afm%TYPE;
        l_tel exe_subscription.subscription_number%TYPE;
        l_rem exe_billing.bill_rem%TYPE := -1;
    BEGIN
        str_u := regexp_replace(input_str, ' ', '');
        IF is_number(str_u) = 1 THEN
            SELECT
                SUM(b.bill_rem)
            INTO l_rem
            FROM
                     exe_customer c
                JOIN exe_billing b ON b.bill_cid = c.customer_id
            WHERE
                c.customer_afm = input_str
            GROUP BY
                c.customer_afm;

        END IF;

        RETURN l_rem;
    END balance_search;

    FUNCTION afm_payment ( str_u IN VARCHAR2,
                           u_amt IN NUMBER ) RETURN NUMBER IS

        CURSOR analytic_view_old_first_afm IS
        SELECT
            b.bill_id,
            b.bill_rem
        FROM
                 exe_billing b
            JOIN exe_customer c ON b.bill_cid = c.customer_id
        WHERE
                c.customer_afm = str_u
            AND bill_rem > 0
        ORDER BY
            b.bill_date ASC;

        CURSOR analytic_view_new_first_afm IS
        SELECT
            b.bill_id,
            b.bill_rem
        FROM
                 exe_billing b
            JOIN exe_customer c ON b.bill_cid = c.customer_id
        WHERE
            c.customer_afm = str_u
        ORDER BY
            b.bill_date DESC;

        f_amt   NUMBER := u_amt;
        l_bid   exe_billing.bill_id%TYPE;
        l_rem   exe_billing.bill_rem%TYPE;
        l_o_bid exe_billing.bill_id%TYPE;
        l_o_rem exe_billing.bill_rem%TYPE;
    BEGIN
        OPEN analytic_view_new_first_afm;
        LOOP
            FETCH analytic_view_new_first_afm INTO
                l_bid,
                l_rem;
            EXIT WHEN analytic_view_new_first_afm%notfound;
            IF f_amt = l_rem AND f_amt > 0 THEN
                UPDATE exe_billing
                SET
                    bill_rem = l_rem - f_amt
                WHERE
                    bill_id = l_bid;

                f_amt := f_amt - l_rem;
                EXIT;
            ELSIF f_amt <> l_rem AND l_rem > 0 AND f_amt > 0 THEN
                OPEN analytic_view_old_first_afm;
                LOOP
                    FETCH analytic_view_old_first_afm INTO
                        l_o_bid,
                        l_o_rem;
                    EXIT WHEN analytic_view_old_first_afm%notfound;
                    IF f_amt < l_o_rem THEN
                        UPDATE exe_billing
                        SET
                            bill_rem = bill_rem - f_amt
                        WHERE
                            bill_id = l_o_bid;

                        f_amt := f_amt - l_o_rem;
                    ELSE
                        UPDATE exe_billing
                        SET
                            bill_rem = 0
                        WHERE
                            bill_id = l_o_bid;

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

    FUNCTION telephone_payment ( str_u IN VARCHAR2,
                                 u_amt IN NUMBER ) RETURN NUMBER IS

        CURSOR analytic_view_old_first_tel IS
        SELECT
            b.bill_id,
            b.bill_rem
        FROM
                 exe_billing b
            JOIN exe_subscription s ON b.bill_sid = s.subscription_id
        WHERE
                s.subscription_number = str_u
            AND bill_rem > 0
        ORDER BY
            b.bill_date ASC;

        CURSOR analytic_view_new_first_tel IS
        SELECT
            b.bill_id,
            b.bill_rem
        FROM
                 exe_billing b
            JOIN exe_subscription s ON b.bill_sid = s.subscription_id
        WHERE
            s.subscription_number = str_u
        ORDER BY
            b.bill_date DESC;

        f_amt   NUMBER := u_amt;
        l_bid   exe_billing.bill_id%TYPE;
        l_rem   exe_billing.bill_rem%TYPE;
        l_o_bid exe_billing.bill_id%TYPE;
        l_o_rem exe_billing.bill_rem%TYPE;
    BEGIN
        OPEN analytic_view_new_first_tel;
        LOOP
            FETCH analytic_view_new_first_tel INTO
                l_bid,
                l_rem;
            EXIT WHEN analytic_view_new_first_tel%notfound;
            IF f_amt = l_rem AND f_amt > 0 THEN
                UPDATE exe_billing
                SET
                    bill_rem = l_rem - f_amt
                WHERE
                    bill_id = l_bid;

                f_amt := f_amt - l_rem;
                EXIT;
            ELSIF f_amt <> l_rem AND l_rem > 0 AND f_amt > 0 THEN
                OPEN analytic_view_old_first_tel;
                LOOP
                    FETCH analytic_view_old_first_tel INTO
                        l_o_bid,
                        l_o_rem;
                    EXIT WHEN analytic_view_old_first_tel%notfound;
                    IF f_amt < l_o_rem THEN
                        UPDATE exe_billing
                        SET
                            bill_rem = bill_rem - f_amt
                        WHERE
                            bill_id = l_o_bid;

                        f_amt := f_amt - l_o_rem;
                    ELSE
                        UPDATE exe_billing
                        SET
                            bill_rem = 0
                        WHERE
                            bill_id = l_o_bid;

                        f_amt := f_amt - l_o_rem;
                    END IF;

                    EXIT;
                END LOOP;

                CLOSE analytic_view_old_first_tel;
            END IF;

        END LOOP;

        CLOSE analytic_view_new_first_tel;
        RETURN f_amt;
    END telephone_payment;

    PROCEDURE payment ( str_input IN exe_customer.customer_afm%TYPE,
                        c_amt     IN NUMBER ) IS
        str_u VARCHAR2(20);
        u_amt NUMBER := c_amt;
    BEGIN
        str_u := regexp_replace(str_input, ' ', '');
        IF is_number(str_u) = 1 AND u_amt > 0 THEN
            u_amt :=
                CASE length(str_u)
                    WHEN 9 THEN
                        afm_payment(str_u, u_amt)
                    WHEN 10 THEN
                        telephone_payment(str_u, u_amt)
                    ELSE -1
                END;

        ELSE
            dbms_output.put_line('INVALID INPUT');
        END IF;

    END payment;

    PROCEDURE reset_values IS

        l_cnt exe_billing.bill_id%TYPE;
        l_amt exe_billing.bill_amount%TYPE;
        l_num NUMBER(2, 0);
        l_dat NUMBER(3, 0);
    BEGIN
        DELETE FROM exe_billing
        WHERE
            bill_id > 8;

        FOR l_cnt IN 1..8 LOOP
            SELECT
                bill_amount
            INTO l_amt
            FROM
                exe_billing
            WHERE
                bill_id = l_cnt;

            l_num := dbms_random.value(5, l_amt);
            l_dat := dbms_random.value(0, 365);
            UPDATE exe_billing
            SET
                bill_rem = l_num,
                bill_date = sysdate - l_dat
            WHERE
                bill_id = l_cnt;

        END LOOP;

    END reset_values;

END mobilenet;
