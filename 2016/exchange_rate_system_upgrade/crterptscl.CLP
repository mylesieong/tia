1.00 130909 /*--------------------------------------------------------------*/              
2.00 130909 /*       AUTHOR        : ERIC WONG(BG24)                        */              
3.00 150227 /*       CHANGED DATE  : 27/02/2015                             */              
4.00 150227 /*       REFFRENCE     : CHG-031-15                             */              
5.00 150227 /*       REASON        : GENERATE THE EXCHANGE RATE REPORT      */              
6.00 150227 /*                       BY SCHEDULE                            */              
7.00 150304 /*--------------------------------------------------------------*/              
8.00 160922 /*       AUTHOR        : MYLES IEONG (BI77PGM)                  */              
9.00 160922 /*       CHANGED DATE  : 22/09/2016                             */              
10.00 160922 /*       REFFRENCE     : CHG-250-16                             */              
11.00 160922 /*       REASON        : CALL NEW MODULE GGRPRATE WITH GROUPS   */              
12.00 160922 /*--------------------------------------------------------------*/              
13.00 150310              PGM                                                                
14.00 160922              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('I700BCM')       
15.00 150310              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
16.00 150211              DCL        VAR(&RMVWRK) TYPE(*CHAR) LEN(1) VALUE('Y')              
17.00 150310              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')          
18.00 150304                                                                                 
19.00 150310              DCL        VAR(&DATTIME) TYPE(*CHAR) LEN(20)                       
20.00 150310              DCL        VAR(&CRTTIME) TYPE(*CHAR) LEN(6)                        
21.00 150310              DCL        VAR(&START) TYPE(*CHAR) LEN(6)                          
22.00 150310              DCL        VAR(&END) TYPE(*CHAR) LEN(6)                            
23.00 150310              DCL        VAR(&DURATION) TYPE(*CHAR) LEN(6)                       
24.00 150310              DCL        VAR(&DELAY) TYPE(*CHAR) LEN(6)                          
25.00 150310              DCL        VAR(&LOOPTIME) TYPE(*CHAR) LEN(6)                       
26.00 150310              DCL        VAR(&TYPE) TYPE(*CHAR) LEN(2)                           
27.00 150310              DCL        VAR(&STATUS) TYPE(*CHAR) LEN(5) VALUE(' ')              
28.00 150310              DCL        VAR(&READY) TYPE(*CHAR) LEN(5) VALUE('READY')           
29.00 150310              DCL        VAR(&ADDTIMEAF) TYPE(*CHAR) LEN(6)                      
30.00 150310              DCL        VAR(&CVTFLAG) TYPE(*CHAR) LEN(1)                        
31.00 150310                                                                                 
32.00 150310              DCL        VAR(&FUNCTION) TYPE(*CHAR) LEN(1) VALUE('S')            
33.00 150310              DCL        VAR(&DATE) TYPE(*DEC) LEN(8) VALUE(0)                   
34.00 150310              DCL        VAR(&TIME) TYPE(*DEC) LEN(6) VALUE(0)                   
35.00 160923 /*D6250*/    DCL        VAR(&GRP) TYPE(*CHAR) LEN(6) VALUE('      ')            
36.00 130909 /* ADD LIBRARIES */                                                             
37.00 150211              ADDLIBLE   LIB(&WRKLIB)                                            
38.00 150211              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRK) +               
39.00 150211                           VALUE('N'))                                           
40.00 150310                                                                                 
41.00 150310              ADDLIBLE   LIB(&IMODULE) POSITION(*LAST)                           
42.00 150310              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) +           
43.00 150310                           VALUE('N'))                                           
44.00 150211                                                                                 
45.00 150310              RTVDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (1 6)) RTNVAR(&START)         
46.00 150310              RTVDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (8 6)) RTNVAR(&END)           
47.00 150310              RTVDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (15 6)) RTNVAR(&DURATION)     
48.00 150310              RTVDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (22 6)) RTNVAR(&DELAY)        
49.00 150310              RTVDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (35 2)) RTNVAR(&TYPE)         
50.00 150310              RTVJOBA    DATETIME(&DATTIME)                                      
51.00 150310              CHGVAR     VAR(&CRTTIME) VALUE(%SST(&DATTIME 9 6))                 
52.00 150313                                                                                 
53.00 150313                                                                                 
54.00 150313                                                                                 
55.00 150313              CHGDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (29 6)) VALUE('READY')        
56.00 150313                                                                                 
57.00 150310                                                                                 
58.00 150310              RTVDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (38 6)) RTNVAR(&LOOPTIME)     
59.00 150310              IF         COND(&LOOPTIME *EQ ' ') THEN(CHGVAR +                   
60.00 150310                           VAR(&LOOPTIME) VALUE(&START))                         
61.00 150310                                                                                 
62.00 150310  REPEAT:    RTVDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (29 5)) RTNVAR(&STATUS)        
63.00 150310             IF         COND(&STATUS *NE &READY *OR &CRTTIME *GT +               
64.00 150310                          &END) THEN(GOTO CMDLBL(EXIT))                          
65.00 150310                                                                                 
66.00 150310             RTVJOBA    DATETIME(&DATTIME)                                       
67.00 150310             CHGVAR     VAR(&CRTTIME) VALUE(%SST(&DATTIME 9 6))                  
68.00 150310                                                                                 
69.00 150310             IF         COND(&CRTTIME *GE &LOOPTIME) THEN(DO)                    
70.00 150310             RTVJOBA    DATETIME(&DATTIME)                                       
71.00 150310             CHGVAR     VAR(&DATE) VALUE(%SST(&DATTIME 1 8))                     
72.00 150310             CHGVAR     VAR(&TIME) VALUE(&LOOPTIME)                              
73.00 160922 /*D6250     CALL       PGM(&WRKLIB/CRTERPTCL) PARM(&FUNCTION &DATE &TIME)    */ 
74.00 160922 /*D6250*/   CALL       PGM(&WRKLIB/CRTERPTCL) PARM(&FUNCTION &DATE &TIME &GRP)  
75.00 150310             RTVJOBA    DATETIME(&DATTIME)                                       
76.00 150310             CHGVAR     VAR(&CRTTIME) VALUE(%SST(&DATTIME 9 6))                  
77.00 150310             CHGDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (45 6)) VALUE(&CRTTIME)        
78.00 150310             CALL       PGM(IMODULE/DCALCTIM) PARM(&LOOPTIME +                   
79.00 150310                          &DURATION &TYPE &ADDTIMEAF &CVTFLAG)                   
80.00 150310             CHGVAR     VAR(&LOOPTIME) VALUE(&ADDTIMEAF)                         
81.00 150310             CHGDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (38 6)) VALUE(&LOOPTIME)       
82.00 150310             ENDDO                                                               
83.00 150310                                                                                 
84.00 150310             DLYJOB     DLY(&DELAY)                                              
85.00 150310             GOTO       CMDLBL(REPEAT)                                           
86.00 150310                                                                                 
87.00 150211                                                                                 
88.00 150211 EXIT:       IF         COND(&RMVWRK *EQ 'Y') THEN(RMVLIBLE +                    
89.00 150211                          LIB(&WRKLIB))                                          
90.00 150310             IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE +                
91.00 150310                          LIB(&IMODULE))                                         
92.00 150312             CHGDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (29 5)) VALUE('END  ')         
93.00 150313             CHGDTAARA  DTAARA(&WRKLIB/CRTERPTDTA (38 6)) VALUE(' ')             
94.00 60223              ENDPGM                                                             
