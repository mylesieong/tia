1.00 130909 /*--------------------------------------------------------------*/              
2.00 130909 /*       AUTHOR        : ERIC WONG(BG24)                        */              
3.00 150227 /*       CHANGED DATE  : 27/02/2015                             */              
4.00 150227 /*       REFFRENCE     : CHG-031-15                             */              
5.00 150227 /*       REASON        : GENERATE THE EXCHANGE RATE REPORT      */              
6.00 150227 /*                       BY SCHEDULE                            */              
7.00 150227 /*       REMARK        : FUNCTION 'S'- BY SCHEDULE              */              
8.00 150227 /*                                'U'- BY USER PRINT FUNCTION   */              
9.00 150304 /*                           DATE '0'- GET THE LASTEST          */              
10.00 150305 /*                           TIME '0'- IF DATE = 0,TIME MUST 0  */              
11.00 150304 /*--------------------------------------------------------------*/              
12.00 150304 /*--------------------------------------------------------------*/              
13.00 150304 /*       AUTHOR        : ALBERT AU(BG09)                        */              
14.00 150304 /*       CHANGED DATE  : 02/03/2015                             */              
15.00 150304 /*       REFFRENCE     : CHG-031-15                             */              
16.00 150304 /*       REASON        : GENERATE THE EXCHANGE RATE REPORT      */              
17.00 150304 /*                       BY SCHEDULE                            */              
18.00 150304 /*       REMARK        :                                        */              
19.00 150304 /*                                                              */              
20.00 150304 /*--------------------------------------------------------------*/              
21.00 160727 /*       AUTHOR        : Myles Ieong (BI77)                     */              
22.00 160727 /*       CHANGED DATE  : 27/07/2016                             */              
23.00 160922 /*       REFFRENCE     : CHG-250-16 (D6250)                     */              
24.00 160923 /*       REASON        : Call with customer groups              */              
25.00 160727 /*--------------------------------------------------------------*/              
26.00 160922 /*D6250      PGM        PARM(&FUNCTION &DATE &TIME)                           */
27.00 160922 /*D6250*/    PGM        PARM(&FUNCTION &DATE &TIME &GRP)                        
28.00 160923              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('I700BCM')       
29.00 150211              DCL        VAR(&ICBS) TYPE(*CHAR) LEN(10) VALUE('ICBSBCMDB1')      
30.00 150211              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
31.00 160922 /*D6250      DCL        VAR(&ZCHEXAPP) TYPE(*CHAR) LEN(10) VALUE('ZCHEXAPP')  */
32.00 150304              DCL        VAR(&BACKLIB) TYPE(*CHAR) LEN(10) VALUE('ZBACKUP')      
33.00 150304                                                                                 
34.00 150211              DCL        VAR(&RMVWRK) TYPE(*CHAR) LEN(1) VALUE('Y')              
35.00 150211              DCL        VAR(&RMVICBS) TYPE(*CHAR) LEN(1) VALUE('Y')             
36.00 150211              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')          
37.00 160922 /*D6250      DCL        VAR(&RMVCHEXAPP) TYPE(*CHAR) LEN(1) VALUE('Y')        */
38.00 150304              DCL        VAR(&RMVBACK)    TYPE(*CHAR) LEN(1) VALUE('Y')          
39.00 150227                                                                                 
40.00 150304              DCL        VAR(&DATTIME) TYPE(*CHAR) LEN(20)                       
41.00 150227              DCL        VAR(&DATE) TYPE(*DEC) LEN(8)                            
42.00 150227              DCL        VAR(&TIME) TYPE(*DEC) LEN(6)                            
43.00 150227              DCL        VAR(&FUNCTION) TYPE(*CHAR) LEN(1)                       
44.00 150227              DCL        VAR(&USER) TYPE(*CHAR) LEN(10)                          
45.00 150227              DCL        VAR(&IND) TYPE(*CHAR) LEN(1) VALUE('N')                 
46.00 160922 /*D6250*/    DCL        VAR(&GRP) TYPE(*CHAR) LEN(6)                            
47.00 150304                                                                                 
48.00 160923              DCL        VAR(&BKLIB) TYPE(*CHAR) LEN(10)  VALUE('I700BCM')       
49.00 150304              DCL        VAR(&BKFILE) TYPE(*CHAR) LEN(10) VALUE('CRTERPTP')      
50.00 160923              DCL        VAR(&PBMEM) TYPE(*CHAR) LEN(10)  VALUE('*ALL')          
51.00 150304              DCL        VAR(&PBTYP) TYPE(*CHAR) LEN(1)   VALUE('A')             
52.00 150304              DCL        VAR(&PNDATE) TYPE(*DEC)  LEN(8 0) VALUE(0)              
53.00 150304              DCL        VAR(&PMEMVAR) TYPE(*CHAR) LEN(10)  VALUE(*BLANK)        
54.00 150304              DCL        VAR(&PSTATUS) TYPE(*CHAR) LEN(1)   VALUE(' ')           
55.00 150304                                                                                 
56.00 130909 /* ADD LIBRARIES */                                                             
57.00 131108                                                                                 
58.00 150211              ADDLIBLE   LIB(&WRKLIB)                                            
59.00 150211              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRK) +               
60.00 150211                           VALUE('N'))                                           
61.00 150211                                                                                 
62.00 150211              ADDLIBLE   LIB(&ICBS)                                              
63.00 150211              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVICBS) +              
64.00 150211                           VALUE('N'))                                           
65.00 150211                                                                                 
66.00 150211              ADDLIBLE   LIB(&IMODULE) POSITION(*LAST)                           
67.00 150211              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) +           
68.00 150211                           VALUE('N'))                                           
69.00 150211                                                                                 
70.00 160922 /*D6250      ADDLIBLE   LIB(&ZCHEXAPP) POSITION(*LAST)                       */ 
71.00 160922 /*D6250      MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVCHEXAPP) +           
72.00 160727                           VALUE('N'))                                        */ 
73.00 150304                                                                                 
74.00 150304              ADDLIBLE   LIB(&BACKLIB) POSITION(*LAST)                           
75.00 150304              MONMSG MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVBACK) VALUE('N'))        
76.00 150304                                                                                 
77.00 150227                                                                                 
78.00 150227              RTVJOBA    USER(&USER)                                             
79.00 150227              CLRPFM     FILE(&WRKLIB/CRTERPTP)                                  
80.00 150304 /* BY SCHEDULE */                                                               
81.00 150227              IF         COND(&FUNCTION *EQ 'S') THEN(DO)                        
82.00 150316              OVRPRTF    FILE(QPQUPRFIL) OUTQ(RPTLIB/MISCOUQMIG) +               
83.00 150316                           SAVE(*YES) USRDTA(CRTERPTQ)                           
84.00 150305              IF         COND(&DATE *EQ 0 *AND &TIME *EQ 0) THEN(DO)             
85.00 150304              RTVJOBA    DATETIME(&DATTIME)                                      
86.00 150304              CHGVAR     VAR(&DATE) VALUE(%SST(&DATTIME 1 8))                    
87.00 150304              CHGVAR     VAR(&TIME) VALUE(%SST(&DATTIME 9 6))                    
88.00 150305              ENDDO                                                              
89.00 160922 /*D6250      CALL       PGM(&WRKLIB/CRTERPT) PARM(&DATE &TIME)               */ 
90.00 160923 /*D6250*/    CHGVAR     VAR(&GRP) VALUE('*ALL  ')                               
91.00 160922 /*D6250*/    CALL       PGM(&WRKLIB/CRTERPT) PARM(&DATE &TIME &GRP)             
92.00 150227              RUNQRY     QRY(&WRKLIB/CRTERPTQ)                                   
93.00 150304              CALL       PGM(&BACKLIB/BKIHFILE) PARM(&BKLIB  &BKFILE  +          
94.00 150304                         &PBMEM &PBTYP &PNDATE &PMEMVAR)                         
95.00 150227              DLTOVR     FILE(QPQUPRFIL)                                         
96.00 150227              ENDDO                                                              
97.00 150304 /* BY USER PRINT */                                                             
98.00 150227              IF         COND(&FUNCTION *EQ 'U') THEN(DO)                        
99.00 150227              CHKOBJ     OBJ(&WRKLIB/CRTERPTP) OBJTYPE(*FILE) MBR(&USER)         
100.00 150227              MONMSG     MSGID(CPF9815) EXEC(CHGVAR VAR(&IND) VALUE('Y'))        
101.00 150227              IF         COND(&IND *EQ 'Y') THEN(DO)                             
102.00 150304 /* CHANGE MAXIMUM MEMBERS TO NOMAX */                                           
103.00 150227              CHGPF      FILE(&WRKLIB/CRTERPTP) MAXMBRS(*NOMAX)                  
104.00 150227              ADDPFM     FILE(&WRKLIB/CRTERPTP) MBR(&USER)                       
105.00 150227              ENDDO                                                              
106.00 150227              OVRDBF     FILE(CRTERPTP) TOFILE(&WRKLIB/CRTERPTP) +               
107.00 150227                           MBR(&USER)                                            
108.00 150310              IF         COND(&DATE *EQ 0 *AND &TIME *EQ 0) THEN(DO)             
109.00 150310              RTVJOBA    DATETIME(&DATTIME)                                      
110.00 150310              CHGVAR     VAR(&DATE) VALUE(%SST(&DATTIME 1 8))                    
111.00 150310              CHGVAR     VAR(&TIME) VALUE(%SST(&DATTIME 9 6))                    
112.00 150310              ENDDO                                                              
113.00 160922 /*D6250      CALL       PGM(&WRKLIB/CRTERPT) PARM(&DATE &TIME)               */ 
114.00 160922 /*D6250*/    CALL       PGM(&WRKLIB/CRTERPT) PARM(&DATE &TIME &GRP)             
115.00 150227              DLTOVR     FILE(CRTERPTP)                                          
116.00 150311    /*        OVRPRTF    FILE(QPQUPRFIL) DEV(*SYSVAL) SAVE(*YES) +               
117.00 150311                           USRDTA(&USER)                             */          
118.00 150304              RUNQRY     QRY(&WRKLIB/CRTERPTQ) +                                 
119.00 150304                           QRYFILE((&WRKLIB/CRTERPTP &USER)) +                   
120.00 150303                                                                                 
121.00 150302              RMVM       FILE(&WRKLIB/CRTERPTP) MBR(&USER)                       
122.00 150303              DLTOVR     FILE(*ALL)                                              
123.00 150227                                                                                 
124.00 150227              ENDDO                                                              
125.00 150227                                                                                 
126.00 150211                                                                                 
127.00 150211 EXIT:       IF         COND(&RMVWRK *EQ 'Y') THEN(RMVLIBLE +                    
128.00 150211                          LIB(&WRKLIB))                                          
129.00 150211             IF         COND(&RMVICBS *EQ 'Y') THEN(RMVLIBLE +                   
130.00 150211                          LIB(&ICBS))                                            
131.00 150211             IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE +                
132.00 150211                          LIB(&IMODULE))                                         
133.00 160922 /*D6250     IF         COND(&RMVCHEXAPP *EQ 'Y') THEN(RMVLIBLE +                
134.00 160727                          LIB(&ZCHEXAPP))                                      */
135.00 150304             IF         COND(&RMVBACK *EQ 'Y') THEN(RMVLIBLE +                   
136.00 150304                          LIB(&BACKLIB))                                         
137.00 150304                                                                                 
138.00 60223              ENDPGM                                                             
