BEGIN
    mobilenet.auto_billing;	dbms_output.put_line('AUTO BILLING COMPLETED.');
END;
/

BEGIN
    dbms_output.put_line('<123456789>	PAY : ' || mobilenet.balance_search('123456789'));
    dbms_output.put_line('<234567891>	PAY : ' || mobilenet.balance_search('234567891'));
    dbms_output.put_line('<345678912>	PAY : ' || mobilenet.balance_search('345678912'));
    dbms_output.put_line('<456789123>	PAY : ' || mobilenet.balance_search('456789123'));
    dbms_output.put_line('<567891234>	PAY : ' || mobilenet.balance_search('567891234'));
    dbms_output.put_line('<678912345>	PAY : ' || mobilenet.balance_search('678912345'));
    dbms_output.put_line('<789123456>	PAY : ' || mobilenet.balance_search('789123456'));
    dbms_output.put_line('<891234567>	PAY : ' || mobilenet.balance_search('891234567'));
    dbms_output.put_line('<912345678>	PAY : ' || mobilenet.balance_search('912345678'));
    dbms_output.put_line('BALANCE SEARCH COMPLETED.');
END;
/

BEGIN
    dbms_output.put_line('123456789,  40 ');	mobilenet.payment('123456789', 40);
    dbms_output.put_line('345678912,  40 ');	mobilenet.payment('345678912', 40);
    dbms_output.put_line('567891234,  40 ');	mobilenet.payment('567891234', 40);
    dbms_output.put_line('678912345,  40 ');	mobilenet.payment('678912345', 40);
    dbms_output.put_line('789123456,  40 ');	mobilenet.payment('789123456', 40);
    dbms_output.put_line('891234567,  40 ');	mobilenet.payment('891234567', 40);
    dbms_output.put_line('912345678,  40 ');	mobilenet.payment('912345678', 40);
    dbms_output.put_line('PAYMENT COMPLETED.');
END;
/

BEGIN
    mobilenet.reset_values;	dbms_output.put_line('RESET COMPLETED.');
END;
/
--##########################################################################################
BEGIN
    mobilenet.auto_billing;	dbms_output.put_line('AUTO BILLING COMPLETED.');
END;
/

BEGIN
    dbms_output.put_line('<123456789>	PAY : ' || mobilenet.balance_search('123456789'));
    dbms_output.put_line('<234567891>	PAY : ' || mobilenet.balance_search('234567891'));
    dbms_output.put_line('<345678912>	PAY : ' || mobilenet.balance_search('345678912'));
    dbms_output.put_line('<456789123>	PAY : ' || mobilenet.balance_search('456789123'));
    dbms_output.put_line('<567891234>	PAY : ' || mobilenet.balance_search('567891234'));
    dbms_output.put_line('<678912345>	PAY : ' || mobilenet.balance_search('678912345'));
    dbms_output.put_line('<789123456>	PAY : ' || mobilenet.balance_search('789123456'));
    dbms_output.put_line('<891234567>	PAY : ' || mobilenet.balance_search('891234567'));
    dbms_output.put_line('<912345678>	PAY : ' || mobilenet.balance_search('912345678'));
    dbms_output.put_line('BALANCE SEARCH COMPLETED.');
END;
/

BEGIN
    dbms_output.put_line('2100000001,  40 ');	mobilenet.payment('2100000001', 40);
    dbms_output.put_line('2100000003,  40 ');	mobilenet.payment('2100000003', 40);
    dbms_output.put_line('2100000005,  40 ');	mobilenet.payment('2100000005', 40);
    dbms_output.put_line('2100000006,  40 ');	mobilenet.payment('2100000006', 40);
    dbms_output.put_line('2100000007,  40 ');	mobilenet.payment('2100000007', 40);
    dbms_output.put_line('2100000008,  40 ');	mobilenet.payment('2100000008', 40);
    dbms_output.put_line('2100000009,  40 ');	mobilenet.payment('2100000009', 40);
    dbms_output.put_line('2100000010,  40 ');	mobilenet.payment('2100000010', 40);
    dbms_output.put_line('PAYMENT COMPLETED.');
END;
/

BEGIN
    mobilenet.reset_values;	dbms_output.put_line('RESET COMPLETED.');
END;
/