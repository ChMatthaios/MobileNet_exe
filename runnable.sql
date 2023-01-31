BEGIN
    mobilenet.auto_billing;
    dbms_output.put_line('AUTO BILLING COMPLETED.');
END;

BEGIN
    FOR i IN (
        SELECT
            customer_afm
        FROM
            exe_customer
    ) LOOP
        dbms_output.put_line(
                            CASE mobilenet.balance_search(i.customer_afm)
                                WHEN -1 THEN
                                    'No active subscriptions for <'
                                    || i.customer_afm
                                    || '>'
                                ELSE '<'
                                     || i.customer_afm
                                     || '>	MUST PAY : '
                                     || mobilenet.balance_search(i.customer_afm)
                            END
        );
    END LOOP;

    dbms_output.put_line('BALANCE SEARCH COMPLETED.');
END;

--######################################-AFM PAYMENT-#######################################
DECLARE
    l_num NUMBER(3, 0);
BEGIN
    FOR i IN (
        SELECT
            customer_afm
        FROM
            exe_customer
    ) LOOP
        l_num := dbms_random.value(0, 50);
        dbms_output.put_line(
                            CASE mobilenet.balance_search(i.customer_afm)
                                WHEN -1 THEN
                                    'No active subscriptions for <'
                                    || i.customer_afm
                                    || '>'
                                ELSE '<'
                                     || i.customer_afm
                                     || '>, '
                                     || l_num
                            END
        );

        IF mobilenet.balance_search(i.customer_afm) <> -1 THEN
            mobilenet.payment(i.customer_afm, l_num);
        END IF;

    END LOOP;

    dbms_output.put_line('PAYMENT COMPLETED.');
END;

--####################################-NUMBER PAYMENT-######################################
DECLARE
    l_num NUMBER(3, 0);
BEGIN
    FOR i IN (
        SELECT
            subscription_number
        FROM
            exe_subscription
    ) LOOP
        l_num := dbms_random.value(0, 50);
        dbms_output.put_line('<'
                             || i.subscription_number
                             || '>, '
                             || l_num);
        mobilenet.payment(i.subscription_number, l_num);
    END LOOP;

    dbms_output.put_line('PAYMENT COMPLETED.');
END;

BEGIN
    mobilenet.reset_values;
    dbms_output.put_line('RESET COMPLETED.');
END;
