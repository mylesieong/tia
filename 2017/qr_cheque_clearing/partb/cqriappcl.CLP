1.00 60817 /*---------------------------------------------------------------------------*/                     
2.00 170906 /*  REFERENCE    : CHG-266-17                                                */                     
3.00 170906 /*  CHANGED BY   : Myles Ieong                                               */                     
4.00 170421 /*  CHANGED DATE : 21-Apr-2017                                               */                     
5.00 170421 /*  REASON       : Cheque QR Incoming Chq Application CL                     */                     
6.00 60818 /*---------------------------------------------------------------------------*/                     
7.00 170421              PGM                                                                                    
8.00 170421              DCL        VAR(&ZCHQLIB) TYPE(*CHAR) LEN(10) +                                         
9.00 170421                           VALUE('ZCHQLIB')                                                          
10.00 170421              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) +                                         
11.00 170421                           VALUE('IMODULE')                                                          
12.00 60821                                                                                                     
13.00 170421              DCL        VAR(&RMVZCHQLIB) TYPE(*CHAR) LEN(1) VALUE('Y')                              
14.00 170421              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')                              
15.00 140313                                                                                                     
16.00 170421              ADDLIBLE   LIB(&ZCHQLIB)                                                               
17.00 170421              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZCHQLIB) +                               
18.00 170421                           VALUE('N'))                                                               
19.00 170421              ADDLIBLE   LIB(&IMODULE)                                                               
20.00 170421              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) +                               
21.00 170421                           VALUE('N'))                                                               
22.00 140313                                                                                                     
23.00 170421              CALL       PGM(&ZCHQLIB/CQRIAPP)                                                       
24.00 60817                                                                                                     
25.00 170421              IF         COND(&RMVZCHQLIB *EQ 'Y') THEN(RMVLIBLE +                                   
26.00 170421                           LIB(&ZCHQLIB))                                                            
27.00 170421              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE +                                   
28.00 170421                           LIB(&IMODULE))                                                            
29.00 60822                                                                                                     
30.00 170421              ENDPGM                                                                                 
