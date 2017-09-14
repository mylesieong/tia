1.00 160824 /*****************************************************************************/ 
2.00 160824 /*  DATE CREATED : 24/08/16                                                  */ 
3.00 160913 /*  REFERENCE    : CHG-0250-16                                               */ 
4.00 160824 /*  PROGRAM NAME : MTFXLOOP                                                  */ 
5.00 160824 /*  AUTHOR       : Myles Ieong                                               */ 
6.00 160824 /*  REASON       : Generates Movement with Loop                              */ 
7.00 160824 /*****************************************************************************/ 
8.00 131210                                                                                 
9.00 50216              PGM                                                                
10.00 160907              DCL        VAR(&ICBSBCMDB0) TYPE(*CHAR) LEN(10) VALUE('ICBSBCMDB0')
11.00 160907              DCL        VAR(&RMVICBS0) TYPE(*CHAR) LEN(1) VALUE('Y')            
12.00 160907              DCL        VAR(&I700CTI) TYPE(*CHAR) LEN(10) VALUE('I700CTI')      
13.00 160907              DCL        VAR(&RMVI700CTI) TYPE(*CHAR) LEN(1) VALUE('Y')          
14.00 160907              DCL        VAR(&ICBSBCMDB1) TYPE(*CHAR) LEN(10) VALUE('ICBSBCMDB1')
15.00 160907              DCL        VAR(&RMVICBS1) TYPE(*CHAR) LEN(1) VALUE('Y')            
16.00 160907              DCL        VAR(&ICBSBCMDB2) TYPE(*CHAR) LEN(10) VALUE('ICBSBCMDB2')
17.00 160907              DCL        VAR(&RMVICBS2) TYPE(*CHAR) LEN(1) VALUE('Y')            
18.00 160907              DCL        VAR(&I700BCM) TYPE(*CHAR) LEN(10) VALUE('I700BCM')      
19.00 160907              DCL        VAR(&RMVI700BCM) TYPE(*CHAR) LEN(1) VALUE('Y')          
20.00 160907              DCL        VAR(&I700FX) TYPE(*CHAR) LEN(10) VALUE('I700FX')        
21.00 160907              DCL        VAR(&RMVI700FX) TYPE(*CHAR) LEN(1) VALUE('Y')           
22.00 160907              DCL        VAR(&I700S218) TYPE(*CHAR) LEN(10) VALUE('I700S218')    
23.00 160907              DCL        VAR(&RMVIS218) TYPE(*CHAR) LEN(1) VALUE('Y')            
24.00 160907              DCL        VAR(&I700BS) TYPE(*CHAR) LEN(10) VALUE('I700BS')        
25.00 160907              DCL        VAR(&RMVI700BS) TYPE(*CHAR) LEN(1) VALUE('Y')           
26.00 160907              DCL        VAR(&ZIHD) TYPE(*CHAR) LEN(10) VALUE('ZIHD')            
27.00 160907              DCL        VAR(&RMVZIHD) TYPE(*CHAR) LEN(1) VALUE('Y')             
28.00 160907              DCL        VAR(&BCMGPL) TYPE(*CHAR) LEN(10) VALUE('BCMGPL')        
29.00 160907              DCL        VAR(&RMVBCMGPL) TYPE(*CHAR) LEN(1) VALUE('Y')           
30.00 160907              DCL        VAR(&I700SMS) TYPE(*CHAR) LEN(10) VALUE('I700SMS')      
31.00 160907              DCL        VAR(&RMVI700SMS) TYPE(*CHAR) LEN(1) VALUE('Y')          
32.00 160907              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
33.00 160907              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')          
34.00 160907                                                                                 
35.00 131127              DCL        VAR(&DATTIME) TYPE(*CHAR) LEN(20)                       
36.00 131218              DCL        VAR(&CRTTIME) TYPE(*CHAR) LEN(6)                        
37.00 131128              DCL        VAR(&START) TYPE(*CHAR) LEN(6)                          
38.00 131128              DCL        VAR(&END) TYPE(*CHAR) LEN(6)                            
39.00 131202              DCL        VAR(&DURATION) TYPE(*CHAR) LEN(6)                       
40.00 131205              DCL        VAR(&DELAY) TYPE(*CHAR) LEN(6)                          
41.00 131205              DCL        VAR(&LOOPTIME) TYPE(*CHAR) LEN(6)                       
42.00 131205              DCL        VAR(&TYPE) TYPE(*CHAR) LEN(2)                           
43.00 131212              DCL        VAR(&NOFLAG) TYPE(*CHAR) LEN(1) VALUE('N')              
44.00 131206              DCL        VAR(&GENFLAG) TYPE(*CHAR) LEN(1)                        
45.00 131203              DCL        VAR(&STATUS) TYPE(*CHAR) LEN(5) VALUE(' ')              
46.00 131205              DCL        VAR(&READY) TYPE(*CHAR) LEN(5) VALUE('READY')           
47.00 160913              DCL        VAR(&MSTATUS) TYPE(*CHAR) LEN(2) VALUE('  ')            
48.00 160913              DCL        VAR(&SS) TYPE(*CHAR) LEN(2) VALUE('SS')                 
49.00 160913              DCL        VAR(&ADDTIMEAF) TYPE(*CHAR) LEN(6)                      
50.00 160913              DCL        VAR(&CVTFLAG) TYPE(*CHAR) LEN(1)                        
51.00 160824                                                                                 
52.00 160907              ADDLIBLE   LIB(&ICBSBCMDB0)                                        
53.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVICBS0) VALUE('N'))   
54.00 160907              ADDLIBLE   LIB(&I700CTI)                                           
55.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVI700CTI) VALUE('N')) 
56.00 160907              ADDLIBLE   LIB(&ICBSBCMDB1)                                        
57.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVICBS1) VALUE('N'))   
58.00 160907              ADDLIBLE   LIB(&ICBSBCMDB2)                                        
59.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVICBS2) VALUE('N'))   
60.00 160907              ADDLIBLE   LIB(&I700BCM)                                           
61.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVI700BCM) VALUE('N')) 
62.00 160907              ADDLIBLE   LIB(&I700FX)                                            
63.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVI700FX) VALUE('N'))  
64.00 160907              ADDLIBLE   LIB(&I700S218)                                          
65.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIS218) VALUE('N'))   
66.00 160907              ADDLIBLE   LIB(&I700BS)                                            
67.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVI700BS) VALUE('N'))  
68.00 160907              ADDLIBLE   LIB(&ZIHD)                                              
69.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZIHD) VALUE('N'))    
70.00 160907              ADDLIBLE   LIB(&BCMGPL)                                            
71.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVBCMGPL) VALUE('N'))  
72.00 160907              ADDLIBLE   LIB(&I700SMS)                                           
73.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVI700SMS) VALUE('N')) 
74.00 160907              ADDLIBLE   LIB(&IMODULE)                                           
75.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N')) 
76.00 160907                                                                                 
77.00 160824              RTVDTAARA  DTAARA(&I700BCM/MTFXLOOP (1 6)) RTNVAR(&START)          
78.00 160824              RTVDTAARA  DTAARA(&I700BCM/MTFXLOOP (8 6)) RTNVAR(&END)            
79.00 160824              RTVDTAARA  DTAARA(&I700BCM/MTFXLOOP (15 6)) RTNVAR(&DURATION)      
80.00 160824              RTVDTAARA  DTAARA(&I700BCM/MTFXLOOP (22 6)) RTNVAR(&DELAY)         
81.00 160824              RTVDTAARA  DTAARA(&I700BCM/MTFXLOOP (35 2)) RTNVAR(&TYPE)          
82.00 131205              RTVJOBA    DATETIME(&DATTIME)                                      
83.00 131218              CHGVAR     VAR(&CRTTIME) VALUE(%SST(&DATTIME 9 6))                 
84.00 131211                                                                                 
85.00 160824              RTVDTAARA  DTAARA(&I700BCM/MTFXLOOP (38 6)) RTNVAR(&LOOPTIME)      
86.00 131211              IF         COND(&LOOPTIME *EQ ' ') THEN(CHGVAR +                   
87.00 131211                           VAR(&LOOPTIME) VALUE(&START))                         
88.00 131205                                                                                 
89.00 160824   REPEAT:    RTVDTAARA  DTAARA(&I700BCM/MTFXLOOP (29 5)) RTNVAR(&STATUS)        
90.00 160913              RTVDTAARA  DTAARA(&I700BCM/MTFXLOOP (35 2)) RTNVAR(&MSTATUS)       
91.00 160913              IF         COND(&STATUS *NE &READY                  +              
92.00 160913                              *OR &CRTTIME *GT &END               +              
93.00 160913                              *OR &MSTATUS *NE &SS                +              
94.00 160913                         ) THEN(GOTO CMDLBL(EXIT))                               
95.00 131205                                                                                 
96.00 131205              RTVJOBA    DATETIME(&DATTIME)                                      
97.00 131218              CHGVAR     VAR(&CRTTIME) VALUE(%SST(&DATTIME 9 6))                 
98.00 131128                                                                                 
99.00 131218              IF         COND(&CRTTIME *GE &LOOPTIME) THEN(DO)                   
100.00 131218                                                                                 
101.00 160824              CALL       PGM(&I700BCM/MTFXCL)         /*Loop Operation*/         
102.00 160824                                                                                 
103.00 160913              CHGDTAARA  DTAARA(&I700BCM/MTFXLOOP (38 6)) VALUE(&LOOPTIME)       
104.00 160906                                                                                 
105.00 160906              CALL       PGM(&IMODULE/DCALCTIM) PARM(&LOOPTIME +                 
106.00 140224                           &DURATION &TYPE &ADDTIMEAF &CVTFLAG)                  
107.00 160906                                                                                 
108.00 131212              CHGVAR     VAR(&LOOPTIME) VALUE(&ADDTIMEAF)                        
109.00 131128                                                                                 
110.00 131128              ENDDO                                                              
111.00 131205              DLYJOB     DLY(&DELAY)                                             
112.00 131205              GOTO       CMDLBL(REPEAT)                                          
113.00 160905                                                                                 
114.00 160905  EXIT:       CHGDTAARA  DTAARA(&I700BCM/MTFXLOOP  (29 5)) VALUE('END  ')        
115.00 131203                                                                                 
116.00 160907              IF         COND(&RMVICBS0 *EQ 'Y') THEN(RMVLIBLE +                 
117.00 160907                           LIB(&ICBSBCMDB0))                                     
118.00 160907              IF         COND(&RMVI700CTI *EQ 'Y') THEN(RMVLIBLE +               
119.00 160907                           LIB(&I700CTI))                                        
120.00 160907              IF         COND(&RMVICBS1 *EQ 'Y') THEN(RMVLIBLE +                 
121.00 160907                           LIB(&ICBSBCMDB1))                                     
122.00 160907              IF         COND(&RMVICBS2 *EQ 'Y') THEN(RMVLIBLE +                 
123.00 160907                           LIB(&ICBSBCMDB2))                                     
124.00 160907              IF         COND(&RMVI700BCM *EQ 'Y') THEN(RMVLIBLE +               
125.00 160907                           LIB(&I700BCM))                                        
126.00 160907              IF         COND(&RMVI700FX *EQ 'Y') THEN(RMVLIBLE +                
127.00 160907                           LIB(&I700FX))                                         
128.00 160907              IF         COND(&RMVIS218 *EQ 'Y') THEN(RMVLIBLE +                 
129.00 160907                           LIB(&I700S218))                                       
130.00 160907              IF         COND(&RMVI700BS *EQ 'Y') THEN(RMVLIBLE +                
131.00 160907                           LIB(&I700BS))                                         
132.00 160907              IF         COND(&RMVZIHD *EQ 'Y') THEN(RMVLIBLE +                  
133.00 160907                           LIB(&ZIHD))                                           
134.00 160907              IF         COND(&RMVBCMGPL *EQ 'Y') THEN(RMVLIBLE +                
135.00 160907                           LIB(&BCMGPL))                                         
136.00 160907              IF         COND(&RMVI700SMS *EQ 'Y') THEN(RMVLIBLE +               
137.00 160907                           LIB(&I700SMS))                                        
138.00 160907              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE +               
139.00 160907                           LIB(&IMODULE))                                        
140.00 131203                                                                                 
141.00 160905              ENDPGM                                                             
