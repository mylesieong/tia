1.00 170814 /*---------------------------------------------------------------------*/                           
2.00 170814 /* REFERENCE NO. : CHG-xxxx-17 (D7xxx)                                 */                           
3.00 170814 /* AUTHOR        : Myles Ieong                                         */                           
4.00 170814 /* USER ID.      : BI77PGM                                             */                           
5.00 170814 /* DATE WRITTEN  : 19 Jun 2017                                         */                           
6.00 170814 /* DESCRPITION   : Cheque Book Order (Extraction & Report) CL          */                           
7.00 170814 /*---------------------------------------------------------------------*/                           
8.00 980219              PGM                                                                                    
9.00 170619                                                                                                     
10.00 170818              DCL        VAR(&TODAY) TYPE(*DEC) LEN(8 0)                                             
11.00 170818              DCL        VAR(&DOFW) TYPE(*CHAR) LEN(4)                                               
12.00 170728              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) +                                         
13.00 170728                           VALUE('IMODULE')                                                          
14.00 170728              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')                              
15.00 170728                                                                                                     
16.00 170728              ADDLIBLE   LIB(&IMODULE)                                                               
17.00 170728              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) +                               
18.00 170728                           VALUE('N'))                                                               
19.00 170728                                                                                                     
20.00 170818              CALL       PGM(DICBSYMD) PARM(&TODAY)                                                  
21.00 170818              CALL       PGM(DDOW1) PARM(&TODAY &DOFW)                                               
22.00 170818              IF         COND(&DOFW *NE '*SAT') THEN(DO)                                             
23.00 170818                                                                                                     
24.00 170728 /* Clear output file */                                                                             
25.00 170619              CLRPFM     FILE(I700BCM/CQNOUT)                                                        
26.00 170619                                                                                                     
27.00 170619 /* Extraction to Output file from TAP033 */                                                         
28.00 170619              CALL       PGM(I700BCM/CQNEXT)                                                         
29.00 990410                                                                                                     
30.00 170619 /* Generate Report base on output file */                                                           
31.00 170619              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(CQNCL)                                    
32.00 170619              RUNQRY     QRY(I700BCM/CQNRPT)                                                         
33.00 980720              DLTOVR     FILE(QPQUPRFIL)                                                             
34.00 170818                                                                                                     
35.00 170818              ENDDO                                                                                  
36.00 170728                                                                                                     
37.00 170728              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE +                                   
38.00 170728                           LIB(&IMODULE))                                                            
39.00 950410                                                                                                     
40.00 961217              ENDPGM                                                                                 
