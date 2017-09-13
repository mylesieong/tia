1.00 41125 /**********************************************************************/                            
2.00 90625 /*   Program Name  : PAMLNCIF                                         */                            
3.00 90625 /*   Function      : PRINT AML REPORT FOR NON-ACCOUNT HOLDER          */                            
4.00 41125 /*                                                                    */                            
5.00 90625 /*   Reference No. : CHG-207-09 (C9207)                               */                            
6.00 50304 /*   Author        : ANTHONY                                          */                            
7.00 50304 /*   User ID       : B422PGM                                          */                            
8.00 90625 /*   Date written  : 23 JUN 2009                                      */                            
9.00 50304 /**********************************************************************/                            
10.00 101007 /* REFERENCE    : CHG-261-10 (D0261)                                          */                    
11.00 100929 /* CHANGED BY   : ANTHONY (B422)                                              */                    
12.00 100929 /* CHANGED DATE : 29 SEP 2010                                                 */                    
13.00 100929 /* REASON       : ADD LIBRARY ZCLNKFIL TO LIBRRAY FOR CHECKING ACCOUNT ACCOUNT*/                    
14.00 100929 /******************************************************************************/                    
15.00 110921 /* REFERENCE    : CHG-284-11 (D1284)                                          */                    
16.00 110921 /* CHANGED BY   : ANTHONY (B422)                                              */                    
17.00 110921 /* CHANGED DATE : 21 SEP 2011                                                 */                    
18.00 110921 /* REASON       : Add new AML reports with the following criteria             */                    
19.00 110921 /*                - Txn amount over 250,000 MOP equi.                         */                    
20.00 110921 /*                - Money exchange, Cash Deposit and Cheque encashment for    */                    
21.00 110921 /*                  non-BCM customer                                          */                    
22.00 110921 /*                - Reports are generated in daily, monthly and quaterly      */                    
23.00 110921 /*                  basic                                                     */                    
24.00 110921 /******************************************************************************/                    
25.00 120515 /* REFERENCE    : CHG-143-12 (D2143)                                          */                    
26.00 120515 /* CHANGED BY   : KARL (BA55)                                                 */                    
27.00 120515 /* CHANGED DATE : 15 MAY 2012                                                 */                    
28.00 120515 /* REASON       : Add new AML reports with the following criteria             */                    
29.00 120515 /*                - Txn amount over 120,000 MOP equi.                         */                    
30.00 120515 /*                - Money exchange, Cash Deposit and Cheque encashment for    */                    
31.00 120515 /*                  non-BCM customer                                          */                    
32.00 120515 /*                - Reports are generated in daily, monthly and quaterly      */                    
33.00 120515 /*                  basic                                                     */                    
34.00 120515 /******************************************************************************/                    
35.00 160721 /* REF. NUMBER : CHG-0219-16 (D6219)                            */                                  
36.00 160721 /* USER ID     : BG09PGM                                        */                                  
37.00 160721 /* USER NAME   : ALBERT AU                                      */                                  
38.00 160721 /* DATE        : 21 JUL 2016                                    */                                  
39.00 160721 /* DESC.       : OUTWARD REMITTANCE (ZOTRMAPP)                  */                                  
40.00 160721 /* ------------------------------------------------------------ */                                  
41.00 160825 /* REF. NUMBER : CHG-0262-16 (D6262)                            */                                  
42.00 160825 /* USER ID     : BI77PGM                                        */                                  
43.00 160825 /* USER NAME   : Myles Ieong                                    */                                  
44.00 160825 /* DATE        : 04 Aug 2016                                    */                                  
45.00 160825 /* DESC.       : AML report parameter changing and revoking     */                                  
46.00 160825 /* ------------------------------------------------------------ */                                  
47.00 41125              PGM                                                                                    
48.00 41125                                                                                                     
49.00 41228              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('IPROD')                             
50.00 41222              DCL        VAR(&MODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')                           
51.00 50315              DCL        VAR(&OPGLIB) TYPE(*CHAR) LEN(10) VALUE('ZOPGLIB')                           
52.00 101007 /* D0261 */  DCL        VAR(&CRLIB) TYPE(*CHAR) LEN(10) VALUE('UCLNKFIL')                           
53.00 160721 /*D6219*/    DCL        VAR(&ZOTRMAPP) TYPE(*CHAR) LEN(10) +                                        
54.00 160721 /*D6219*/                 VALUE('ZOTRMAPP')                                                         
55.00 41125                                                                                                     
56.00 41222     /* Declare working variables */                                                                 
57.00 41211              DCL        VAR(&WRKLIBADD) TYPE(*CHAR) LEN(1) VALUE('Y')                               
58.00 41211              DCL        VAR(&MODULEADD) TYPE(*CHAR) LEN(1) VALUE('Y')                               
59.00 50315              DCL        VAR(&OPGLIBADD) TYPE(*CHAR) LEN(1) VALUE('Y')                               
60.00 101007 /* D0261 */  DCL        VAR(&CRLIBADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                
61.00 160721 /*D6219*/    DCL        VAR(&RMVZOTRMAP) TYPE(*CHAR) LEN(1) VALUE('Y')                              
62.00 41222                                                                                                     
63.00 90625              DCLF       FILE(TAP001)                                                                
64.00 41202                                                                                                     
65.00 41222     /* Add library */                                                                               
66.00 50315              ADDLIBLE   LIB(&WRKLIB)                                                                
67.00 41222              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&WRKLIBADD) VALUE('N'))                      
68.00 41211              ADDLIBLE   LIB(&MODULE) POSITION(*LAST)                                                
69.00 41222              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&MODULEADD) VALUE('N'))                      
70.00 50315              ADDLIBLE   LIB(&OPGLIB) POSITION(*LAST)                                                
71.00 50315              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&OPGLIBADD) VALUE('N'))                      
72.00 101007 /* D0261 */  ADDLIBLE   LIB(&CRLIB) POSITION(*LAST)                                                 
73.00 101007 /* D0261 */  MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&CRLIBADD) VALUE('N'))                       
74.00 160721 /*D6219*/      ADDLIBLE   LIB(&ZOTRMAPP)                                                            
75.00 160721 /*D6219*/      MONMSG MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZOTRMAP) VALUE('N'))                       
76.00 160721 /*D6219*/                                                                                           
77.00 41222                                                                                                     
78.00 90625  /* CHECK WEEKLY AND MONTHLY STATUS */                                                              
79.00 90625  READFL:     RCVF                                                                                   
80.00 90625              MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(EXIT))                                      
81.00 90625              IF         COND(&DSBK *NE 1) THEN(GOTO CMDLBL(READFL))                                 
82.00 90625                                                                                                     
83.00 90625  /* DAILY REPORT */                                                                                 
84.00 90625              RUNQRY     QRY(&WRKLIB/AMLNOCIF)                                                       
85.00 90625              CLRPFM     FILE(&WRKLIB/AMLNCIFR)                                                      
86.00 90625              CALL       PGM(&WRKLIB/GAMLNCIFR)                                                      
87.00 90625              OVRPRTF    FILE(AMLNCIFP1) OUTQ(RPTLIB/MISCOUQMIG)                                     
88.00 90625              CALL       PGM(&WRKLIB/PAMLNCIFP1)                                                     
89.00 90625              DLTOVR     FILE(AMLNCIFP1)                                                             
90.00 110922 /* D1284 */  OVRPRTF    FILE(AMLNC25P1) OUTQ(RPTLIB/MISCOUQMIG)                                     
91.00 110922 /* D1284 */  CALL       PGM(&WRKLIB/PAMLNC25P1)                                                     
92.00 110922 /* D1284 */  DLTOVR     FILE(AMLNC25P1)                                                             
93.00 120607 /* D2143 */  CLRPFM     FILE(&WRKLIB/AMLNCIFDBK)                                                    
94.00 120607 /* D2143 */  CLRPFM     FILE(&WRKLIB/AMLNCIFS)                                                      
95.00 120607 /* D2143 */  RUNSQLSTM  SRCFILE(&WRKLIB/QAMLSRC) SRCMBR(GAMLNC12D) +                                
96.00 120607                           COMMIT(*NONE)                                                             
97.00 120515 /* D2143 */  OVRPRTF    FILE(AMLNC12P1) OUTQ(RPTLIB/MISCOUQMIG)                                     
98.00 120515 /* D2143 */  CALL       PGM(&WRKLIB/PAMLNC12P1)                                                     
99.00 120515 /* D2143 */  DLTOVR     FILE(AMLNC12P1)                                                             
100.00 50310                                                                                                     
101.00 90625  /* MONTHLY REPORT */                                                                               
102.00 90625              CPYF       FROMFILE(&WRKLIB/AMLNCIFR) +                                                
103.00 90625                           TOFILE(&WRKLIB/AMLNCIFM) MBROPT(*ADD)                                     
104.00 120625              IF         COND(&DSMOFG *EQ 'F') THEN(DO)                                              
105.00 90626              CLRPFM     FILE(&WRKLIB/AMLNCIFMBK)                                                    
106.00 90626              CLRPFM     FILE(&WRKLIB/AMLNCIFS)                                                      
107.00 90626              RUNSQLSTM  SRCFILE(&WRKLIB/QAMLSRC) SRCMBR(GAMLNCIFM) +                                
108.00 90626                           COMMIT(*NONE)                                                             
109.00 90626              OVRPRTF    FILE(AMLNCIFP2) OUTQ(RPTLIB/MISCOUQMIG)                                     
110.00 90626              CALL       PGM(&WRKLIB/PAMLNCIFP2)                                                     
111.00 90626              DLTOVR     FILE(AMLNCIFP2)                                                             
112.00 110922 /* D1284 */  CLRPFM     FILE(&WRKLIB/AMLNCIFMBK)                                                    
113.00 110922 /* D1284 */  CLRPFM     FILE(&WRKLIB/AMLNCIFS)                                                      
114.00 110922 /* D1284 */  RUNSQLSTM  SRCFILE(&WRKLIB/QAMLSRC) SRCMBR(GAMLNC25M) +                                
115.00 110922                           COMMIT(*NONE)                                                             
116.00 110922 /* D1284 */  OVRPRTF    FILE(AMLNC25P2) OUTQ(RPTLIB/MISCOUQMIG)                                     
117.00 110922 /* D1284 */  CALL       PGM(&WRKLIB/PAMLNC25P2)                                                     
118.00 110922 /* D1284 */  DLTOVR     FILE(AMLNC25P2)                                                             
119.00 120515 /* D2143 */  CLRPFM     FILE(&WRKLIB/AMLNCIFMBK)                                                    
120.00 120515 /* D2143 */  CLRPFM     FILE(&WRKLIB/AMLNCIFS)                                                      
121.00 120515 /* D2143 */  RUNSQLSTM  SRCFILE(&WRKLIB/QAMLSRC) SRCMBR(GAMLNC12M) +                                
122.00 120515                           COMMIT(*NONE)                                                             
123.00 120515 /* D2143 */  OVRPRTF    FILE(AMLNC12P2) OUTQ(RPTLIB/MISCOUQMIG)                                     
124.00 120515 /* D2143 */  CALL       PGM(&WRKLIB/PAMLNC12P2)                                                     
125.00 120515 /* D2143 */  DLTOVR     FILE(AMLNC12P2)                                                             
126.00 90625              CPYF       FROMFILE(&WRKLIB/AMLNCIFM) +                                                
127.00 90625                           TOFILE(&WRKLIB/AMLNCIFMBK) MBROPT(*REPLACE)                               
128.00 90703              CLRPFM     FILE(&WRKLIB/AMLNCIFM)                                                      
129.00 90625              ENDDO                                                                                  
130.00 90625                                                                                                     
131.00 90626  /* QUARTERLY REPORT */                                                                             
132.00 90626              CPYF       FROMFILE(&WRKLIB/AMLNCIFR) +                                                
133.00 90626                           TOFILE(&WRKLIB/AMLNCIFQ) MBROPT(*ADD)                                     
134.00 120625              IF         COND(&DSMOFG *EQ 'F') THEN(DO)                                              
135.00 90626              CALL       PGM(&WRKLIB/CAMLQ) PARM(&DSCDT)                                             
136.00 120625              IF         COND(&DSCDT *EQ 999999999) THEN(DO)                                         
137.00 90626              CLRPFM     FILE(&WRKLIB/AMLNCIFQBK)                                                    
138.00 90626              CLRPFM     FILE(&WRKLIB/AMLNCIFS)                                                      
139.00 90626              RUNSQLSTM  SRCFILE(&WRKLIB/QAMLSRC) SRCMBR(GAMLNCIFQ) +                                
140.00 90626                           COMMIT(*NONE)                                                             
141.00 90626              OVRPRTF    FILE(AMLNCIFP3) OUTQ(RPTLIB/MISCOUQMIG)                                     
142.00 160825 /* D6262     CALL       PGM(&WRKLIB/PAMLNCIFP3)                        */                           
143.00 90626              DLTOVR     FILE(AMLNCIFP3)                                                             
144.00 110922 /* D1284 */  CLRPFM     FILE(&WRKLIB/AMLNCIFQBK)                                                    
145.00 110922 /* D1284 */  CLRPFM     FILE(&WRKLIB/AMLNCIFS)                                                      
146.00 110922 /* D1284 */  RUNSQLSTM  SRCFILE(&WRKLIB/QAMLSRC) SRCMBR(GAMLNC25Q) +                                
147.00 110922                           COMMIT(*NONE)                                                             
148.00 110922 /* D1284 */  OVRPRTF    FILE(AMLNC25P3) OUTQ(RPTLIB/MISCOUQMIG)                                     
149.00 160825 /* D6262  D1284  CALL       PGM(&WRKLIB/PAMLNC25P3)                    */                           
150.00 110922 /* D1284 */  DLTOVR     FILE(AMLNC25P3)                                                             
151.00 120515 /* D2143 */  CLRPFM     FILE(&WRKLIB/AMLNCIFQBK)                                                    
152.00 120515 /* D2143 */  CLRPFM     FILE(&WRKLIB/AMLNCIFS)                                                      
153.00 120515 /* D2143 */  RUNSQLSTM  SRCFILE(&WRKLIB/QAMLSRC) SRCMBR(GAMLNC12Q) +                                
154.00 120515                           COMMIT(*NONE)                                                             
155.00 120515 /* D2143 */  OVRPRTF    FILE(AMLNC12P3) OUTQ(RPTLIB/MISCOUQMIG)                                     
156.00 160825 /* D6262  D2143  CALL       PGM(&WRKLIB/PAMLNC12P3)                    */                           
157.00 120515 /* D2143 */  DLTOVR     FILE(AMLNC12P3)                                                             
158.00 90626              CPYF       FROMFILE(&WRKLIB/AMLNCIFQ) +                                                
159.00 90626                           TOFILE(&WRKLIB/AMLNCIFQBK) MBROPT(*REPLACE)                               
160.00 90703              CLRPFM     FILE(&WRKLIB/AMLNCIFQ)                                                      
161.00 90626              ENDDO                                                                                  
162.00 90626              ENDDO                                                                                  
163.00 90626                                                                                                     
164.00 90625                                                                                                     
165.00 41222  EXIT:                                                                                              
166.00 41222     /* Remove library */                                                                            
167.00 41222              IF         COND(&WRKLIBADD *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))                        
168.00 41222              IF         COND(&MODULEADD *EQ 'Y') THEN(RMVLIBLE LIB(&MODULE))                        
169.00 50315              IF         COND(&OPGLIBADD *EQ 'Y') THEN(RMVLIBLE LIB(&OPGLIB))                        
170.00 101007 /* D0261 */  IF         COND(&CRLIBADD *EQ 'Y') THEN(RMVLIBLE LIB(&CRLIB))                          
171.00 160721 /*D6219*/      IF COND(&RMVZOTRMAP *EQ 'Y') THEN(RMVLIBLE LIB(&ZOTRMAPP))                           
172.00 41222                                                                                                     
173.00 41125              ENDPGM                                                                                 
