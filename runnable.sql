/* Formatted on 17/05/2023 14:09:17 (QP5 v5.336) */
BEGIN
    mobilenet.auto_billing;
    DBMS_OUTPUT.put_line ('AUTO BILLING COMPLETED.');
END;

BEGIN
    FOR i IN (SELECT afm FROM viewa2)
    LOOP
        DBMS_OUTPUT.put_line (
            CASE mobilenet.balance_search (i.afm)
                WHEN 0
                THEN
                    'Nothing to pay for <' || i.afm || '>'
                ELSE
                       '<'
                    || i.afm
                    || '>	MUST PAY : '
                    || mobilenet.balance_search (i.afm)
            END);
    END LOOP;

    DBMS_OUTPUT.put_line ('BALANCE SEARCH COMPLETED.');
END;

DECLARE
    l_num          NUMBER (3, 0);
BEGIN
    FOR i IN (SELECT afm FROM viewa2)
    LOOP
        l_num := DBMS_RANDOM.VALUE (0, 50);
        DBMS_OUTPUT.put_line (
            CASE mobilenet.balance_search (i.afm)
                WHEN 0 THEN 'Nothing to pay for <' || i.afm || '>'
                ELSE '<' || i.afm || '>, ' || l_num
            END);

        IF mobilenet.balance_search (i.afm) <> 0
        THEN
            mobilenet.payment (i.afm, l_num);
            DBMS_OUTPUT.put_line (
                'Your balance is : ' || mobilenet.balance_search (i.afm));
        END IF;
    END LOOP;

    DBMS_OUTPUT.put_line ('PAYMENT COMPLETED.');
END;

BEGIN
    mobilenet.reset_values;
    DBMS_OUTPUT.put_line ('RESET COMPLETED.');
END;
