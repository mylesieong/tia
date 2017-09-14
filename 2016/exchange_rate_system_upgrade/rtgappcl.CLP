1.00 100805 /************************************************************************/      
2.00 160727 /* PROGRAM ID   : RTGAPPCL                                              */      
3.00 160920 /* REFERENCE    : CHG-250-16 (D6250)                                    */      
4.00 160727 /* AUTHOR       : Myles Ieong                                           */      
5.00 160727 /* Written Date : BI77PGM                                               */      
6.00 160727 /* DESCRIPTION  : Exchange Rate for Customer Group Application CL       */      
7.00 100805 /************************************************************************/      
8.00 160727              PGM                                                                
9.00 160727                                                                                 
10.00 160727              DCL        VAR(&ZCHEXAPP) TYPE(*CHAR) LEN(10) VALUE('ZCHEXAPP')    
11.00 160727              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
12.00 160727              DCL        VAR(&RMVZCHEX) TYPE(*CHAR) LEN(1) VALUE('Y')            
13.00 160727              DCL        VAR(&RMVIMOD) TYPE(*CHAR) LEN(1) VALUE('Y')             
14.00 160727                                                                                 
15.00 160920 /*D6250*/    DCL        VAR(&USER)   TYPE(*CHAR) LEN(10)                        
16.00 160920 /*D6250*/    DCL        VAR(&WMOPT) TYPE(*CHAR) LEN(6)  VALUE('RTGAPP')         
17.00 160920 /*D6250*/    DCL        VAR(&WLEVEL) TYPE(*CHAR) LEN(1) VALUE('0')              
18.00 160920 /*D6250*/    DCL        VAR(&WOPT) TYPE(*CHAR) LEN(2) VALUE('  ')               
19.00 160920 /*D6250*/    DCL        VAR(&WBCMBRN) TYPE(*CHAR) LEN(3)                        
20.00 160920 /*D6250*/    DCL        VAR(&WIHMBRN) TYPE(*CHAR) LEN(3)                        
21.00 160920 /*D6250*/    DCL        VAR(&WBRNNAME) TYPE(*CHAR) LEN(30)                      
22.00 160920 /*D6250*/    DCL        VAR(&RTNCOD) TYPE(*CHAR) LEN(1)                         
23.00 160920                                                                                 
24.00 160727              ADDLIBLE   LIB(&ZCHEXAPP)                                          
25.00 160727              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZCHEX) VALUE('N'))   
26.00 160727              ADDLIBLE   LIB(&IMODULE)                                           
27.00 160727              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMOD) VALUE('N'))    
28.00 160920                                                                                 
29.00 160920 /*D6250*/    RTVJOBA    USER(&USER)                                             
30.00 160920 /*D6250*/    CALL       PGM(BCMGPL/CHKAUT) PARM(&USER &WMOPT +                  
31.00 160920                           &WLEVEL &WOPT &WBCMBRN &WIHMBRN &WBRNNAME +           
32.00 160920                           &RTNCOD)                                              
33.00 160920 /*D6250*/    IF         COND(&RTNCOD *NE 'Y') THEN(DO)                          
34.00 160920 /*D6250*/    SNDPGMMSG  MSG('USER HAS NO AUTHORITY TO  +                        
35.00 160920                           ACCESS')                                              
36.00 160920 /*D6250*/    GOTO       CMDLBL(EXIT)                                            
37.00 160920 /*D6250*/    ENDDO                                                              
38.00 160920                                                                                 
39.00 160727              CALL       PGM(RTGAPP)                                             
40.00 160727                                                                                 
41.00 160920 /*D6250*/ EXIT:                                                                 
42.00 160920              IF         COND(&RMVZCHEX *EQ 'Y') THEN(RMVLIBLE LIB(&ZCHEXAPP))   
43.00 160727              IF         COND(&RMVIMOD *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))     
44.00 160727                                                                                 
45.00 160727              ENDPGM                                                             
