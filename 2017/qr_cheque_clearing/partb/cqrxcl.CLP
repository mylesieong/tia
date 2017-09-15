1.00 160414 /******************************************************************************/                    
2.00 170906 /* REFERENCE NO. : CHG-0266-17 (D7266)                                        */                    
3.00 160414 /* AUTHOR        : Myles Ieong                                                */                    
4.00 160414 /* USER ID.      : BI77PGM                                                    */                    
5.00 170227 /* DATE WRITTEN  : 27 Feb 2017                                                */                    
6.00 170227 /* DESCRPITION   : Cheque QR code Extraction CLP                              */                    
7.00 160526 /*                                                                            */                    
8.00 160414 /******************************************************************************/                    
9.00 170706          PGM        PARM(&PBRN)                                                                     
10.00 170706                                                                                                     
11.00 170706              DCL        VAR(&PBRN) TYPE(*DEC) LEN(5 0)                                              
12.00 170706                                                                                                     
13.00 170227              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('ZCHQLIB')                           
14.00 160907              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1) VALUE('Y')                               
15.00 170301              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')                          
16.00 170301              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')                              
17.00 170301                                                                                                     
18.00 160414              ADDLIBLE   LIB(&WRKLIB)                                                                
19.00 160505              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))                      
20.00 170301              ADDLIBLE   LIB(&IMODULE)                                                               
21.00 170707              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N'))                     
22.00 170707                                                                                                     
23.00 170706              /* Extract records from members of CQRXIN to CQRXCHQ */                                
24.00 170707              CLRPFM     FILE(&WRKLIB/CQRXCHQ)                                                       
25.00 170707              CALL       PGM(CQRXEXTC) PARM(&PBRN)                                                   
26.00 170706                                                                                                     
27.00 170706              /* Extract records from PST00101 to CQRXSYS */                                         
28.00 170707              CLRPFM     FILE(&WRKLIB/CQRXSYS)                                                       
29.00 170707              CALL       PGM(CQRXEXTS) PARM(&PBRN)                                                   
30.00 170301                                                                                                     
31.00 170706              /* Merge info of CQRXCHQ and CQRXSYS into CQRXPF */                                    
32.00 170706              CALL       PGM(&WRKLIB/CQRXEXT) PARM(&PBRN)                                            
33.00 170707  END:                                                                                               
34.00 170301              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))                        
35.00 170301              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))                      
36.00 160823                                                                                                     
37.00 160329              ENDPGM                                                                                 
