1.00 160610 /*-----------------------------------------------------------------*/           
2.00 160610 /*        Program ID.   : GEXCIFGPCL                               */           
3.00 160610 /*        Program Name  : Get group from cif for exchange rate     */           
4.00 160610 /*        Parameter     : incoming - CIF Number (10A)              */           
5.00 160610 /*                                 - Channel (6A)                  */           
6.00 160610 /*                        outgoing - GroupIN (6A)                  */           
7.00 160610 /*                                   Status (1A) 0:SUCCESS 1:ERR   */           
8.00 160610 /*        Author        : Myles Ieong                              */           
9.00 160610 /*        Date written  : 2016-06-10                               */           
10.00 160610 /*                                                                 */           
11.00 160610 /*-----------------------------------------------------------------*/           
12.00 160610              PGM        PARM(&PCIF &PCHN &PGRP &PSTS)                           
13.00 160610                                                                                 
14.00 160610              DCL        VAR(&PCIF) TYPE(*CHAR) LEN(10)                          
15.00 160610              DCL        VAR(&PCHN) TYPE(*CHAR) LEN(6)                           
16.00 160610              DCL        VAR(&PGRP) TYPE(*CHAR) LEN(6)                           
17.00 160610              DCL        VAR(&PSTS) TYPE(*CHAR) LEN(1)                           
18.00 160610                                                                                 
19.00 160610              DCL        VAR(&ZVIPLIB) TYPE(*CHAR) LEN(10) VALUE('ZVIPLIB')      
20.00 160610              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
21.00 160715              DCL        VAR(&ZCSERVICE) TYPE(*CHAR) LEN(10) VALUE('ZCSERVICE')  
22.00 160610              DCL        VAR(&RMVZVIPLIB) TYPE(*CHAR) LEN(1) VALUE('Y')          
23.00 160610              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')          
24.00 160715              DCL        VAR(&RMVZCSERV) TYPE(*CHAR) LEN(1) VALUE('Y')           
25.00 160610                                                                                 
26.00 160610              ADDLIBLE   LIB(&ZVIPLIB)                                           
27.00 160610              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZVIPLIB) VALUE('N')) 
28.00 160610              ADDLIBLE   LIB(&IMODULE)                                           
29.00 160610              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N')) 
30.00 160715              ADDLIBLE   LIB(&ZCSERVICE)                                         
31.00 160715              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZCSERV) VALUE('N'))  
32.00 160610                                                                                 
33.00 160920              CALL       PGM(GEXCIFGRP) PARM(&PCIF &PCHN &PGRP &PSTS)            
34.00 160610                                                                                 
35.00 160610              IF         COND(&RMVZVIPLIB *EQ 'Y') THEN(RMVLIBLE LIB(&ZVIPLIB))  
36.00 160610              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))  
37.00 160715              IF         COND(&RMVZCSERV *EQ 'Y') THEN(RMVLIBLE LIB(&ZCSERVICE)) 
38.00 160610                                                                                 
39.00 160610              ENDPGM                                                             
40.00 160610                                                                                 
