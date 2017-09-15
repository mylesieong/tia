1.00 1213     /*                                                                 */       
2.00 1213     /*        Program ID.   : BTRPTCL                                  */       
3.00 1213     /*        Program Name  : print bt tx report (with override id)    */       
4.00 1213     /*        Functions     :                                          */       
5.00 1213     /*                                                                 */       
6.00 1213     /*        Author        : edward cheung                            */       
7.00 1213     /*        Date written  : 2000 Nov 27                              */       
8.00 1213     /*-----------------------------------------------------------------*/       
9.00 20110      /*-----------------------------------------------------------------        
10.00 20110  /*        REFERENCE NO  : C2005                                    */          
11.00 20110  /*        USER ID       : B323                                     */          
12.00 20110  /*        USER NAME     : edward cheng                             */          
13.00 20110  /*        CHANGED DATE  : 10/01/2002                               */          
14.00 20110  /*        PURPOSE       : add two queries for bt tx override rpt   */          
15.00 20110  /*                        in file as output                        */          
16.00 20110  /*******************************************************************/          
17.00 50419  /*        REFERENCE NO  : C5050                                    */          
18.00 50419  /*        USER ID       : B323                                     */          
19.00 50419  /*        USER NAME     : edward cheng                             */          
20.00 50419  /*        CHANGED DATE  : 18/04/2005                               */          
21.00 50419  /*        PURPOSE       : include generation of report for cash    */          
22.00 50419  /*                        advance                                  */          
23.00 50419  /*******************************************************************/          
24.00 51104  /*        REFERENCE NO  : CHG-192-05 (C5192)                       */          
25.00 51104  /*        USER ID       : B505PGM                                  */          
26.00 51104  /*        USER NAME     : Paris Che                                */          
27.00 51104  /*        CHANGED DATE  : 04/11/2005                               */          
28.00 51104  /*        PURPOSE       : Backup BTLOG, BTADVLOG and then clear    */          
29.00 51104  /*                        them to advoid the PGM 'BTDTEMNT' convert*/          
30.00 51104  /*                        previous converted date into a invalid   */          
31.00 51104  /*                        format, which makes the quries fails to  */          
32.00 51104  /*                        run properly                             */          
33.00 51104  /*        (if branch 01 has no rec, the files won't clear so dates */          
34.00 51104  /*         are converted again)                                    */          
35.00 51104  /*******************************************************************/          
36.00 51128  /*        REFERENCE NO  : CHG-208-05 (C5208)                       */          
37.00 51128  /*        USER ID       : B505PGM                                  */          
38.00 51128  /*        USER NAME     : Paris Che                                */          
39.00 51128  /*        CHANGED DATE  : 28/11/2005                               */          
40.00 51128  /*        PURPOSE       : For Backup BTLOG and BTADVLOG, clear the */          
41.00 51128  /*                        backup file and use *ADD option in CPFY  */          
42.00 51128  /*                        instead of *REPLACE to avoid err msg of  */          
43.00 51128  /*                        empty member copying                     */          
44.00 51128  /*******************************************************************/          
45.00 80902  /*        USER NAME     : edward cheung                            */          
46.00 80902  /*        CHANGED DATE  : 02/09/2008                               */          
47.00 80902  /*        PURPOSE       : add report for transaction override of   */          
48.00 80902  /*                        the message id 429 because of the Customer*/         
49.00 80902  /*                        information update project               */          
50.00 80902  /*                                                                 */          
51.00 80902  /*******************************************************************/          
52.00 110105  /*        REFERENCE NO  : CHG-005-10 (D1005)                       */          
53.00 110105  /*        USER NAME     : FRANCISCO LO                             */          
54.00 110105  /*        USER ID       : BB14PGM                                  */          
55.00 110105  /*        CHANGE DATE   : 05 JAN 2011                              */          
56.00 110105  /*        REASON        : ADD BATCH JOB LOG MODULE BEFORE AND AFTER*/          
57.00 110105  /*                        RUNNING THE PROGRAM                      */          
58.00 110105  /*******************************************************************/          
59.00 120418  /*        REFERENCE NO  : CHG-118-12 (D2118)                       */          
60.00 120418  /*        USER NAME     : KARL (BA55PGM)                           */          
61.00 120418  /*        CHANGE DATE   : 18 APR 2012                              */          
62.00 120418  /*        REASON        : ADD JOB TO IMPROVE PERFORMANCE           */          
63.00 120418  /*******************************************************************/          
64.00 170329  /*        REFERENCE NO  : CHG-096-17 (D7096)                       */          
65.00 170111  /*        USER NAME     : Myles Ieong                              */          
66.00 170111  /*        USER ID       : BI77PGM                                  */          
67.00 170111  /*        CHANGE DATE   : 11 JAN 2017                              */          
68.00 170111  /*        REASON        : Add report for message overridden by CDD */          
69.00 170111  /*                        project                                  */          
70.00 170111  /*******************************************************************/          
71.00 1213              PGM                                                                
72.00 1213                                                                                 
73.00 110105 /*D1005*/    DCL        VAR(&PGMNAME) TYPE(*CHAR) LEN(10) +                     
74.00 110105 /*D1005*/                 VALUE('BTRPTCL')                                      
75.00 110105 /*D1005*/    DCL        VAR(&USER) TYPE(*CHAR) LEN(10)                          
76.00 110105                                                                                 
77.00 1213              DCL        VAR(&LIB) TYPE(*CHAR) LEN(10) VALUE('IPROD')            
78.00 1213              MONMSG     MSGID(CPF2103 CPF2104 CPF4174 CPF3142 +                 
79.00 1213                           CPF4520 CPF0864 CPF4174)                              
80.00 1213                                                                                 
81.00 1213  RUNRPT:     ADDLIBLE   LIB(IMODULE) POSITION(*LAST)                            
82.00 1213              ADDLIBLE   LIB(&LIB)                                               
83.00 1213                                                                                 
84.00 110105 /*D1005*/    RTVJOBA    USER(&USER)                                             
85.00 110105 /*D1005*/    CALL       PGM(WRIBTHLOG) PARM('START' &LIB +                      
86.00 110105 /*D1005*/                 &PGMNAME &USER)                                       
87.00 110105                                                                                 
88.00 1213  /*reformat bt date from PC */                                                  
89.00 1213              CALL       PGM(&LIB/BTDTEMNT)                                      
90.00 1213  /*get the current date transaction of the till/teller */                       
91.00 1213              RUNQRY     QRY(&LIB/BTCURLOG)                                      
92.00 120418                                                                                 
93.00 120418  /*D2118 DELETE RECORD & REORGANIZE PSPRVLOG */                                 
94.00 120418  /*D2118*/   RUNSQLSTM  SRCFILE(&LIB/QCLSRC) SRCMBR(BTRPTSQL) +                 
95.00 120418                           COMMIT(*NONE)                                         
96.00 120418  /*D2118*/   RGZPFM     FILE(&LIB/PSPRVLOG)                                     
97.00 120418                                                                                 
98.00 1213  /* bt transaction override report */                                           
99.00 1213  /* this contains monetary tx over user profile limit */                        
100.00 1213  /* and insuffiicent funds */                                                   
101.00 1213              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(BTTXRPT)              
102.00 1213              RUNQRY     QRY(&LIB/BTTXRPT)                                       
103.00 1213              DLTOVR     FILE(*ALL)                                              
104.00 1213  /*bt override report*/                                                         
105.00 1213  /* this contains all the bt tx requires overide */                             
106.00 1213              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(BTOVRRPT)             
107.00 1213              RUNQRY     QRY(&LIB/BTOVRRPT)                                      
108.00 1213              DLTOVR     FILE(*ALL)                                              
109.00 50419                                                                                 
110.00 80902 /*C8224 add report for message overridden by CIU project */                     
111.00 80902 /*C8224*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(BTCIFOVR)             
112.00 80902 /*C8224*/    RUNQRY     QRY(&LIB/BTCIFOVR)                                      
113.00 80902 /*c8224*/    DLTOVR     FILE(*ALL)                                              
114.00 80902                                                                                 
115.00 50419 /* refid C2005 userid B323 purpose: generate BT log to file */                  
116.00 20110 /*C2005*/    RUNQRY     QRY(&LIB/BTOVRFLE)                                      
117.00 20110 /*C2005*/    RUNQRY     QRY(&LIB/BTTXFLE)                                       
118.00 1213                                                                                 
119.00 50419 /* refid C5050 userid B323 purpose: generate BT cash advance report*/           
120.00 50419 /*C5050*/    RUNQRY     QRY(&LIB/BTADVCURLG)                                    
121.00 50419 /*C5050*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(BTADVRPT)             
122.00 50419 /*C5050*/    RUNQRY     QRY(&LIB/BTADVRPT)                                      
123.00 50419 /*C5050*/    DLTOVR     FILE(*ALL)                                              
124.00 50419                                                                                 
125.00 170329 /* refid D7096 userid BI77 purpose: Add rpt for CDD msg overridden */           
126.00 170329 /*D7096*/    RUNQRY     QRY(&LIB/BTCDDOVR1)                                     
127.00 170329 /*D7096*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(BTCDDOVR)             
128.00 170329 /*D7096*/    RUNQRY     QRY(&LIB/BTCDDOVR2)                                     
129.00 170329 /*D7096*/    DLTOVR     FILE(*ALL)                                              
130.00 170111                                                                                 
131.00 51104 /* Reference: CHG-192-05                                           */           
132.00 51104 /* Purpose  : Backup BTLOG, BTADVLOG and Clear them                */           
133.00 51104 /* User & ID: Paris Che, B505PGM                                   */           
134.00 51128 /*C5208      CPYF       FROMFILE(&LIB/BTLOG) TOFILE(&LIB/BTLOGB) +              
135.00 51128                           MBROPT(*REPLACE)                             */       
136.00 51128 /*C5208      CPYF       FROMFILE(&LIB/BTADVLOG) TOFILE(&LIB/BTADVLOGB) +        
137.00 51128                           MBROPT(*REPLACE)                             */       
138.00 51128 /*C5208*/    CLRPFM     FILE(&LIB/BTLOGB)                                       
139.00 51128 /*C5208*/    CLRPFM     FILE(&LIB/BTADVLOGB)                                    
140.00 51128 /*C5208*/    CPYF       FROMFILE(&LIB/BTLOG) TOFILE(&LIB/BTLOGB) +              
141.00 51128                           MBROPT(*ADD)                                          
142.00 51128 /*C5208*/    CPYF       FROMFILE(&LIB/BTADVLOG) TOFILE(&LIB/BTADVLOGB) +        
143.00 51128                           MBROPT(*ADD)                                          
144.00 51104 /*C5192*/    CLRPFM     FILE(&LIB/BTLOG)                                        
145.00 51104 /*C5192*/    CLRPFM     FILE(&LIB/BTADVLOG)                                     
146.00 51104                                                                                 
147.00 110105 /*D1005*/    CALL       PGM(WRIBTHLOG) PARM('END' &LIB +                        
148.00 110105 /*D1005*/                 &PGMNAME &USER)                                       
149.00 110105                                                                                 
150.00 1213              RMVLIBLE   LIB(&LIB)                                               
151.00 1213              RMVLIBLE   LIB(IMODULE)                                            
152.00 1213                                                                                 
153.00 1213  END:        ENDPGM                                                             
154.00 1213                                                                                 
155.00 1213                                                                                 
156.00 1213                                                                                 
157.00 1213                                                                                 
158.00 1213                                                                                 
159.00 1213                                                                                 
160.00 1213                                                                                 
161.00 1213                                                                                 
162.00 1213                                                                                 
163.00 1213                                                                                 
164.00 1213                                                                                 
165.00 1213                                                                                 
166.00 1213                                                                                 
167.00 1213                                                                                 
168.00 1213                                                                                 
169.00 1213                                                                                 
170.00 1213                                                                                 
171.00 1213                                                                                 
172.00 1213                                                                                 
173.00 1213                                                                                 
174.00 1213                                                                                 
