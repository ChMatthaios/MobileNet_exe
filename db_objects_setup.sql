--  DDL for Table EXE_BILLING
CREATE TABLE exe_billing (
    bill_id     NUMBER NOT NULL,
    bill_date   DATE NOT NULL,
    bill_amount NUMBER NOT NULL,
    bill_rem    NUMBER NOT NULL,
    bill_cid    NUMBER NOT NULL,
    bill_sid    NUMBER NOT NULL
);

--  DDL for Table EXE_CUSTOMER
CREATE TABLE exe_customer (
    customer_id      NUMBER NOT NULL,
    customer_name    VARCHAR2(20) NOT NULL,
    customer_afm     VARCHAR2(9) NOT NULL,
    customer_address VARCHAR2(20) NOT NULL,
    customer_tid     NUMBER NOT NULL
);

--  DDL for Table EXE_CUSTOMER_TYPE
CREATE TABLE exe_customer_type (
    ctype_id   NUMBER NOT NULL,
    ctype_name VARCHAR2(15) NOT NULL
);

--  DDL for Table EXE_SUBS_PL_RELATION
CREATE TABLE exe_subs_pl_relation (
    rel_id             NUMBER NOT NULL,
    subs_id            NUMBER NOT NULL,
    subs_pl_id         NUMBER NOT NULL,
    subs_pl_start_date DATE NOT NULL,
    subs_pl_end_date   DATE
);

--  DDL for Table EXE_SUBSCRIPTION
CREATE TABLE exe_subscription (
    subscription_id         NUMBER NOT NULL,
    subscription_start_date DATE NOT NULL,
    subscription_end_date   DATE,
    subscription_cid        NUMBER NOT NULL,
    subscription_number     VARCHAR2(10) NOT NULL DEFAULT '2101111111'
);

--  DDL for Table EXE_SUBSCRIPTION_PLAN
CREATE TABLE exe_subscription_plan (
    splan_id   NUMBER NOT NULL,
    splan_name VARCHAR2(15) NOT NULL,
    splan_fix  NUMBER NOT NULL
);

--  REM INSERTING INTO EXE_BILLING
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (1,to_date('05-DEC-22 16.34.53','DD-MON-RR HH24.MI.SS'),10,8,1,1);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (2,to_date('26-JAN-22 16.34.53','DD-MON-RR HH24.MI.SS'),30,29,3,3);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (3,to_date('12-APR-22 16.34.53','DD-MON-RR HH24.MI.SS'),10,9,5,5);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (4,to_date('10-SEP-22 16.34.53','DD-MON-RR HH24.MI.SS'),20,20,6,6);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (5,to_date('15-JUN-22 16.34.53','DD-MON-RR HH24.MI.SS'),30,6,7,7);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (6,to_date('17-JUL-22 16.34.53','DD-MON-RR HH24.MI.SS'),40,26,8,8);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (7,to_date('26-FEB-22 16.34.53','DD-MON-RR HH24.MI.SS'),10,6,9,9);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (8,to_date('13-SEP-22 16.34.53','DD-MON-RR HH24.MI.SS'),20,13,6,10);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (9,to_date('09-JAN-23 16.35.25','DD-MON-RR HH24.MI.SS'),10,10,1,1);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (10,to_date('09-JAN-23 16.35.25','DD-MON-RR HH24.MI.SS'),30,30,3,3);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (11,to_date('09-JAN-23 16.35.25','DD-MON-RR HH24.MI.SS'),10,10,5,5);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (12,to_date('09-JAN-23 16.35.25','DD-MON-RR HH24.MI.SS'),20,20,6,6);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (13,to_date('09-JAN-23 16.35.25','DD-MON-RR HH24.MI.SS'),30,30,7,7);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (14,to_date('09-JAN-23 16.35.25','DD-MON-RR HH24.MI.SS'),40,40,8,8);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (15,to_date('09-JAN-23 16.35.25','DD-MON-RR HH24.MI.SS'),10,10,9,9);
INSERT INTO exe_billing (bill_id,bill_date,bill_amount,bill_rem,bill_cid,bill_sid) VALUES (16,to_date('09-JAN-23 16.35.25','DD-MON-RR HH24.MI.SS'),20,20,6,10);

