CREATE OR REPLACE PACKAGE mobilenet AUTHID current_user AS
	/*
	Invoicing/invoicing process. Billing is done once a month for all 
	customers. The amount of each account is equal to the sum of the 
	assets of the customer's active connections. A procedure should be 
	created that will create an account for each client that has active 
	connections.
	*/
    PROCEDURE auto_billing;
	/*
	Balance search. The customer can ask for his outstanding balance by 
	giving his VAT number or account number. Develop a PL/SQL function 
	to support the functionality.
	*/
    FUNCTION balance_search ( input_str IN VARCHAR2 ) RETURN NUMBER;
	/*
	Bill payment. The customer can pay any amount from €0.01 up to their 
	total outstanding balance. If the amount of the payment is equal to 
	the outstanding balance of an account, then the payment pays off that 
	account. Otherwise, the amount is used to pay/pay off the older bills. 
	Create a stored procedure with parameters the employee's VAT number 
	and the payment amount, which will do the following:
	i)	Performs the necessary checks.
	ii)	Updates the outstanding balance of the customer's account(s).
	*/
    PROCEDURE payment ( str_input IN customer.customer_afm%TYPE,
						c_amt     IN NUMBER );

    PROCEDURE reset_values;

END mobilenet;