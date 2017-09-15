1.00 160414 /******************************************************************************/                    
2.00 170906 /* REFERENCE NO. : CHG-0266-17 (D7266)                                        */                    
3.00 160414 /* AUTHOR        : Myles Ieong                                                */                    
4.00 160414 /* USER ID.      : BI77PGM                                                    */                    
5.00 170906 /* DATE WRITTEN  : 06 Sep 2017                                                */                    
6.00 170906 /* DESCRPITION   : Cheque QR Day End Process CLP                              */                    
7.00 160526 /*                                                                            */                    
8.00 160414 /******************************************************************************/                    
9.00 170906          PGM                                                                                        
10.00 170706                                                                                                     
11.00 170227              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('ZCHQLIB')                           
12.00 160907              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1) VALUE('Y')                               
13.00 170301                                                                                                     
14.00 160414              ADDLIBLE   LIB(&WRKLIB)                                                                
15.00 160505              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))                      
16.00 170707                                                                                                     
17.00 170906              /* Update Envelope Number Master File */                                               
18.00 170906              CALL       PGM(&WRKLIB/CQRXENVCL)                                                      
19.00 170906                                                                                                     
20.00 170906              /* Backup CQRXPF and CQRXIN */                                                         
21.00 170906              CPYF       FROMFILE(&WRKLIB/CQRXPF) +                                                  
22.00 170906                           TOFILE(&WRKLIB/CQRXPFBK) MBROPT(*REPLACE) +                               
23.00 170906                           CRTFILE(*YES)                                                             
24.00 170906              CPYF       FROMFILE(&WRKLIB/CQRXIN) +                                                  
25.00 170906                           TOFILE(&WRKLIB/CQRXINBK) FROMMBR(*ALL) +                                  
26.00 170906                           TOMBR(*FROMMBR) MBROPT(*REPLACE) +                                        
27.00 170906                           CRTFILE(*YES)                                                             
28.00 170906                                                                                                     
29.00 170906              /* Clear files */                                                                      
30.00 170906              CLRPFM     FILE(&WRKLIB/CQRXPF)                                                        
31.00 170906              CLRPFM     FILE(&WRKLIB/CQRXIN)                                                        
32.00 170707  END:                                                                                               
33.00 170301              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))                        
34.00 160823                                                                                                     
35.00 160329              ENDPGM                                                                                 
