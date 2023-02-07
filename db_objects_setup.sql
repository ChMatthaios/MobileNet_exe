--------------------------------------------------------
--  File created - 07-02-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EXE_CUSTOMER_TYPE
--------------------------------------------------------
CREATE TABLE exe_customer_type (
    ctype_id   NUMBER NOT NULL PRIMARY KEY,
    ctype_name VARCHAR2(15) NOT NULL
);
--------------------------------------------------------
--  DDL for Table EXE_SUBSCRIPTION_PLAN
--------------------------------------------------------
CREATE TABLE exe_subscription_plan (
    splan_id   NUMBER NOT NULL PRIMARY KEY,
    splan_name VARCHAR2(15) NOT NULL,
    splan_fix  NUMBER NOT NULL
);
--------------------------------------------------------
--  DDL for Table EXE_CUSTOMER
--------------------------------------------------------
CREATE TABLE exe_customer (
    customer_id      NUMBER NOT NULL PRIMARY KEY,
    customer_name    VARCHAR2(20) NOT NULL,
    customer_afm     VARCHAR2(9) NOT NULL,
    customer_address VARCHAR2(20) NOT NULL,
    customer_tid     NUMBER NOT NULL,
    CONSTRAINT c_t_fk FOREIGN KEY ( customer_tid )
        REFERENCES exe_customer_type ( ctype_id )
);
--------------------------------------------------------
--  DDL for Table EXE_SUBSCRIPTION
--------------------------------------------------------
CREATE TABLE exe_subscription (
    subscription_id         NUMBER NOT NULL PRIMARY KEY,
    subscription_start_date DATE NOT NULL,
    subscription_end_date   DATE,
    subscription_cid        NUMBER NOT NULL,
    subscription_number     VARCHAR2(10) DEFAULT '2101111111',
    CONSTRAINT s_c_fk FOREIGN KEY ( subscription_cid )
        REFERENCES exe_customer ( customer_id )
);
--------------------------------------------------------
--  DDL for Table EXE_SUBS_PL_RELATION
--------------------------------------------------------
CREATE TABLE exe_subs_pl_relation (
    rel_id             NUMBER NOT NULL,
    subs_id            NUMBER NOT NULL,
    subs_pl_id         NUMBER NOT NULL,
    subs_pl_start_date DATE NOT NULL,
    subs_pl_end_date   DATE,
    PRIMARY KEY ( rel_id,
                  subs_pl_start_date ),
    CONSTRAINT r_p_fk FOREIGN KEY ( subs_pl_id )
        REFERENCES exe_subscription_plan ( splan_id ),
    CONSTRAINT r_s_fk FOREIGN KEY ( subs_id )
        REFERENCES exe_subscription ( subscription_id )
);
--------------------------------------------------------
--  DDL for Table EXE_BILLING
--------------------------------------------------------
CREATE TABLE exe_billing (
    bill_id     NUMBER NOT NULL PRIMARY KEY,
    bill_date   DATE NOT NULL,
    bill_amount NUMBER NOT NULL,
    bill_rem    NUMBER NOT NULL,
    bill_cid    NUMBER NOT NULL,
    bill_sid    NUMBER NOT NULL,
    CONSTRAINT b_c_fk FOREIGN KEY ( bill_cid )
        REFERENCES exe_customer ( customer_id ),
    CONSTRAINT b_s_fk FOREIGN KEY ( bill_sid )
        REFERENCES exe_subscription ( subscription_id )
);
-- INSERTING INTO EXE_CUSTOMER_TYPE
INSERT INTO exe_customer_type VALUES (1,'PERSON');
INSERT INTO exe_customer_type VALUES (2,'PROFESSIONAL');
INSERT INTO exe_customer_type VALUES (3,'COMPANY');
-- INSERTING INTO EXE_SUBSCRIPTION_PLAN
INSERT INTO exe_subscription_plan VALUES (1,'SMALL',10);
INSERT INTO exe_subscription_plan VALUES (2,'MEDIUM',20);
INSERT INTO exe_subscription_plan VALUES (3,'LARGE',30);
INSERT INTO exe_subscription_plan VALUES (4,'EXTRA LARGE',40);
-- INSERTING INTO EXE_CUSTOMER
INSERT INTO exe_customer VALUES (1,'ALFA','123456789','ADDRESS 1',1);
INSERT INTO exe_customer VALUES (2,'BETA','234567891','ADDRESS 2',2);
INSERT INTO exe_customer VALUES (3,'GAMMA','345678912','ADDRESS 3',3);
INSERT INTO exe_customer VALUES (4,'DELTA','456789123','ADDRESS 4',1);
INSERT INTO exe_customer VALUES (5,'EPSILON','567891234','ADDRESS 5',1);
INSERT INTO exe_customer VALUES (6,'ZETA','678912345','ADDRESS 6',3);
INSERT INTO exe_customer VALUES (7,'ITTA','789123456','ADDRESS 7',2);
INSERT INTO exe_customer VALUES (8,'THETA','891234567','ADDRESS 8',1);
INSERT INTO exe_customer VALUES (9,'GIWTA','912345678','ADDRESS 9',2);
-- INSERTING INTO EXE_SUBSCRIPTION
INSERT INTO exe_subscription VALUES (1,TO_DATE('01-MAY-18','DD-MON-RR'),NULL,1,'2100000001');
INSERT INTO exe_subscription VALUES (2,TO_DATE('02-JUN-19','DD-MON-RR'),TO_DATE('02-JUN-20','DD-MON-RR'),2,'2100000002');
INSERT INTO exe_subscription VALUES (3,TO_DATE('03-JUL-20','DD-MON-RR'),NULL,3,'2100000003');
INSERT INTO exe_subscription VALUES (4,TO_DATE('04-AUG-21','DD-MON-RR'),TO_DATE('04-AUG-22','DD-MON-RR'),4,'2100000004');
INSERT INTO exe_subscription VALUES (5,TO_DATE('05-SEP-22','DD-MON-RR'),NULL,5,'2100000005');
INSERT INTO exe_subscription VALUES (6,TO_DATE('03-OCT-22','DD-MON-RR'),NULL,6,'2100000006');
INSERT INTO exe_subscription VALUES (7,TO_DATE('04-NOV-22','DD-MON-RR'),NULL,7,'2100000007');
INSERT INTO exe_subscription VALUES (8,TO_DATE('04-SEP-22','DD-MON-RR'),NULL,8,'2100000008');
INSERT INTO exe_subscription VALUES (9,TO_DATE('05-DEC-22','DD-MON-RR'),NULL,9,'2100000009');
INSERT INTO exe_subscription VALUES (10,TO_DATE('06-DEC-22','DD-MON-RR'),NULL,6,'2100000010');
-- INSERTING INTO EXE_SUBS_PL_RELATION
INSERT INTO exe_subs_pl_relation VALUES (1,1,1,TO_DATE('01-MAY-18','DD-MON-RR'),NULL);
INSERT INTO exe_subs_pl_relation VALUES (2,2,2,TO_DATE('02-JUN-19','DD-MON-RR'),TO_DATE('02-JUN-20','DD-MON-RR'));
INSERT INTO exe_subs_pl_relation VALUES (3,3,3,TO_DATE('01-MAY-18','DD-MON-RR'),NULL);
INSERT INTO exe_subs_pl_relation VALUES (4,4,4,TO_DATE('04-AUG-21','DD-MON-RR'),TO_DATE('04-AUG-22','DD-MON-RR'));
INSERT INTO exe_subs_pl_relation VALUES (5,5,1,TO_DATE('01-MAY-18','DD-MON-RR'),NULL);
INSERT INTO exe_subs_pl_relation VALUES (6,6,2,TO_DATE('03-OCT-18','DD-MON-RR'),NULL);
INSERT INTO exe_subs_pl_relation VALUES (7,7,3,TO_DATE('04-NOV-18','DD-MON-RR'),NULL);
INSERT INTO exe_subs_pl_relation VALUES (8,8,4,TO_DATE('04-SEP-18','DD-MON-RR'),NULL);
INSERT INTO exe_subs_pl_relation VALUES (9,9,1,TO_DATE('05-DEC-18','DD-MON-RR'),NULL);
INSERT INTO exe_subs_pl_relation VALUES (10,10,2,TO_DATE('06-DEC-18','DD-MON-RR'),NULL);
-- INSERTING INTO EXE_BILLING
INSERT INTO exe_billing VALUES (1,TO_DATE('15-JUL-22 12.31.58','DD-MON-RR'),10,6,1,1);
INSERT INTO exe_billing VALUES (2,TO_DATE('08-OCT-22 12.31.58','DD-MON-RR'),30,29,3,3);
INSERT INTO exe_billing VALUES (3,TO_DATE('02-AUG-22 12.31.58','DD-MON-RR'),10,9,5,5);
INSERT INTO exe_billing VALUES (4,TO_DATE('09-SEP-22 12.31.58','DD-MON-RR'),20,18,6,6);
INSERT INTO exe_billing VALUES (5,TO_DATE('02-NOV-22 12.31.58','DD-MON-RR'),30,27,7,7);
INSERT INTO exe_billing VALUES (6,TO_DATE('24-MAR-22 12.31.58','DD-MON-RR'),40,13,8,8);
INSERT INTO exe_billing VALUES (7,TO_DATE('15-JAN-23 12.31.58','DD-MON-RR'),10,6,9,9);
INSERT INTO exe_billing VALUES (8,TO_DATE('15-NOV-22 12.31.58','DD-MON-RR'),20,14,6,10);
--  DDL for Sequence BILL_SEQ
CREATE SEQUENCE bill_seq MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 NOCACHE NOORDER CYCLE;
