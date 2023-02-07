BEGIN
    mobilenet.auto_billing;
    dbms_output.put_line('AUTO BILLING COMPLETED.');
END;

BEGIN
    FOR i IN (
        SELECT
            afm
        FROM
            viewa2
    ) LOOP
        dbms_output.put_line(
                            CASE mobilenet.balance_search(i.afm)
                                WHEN 0 THEN
                                    'Nothing to pay for <'
                                    || i.afm
                                    || '>'
                                ELSE '<'
                                     || i.afm
                                     || '>	MUST PAY : '
                                     || mobilenet.balance_search(i.afm)
                            END
        );
    END LOOP;

    dbms_output.put_line('BALANCE SEARCH COMPLETED.');
END;

DECLARE
    l_num NUMBER(3, 0);
BEGIN
    FOR i IN (
        SELECT
            afm
        FROM
            viewa2
    ) LOOP
        l_num := dbms_random.value(0, 50);
        dbms_output.put_line(
                            CASE mobilenet.balance_search(i.afm)
                                WHEN 0 THEN
                                    'Nothing to pay for <'
                                    || i.afm
                                    || '>'
                                ELSE '<'
                                     || i.afm
                                     || '>, '
                                     || l_num
                            END
        );

        IF mobilenet.balance_search(i.afm) <> 0 THEN
            mobilenet.payment(i.afm, l_num);
            dbms_output.put_line('Your balance is : '
                                 || mobilenet.balance_search(i.afm));
        END IF;

    END LOOP;

    dbms_output.put_line('PAYMENT COMPLETED.');
END;

BEGIN
    mobilenet.reset_values;
    dbms_output.put_line('RESET COMPLETED.');
END;
