1.00 100805 /************************************************************************/                          
2.00 161115 /* PROGRAM ID   : ECSDMNUCL                                             */                          
3.00 170328 /* REFERENCE    : CHG-100-17 (D7100)                                    */                          
4.00 160727 /* AUTHOR       : Myles Ieong                                           */                          
5.00 160727 /* Written Date : BI77PGM                                               */                          
6.00 170328 /* DESCRIPTION  : ECSD ICBS Menu Direct Call CLP                        */                          
7.00 100805 /************************************************************************/                          
8.00 161027              PGM                                                                                    
9.00 160727                                                                                                     
10.00 161027              DCL        VAR(&PEMAPPCODE) TYPE(*CHAR) LEN(2) VALUE('  ')                             
11.00 161027              DCL        VAR(&PEMKEY) TYPE(*CHAR) LEN(20) +                                          
12.00 161027                         VALUE('                    ')                                               
13.00 160825              DCL        VAR(&ZECSDLIB) TYPE(*CHAR) LEN(10) VALUE('ZECSDLIB')                        
14.00 160825              DCL        VAR(&RMVZECSD) TYPE(*CHAR) LEN(1) VALUE('Y')                                
15.00 160727                                                                                                     
16.00 160825              ADDLIBLE   LIB(&ZECSDLIB)                                                              
17.00 160825              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZECSD) VALUE('N'))                       
18.00 160727                                                                                                     
19.00 170120              CALL       PGM(ECSDAPPCL) PARM(&PEMAPPCODE &PEMKEY)                                    
20.00 160727                                                                                                     
21.00 160825              IF         COND(&RMVZECSD *EQ 'Y') THEN(RMVLIBLE LIB(&ZECSDLIB))                       
22.00 160727                                                                                                     
23.00 160727              ENDPGM                                                                                 
