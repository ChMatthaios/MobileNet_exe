# MobileNet Exercise

MobileNet is a mobile phone company. When a new customer becomes a subscriber, they are asked for the following information: Name/Surname, VAT number, address, type of customer (Individual, Professional, Company). Each customer can have one or more mobile connections. Each connection has a phone number, activation date, deactivation date if terminated and one of the following usage plans: Small, Medium, Large, Extra Large. Each usage plan has a fixed monthly fee, e.g., Small €10, Medium €20 etc.
Every 1st of the month, MobileNet issues bills (or invoices) for its customers. Each customer's account has an account code, issue date, account amount and outstanding account balance (e.g., if the bill is €40 and the customer pays €25, the account amount will be €40, and the outstanding balance will be €15).
The exercise is to create a database with relational tables in Oracle, as well as the appropriate views and a PL/SQL package with stored procedures/functions to serve the operation of MobileNet.

Specifically:
1. Create a view to create a report with the number of active connections per user program and customer type.
2. Create a view to create a report with the customers who owe. The report should show the TIN, full name, total outstanding balance and date of oldest outstanding bill.
3. Create a PL/SQL package with the following procedures/functions:
 - Invoicing/invoicing process. Billing is done once a month for all customers. The amount of each account is equal to the sum of the assets of the customer's active connections. A procedure should be created that will create an account for each client that has active connections.
 - Balance search. The customer can ask for his outstanding balance by giving his VAT number or account number. Develop a PL/SQL function to support the functionality.
 - Bill payment. The customer can pay any amount from €0.01 up to their total outstanding balance. If the amount of the payment is equal to the outstanding balance of an account, then the payment pays off that account. Otherwise, the amount is used to pay/pay off the older bills. Create a stored procedure with parameters the employee's VAT number and the payment amount, which will do the following:
   - Performs the necessary checks.
   - Updates the outstanding balance of the customer's account(s).
