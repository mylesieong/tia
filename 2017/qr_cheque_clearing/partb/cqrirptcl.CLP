1.00 30207  /****************************************************************************/                     
2.00 170906  /*   REFERENCE     : CHG-266-17 (D7266)                                     */                     
3.00 170828  /*   USER ID       : BI77PGM                                                */                     
4.00 170828  /*   CHANGED BY    : Myles Ieong                                            */                     
5.00 170626  /*   CHANGED DATE  : 26 JUN 2017                                            */                     
6.00 170906  /*   REASON        : Cheque QR Print Report CL                              */                     
7.00 170906  /*                                                                          */                     
8.00 170906  /****************************************************************************/                     
9.00 170906              PGM        PARM(&BRN)                                                                  
10.00 170906                                                                                                     
11.00 170906              DCL        VAR(&BRN) TYPE(*DEC) LEN(5 0)                                               
12.00 170906              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('ZCHQLIB')                           
13.00 170906              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1)  VALUE('Y')                              
14.00 170906                                                                                                     
15.00 170906              ADDLIBLE   LIB(&WRKLIB)                                                                
16.00 170906              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))                      
17.00 170906                                                                                                     
18.00 170913  /*D7266*/   CALL       PGM(&WRKLIB/CQRIRPT) PARM(&BRN)                                             
19.00 170906              OVRPRTF    FILE(CQRIRPTF) OUTQ(RPTLIB/MISCOUQMIG)                                      
20.00 170906              CALL       PGM(&WRKLIB/CQRIRPT) PARM(&BRN)                                             
21.00 170621                                                                                                     
22.00 170626              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))                        
23.00 170616                                                                                                     
24.00 30205              ENDPGM                                                                                 