--  INSERTING INTO EXE_CUSTOMER
INSERT INTO exe_customer (customer_id,customer_name,customer_afm,customer_address,customer_tid) VALUES (1,'Alfa','123456789','Address 1',1);
INSERT INTO exe_customer (customer_id,customer_name,customer_afm,customer_address,customer_tid) VALUES (2,'Beta','234567891','Address 2',2);
INSERT INTO exe_customer (customer_id,customer_name,customer_afm,customer_address,customer_tid) VALUES (3,'Gamma','345678912','Address 3',3);
INSERT INTO exe_customer (customer_id,customer_name,customer_afm,customer_address,customer_tid) VALUES (4,'Delta','456789123','Address 4',1);
INSERT INTO exe_customer (customer_id,customer_name,customer_afm,customer_address,customer_tid) VALUES (5,'Epsilon','567891234','Address 5',1);
INSERT INTO exe_customer (customer_id,customer_name,customer_afm,customer_address,customer_tid) VALUES (6,'Zeta','678912345','Address 6',3);
INSERT INTO exe_customer (customer_id,customer_name,customer_afm,customer_address,customer_tid) VALUES (7,'Itta','789123456','Address 7',2);
INSERT INTO exe_customer (customer_id,customer_name,customer_afm,customer_address,customer_tid) VALUES (8,'Theta','891234567','Address 8',1);
INSERT INTO exe_customer (customer_id,customer_name,customer_afm,customer_address,customer_tid) VALUES (9,'Giwta','912345678','Address 9',2);

--  INSERTING INTO EXE_CUSTOMER_TYPE
INSERT INTO exe_customer_type (ctype_id,ctype_name) VALUES (1,'Person');
INSERT INTO exe_customer_type (ctype_id,ctype_name) VALUES (2,'Professional');
INSERT INTO exe_customer_type (ctype_id,ctype_name) VALUES (3,'Company');

--  INSERTING INTO EXE_SUBS_PL_RELATION
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (1,1,1,to_date('01-MAY-18 00.00.00','DD-MON-RR HH24.MI.SS'),null);
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (2,2,2,to_date('02-JUN-19 00.00.00','DD-MON-RR HH24.MI.SS'),to_date('02-JUN-20 00.00.00','DD-MON-RR HH24.MI.SS'));
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (3,3,3,to_date('01-MAY-18 00.00.00','DD-MON-RR HH24.MI.SS'),null);
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (4,4,4,to_date('04-AUG-21 00.00.00','DD-MON-RR HH24.MI.SS'),to_date('04-AUG-22 00.00.00','DD-MON-RR HH24.MI.SS'));
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (5,5,1,to_date('01-MAY-18 00.00.00','DD-MON-RR HH24.MI.SS'),null);
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (6,6,2,to_date('03-OCT-18 00.00.00','DD-MON-RR HH24.MI.SS'),null);
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (7,7,3,to_date('04-NOV-18 00.00.00','DD-MON-RR HH24.MI.SS'),null);
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (8,8,4,to_date('04-SEP-18 00.00.00','DD-MON-RR HH24.MI.SS'),null);
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (9,9,1,to_date('05-DEC-18 00.00.00','DD-MON-RR HH24.MI.SS'),null);
INSERT INTO exe_subs_pl_relation (rel_id,subs_id,subs_pl_id,subs_pl_start_date,subs_pl_end_date) VALUES (10,10,2,to_date('06-DEC-18 00.00.00','DD-MON-RR HH24.MI.SS'),null);

