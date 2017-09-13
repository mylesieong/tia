1.00 0 /******************************************************************************/
2.00 160622 /* REFERENCE NO. : CHG-0200-16 (D6200)                                        */
3.00 0 /* AUTHOR        : Myles Ieong                                                */
4.00 0 /* USER ID.      : BI77PGM                                                    */
5.00 0 /* DATE WRITTEN  : 21-APR-2016                                                */
6.00 160504 /* DESCRPITION   : 1. Update flag of lnstpf and copy pf records of lnsttran   */
7.00 160504 /*                 2. Process SMS, Fee Posting and GL entry update CL         */
8.00 0 /******************************************************************************/
9.00 0              PGM                                                                
10.00 0                                                                                 
11.00 160720              DCL        VAR(&NOTELIB) TYPE(*CHAR) LEN(10) VALUE('ZNOTELIB')     
12.00 0              DCL        VAR(&SNDLIB) TYPE(*CHAR) LEN(10) VALUE('ZCD')           
13.00 0              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
14.00 0              DCL        VAR(&ZIHD) TYPE(*CHAR) LEN(10) VALUE('ZIHD')            
15.00 160426              DCL        VAR(&ZCSERVICE) TYPE(*CHAR) LEN(10) VALUE('ZCSERVICE')  
16.00 0                                                                                 
17.00 160720              DCL        VAR(&RMVNOTELIB) TYPE(*CHAR) LEN(1) VALUE('Y')          
18.00 0              DCL        VAR(&RMVSNDLIB) TYPE(*CHAR) LEN(1) VALUE('Y')           
19.00 0              DCL        VAR(&RMVIMOD) TYPE(*CHAR) LEN(1) VALUE('Y')             
20.00 0              DCL        VAR(&RMVZIHD) TYPE(*CHAR) LEN(1) VALUE('Y')             
21.00 160426              DCL        VAR(&RMVZCSERV) TYPE(*CHAR) LEN(1) VALUE('Y')           
22.00 0                                                                                 
23.00 160720              DCL        VAR(&LDBFIL) TYPE(*CHAR) LEN(10) VALUE('LNSTDBGLPF')    
24.00 160720              DCL        VAR(&LCRFIL) TYPE(*CHAR) LEN(10) VALUE('LNSTCRGLPF')    
25.00 160720              DCL        VAR(&DBFIL) TYPE(*CHAR) LEN(10) VALUE('DBGLPF')         
26.00 160720              DCL        VAR(&CRFIL) TYPE(*CHAR) LEN(10) VALUE('CRGLPF')         
27.00 160720              DCL        VAR(&NBRLDBFIL) TYPE(*DEC) LEN(10 0) VALUE(0)           
28.00 160720              DCL        VAR(&NBRLCRFIL) TYPE(*DEC) LEN(10 0) VALUE(0)           
29.00 0              DCL        VAR(&GLBATCH) TYPE(*DEC) LEN(5 0)                       
30.00 160720                                                                                 
31.00 160720              DCL        VAR(&REPLY) TYPE(*CHAR) LEN(1)                          
32.00 160720                                                                                 
33.00 160720              MONMSG     MSGID(CPF2104 CPF4174 CPF3142 CPF4520 CPF0864 CPF4174)  
34.00 160720                                                                                 
35.00 160720              DLTOVR     FILE(*ALL)                                              
46.00 160720                                                                                 
47.00 160720              ADDLIBLE   LIB(&NOTELIB)                                           
48.00 160720              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVNOTELIB) VALUE('N')) 
49.00 0              ADDLIBLE   LIB(&SNDLIB)                                            
50.00 0              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVSNDLIB) VALUE('N'))  
51.00 0              ADDLIBLE   LIB(&IMODULE)                                           
52.00 0              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMOD) VALUE('N'))    
53.00 0              ADDLIBLE   LIB(&ZIHD)                                              
54.00 0              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZIHD) VALUE('N'))    
55.00 160426              ADDLIBLE   LIB(&ZCSERVICE)                                         
56.00 160426              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZCSERV) VALUE('N'))  
57.00 160505                                                                                 
60.00 160505              /* preparation of pf and dtaara */                                 
61.00 160720              CLRPFM     FILE(&NOTELIB/&LDBFIL)                                  
62.00 160720              CLRPFM     FILE(&NOTELIB/&LCRFIL)                                  
63.00 160720              RTVDTAARA  DTAARA(&NOTELIB/LNSTCCY) RTNVAR(&GLBATCH)               
64.00 160720              CHGDTAARA  DTAARA(IMMSBTH) VALUE(&GLBATCH)                         
65.00 0                                                                                 
66.00 160505              /* Main operation body:                                         */ 
67.00 160719              /* 1. Call program to update flags on daily base                */ 
68.00 160719              /* 2. Post fee and prepare gl posting working file dbglpf&crglpf*/ 
69.00 160719              /* 3. Call standard gl posting program                          */ 
70.00 160719              /* 4. Write log of gl posting                                   */ 
71.00 160719              /* 5. Call sms sql                                              */ 
72.00 160720              CALL       PGM(&NOTELIB/LNSTMNR)                                   
73.00 160720              CALL       PGM(&NOTELIB/LNSTPST)                                   
74.00 160720              RTVMBRD    FILE(&LDBFIL) NBRCURRCD(&NBRLDBFIL)                     
75.00 160720              RTVMBRD    FILE(&LCRFIL) NBRCURRCD(&NBRLCRFIL)                     
76.00 160720              IF         COND((&NBRLDBFIL *EQ 0) *AND (&NBRLCRFIL *EQ 0)) +      
77.00 160720                           THEN( GOTO CMDLBL(RMVLIB))                            
78.00 160720              OVRDBF     FILE(&DBFIL) TOFILE(&NOTELIB/&LDBFIL)                   
79.00 160720              OVRDBF     FILE(&CRFIL) TOFILE(&NOTELIB/&LCRFIL)                   
80.00 0              CALL       PGM(JFMTGLR)                                            
81.00 160720              DLTOVR     FILE(&DBFIL &CRFIL)                                     
82.00 160720              CALL       PGM(&NOTELIB/LNSTGLLOG)                                 
83.00 160722 /*D6200      RUNSQLSTM  SRCFILE(&NOTELIB/QLNSTSRC) SRCMBR(LNSTSMSSQL) +         
84.00 160722                         COMMIT(*NONE)                                        */ 
85.00 160426                                                                                 
86.00 160505              /* Program PGLEDIT refer to library list instead of coding ICBS*/  
87.00 160505              CALL       PGM(PGLEDIT)                                            
88.00 160720                                                                                 
89.00 160720  RMVLIB:     IF         COND(&RMVNOTELIB *EQ 'Y') THEN(RMVLIBLE LIB(&NOTELIB))  
90.00 0              IF         COND(&RMVSNDLIB *EQ 'Y') THEN(RMVLIBLE LIB(&SNDLIB))    
91.00 0              IF         COND(&RMVIMOD *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))     
92.00 0              IF         COND(&RMVZIHD *EQ 'Y') THEN(RMVLIBLE LIB(&ZIHD))        
93.00 160426              IF         COND(&RMVZCSERV *EQ 'Y') THEN(RMVLIBLE LIB(&ZCSERVICE)) 
94.00 160505                                                                                 
95.00 160720  END:                                                                           
96.00 0              ENDPGM                                                             
