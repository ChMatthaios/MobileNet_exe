--------------------------------------------------------
--  DDL for Package MOBILENET
--------------------------------------------------------

CREATE OR REPLACE EDITIONABLE PACKAGE mobilenet AUTHID current_user AS
    PROCEDURE auto_billing;

    FUNCTION balance_search ( input_str IN VARCHAR2 ) RETURN NUMBER;

    PROCEDURE payment ( str_input IN exe_customer.customer_afm%TYPE,
			                  c_amt     IN NUMBER );

    PROCEDURE reset_values;

END mobilenet;
