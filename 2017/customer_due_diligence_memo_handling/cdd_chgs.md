# CDD Change

1. The project define new memo/tickler class for AML missing data, and narrow down the memo/tickler scope to only CIF level, which makes much sense that if "missing data" should only happen to a customer instead of an account.  

2. The creation of a memo/tickler now has 2 ways:     
    - manual adding at option 10     
    - weekly scan   

## Add retrun code in FCIUMEMO
{
	src:    i700bcm/qcalertsrc,
	rpg:    fciumemo MOD
    cl:     IPROD/BTRPTCL MOD    *BT report cl 
    query:  IPROD/BTCDDOVR1 NEW  *Output file
            IPROD/BTCDDOVR2 NEW  *Output report (usrdta-BTCDDOVR)
    dtaara: I700BCM/MEOTKRPARM MOD    * CDD Keyword 
    test:   ymyles1/bbtfciu NEW
}

## Weekly Scan CIF process (scan + dispatch + report)
**For the part !!!REVERSE!!! Cancel**
{
    src:    iprod/icinfsrc
    cl:     ICINFCL REF      * General CL
            ICINFPT1 REF
            ICEXTDTA REF     * Part 1 SQL and RPG
            ICINFPT2 MOD
            ICCRTMEMO REF    * Part 2 SQL and RPG
            ICINFPT3 MOD 
            ICMNTDLTAC REF
            ICCIFMIS REF / ICCIFCOM/ ICACCMIS/ ICACCCOM * Part 3 SQL, RPG and Queries.               1   
}

## Add CDD override authority maintenance screen
Involve program: 
    * OPG and Customer Position Maintenance 
    * BCM In-House Application Maintenance  
Logic between:
    * IHAMNT only allow user to change CDD authority through F7 and F8
    * IHAMNT when F6, hidden options about CDD so that no single add can be performed
    * OGCPSC can perform single CDD Auth granting/removing
    * OGCPSC when add single auth, sync to appusrpf, but when delete, no act

### OPG and Customer Position Maintenance 
{
    src:    BCMGPL/QIHAMNT
    rpg:    IHAMNT MOD     *Main maintenance screen
    pf:     APPUSRPF REF   *User auth master file
            PAPPOPT REF    *Option full set
} 

### BCM In-House Application Maintenance  
{
    src:    BCMGPL/QRPGLESRC
    rpg:    OGCPSC MOD
    dsp:    OGCPDSP MOD
    pf:     BCMGPL/OGCPUSRLOG MOD            * log file for both opts
            ZOPGLIB/OGUSRID REF              *for select OPG in (OPG/CUS)
            ZCUSPRO/SECACC REF               *for select CUS in (OPG/CUS)
            I700bcm/SCAPPGRP REF             *not new pf but newly add to rpg
            I700bcm/SCAPPARM REF             *not new pf but newly add to rpg
    #I700bcm/qrpgsrc(scapchk) is using scapparm & scapgrp #
    # and PS1002 is using this to auth #
}


I700BCM/CUSORC(CU0140) (create memo/tickler program) will call I700BCM/QRPGSRC(SCAPCHK) to provide what kind of evident/permission? (SCAPGRP & SCAPPARM)
