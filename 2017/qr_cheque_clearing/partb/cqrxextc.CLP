1.00 160414 /******************************************************************************/                    
2.00 170906 /* REFERENCE NO. : CHG-0266-17 (D7266)                                        */                    
3.00 160414 /* AUTHOR        : Myles Ieong                                                */                    
4.00 160414 /* USER ID.      : BI77PGM                                                    */                    
5.00 170227 /* DATE WRITTEN  : 27 Feb 2017                                                */                    
6.00 170227 /* DESCRPITION   : Cheque QR code Extraction CLP                              */                    
7.00 160526 /*                                                                            */                    
8.00 160414 /******************************************************************************/                    
9.00 170707          PGM        PARM(&PBRN)                                                                     
10.00 160414                                                                                                     
11.00 170301              DCLF       FILE(CQRXBRN)                                                               
12.00 170707                                                                                                     
13.00 170707              DCL        VAR(&PBRN) TYPE(*DEC) LEN(5 0)                                              
14.00 170301                                                                                                     
15.00 170227              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('ZCHQLIB')                           
16.00 160907              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1) VALUE('Y')                               
17.00 170301              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')                          
18.00 170301              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')                              
19.00 170301                                                                                                     
20.00 160414              ADDLIBLE   LIB(&WRKLIB)                                                                
21.00 160505              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))                      
22.00 170301              ADDLIBLE   LIB(&IMODULE)                                                               
23.00 170301              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N'))                     
24.00 170707   LOOP:                                                                                             
25.00 170707              RCVF                                                                                   
26.00 170707              MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(END))                                       
27.00 170828                                                                                                     
28.00 170707              IF         COND(&CXBBRN *EQ &PBRN) THEN(DO)                                            
29.00 170828                                                                                                     
30.00 170707              CLRPFM     FILE(CQRXCHQ)                                                               
31.00 170712              CPYF       FROMFILE(&WRKLIB/CQRXIN) +                                                  
32.00 170712                           TOFILE(&WRKLIB/CQRXCHQ) FROMMBR(&CXBMBR) +                                
33.00 170712                           MBROPT(*ADD) FROMRCD(2) FMTOPT(*NOCHK)                                    
34.00 170911              MONMSG     MSGID(CPF2968) EXEC(SNDUSRMSG MSG('No Data +                                
35.00 170911                           Imported.') MSGTYPE(*INFO))                                               
36.00 170707              GOTO       CMDLBL(END)                                                                 
37.00 170828                                                                                                     
38.00 170707              ENDDO                                                                                  
39.00 170828                                                                                                     
40.00 170707              GOTO       CMDLBL(LOOP)                                                                
41.00 170707                                                                                                     
42.00 170707   END:                                                                                              
43.00 170301              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))                        
44.00 170301              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))                      
45.00 160823                                                                                                     
46.00 160329              ENDPGM                                                                                 
