1.00 100805 /************************************************************************/                          
2.00 160825 /* PROGRAM ID   : ECSDAPPCL                                             */                          
3.00 170328 /* REFERENCE    : CHG-100-17 (D7100)                                    */                          
4.00 160727 /* AUTHOR       : Myles Ieong                                           */                          
5.00 160727 /* Written Date : BI77PGM                                               */                          
6.00 170328 /* DESCRIPTION  : Electronic Customer Statement Delivery App CL         */                          
7.00 100805 /************************************************************************/                          
8.00 161025              PGM        PARM(&PEMAPPCODE &PEMKEY)                                                   
9.00 160727                                                                                                     
10.00 161025              DCL        VAR(&PEMAPPCODE) TYPE(*CHAR) LEN(2)                                         
11.00 161025              DCL        VAR(&PEMKEY) TYPE(*CHAR) LEN(20)                                            
12.00 161025                                                                                                     
13.00 160825              DCL        VAR(&ZECSDLIB) TYPE(*CHAR) LEN(10) VALUE('ZECSDLIB')                        
14.00 160825              DCL        VAR(&RMVZECSD) TYPE(*CHAR) LEN(1) VALUE('Y')                                
15.00 170116              DCL        VAR(&ZCLNKFIL) TYPE(*CHAR) LEN(10) VALUE('ZCLNKFIL')                        
16.00 170116              DCL        VAR(&RMVZCLNK) TYPE(*CHAR) LEN(1) VALUE('Y')                                
17.00 170120              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')                          
18.00 170120              DCL        VAR(&RMVIMOD) TYPE(*CHAR) LEN(1) VALUE('Y')                                 
19.00 170327                                                                                                     
20.00 170327              DCL        VAR(&USER) TYPE(*CHAR) LEN(10)                                              
21.00 170327              DCL        VAR(&TMOPT) TYPE(*CHAR) LEN(6) VALUE('ECSDAP')                              
22.00 170327              DCL        VAR(&TLEVEL) TYPE(*CHAR) LEN(1) VALUE('0')                                  
23.00 170327              DCL        VAR(&TOPT) TYPE(*CHAR) LEN(2) VALUE('  ')                                   
24.00 170327              DCL        VAR(&BRN) TYPE(*CHAR) LEN(3) VALUE('   ')                                   
25.00 170327              DCL        VAR(&IBRN) TYPE(*CHAR) LEN(3) VALUE('   ')                                  
26.00 170327              DCL        VAR(&BNAME) TYPE(*CHAR) LEN(30) VALUE(' ')                                  
27.00 170327              DCL        VAR(&AUT) TYPE(*CHAR) LEN(1) VALUE('N')                                     
28.00 170327                                                                                                     
29.00 160825              ADDLIBLE   LIB(&ZECSDLIB)                                                              
30.00 160825              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZECSD) VALUE('N'))                       
31.00 170116              ADDLIBLE   LIB(&ZCLNKFIL)                                                              
32.00 170116              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZCLNK) VALUE('N'))                       
33.00 170120              ADDLIBLE   LIB(&IMODULE)                                                               
34.00 170120              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMOD) VALUE('N'))                        
35.00 160727                                                                                                     
36.00 170327              RTVJOBA    USER(&USER)                                                                 
37.00 170327                                                                                                     
38.00 170327              CALL       PGM(CHKAUT) PARM(&USER &TMOPT &TLEVEL &TOPT +                               
39.00 170327                            &BRN &IBRN &BNAME &AUT)                                                  
40.00 170327                                                                                                     
41.00 170327              IF         COND(&AUT *EQ 'N') THEN(DO)                                                 
42.00 170327                         RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                                           
43.00 170327                         SNDPGMMSG  MSG('YOU ARE NOT AUTHORIZED TO PERFORM +                         
44.00 170327                                 THIS FUNCTION') TOPGMQ(*EXT)                                        
45.00 170327                         GOTO CMDLBL(EXIT)                                                           
46.00 170327                         ENDDO                                                                       
47.00 170327                                                                                                     
48.00 161025              CALL       PGM(ECSDAPP) PARM(&PEMAPPCODE &PEMKEY)                                      
49.00 170327  EXIT:                                                                                              
50.00 160825              IF         COND(&RMVZECSD *EQ 'Y') THEN(RMVLIBLE LIB(&ZECSDLIB))                       
51.00 170327              IF         COND(&RMVZCLNK *EQ 'Y') THEN(RMVLIBLE LIB(&ZCLNKFIL))                       
52.00 170327              IF         COND(&RMVIMOD *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))                         
53.00 160727                                                                                                     
54.00 160727              ENDPGM                                                                                 
