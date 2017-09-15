1.00 30207  /****************************************************************************/                     
2.00 170906  /*   REFERENCE     : CHG-266-17 (D7266)                                     */                     
3.00 170719  /*   USER ID       : BI77PGM                                                */                     
4.00 170719  /*   CHANGED BY    : Myles Ieong                                            */                     
5.00 170719  /*   CHANGED DATE  : 19 JUL 2017                                            */                     
6.00 170906  /*   REASON        : Cheque QR Incoming Generate QR/NQ AMCM Format          */                     
7.00 170616  /*                                                                          */                     
8.00 151029  /****************************************************************************/                     
9.00 170719              PGM                                                                                    
10.00 170621                                                                                                     
11.00 170710              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('ZCHQLIB')                           
12.00 170626              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1)  VALUE('Y')                              
13.00 170616                                                                                                     
14.00 170626              ADDLIBLE   LIB(&WRKLIB)                                                                
15.00 170626              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))                      
16.00 170718                                                                                                     
17.00 170906              /* Generate 2 files */                                                                 
18.00 170719              CLRPFM     FILE(&WRKLIB/CQRIGENQ)                                                      
19.00 170719              CLRPFM     FILE(&WRKLIB/CQRIGENN)                                                      
20.00 170719              CALL       PGM(&WRKLIB/CQRIGEN)                                                        
21.00 170825                                                                                                     
22.00 170825              /* Copy OK flag file */                                                                
23.00 170825              CPYF       FROMFILE(&WRKLIB/OKFLAG) TOFILE(&WRKLIB/OK) +                               
24.00 170825                           FROMMBR(OKFLAG) TOMBR(OK) MBROPT(*REPLACE) +                              
25.00 170825                           CRTFILE(*YES)                                                             
26.00 170621                                                                                                     
27.00 170626              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))                        
28.00 170616                                                                                                     
29.00 30205              ENDPGM                                                                                 
