1.00 30207  /****************************************************************************/                     
2.00 170906  /*   REFERENCE     : CHG-266-17 (D7266)                                     */                     
3.00 170828  /*   USER ID       : BI77PGM                                                */                     
4.00 170828  /*   CHANGED BY    : Myles Ieong                                            */                     
5.00 170626  /*   CHANGED DATE  : 26 JUN 2017                                            */                     
6.00 170828  /*   REASON        : Cheque QR Envelope Number Update CL                    */                     
7.00 170616  /*                                                                          */                     
8.00 151029  /****************************************************************************/                     
9.00 170828              PGM                                                                                    
10.00 170621                                                                                                     
11.00 170710              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('ZCHQLIB')                           
12.00 170626              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1)  VALUE('Y')                              
13.00 170616                                                                                                     
14.00 170626              ADDLIBLE   LIB(&WRKLIB)                                                                
15.00 170626              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))                      
16.00 170718                                                                                                     
17.00 170828              CALL       PGM(&WRKLIB/CQRXENVU)                                                       
18.00 170621                                                                                                     
19.00 170626              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))                        
20.00 170616                                                                                                     
21.00 30205              ENDPGM                                                                                 