--  INSERTING INTO EXE_SUBSCRIPTION
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (1,to_date('01-MAY-18 00.00.00','DD-MON-RR HH24.MI.SS'),null,1,'2100000001');
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (2,to_date('02-JUN-19 00.00.00','DD-MON-RR HH24.MI.SS'),to_date('02-JUN-20 00.00.00','DD-MON-RR HH24.MI.SS'),2,'2100000002');
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (3,to_date('03-JUL-20 00.00.00','DD-MON-RR HH24.MI.SS'),null,3,'2100000003');
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (4,to_date('04-AUG-21 00.00.00','DD-MON-RR HH24.MI.SS'),to_date('04-AUG-22 00.00.00','DD-MON-RR HH24.MI.SS'),4,'2100000004');
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (5,to_date('05-SEP-22 00.00.00','DD-MON-RR HH24.MI.SS'),null,5,'2100000005');
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (6,to_date('03-OCT-22 00.00.00','DD-MON-RR HH24.MI.SS'),null,6,'2100000006');
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (7,to_date('04-NOV-22 00.00.00','DD-MON-RR HH24.MI.SS'),null,7,'2100000007');
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (8,to_date('04-SEP-22 00.00.00','DD-MON-RR HH24.MI.SS'),null,8,'2100000008');
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (9,to_date('05-DEC-22 00.00.00','DD-MON-RR HH24.MI.SS'),null,9,'2100000009');
INSERT INTO exe_subscription (subscription_id,subscription_start_date,subscription_end_date,subscription_cid,subscription_number) VALUES (10,to_date('06-DEC-22 00.00.00','DD-MON-RR HH24.MI.SS'),null,6,'2100000010');

--  INSERTING INTO EXE_SUBSCRIPTION_PLAN
INSERT INTO exe_subscription_plan (splan_id,splan_name,splan_fix) VALUES (1,'Small',10);
INSERT INTO exe_subscription_plan (splan_id,splan_name,splan_fix) VALUES (2,'Medium',20);
INSERT INTO exe_subscription_plan (splan_id,splan_name,splan_fix) VALUES (3,'Large',30);
INSERT INTO exe_subscription_plan (splan_id,splan_name,splan_fix) VALUES (4,'Extra Large',40);

--  Constraints for Table EXE_BILLING
ALTER TABLE exe_billing
    ADD PRIMARY KEY ( bill_id );

--  Constraints for Table EXE_CUSTOMER
ALTER TABLE exe_customer
    ADD PRIMARY KEY ( customer_id );

--  Constraints for Table EXE_CUSTOMER_TYPE
ALTER TABLE exe_customer_type
    ADD PRIMARY KEY ( ctype_id );

--  Constraints for Table EXE_SUBS_PL_RELATION
ALTER TABLE exe_subs_pl_relation
    ADD PRIMARY KEY ( rel_id,
                      subs_pl_start_date );

--  Constraints for Table EXE_SUBSCRIPTION
ALTER TABLE exe_subscription
    ADD PRIMARY KEY ( subscription_id );

--  Constraints for Table EXE_SUBSCRIPTION_PLAN
ALTER TABLE exe_subscription_plan
    ADD PRIMARY KEY ( splan_id );

--  Ref Constraints for Table EXE_BILLING
ALTER TABLE exe_billing
    ADD CONSTRAINT b_c_fk FOREIGN KEY ( bill_cid )
        REFERENCES exe_customer ( customer_id );

ALTER TABLE exe_billing
    ADD CONSTRAINT b_s_fk FOREIGN KEY ( bill_sid )
        REFERENCES exe_subscription ( subscription_id );

--  Ref Constraints for Table EXE_CUSTOMER
ALTER TABLE exe_customer
    ADD CONSTRAINT c_t_fk FOREIGN KEY ( customer_tid )
        REFERENCES exe_customer_type ( ctype_id );

--  Ref Constraints for Table EXE_SUBS_PL_RELATION
ALTER TABLE exe_subs_pl_relation
    ADD CONSTRAINT r_p_fk FOREIGN KEY ( subs_pl_id )
        REFERENCES exe_subscription_plan ( splan_id );

ALTER TABLE exe_subs_pl_relation
    ADD CONSTRAINT r_s_fk FOREIGN KEY ( subs_id )
        REFERENCES exe_subscription ( subscription_id );

--  Ref Constraints for Table EXE_SUBSCRIPTION
ALTER TABLE exe_subscription
    ADD CONSTRAINT s_c_fk FOREIGN KEY ( subscription_cid )
        REFERENCES exe_customer ( customer_id );
