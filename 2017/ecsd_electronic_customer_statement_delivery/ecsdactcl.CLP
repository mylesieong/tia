1.00 100805 /************************************************************************/                          
2.00 170328 /* PROGRAM ID   : ECSDACTCL                                             */                          
3.00 170328 /* REFERENCE    : CHG-100-17 (D7100)                                    */                          
4.00 160727 /* AUTHOR       : Myles Ieong                                           */                          
5.00 160727 /* Written Date : BI77PGM                                               */                          
6.00 170328 /* DESCRIPTION  : ECSD Module Program CL                                */                          
7.00 100805 /************************************************************************/                          
8.00 161025              PGM        PARM(&PCHANNEL &PACTCODE &PACTTYPE +                                        
9.00 161025                         &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                         
10.00 161025                         &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                          
11.00 161025                         &PEMTIME &PEMSRUPD &PEMREL +                                                
12.00 161025                         &PICBSSTS &PSTS &PMOMENT )                                                  
13.00 160727                                                                                                     
14.00 170120              DCL        VAR(&PCHANNEL) TYPE(*CHAR) LEN(3)                                           
15.00 170120              DCL        VAR(&PACTCODE) TYPE(*CHAR) LEN(4)                                           
16.00 170120              DCL        VAR(&PACTTYPE) TYPE(*CHAR) LEN(4)                                           
17.00 161020              DCL        VAR(&PEMAPPCODE) TYPE(*CHAR) LEN(2)                                         
18.00 161020              DCL        VAR(&PEMKEY) TYPE(*CHAR) LEN(20)                                            
19.00 161025              DCL        VAR(&PEMCLASS) TYPE(*CHAR) LEN(10)                                          
20.00 161025              DCL        VAR(&PEMTYPE) TYPE(*CHAR) LEN(10)                                           
21.00 161025              DCL        VAR(&PEMSUTYPE) TYPE(*CHAR) LEN(2)                                          
22.00 161020              DCL        VAR(&PEMOP1) TYPE(*CHAR) LEN(1)                                             
23.00 161020              DCL        VAR(&PEMOP2) TYPE(*CHAR) LEN(1)                                             
24.00 161020              DCL        VAR(&PEMOP3) TYPE(*CHAR) LEN(2)                                             
25.00 161020              DCL        VAR(&PEMDATE) TYPE(*DEC) LEN(8 0)                                           
26.00 161020              DCL        VAR(&PEMTIME) TYPE(*DEC) LEN(6 0)                                           
27.00 161020              DCL        VAR(&PEMSRUPD) TYPE(*CHAR) LEN(10)                                          
28.00 161020              DCL        VAR(&PEMREL) TYPE(*CHAR) LEN(10)                                            
29.00 170120              DCL        VAR(&PICBSSTS) TYPE(*CHAR) LEN(1)                                           
30.00 170120              DCL        VAR(&PSTS) TYPE(*CHAR) LEN(10)                                              
31.00 170120              DCL        VAR(&PMOMENT) TYPE(*CHAR) LEN(26)                                           
32.00 161020                                                                                                     
33.00 160825              DCL        VAR(&ZECSDLIB) TYPE(*CHAR) LEN(10) VALUE('ZECSDLIB')                        
34.00 160825              DCL        VAR(&RMVZECSD) TYPE(*CHAR) LEN(1) VALUE('Y')                                
35.00 170328              DCL        VAR(&ZVIPLIB) TYPE(*CHAR) LEN(10) VALUE('ZVIPLIB')                          
36.00 170328              DCL        VAR(&RMVZVIP) TYPE(*CHAR) LEN(1) VALUE('Y')                                 
37.00 170328                                                                                                     
38.00 170328              ADDLIBLE   LIB(&ZECSDLIB)                                                              
39.00 170328              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZECSD) VALUE('N'))                       
40.00 170328              ADDLIBLE   LIB(&ZVIPLIB)                                                               
41.00 170328              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZVIP) VALUE('N'))                        
42.00 160727                                                                                                     
43.00 161025              CALL       PGM(ECSDACT) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                           
44.00 161025                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
45.00 161025                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
46.00 161025                           &PEMTIME &PEMSRUPD &PEMREL +                                              
47.00 161025                           &PICBSSTS &PSTS &PMOMENT )                                                
48.00 160727                                                                                                     
49.00 160825              IF         COND(&RMVZECSD *EQ 'Y') THEN(RMVLIBLE LIB(&ZECSDLIB))                       
50.00 170328              IF         COND(&RMVZVIP *EQ 'Y') THEN(RMVLIBLE LIB(&ZVIPLIB))                         
51.00 160727                                                                                                     
52.00 160727              ENDPGM                                                                                 
