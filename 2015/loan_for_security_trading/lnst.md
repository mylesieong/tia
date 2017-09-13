# LNST: Loan for Security Trading

Security trading is a technique to provide the integrity and security of online stock trading. This loan type (161-164) is a new loan product for customer's security trading purpose.

Programs are divided into 2 parts: 
1. Monthly extraction (LNSTCL) that prepare master file for fee charge
2. Daily posting program (LNSTDAILY) 

## Part 1 (LNSTCL) structure
{
    cl: ZNOTELIB/LNSTCL NEW
        ZOPRLIB/QCLSRC(OPRMNU) MOD //operation menu E17
    rpg:ZNOTELIB/LNSTEXTC NEW
        ZNOTELIB/LNSTCTR NEW
        ZNOTELIB/LNSTTXUPD NEW 
        ZNOTELIB/LNSTTXDLT NEW
    pf: LNSTPF NEW
        LNSTPARM NEW
        LNSTTRAN NEW
    sql:ZNOTELIB/QLNSTSRC(LNSTSQL) NEW
}

## Part 2 (LNSTDAILY) structure
{
    cl: ZNOTELIB/LNSTDAILY NEW // call by ZOPRLIB/OPRMNU B15->ZNOTELIB/AUTCAPSRC(GLNAUTOPAY))
    rpg:ZNOTELIB/LNSTMNR NEW
        ZNOTELIB/LNSTPST NEW
        ZNOTELIB/LNSTGLLOG NEW 
        IMODULE/JFMTGLR REF
    sql:ZNOTELIB/QLNSTSRC(LNSTSMSSQL) NEW
    dta:I700BCM/IMMSBTH NEW
        LNSTCCY NEW
        LNSTDBGLAC NEW
        LNSTCRGLAC NEW
}

