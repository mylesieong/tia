1.00 160414 /******************************************************************************/
2.00 160804 /* REFERENCE NO. : CHG-0250-16 (D6250)                                        */
3.00 160414 /* AUTHOR        : Myles Ieong                                                */
4.00 160414 /* USER ID.      : BI77PGM                                                    */
5.00 160808 /* DATE WRITTEN  : 08 Aug 2016                                                */
6.00 160808 /* DESCRPITION   : EChannel exchange rate monitoring Application CL           */
7.00 160526 /*                                                                            */
8.00 160414 /******************************************************************************/
9.00 160329          PGM                                                                    
10.00 160414                                                                                 
11.00 160715              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('I700BCM')       
12.00 160414              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
13.00 160414              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1) VALUE('Y')           
14.00 160414              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')          
15.00 160505                                                                                 
16.00 160920 /*D6250*/    DCL        VAR(&USER)   TYPE(*CHAR) LEN(10)                        
17.00 160920 /*D6250*/    DCL        VAR(&WMOPT) TYPE(*CHAR) LEN(6)  VALUE('MTFXAP')         
18.00 160920 /*D6250*/    DCL        VAR(&WLEVEL) TYPE(*CHAR) LEN(1) VALUE('0')              
19.00 160920 /*D6250*/    DCL        VAR(&WOPT) TYPE(*CHAR) LEN(2) VALUE('  ')               
20.00 160920 /*D6250*/    DCL        VAR(&WBCMBRN) TYPE(*CHAR) LEN(3)                        
21.00 160920 /*D6250*/    DCL        VAR(&WIHMBRN) TYPE(*CHAR) LEN(3)                        
22.00 160920 /*D6250*/    DCL        VAR(&WBRNNAME) TYPE(*CHAR) LEN(30)                      
23.00 160920 /*D6250*/    DCL        VAR(&RTNCOD) TYPE(*CHAR) LEN(1)                         
24.00 160920                                                                                 
25.00 160414              ADDLIBLE   LIB(&WRKLIB)                                            
26.00 160505              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))  
27.00 160526              ADDLIBLE   LIB(&IMODULE)                                           
28.00 160526              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N')) 
29.00 160526                                                                                 
30.00 160920 /*D6250*/    RTVJOBA    USER(&USER)                                             
31.00 160920 /*D6250*/    CALL       PGM(BCMGPL/CHKAUT) PARM(&USER &WMOPT +                  
32.00 160920                          &WLEVEL &WOPT &WBCMBRN &WIHMBRN &WBRNNAME +            
33.00 160920                          &RTNCOD)                                               
34.00 160920 /*D6250*/    IF         COND(&RTNCOD *NE 'Y') THEN(DO)                          
35.00 160920 /*D6250*/    SNDPGMMSG  MSG('USER HAS NO AUTHORITY TO  +                        
36.00 160920                           ACCESS')                                              
37.00 160920 /*D6250*/    GOTO       CMDLBL(EXIT)                                            
38.00 160920 /*D6250*/    ENDDO                                                              
39.00 160920                                                                                 
40.00 160808              CALL       PGM(&WRKLIB/MTFXAPP)                                    
41.00 160329                                                                                 
42.00 160920 /*D6250*/ EXIT:                                                                 
43.00 160414              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))    
44.00 160414              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))  
45.00 160329              ENDPGM                                                             
