1.00 60516 /*-----------------------------------------------------------------*/                                
2.00 60608 /*  Reference    : C6166 (CHG-166-06)                              */                                
3.00 60519 /*  User Id      : B454PGM                                         */                                
4.00 60519 /*  Changed by   : ARIES LUNG                                      */                                
5.00 60519 /*  Changed date : 20 MAY 2006                                     */                                
6.00 60608 /*  DESCRIPTION  : GENERATE DAILY, WEEKLY AND MONTHLY AML          */                                
7.00 60608 /*                 REPORT.                                         */                                
8.00 60519 /*                                                                 */                                
9.00 60516 /*******************************************************************/                                
10.00 70808 /* REFERENCE    : CHG-227-07 (C7227)                                          */                     
11.00 70803 /* CHANGED BY   : ANTHONY (B422)                                              */                     
12.00 70803 /* CHANGED DATE : 02 AUG 2007                                                 */                     
13.00 70803 /* REASON       : DUE TO IMPLEMENTATION OF IN-HOUSE CHEQUE COLLECTION         */                     
14.00 70803 /*                APPLICATION, ADD LOGIC TO RETRIEVE CHEQUE COLLECTION        */                     
15.00 70803 /*                (INWARD REMITTANCE) TRANSACTION FROM IN-HOSUE DATABASE      */                     
16.00 70803 /******************************************************************************/                     
17.00 100826 /* REFERENCE    : CHG-201-10 (D0201)                                          */                     
18.00 100825 /* CHANGED BY   : ANTHONY (B422)                                              */                     
19.00 100825 /* CHANGED DATE : 25 AUG 2010                                                 */                     
20.00 100825 /* REASON       : Create ne AML reports                                       */                     
21.00 100825 /*                - Transactions of large amount and unusual frequency by     */                     
22.00 100825 /*                  Personal customer - Weekly                                */                     
23.00 100825 /*                - Transactions of large amount and unusual frequency by     */                     
24.00 100825 /*                  Non-Personal customer - Weekly                            */                     
25.00 100825 /*                - Inward remittance for SCC customer in last 30 days        */                     
26.00 100825 /*                - Inward remittance for SCC customer in last 90 days        */                     
27.00 100825 /*                - Inward remittance for SCC customer in last 180 days       */                     
28.00 100825 /*                - Outward remittance for SCC customer in last 30 days       */                     
29.00 100825 /*                - Outward remittance for SCC customer in last 90 days       */                     
30.00 100825 /*                - Outward remittance for SCC customer in last 180 days      */                     
31.00 100825 /******************************************************************************/                     
32.00 110113 /*  REFERENCE    : CHG-339-10 (D0339)                                         */                     
33.00 101221 /*  USER ID      : BB16PGM                                                    */                     
34.00 101221 /*  CHANGED BY   : ALVIN LEI                                                  */                     
35.00 101221 /*  CHANGED DATE : 17 DEC 20                                                  */                     
36.00 110104 /*  REASON       : Modify the following AML reports layout and provide        */                     
37.00 110104 /*                 daily Excel file                                           */                     
38.00 110104 /*                 - Transactions of large amount and unusual frequency by    */                     
39.00 110104 /*                   Personal customer - Weekly                               */                     
40.00 110104 /*                 - Transactions of large amount and unusual frequency by    */                     
41.00 110104 /*                   Non-Personal customer - Weekly                           */                     
42.00 110104 /*                 - Inward remittance for SCC customer in last 30 days       */                     
43.00 110104 /*                 - Inward remittance for SCC customer in last 90 days       */                     
44.00 110104 /*                 - Inward remittance for SCC customer in last 180 days      */                     
45.00 110104 /*                 - Outward remittance for SCC customer in last 30 days      */                     
46.00 110104 /*                 - Outward remittance for SCC customer in last 90 days      */                     
47.00 110104 /*                 - Outward remittance for SCC customer in last 180 days     */                     
48.00 110104 /******************************************************************************/                     
49.00 110221 /* REFERENCE    : CHG-057-11 (D1057)                                          */                     
50.00 110221 /* CHANGED BY   : Anthony (B422)                                              */                     
51.00 110221 /* CHANGED DATE : 21 Feb 2011                                                 */                     
52.00 110221 /* REASON       : Add logic to cater new SCC code 'LR' that is same as previou*/                     
53.00 110221 /*                code '  ' - Low Risk.                                      */                      
54.00 110221 /******************************************************************************/                     
55.00 110526 /* REFERENCE    : CHG-160-10 (D1160)                                          */                     
56.00 110526 /* CHANGED BY   : Karl (BA55)                                                 */                     
57.00 110526 /* CHANGED DATE : 26 MAY 2011                                                 */                     
58.00 110526 /* REASON       : 1. Change the follows reports to queue RPTLIB/MISCOUQMIG    */                     
59.00 110526 /*                - Transactions of large amount and unusual frequency by     */                     
60.00 110526 /*                  Personal customer - Weekly                                */                     
61.00 110526 /*                - Transactions of large amount and unusual frequency by     */                     
62.00 110526 /*                  Non-Personal customer - Weekly                            */                     
63.00 110526 /*                - Inward remittance for SCC customer in last 30 days        */                     
64.00 110526 /*                - Inward remittance for SCC customer in last 90 days        */                     
65.00 110526 /*                - Inward remittance for SCC customer in last 180 days       */                     
66.00 110526 /*                - Outward remittance for SCC customer in last 30 days       */                     
67.00 110526 /*                - Outward remittance for SCC customer in last 90 days       */                     
68.00 110526 /*                - Outward remittance for SCC customer in last 180 days      */                     
69.00 110527 /*                2. Copy the monthly file: TXNRCDM to new file: TXNRCDM2     */                     
70.00 110526 /******************************************************************************/                     
71.00 110527 /* REFERENCE    : CHG-160-10 (D1160)                                          */                     
72.00 110527 /* CHANGED BY   : Karl (BA55)                                                 */                     
73.00 110527 /* CHANGED DATE : 26 MAY 2011                                                 */                     
74.00 110527 /* DESCRIPTION  : Phase II of the change management                           */                     
75.00 110527 /*                1. Add MONTHLY AND QUARTERLY REMIT/CASHIER ODR/DEMAND DRAFT */                     
76.00 110527 /*                REPORT                                                      */                     
77.00 110527 /******************************************************************************/                     
78.00 111025 /* REFERENCE    : CHG-315-11 (D1315)                                          */                     
79.00 111025 /* CHANGED BY   : Karl (BA55)                                                 */                     
80.00 111025 /* CHANGED DATE : 25 OCT 2011                                                 */                     
81.00 111025 /* DESCRIPTION  : 1. Add monthly and quarterly large cash TXN. by customer    */                     
82.00 111025 /*                2. Add monthly and quarterly Time deposit cash Txn.         */                     
83.00 111025 /*                3. Add monthly and quarterly lage accumulated deposit in    */                     
84.00 111025 /*                   credit card account                                      */                     
85.00 111025 /*                4. Add quarterly and Semi-annually credit card account with */                     
86.00 111025 /*                   credit balance >= MOP10000 & MOP50000                    */                     
87.00 111025 /******************************************************************************/                     
88.00 120120 /* REFERENCE    : CHG-016-12 (D2016)                                          */                     
89.00 120117 /* CHANGED BY   : Karl (BA55)                                                 */                     
90.00 120117 /* CHANGED DATE : 17 JAN 2012                                                 */                     
91.00 120117 /* DESCRIPTION  : Run SQL statement to copy CC no. after call PGM - AML_GCC   */                     
92.00 120203 /*                Stop copying weekly file of deposit in credit card account  */                     
93.00 120117 /******************************************************************************/                     
94.00 120817 /* REFERENCE    : CHG-016-12 (D2230)                                          */                     
95.00 120817 /* CHANGED BY   : Karl (BA55)                                                 */                     
96.00 120817 /* CHANGED DATE : 17 AUG 2012                                                 */                     
97.00 120817 /* DESCRIPTION  : 1. Change quarterly report 'T/D cash txn', 'Credit Card     */                     
98.00 120817 /*                   deposit' and 'Large cash txn' generation month to every  */                     
99.00 120817 /*                   beginning of 1, 4, 7, 10                                 */                     
100.00 120817 /*                2. Divid monthly/quarterly report 'Large cash txn by        */                     
101.00 120817 /*                   customer' by customer type (Personal/Non-personal)       */                     
102.00 120817 /******************************************************************************/                     
103.00 131105 /* REFERENCE    : CHG-390-13 (D3390)                                          */                     
104.00 131002 /* CHANGED BY   : Karl (BA55)                                                 */                     
105.00 131002 /* CHANGED DATE : 02 OCT 2013                                                 */                     
106.00 131002 /* DESCRIPTION  : Add AML 5 report for monitoring gift card transactions:     */                     
107.00 131002 /*                  Daily report, daily exception report, weekly report,      */                     
108.00 131002 /*                  Bi-weekly report (15th and month-end) and monthly report  */                     
109.00 131002 /******************************************************************************/                     
110.00 140715 /* REFERENCE    : CHG-297-14 (D4297)                                          */                     
111.00 140715 /* CHANGED BY   : Karl (BA55)                                                 */                     
112.00 140715 /* CHANGED DATE : 17 JUL 2014                                                 */                     
113.00 140715 /* DESCRIPTION  : Add low risk code when coping data file                     */                     
114.00 140715 /******************************************************************************/                     
115.00 150324 /* REFERENCE    : CHG-038-15 (D5038)                                          */                     
116.00 150324 /* CHANGED BY   : Karl (BA55)                                                 */                     
117.00 150324 /* CHANGED DATE : 24 MAR 2015                                                 */                     
118.00 150324 /* DESCRIPTION  : Add remittance and trade finance transaction report         */                     
119.00 150324 /*                (high risk country)                                         */                     
120.00 150324 /******************************************************************************/                     
121.00 150427 /* REFERENCE    : CHG-111-15 (D5111)                                          */                     
122.00 150416 /* CHANGED BY   : Karl (BA55)                                                 */                     
123.00 150416 /* CHANGED DATE : 16 MAR 2015                                                 */                     
124.00 150416 /* DESCRIPTION  : Devide the weekly SCC report into two (B1/C7 and not B1/C7) */                     
125.00 150416 /******************************************************************************/                     
126.00 151126 /* REFERENCE    : CHG-416-15 (D5416)                                          */                     
127.00 151126 /* CHANGED BY   : Albert Au (BG09)                                            */                     
128.00 151126 /* CHANGED DATE : 26 Nov 2015                                                 */                     
129.00 151126 /* DESCRIPTION  : Stop producting the MIS Report (AMLWTXRPT1 & AMLWTXRPT2)    */                     
130.00 151126 /******************************************************************************/                     
131.00 160721 /* ------------------------------------------------------------ */                                   
132.00 160721 /* REF. NUMBER : CHG-0219-16 (D6219)                            */                                   
133.00 160721 /* USER ID     : BG09PGM                                        */                                   
134.00 160721 /* USER NAME   : ALBERT AU                                      */                                   
135.00 160721 /* DATE        : 21 JUL 2016                                    */                                   
136.00 160721 /* DESC.       : OUTWARD REMITTANCE (ZOTRMAPP)                  */                                   
137.00 160721 /* ------------------------------------------------------------ */                                   
138.00 160825 /* REFERENCE    : CHG-262-16 (D6262)                            */                                   
139.00 160825 /* CHANGED BY   : Myles Ieong (BI77)                            */                                   
140.00 160825 /* CHANGED DATE : 04 Aug 2016                                   */                                   
141.00 160825 /* DESCRIPTION  : AML report parameter changing and revoking    */                                   
142.00 160825 /* ------------------------------------------------------------ */                                   
143.00 170331 /* REFERENCE    : CHG-121-17 (D7121)                            */                                   
144.00 170301 /* CHANGED BY   : Albert Au (BG09)                              */                                   
145.00 170301 /* CHANGED DATE : 01 Mar 2017                                   */                                   
146.00 170302 /* DESCRIPTION  : UPDATE CIF SCC CODE BEFORE PRINT OUT REPORT   */                                   
147.00 170301 /* ------------------------------------------------------------ */                                   
148.00 170606 /* REFERENCE    : CHG-196-17 (D7196)                            */                                   
149.00 170410 /* CHANGED BY   : Albert Au (BG09)                              */                                   
150.00 170410 /* CHANGED DATE : 10 Apr 2017                                   */                                   
151.00 170413 /* DESCRIPTION  : Modify Report AMLDCTRPT1, AMLDCTRPT2,         */                                   
152.00 170413 /*                AMLTDRPT1, AMLWCCRPT1, AMLMACCRP1, AMLMCCRPT1,*/                                   
153.00 170413 /*                AMLQCCRPT1                                    */                                   
154.00 170609 /*                Add Report AMLDCTSTF1,AMLDCTSTF2,AMLMCTSTF1,  */                                   
155.00 170609 /*                AMLTDSTF1,AMLWCCSTF1,AMLMACCST1,AMLMCCSTF1,   */                                   
156.00 170609 /*                AMLQCCSTF1                                    */                                   
157.00 170410 /* ------------------------------------------------------------ */                                   
158.00 60516 PGM                                                                                                  
159.00 60608 /* DEFINE RELATED VARIABLE AND ADD LIBRARIES*/                                                       
160.00 60517              DCLF       FILE(TAP00101B)                                                              
161.00 60516              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) +                                           
162.00 60523                           VALUE('IPROD')                                                             
163.00 60524              DCL        VAR(&IMODUL) TYPE(*CHAR) LEN(10) +                                           
164.00 60524                           VALUE('IMODULE')                                                           
165.00 60516              DCL        VAR(&ICBSBCMDB1) TYPE(*CHAR) LEN(10) +                                       
166.00 60516                           VALUE('ICBSBCMDB1')                                                        
167.00 60908              DCL        VAR(&ICBSBCMDB0) TYPE(*CHAR) LEN(10) +                                       
168.00 60908                           VALUE('ICBSBCMDB0')                                                        
169.00 60608              DCL        VAR(&ZCARD) TYPE(*CHAR) LEN(10) +                                            
170.00 60608                           VALUE('ZCARD')                                                             
171.00 60608              DCL        VAR(&IMODICCSRM) TYPE(*CHAR) LEN(10) +                                       
172.00 70104                           VALUE('IMODCLNK  ')                                                        
173.00 70104              DCL        VAR(&CRDLIB) TYPE(*CHAR) LEN(10) +                                           
174.00 70104                           VALUE('ZCLNKFIL  ')                                                        
175.00 60516              DCL        VAR(&SRCFILE) TYPE(*CHAR) LEN(10) +                                          
176.00 60516                           VALUE('QAMLRSRC')                                                          
177.00 60901              DCL        VAR(&ZCUSPRO) TYPE(*CHAR) LEN(10) +                                          
178.00 60901                           VALUE('ZCUSPRO')                                                           
179.00 60908              DCL        VAR(&I700BCM) TYPE(*CHAR) LEN(10) +                                          
180.00 60908                           VALUE('I700BCM')                                                           
181.00 60908              DCL        VAR(&ZOPGLIB) TYPE(*CHAR) LEN(10) +                                          
182.00 60908                           VALUE('ZOPGLIB')                                                           
183.00 160721 /*D6219*/    DCL        VAR(&ZOTRMAPP) TYPE(*CHAR) LEN(10) +                                         
184.00 160721 /*D6219*/                 VALUE('ZOTRMAPP')                                                          
185.00 60608                                                                                                      
186.00 60608              DCL        VAR(&CARDADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                  
187.00 60608              DCL        VAR(&SRMADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                   
188.00 60516              DCL        VAR(&WRKLADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                  
189.00 60524              DCL        VAR(&IMODADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                  
190.00 60516              DCL        VAR(&DB1ADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                   
191.00 60908              DCL        VAR(&DB0ADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                   
192.00 70104              DCL        VAR(&CRDADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                   
193.00 60901              DCL        VAR(&ZCUSADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                  
194.00 60908              DCL        VAR(&I700ADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                  
195.00 60908              DCL        VAR(&OPGADD) TYPE(*CHAR) LEN(1) VALUE('Y')                                   
196.00 160721 /*D6219*/    DCL        VAR(&RMVZOTRMAP) TYPE(*CHAR) LEN(1) VALUE(Y)                                 
197.00 110530  /*D1160*/   DCL        VAR(&QUAFLG) TYPE(*CHAR) LEN(2)                                              
198.00 110530  /*D1160*/   DCL        VAR(&CURDAT) TYPE(*CHAR) LEN(9)                                              
199.00 120725  /*D2016*/   DCL        VAR(&GENFLG) TYPE(*CHAR) LEN(1)                                              
200.00 120817  /*D2230*/   DCL        VAR(&CURDATD) TYPE(*DEC) LEN(8 0)                                            
201.00 131105  /*D3390*/   DCL        VAR(&GFCDP1) TYPE(*CHAR) LEN(2)                                              
202.00 131105  /*D3390*/   DCL        VAR(&GFCDP2) TYPE(*CHAR) LEN(1)                                              
203.00 131105  /*D3390*/   DCL        VAR(&DAYS) TYPE(*DEC) LEN(2 0)                                               
204.00 60901              ADDLIBLE   LIB(&ZCUSPRO)                                                                
205.00 60901              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&ZCUSADD) +                                   
206.00 60901                           VALUE('N'))                                                                
207.00 60711              ADDLIBLE   LIB(&IMODICCSRM)                                                             
208.00 60711              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&SRMADD) +                                    
209.00 60711                           VALUE('N'))                                                                
210.00 70104              ADDLIBLE   LIB(&CRDLIB)                                                                 
211.00 70104              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&CRDADD) +                                    
212.00 70104                           VALUE('N'))                                                                
213.00 60711              ADDLIBLE   LIB(&ZCARD)                                                                  
214.00 60711              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&CARDADD) +                                   
215.00 60711                           VALUE('N'))                                                                
216.00 60711              ADDLIBLE   LIB(&IMODUL)                                                                 
217.00 60711              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&IMODADD) +                                   
218.00 60711                           VALUE('N'))                                                                
219.00 60711              ADDLIBLE   LIB(&ICBSBCMDB1)                                                             
220.00 60711              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&DB1ADD) +                                    
221.00 60711                           VALUE('N'))                                                                
222.00 60908              ADDLIBLE   LIB(&ICBSBCMDB0)                                                             
223.00 60908              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&DB0ADD) +                                    
224.00 60908                           VALUE('N'))                                                                
225.00 60516              ADDLIBLE   LIB(&WRKLIB)                                                                 
226.00 60516              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&WRKLADD) +                                   
227.00 60516                           VALUE('N'))                                                                
228.00 60908              ADDLIBLE   LIB(&I700BCM)                                                                
229.00 60908              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&I700ADD) +                                   
230.00 60908                           VALUE('N'))                                                                
231.00 60908              ADDLIBLE   LIB(&ZOPGLIB)                                                                
232.00 60908              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&OPGADD) +                                    
233.00 60908                           VALUE('N'))                                                                
234.00 60516                                                                                                      
235.00 160721 /*D6219*/      ADDLIBLE   LIB(&ZOTRMAPP)                                                             
236.00 160721 /*D6219*/      MONMSG MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZOTRMAP) VALUE(N))                          
237.00 160721 /*D6219*/                                                                                            
238.00 60516 /***********************MAIL CL**************************************************/                   
239.00 150324                                                                                                      
240.00 150324 /*D5038 Remittance and trade txn with high risk country */                                           
241.00 150324 /*D5038*/    CALL       PGM(&WRKLIB/RMTCNTCL)                                                        
242.00 160829                                                                                                      
243.00 160829              CHKOBJ     OBJ(&WRKLIB/PST001B) OBJTYPE(*FILE)                                          
244.00 160829              MONMSG     MSGID(CPF9801) EXEC(CRTLF +                                                  
245.00 160829                           FILE(&WRKLIB/PST001B) +                                                    
246.00 160829                           SRCFILE(&WRKLIB/QAMLSRC))                                                  
247.00 150324                                                                                                      
248.00 60608     /*CLEAR & EXTRACT DAILY TXN DATA */                                                              
249.00 60602              CLRPFM     FILE(&WRKLIB/AML_DLYTX)                                                      
250.00 60517              CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
251.00 60517              CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
252.00 60517              RUNSQLSTM  SRCFILE(&WRKLIB/&SRCFILE) SRCMBR(AMLTXNSQL) +                                
253.00 60517                         COMMIT(*NONE)                                                                
254.00 131002                                                                                                      
255.00 60711                                                                                                      
256.00 60517              CALL       PGM(AML_DLYT)                                                                
257.00 60516              CLRPFM     FILE(&WRKLIB/DLYTXNWKF)                                                      
258.00 60516              CLRPFM     FILE(&WRKLIB/DLYTXNWKF1)                                                     
259.00 60608     /*BACKUP CURRENT WEEKLY TXN*/                                                                    
260.00 60602              CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
261.00 60519                           TOFILE(&WRKLIB/AML_BKCURW) MBROPT(*ADD)                                    
262.00 60608     /* GENERATE DAILY TRANSACTION IN TA ACCOUNT REPORT */                                            
263.00 60518              OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                                
264.00 60523                           USRDTA(AMLDLYTXN1) SPLFNAME(AMLDTXRPT1) +                                  
265.00 60518                           SECURE(*YES)                                                               
266.00 60523              CALL       PGM(AML_GENRPT) PARM('D01' 'R')                                              
267.00 60523              OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                                
268.00 60523                           USRDTA(AMLDLYTXN2) SPLFNAME(AMLDTXRPT2) +                                  
269.00 60523                           SECURE(*YES)                                                               
270.00 60523              CALL       PGM(AML_GENRPT) PARM('D01' 'O')                                              
271.00 60518              DLTOVR     FILE(*ALL)                                                                   
272.00 60608                                                                                                      
273.00 60608     /* GENERATE DAILY CASH TRANSACTION BY CUSTOMER REPORT*/                                          
274.00 60608              CLRPFM     FILE(AMLDTLCNY)                                                              
275.00 60608              CLRPFM     FILE(AMLDDOCRCD)                                                             
276.00 60608              CLRPFM     FILE(AMLDDNCRCD)                                                             
277.00 60608              CLRPFM     FILE(TXNCTWRK1)                                                              
278.00 60608              CLRPFM     FILE(TXNCTWRK2)                                                              
279.00 60608              CLRPFM     FILE(TXNCT1)                                                                 
280.00 60608              CLRPFM     FILE(TXNCT2)                                                                 
281.00 160825 /*D6262*/    CLRPFM     FILE(TXNCT1S)                                                                
282.00 160825 /*D6262*/    CLRPFM     FILE(TXNCT2S)                                                                
283.00 60608              CLRPFM     FILE(AMLCTXN)                                                                
284.00 60608                                                                                                      
285.00 60608              OVRDBF     FILE(NARPARM) TOFILE(NARP)                                                   
286.00 60608              OVRDBF     FILE(NARPARMLF1) TOFILE(NARPLF1)                                             
287.00 60608              OVRDBF     FILE(NARPARMLF2) TOFILE(NARPLF2)                                             
288.00 60608              OVRDBF     FILE(NARPARMLF3) TOFILE(NARPLF3)                                             
289.00 60608              CALL       PGM(GAML1)                                                                   
290.00 60608              CALL       PGM(GAML2)                                                                   
291.00 70808 /* C7227 */  CALL       PGM(GAML3)                                                                   
292.00 170606 /*D7196      OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
293.00 60608                           USRDTA(AMLDCTTXN1) SPLFNAME(AMLDCTRPT1) +                                  
294.00 170413                           SECURE(*YES)                         */                                    
295.00 170606 /*D7196      CALL       PGM(AML_GENCT) PARM('R')               */                                    
296.00 170606 /*D7196*/    CALL       PGM(AML_GENCT) PARM('R' 'C')                                                 
297.00 170606 /*D7196*/    CLRPFM     FILE(&WRKLIB/TXNCTWRK1T)                                                     
298.00 170606 /*D7196*/    CLRPFM     FILE(&WRKLIB/TXNCTWRK2T)                                                     
299.00 170606 /*D7196*/    CPYF       FROMFILE(&WRKLIB/TXNCTWRK1)                  +                               
300.00 170606 /*D7196*/               TOFILE(&WRKLIB/TXNCTWRK1T)                   +                               
301.00 170606 /*D7196*/               INCREL((*IF CTOFF *NE 'PER'))                +                               
302.00 170606 /*D7196*/               MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
303.00 170606 /*D7196*/    MONMSG     MSGID(CPF2869 CPF2817)                                                       
304.00 170606 /*D7196*/    CPYF       FROMFILE(&WRKLIB/TXNCTWRK2)                  +                               
305.00 170606 /*D7196*/               TOFILE(&WRKLIB/TXNCTWRK2T)                   +                               
306.00 170606 /*D7196*/               INCREL((*IF CTOFF *NE 'PER'))                +                               
307.00 170606 /*D7196*/               MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
308.00 170606 /*D7196*/    MONMSG     MSGID(CPF2869 CPF2817)                                                       
309.00 170606 /*D7196*/    OVRDBF     FILE(TXNCTWRK1) TOFILE(&WRKLIB/TXNCTWRK1T)                                   
310.00 170606 /*D7196*/    OVRDBF     FILE(TXNCTWRK2) TOFILE(&WRKLIB/TXNCTWRK2T)                                   
311.00 170606 /*D7196*/    OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
312.00 170606 /*D7196*/                 USRDTA(AMLDCTTXN1) SPLFNAME(AMLDCTRPT1) +                                  
313.00 170606 /*D7196*/                 SECURE(*YES)                                                               
314.00 170606 /*D7196*/    CALL       PGM(AML_GENCT) PARM('R' 'P')                                                 
315.00 170606 /*D7196*/    DLTOVR     FILE(TXNCTWRK1)                                                              
316.00 170606 /*D7196*/    DLTOVR     FILE(TXNCTWRK2)                                                              
317.00 170606 /*D7196*/                                                                                            
318.00 170606 /*D7196      OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
319.00 60608                           USRDTA(AMLDCTTXN2) SPLFNAME(AMLDCTRPT2) +                                  
320.00 170413                           SECURE(*YES)                         */                                    
321.00 170606 /*D7196      CALL       PGM(AML_GENCT) PARM('O')               */                                    
322.00 170606 /*D7196*/    CALL       PGM(AML_GENCT) PARM('O' 'C')                                                 
323.00 170606 /*D7196*/    CLRPFM     FILE(&WRKLIB/TXNCTWRK1T)                                                     
324.00 170606 /*D7196*/    CLRPFM     FILE(&WRKLIB/TXNCTWRK2T)                                                     
325.00 170606 /*D7196*/    CPYF       FROMFILE(&WRKLIB/TXNCTWRK1)                  +                               
326.00 170606 /*D7196*/               TOFILE(&WRKLIB/TXNCTWRK1T)                   +                               
327.00 170606 /*D7196*/               INCREL((*IF CTOFF *NE 'PER'))                +                               
328.00 170606 /*D7196*/               MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
329.00 170606 /*D7196*/    MONMSG     MSGID(CPF2869 CPF2817)                                                       
330.00 170606 /*D7196*/    CPYF       FROMFILE(&WRKLIB/TXNCTWRK2)                  +                               
331.00 170606 /*D7196*/               TOFILE(&WRKLIB/TXNCTWRK2T)                   +                               
332.00 170606 /*D7196*/               INCREL((*IF CTOFF *NE 'PER'))                +                               
333.00 170606 /*D7196*/               MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
334.00 170606 /*D7196*/    MONMSG     MSGID(CPF2869 CPF2817)                                                       
335.00 170606 /*D7196*/    OVRDBF     FILE(TXNCTWRK1) TOFILE(&WRKLIB/TXNCTWRK1T)                                   
336.00 170606 /*D7196*/    OVRDBF     FILE(TXNCTWRK2) TOFILE(&WRKLIB/TXNCTWRK2T)                                   
337.00 170606 /*D7196*/    OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
338.00 170606 /*D7196*/                 USRDTA(AMLDCTTXN2) SPLFNAME(AMLDCTRPT2) +                                  
339.00 170606 /*D7196*/                 SECURE(*YES)                                                               
340.00 170606 /*D7196*/    CALL       PGM(AML_GENCT) PARM('O' 'P')                                                 
341.00 170606 /*D7196*/    DLTOVR     FILE(TXNCTWRK1)                                                              
342.00 170606 /*D7196*/    DLTOVR     FILE(TXNCTWRK2)                                                              
343.00 170606 /*D7196*/                                                                                            
344.00 170606 /*D7196*/    CLRPFM     FILE(&WRKLIB/TXNCTWRK1T)                                                     
345.00 170606 /*D7196*/    CLRPFM     FILE(&WRKLIB/TXNCTWRK2T)                                                     
346.00 170606 /*D7196*/    CPYF       FROMFILE(&WRKLIB/TXNCTWRK1)                  +                               
347.00 170606 /*D7196*/               TOFILE(&WRKLIB/TXNCTWRK1T)                   +                               
348.00 170606 /*D7196*/               INCREL((*IF CTOFF *EQ 'PER'))                +                               
349.00 170606 /*D7196*/               MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
350.00 170606 /*D7196*/    MONMSG     MSGID(CPF2869 CPF2817)                                                       
351.00 170606 /*D7196*/    CPYF       FROMFILE(&WRKLIB/TXNCTWRK2)                  +                               
352.00 170606 /*D7196*/               TOFILE(&WRKLIB/TXNCTWRK2T)                   +                               
353.00 170606 /*D7196*/               INCREL((*IF CTOFF *EQ 'PER'))                +                               
354.00 170606 /*D7196*/               MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
355.00 170606 /*D7196*/    MONMSG     MSGID(CPF2869 CPF2817)                                                       
356.00 170606 /*D7196*/    OVRDBF     FILE(TXNCTWRK1) TOFILE(&WRKLIB/TXNCTWRK1T)                                   
357.00 170606 /*D7196*/    OVRDBF     FILE(TXNCTWRK2) TOFILE(&WRKLIB/TXNCTWRK2T)                                   
358.00 170606 /*D7196*/    OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
359.00 170609 /*D7196*/                 USRDTA(AMLDCTTXN1) SPLFNAME(AMLDCTSTF1) +                                  
360.00 170606 /*D7196*/                 SECURE(*YES)                                                               
361.00 170606 /*D7196*/    CALL       PGM(AML_GENCT) PARM('R' 'P')                                                 
362.00 170606 /*D7196*/    DLTOVR     FILE(TXNCTWRK1)                                                              
363.00 170606 /*D7196*/    DLTOVR     FILE(TXNCTWRK2)                                                              
364.00 170606 /*D7196*/                                                                                            
365.00 170606 /*D7196      CALL       PGM(AML_GENCT) PARM('O')               */                                    
366.00 170606 /*D7196*/    CALL       PGM(AML_GENCT) PARM('O' 'C')                                                 
367.00 170606 /*D7196*/    CLRPFM     FILE(&WRKLIB/TXNCTWRK1T)                                                     
368.00 170606 /*D7196*/    CLRPFM     FILE(&WRKLIB/TXNCTWRK2T)                                                     
369.00 170606 /*D7196*/    CPYF       FROMFILE(&WRKLIB/TXNCTWRK1)                  +                               
370.00 170606 /*D7196*/               TOFILE(&WRKLIB/TXNCTWRK1T)                   +                               
371.00 170606 /*D7196*/               INCREL((*IF CTOFF *EQ 'PER'))                +                               
372.00 170606 /*D7196*/               MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
373.00 170606 /*D7196*/    MONMSG     MSGID(CPF2869 CPF2817)                                                       
374.00 170606 /*D7196*/    CPYF       FROMFILE(&WRKLIB/TXNCTWRK2)                  +                               
375.00 170606 /*D7196*/               TOFILE(&WRKLIB/TXNCTWRK2T)                   +                               
376.00 170606 /*D7196*/               INCREL((*IF CTOFF *EQ 'PER'))                +                               
377.00 170606 /*D7196*/               MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
378.00 170606 /*D7196*/    MONMSG     MSGID(CPF2869 CPF2817)                                                       
379.00 170606 /*D7196*/    OVRDBF     FILE(TXNCTWRK1) TOFILE(&WRKLIB/TXNCTWRK1T)                                   
380.00 170606 /*D7196*/    OVRDBF     FILE(TXNCTWRK2) TOFILE(&WRKLIB/TXNCTWRK2T)                                   
381.00 170606 /*D7196*/    OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
382.00 170609 /*D7196*/                 USRDTA(AMLDCTTXN2) SPLFNAME(AMLDCTSTF2) +                                  
383.00 170606 /*D7196*/                 SECURE(*YES)                                                               
384.00 170606 /*D7196*/    CALL       PGM(AML_GENCT) PARM('O' 'P')                                                 
385.00 170606 /*D7196*/    DLTOVR     FILE(TXNCTWRK1)                                                              
386.00 170606 /*D7196*/    DLTOVR     FILE(TXNCTWRK2)                                                              
387.00 170606 /*D7196*/                                                                                            
388.00 60608                                                                                                      
389.00 60608              DLTOVR     FILE(*ALL)                                                                   
390.00 111025                                                                                                      
391.00 111025  /*D1315 COPY DATA TO MONTHLY FILE */                                                                
392.00 111025  /*D1315*/   CPYF       FROMFILE(&WRKLIB/TXNCT1) +                                                   
393.00 111025                           TOFILE(&WRKLIB/TXNMCT1) MBROPT(*ADD)                                       
394.00 111025  /*D1315*/   MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
395.00 111025  /*D1315*/   CPYF       FROMFILE(&WRKLIB/TXNCT2) +                                                   
396.00 111025                           TOFILE(&WRKLIB/TXNMCT2) MBROPT(*ADD)                                       
397.00 111025  /*D1315*/   MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
398.00 60608                                                                                                      
399.00 60608                                                                                                      
400.00 60608     /* GENERATE DAILY TRANSACTION OF REMITTANCE/CASHIER ORDER/DEMAND DRAFT BY CUSTOMER REPORT */     
401.00 60608              CLRPFM     FILE(TXNRCD1)                                                                
402.00 60608              CLRPFM     FILE(TXNRCD2)                                                                
403.00 60608              CLRPFM     FILE(AMLDDNCRCD)                                                             
404.00 60608              CLRPFM     FILE(AMLDDOCRCD)                                                             
405.00 60608              CLRPFM     FILE(TXNRCDWRK1)                                                             
406.00 60608              CLRPFM     FILE(TXNRCDWRK2)                                                             
407.00 110113  /*D0339*/   CLRPFM     FILE(TXNRCDWRK3)                                                             
408.00 60608              OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
409.00 60608                           USRDTA(AMLDRCDTX1) SPLFNAME(AMLRCDRPT1) +                                  
410.00 60608                           SECURE(*YES)                                                               
411.00 60608              CALL       PGM(AML_GENRCD) PARM('R')                                                    
412.00 60608              OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
413.00 60608                           USRDTA(AMLDRCDTX2) SPLFNAME(AMLRCDRPT2) +                                  
414.00 60608                           SECURE(*YES)                                                               
415.00 60608              CALL       PGM(AML_GENRCD) PARM('O')                                                    
416.00 60608              DLTOVR     FILE(*ALL)                                                                   
417.00 100826  /* D0201 Start */                                                                                   
418.00 100825              CPYF       FROMFILE(&WRKLIB/TXNRCD1) +                                                  
419.00 100825                           TOFILE(&WRKLIB/TXNRCDM) MBROPT(*ADD)                                       
420.00 100825              MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
421.00 110527  /*D1160*/   CPYF       FROMFILE(&WRKLIB/TXNRCD1) +                                                  
422.00 110527                           TOFILE(&WRKLIB/TXNRCDM2) MBROPT(*ADD)                                      
423.00 110527  /*D1160*/   MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
424.00 101008              CPYF       FROMFILE(&WRKLIB/TXNRCD2) +                                                  
425.00 100825                           TOFILE(&WRKLIB/TXNRCDM) MBROPT(*ADD)                                       
426.00 100825              MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
427.00 110527  /*D1160*/   CPYF       FROMFILE(&WRKLIB/TXNRCD2) +                                                  
428.00 110527                           TOFILE(&WRKLIB/TXNRCDM2) MBROPT(*ADD)                                      
429.00 110527  /*D1160*/   MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
430.00 110603              CALL       PGM(&WRKLIB/EOUTRMT)                                                         
431.00 110603              CLRPFM     FILE(TXNRCDW)                                                                
432.00 110603              CLRPFM     FILE(AMLDDNCRCD)                                                             
433.00 110603              CLRPFM     FILE(AMLDDOCRCD)                                                             
434.00 110603              CLRPFM     FILE(TXNRCDWRK1)                                                             
435.00 110603              CLRPFM     FILE(TXNRCDWRK2)                                                             
436.00 110603  /*D0339*/   CLRPFM     FILE(TXNRCDWRK3)                                                             
437.00 110603  /*D1160     OVRPRTF    FILE(AMLRMTWK) SAVE(*YES) +  */                                              
438.00 110603  /*D1160*/   OVRPRTF    FILE(AMLRMTWK) OUTQ(RPTLIB/MISCOUQMIG) +                                     
439.00 110603                           SAVE(*YES) USRDTA(AMLDRCDTIM) +                                            
440.00 110603                           SPLFNAME(AMLRCDRPIM) SECURE(*YES)                                          
441.00 110603              CALL       PGM(AML_GENRMT) PARM('I' 'M')                                                
442.00 110603  /*D0339*/   CPYF       FROMFILE(&WRKLIB/TXNRCDWRK3) +                                               
443.00 110603  /*D0339*/                TOFILE(&WRKLIB/RMTRPTIM) MBROPT(*REPLACE) CRTFILE(*YES)                    
444.00 110603  /*D0339*/   MONMSG     MSGID(CPF2816 CPF2817) EXEC(CLRPFM FILE(RMTRPTIM))                           
445.00 110603              CLRPFM     FILE(TXNRCDW)                                                                
446.00 110603              CLRPFM     FILE(AMLDDNCRCD)                                                             
447.00 110603              CLRPFM     FILE(AMLDDOCRCD)                                                             
448.00 110603              CLRPFM     FILE(TXNRCDWRK1)                                                             
449.00 110603              CLRPFM     FILE(TXNRCDWRK2)                                                             
450.00 110603  /*D0339*/   CLRPFM     FILE(TXNRCDWRK3)                                                             
451.00 110603  /*D1160     OVRPRTF    FILE(AMLRMTWK) SAVE(*YES) + */                                               
452.00 110603  /*D1160*/   OVRPRTF    FILE(AMLRMTWK) OUTQ(RPTLIB/MISCOUQMIG) +                                     
453.00 110603                           SAVE(*YES) USRDTA(AMLDRCDTIQ) +                                            
454.00 110603                           SPLFNAME(AMLRCDRPIQ) SECURE(*YES)                                          
455.00 110603              CALL       PGM(AML_GENRMT) PARM('I' 'Q')                                                
456.00 110603  /*D0339*/   CPYF       FROMFILE(&WRKLIB/TXNRCDWRK3) +                                               
457.00 110603  /*D0339*/                TOFILE(&WRKLIB/RMTRPTIQ) MBROPT(*REPLACE) CRTFILE(*YES)                    
458.00 110603  /*D0339*/   MONMSG     MSGID(CPF2816 CPF2817) EXEC(CLRPFM FILE(RMTRPTIQ))                           
459.00 110603              CLRPFM     FILE(TXNRCDW)                                                                
460.00 110603              CLRPFM     FILE(AMLDDNCRCD)                                                             
461.00 110603              CLRPFM     FILE(AMLDDOCRCD)                                                             
462.00 110603              CLRPFM     FILE(TXNRCDWRK1)                                                             
463.00 110603              CLRPFM     FILE(TXNRCDWRK2)                                                             
464.00 110603  /*D0339*/   CLRPFM     FILE(TXNRCDWRK3)                                                             
465.00 110603  /*D1160     OVRPRTF    FILE(AMLRMTWK) SAVE(*YES) + */                                               
466.00 110603  /*D1160*/   OVRPRTF    FILE(AMLRMTWK) OUTQ(RPTLIB/MISCOUQMIG) +                                     
467.00 110603                           SAVE(*YES) USRDTA(AMLDRCDTIH) +                                            
468.00 110603                           SPLFNAME(AMLRCDRPIH) SECURE(*YES)                                          
469.00 110603              CALL       PGM(AML_GENRMT) PARM('I' 'H')                                                
470.00 110603  /*D0339*/   CPYF       FROMFILE(&WRKLIB/TXNRCDWRK3) +                                               
471.00 110603  /*D0339*/                TOFILE(&WRKLIB/RMTRPTIH) MBROPT(*REPLACE) CRTFILE(*YES)                    
472.00 110603  /*D0339*/   MONMSG     MSGID(CPF2816 CPF2817) EXEC(CLRPFM FILE(RMTRPTIH))                           
473.00 110603              CLRPFM     FILE(TXNRCDW)                                                                
474.00 110603              CLRPFM     FILE(AMLDDNCRCD)                                                             
475.00 110603              CLRPFM     FILE(AMLDDOCRCD)                                                             
476.00 110603              CLRPFM     FILE(TXNRCDWRK1)                                                             
477.00 110603              CLRPFM     FILE(TXNRCDWRK2)                                                             
478.00 110603  /*D0339*/   CLRPFM     FILE(TXNRCDWRK3)                                                             
479.00 110603  /*D1160     OVRPRTF    FILE(AMLRMTWK) SAVE(*YES) + */                                               
480.00 110603  /*D1160*/   OVRPRTF    FILE(AMLRMTWK) OUTQ(RPTLIB/MISCOUQMIG) +                                     
481.00 110603                           SAVE(*YES) USRDTA(AMLDRCDTOM) +                                            
482.00 110603                           SPLFNAME(AMLRCDRPOM) SECURE(*YES)                                          
483.00 110603              CALL       PGM(AML_GENRMT) PARM('O' 'M')                                                
484.00 110603  /*D0339*/   CPYF       FROMFILE(&WRKLIB/TXNRCDWRK3) +                                               
485.00 110603  /*D0339*/                TOFILE(&WRKLIB/RMTRPTOM) MBROPT(*REPLACE) CRTFILE(*YES)                    
486.00 110603  /*D0339*/   MONMSG     MSGID(CPF2816 CPF2817) EXEC(CLRPFM FILE(RMTRPTOM))                           
487.00 110603              CLRPFM     FILE(TXNRCDW)                                                                
488.00 110603              CLRPFM     FILE(AMLDDNCRCD)                                                             
489.00 110603              CLRPFM     FILE(AMLDDOCRCD)                                                             
490.00 110603              CLRPFM     FILE(TXNRCDWRK1)                                                             
491.00 110603              CLRPFM     FILE(TXNRCDWRK2)                                                             
492.00 110603  /*D0339*/   CLRPFM     FILE(TXNRCDWRK3)                                                             
493.00 110603  /*D1160     OVRPRTF    FILE(AMLRMTWK) SAVE(*YES) + */                                               
494.00 110603  /*D1160*/   OVRPRTF    FILE(AMLRMTWK) OUTQ(RPTLIB/MISCOUQMIG) +                                     
495.00 110603                           SAVE(*YES) USRDTA(AMLDRCDTOQ) +                                            
496.00 110603                           SPLFNAME(AMLRCDRPOQ) SECURE(*YES)                                          
497.00 110603              CALL       PGM(AML_GENRMT) PARM('O' 'Q')                                                
498.00 110603  /*D0339*/   CPYF       FROMFILE(&WRKLIB/TXNRCDWRK3) +                                               
499.00 110603  /*D0339*/                TOFILE(&WRKLIB/RMTRPTOQ) MBROPT(*REPLACE) CRTFILE(*YES)                    
500.00 110603  /*D0339*/   MONMSG     MSGID(CPF2816 CPF2817) EXEC(CLRPFM FILE(RMTRPTOQ))                           
501.00 110603              CLRPFM     FILE(TXNRCDW)                                                                
502.00 110603              CLRPFM     FILE(AMLDDNCRCD)                                                             
503.00 110603              CLRPFM     FILE(AMLDDOCRCD)                                                             
504.00 110603              CLRPFM     FILE(TXNRCDWRK1)                                                             
505.00 110603              CLRPFM     FILE(TXNRCDWRK2)                                                             
506.00 110603  /*D0339*/   CLRPFM     FILE(TXNRCDWRK3)                                                             
507.00 110603  /*D1160     OVRPRTF    FILE(AMLRMTWK) SAVE(*YES) + */                                               
508.00 110603  /*D1160*/   OVRPRTF    FILE(AMLRMTWK) OUTQ(RPTLIB/MISCOUQMIG) +                                     
509.00 110603                           SAVE(*YES) USRDTA(AMLDRCDTOH) +                                            
510.00 110603                           SPLFNAME(AMLRCDRPOH) SECURE(*YES)                                          
511.00 110603              CALL       PGM(AML_GENRMT) PARM('O' 'H')                                                
512.00 110603  /*D0339*/   CPYF       FROMFILE(&WRKLIB/TXNRCDWRK3) +                                               
513.00 110603  /*D0339*/                TOFILE(&WRKLIB/RMTRPTOH) MBROPT(*REPLACE) CRTFILE(*YES)                    
514.00 110603  /*D0339*/   MONMSG     MSGID(CPF2816 CPF2817) EXEC(CLRPFM FILE(RMTRPTOH))                           
515.00 110603              DLTOVR     FILE(*ALL)                                                                   
516.00 100826  /* D0201 End */                                                                                     
517.00 60608                                                                                                      
518.00 60608                                                                                                      
519.00 60608     /*GENERATE TIME DEPOSIT DAILY CASH TRANSACTION BY CUSTOMER REPORT*/                              
520.00 60608              CLRPFM     FILE(TXNTD1)                                                                 
521.00 60608              CLRPFM     FILE(TXNTD2)                                                                 
522.00 60608              CLRPFM     FILE(AMLDDNCTX)                                                              
523.00 60608              CLRPFM     FILE(AMLDDOCTX)                                                              
524.00 60608              CLRPFM     FILE(TXNTDWRK1)                                                              
525.00 60608              CLRPFM     FILE(TXNTDWRK2)                                                              
526.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNTDWRK1T)                                                     
527.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNTDWRK2T)                                                     
528.00 170606  /*D7196*/   CALL       PGM(AML_GENTD) PARM('R' 'C')                                                 
529.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNTDWRK1)                  +                               
530.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNTDWRK1T)                   +                               
531.00 170606  /*D7196*/              INCREL((*IF TDOFF *NE 'PER'))                +                               
532.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
533.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
534.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNTDWRK2)                  +                               
535.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNTDWRK2T)                   +                               
536.00 170606  /*D7196*/              INCREL((*IF TDOFF *NE 'PER'))                +                               
537.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
538.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
539.00 170606  /*D7196*/   OVRDBF     FILE(TXNTDWRK1) TOFILE(&WRKLIB/TXNTDWRK1T)                                   
540.00 170606  /*D7196*/   OVRDBF     FILE(TXNTDWRK2) TOFILE(&WRKLIB/TXNTDWRK2T)                                   
541.00 60608              OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
542.00 60608                         USRDTA(AMLDTDTXN1) SPLFNAME(AMLTDRPT1) +                                     
543.00 60608                         SECURE(*YES)                                                                 
544.00 170606  /*D7196*/   CALL       PGM(AML_GENTD) PARM('R' 'P')                                                 
545.00 170606  /*D7196*/   DLTOVR     FILE(TXNTDWRK1)                                                              
546.00 170606  /*D7196*/   DLTOVR     FILE(TXNTDWRK2)                                                              
547.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNTDWRK1T)                                                     
548.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNTDWRK2T)                                                     
549.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNTDWRK1)                  +                               
550.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNTDWRK1T)                   +                               
551.00 170606  /*D7196*/              INCREL((*IF TDOFF *EQ 'PER'))                +                               
552.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
553.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
554.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNTDWRK2)                  +                               
555.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNTDWRK2T)                   +                               
556.00 170606  /*D7196*/              INCREL((*IF TDOFF *EQ 'PER'))                +                               
557.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
558.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
559.00 170606  /*D7196*/   OVRDBF     FILE(TXNTDWRK1) TOFILE(&WRKLIB/TXNTDWRK1T)                                   
560.00 170606  /*D7196*/   OVRDBF     FILE(TXNTDWRK2) TOFILE(&WRKLIB/TXNTDWRK2T)                                   
561.00 170609  /*D7196*/   OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
562.00 170609                         USRDTA(AMLDTDTXN1) SPLFNAME(AMLTDSTF1 ) +                                    
563.00 170522                         SECURE(*YES)                                                                 
564.00 170606  /*D7196*/   CALL       PGM(AML_GENTD) PARM('R' 'P')                                                 
565.00 170606  /*D7196*/   DLTOVR     FILE(TXNTDWRK1)                                                              
566.00 170606  /*D7196*/   DLTOVR     FILE(TXNTDWRK2)                                                              
567.00 170606  /*D7196*/   CALL       PGM(AML_GENTD) PARM('O' 'C')                                                 
568.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNTDWRK1T)                                                     
569.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNTDWRK2T)                                                     
570.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNTDWRK1)                  +                               
571.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNTDWRK1T)                   +                               
572.00 170606  /*D7196*/              INCREL((*IF TDOFF *NE 'PER'))                +                               
573.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
574.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
575.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNTDWRK2)                  +                               
576.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNTDWRK2T)                   +                               
577.00 170606  /*D7196*/              INCREL((*IF TDOFF *NE 'PER'))                +                               
578.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
579.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
580.00 170606  /*D7196*/   OVRDBF     FILE(TXNTDWRK1) TOFILE(&WRKLIB/TXNTDWRK1T)                                   
581.00 170606  /*D7196*/   OVRDBF     FILE(TXNTDWRK2) TOFILE(&WRKLIB/TXNTDWRK2T)                                   
582.00 170606  /*D7196     CALL       PGM(AML_GENTD) PARM('R')             */                                      
583.00 60608              OVRPRTF    FILE(AMLDLYRPT) SAVE(*YES) +                                                 
584.00 60608                         USRDTA(AMLDTDTXN2) SPLFNAME(AMLTDRPT2) +                                     
585.00 60608                         SECURE(*YES)                                                                 
586.00 170606  /*D7196     CALL       PGM(AML_GENTD) PARM('O')             */                                      
587.00 170606  /*D7196*/   CALL       PGM(AML_GENTD) PARM('O' 'P')                                                 
588.00 60608              DLTOVR     FILE(*ALL)                                                                   
589.00 60608                                                                                                      
590.00 111025  /*D1315 COPY DATA TO MONTHLY FILE */                                                                
591.00 111025  /*D1315*/   CPYF       FROMFILE(&WRKLIB/TXNTD1) +                                                   
592.00 111025                           TOFILE(&WRKLIB/TXNMTD1) MBROPT(*ADD)                                       
593.00 111025  /*D1315*/   MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
594.00 111025  /*D1315*/   CPYF       FROMFILE(&WRKLIB/TXNTD2) +                                                   
595.00 111025                           TOFILE(&WRKLIB/TXNMTD2) MBROPT(*ADD)                                       
596.00 111025  /*D1315*/   MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
597.00 60608                                                                                                      
598.00 60608                                                                                                      
599.00 60608     /* ADD DAILY TXN TO WEEKLY TXN PF */                                                             
600.00 120921              CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
601.00 60519                           TOFILE(&WRKLIB/WLYTXN) MBROPT(*ADD) +                                      
602.00 60519                           INCREL((*IF DMARK *EQ 'RET') (*AND DSTAFF +                                
603.00 60519                           *EQ ' ') (*AND DCURSPF *EQ ' ') (*AND +                                    
604.00 120921                           DTXNRELF *EQ 'Y'))                                                         
605.00 120921              CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
606.00 60519                           TOFILE(&WRKLIB/WLYTXN1) MBROPT(*ADD) +                                     
607.00 60519                           INCREL((*IF DMARK *NE 'RET') (*AND DSTAFF +                                
608.00 60519                           *EQ ' ') (*AND DCURSPF *EQ ' ') (*AND +                                    
609.00 120921                           DTXNRELF *EQ 'Y'))                                                         
610.00 110221                                                                                                      
611.00 110221     /* D1057 ADD DAILY TXN FOR SCC CODE "LR" TO WEEKLY TXN PF */                                     
612.00 110221              CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
613.00 110221                           TOFILE(&WRKLIB/WLYTXN) MBROPT(*ADD) +                                      
614.00 110221                           INCREL((*IF DMARK *EQ 'RET') (*AND DSTAFF +                                
615.00 110221                           *EQ ' ') (*AND DCURSPF *EQ 'LR') (*AND +                                   
616.00 110221                           DTXNRELF *EQ 'Y'))                                                         
617.00 110221              CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
618.00 110221                           TOFILE(&WRKLIB/WLYTXN1) MBROPT(*ADD) +                                     
619.00 110221                           INCREL((*IF DMARK *NE 'RET') (*AND DSTAFF +                                
620.00 110221                           *EQ ' ') (*AND DCURSPF *EQ 'LR') (*AND +                                   
621.00 110221                           DTXNRELF *EQ 'Y'))                                                         
622.00 110221     /* D1057 END */                                                                                  
623.00 60908                                                                                                      
624.00 60908           /*ADD Z1 TXN TO WEEKLY TXN PF*/                                                            
625.00 120914              CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
626.00 60908                           TOFILE(&WRKLIB/WLYTXN) MBROPT(*ADD) +                                      
627.00 60908                           INCREL((*IF DMARK *EQ 'RET') (*AND DSTAFF +                                
628.00 60908                           *EQ ' ') (*AND DCURSPF *EQ 'Z1') (*AND +                                   
629.00 60908                           DTXNRELF *EQ 'Y'))                                                         
630.00 60908              CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
631.00 60908                           TOFILE(&WRKLIB/WLYTXN1) MBROPT(*ADD) +                                     
632.00 60908                           INCREL((*IF DMARK *NE 'RET') (*AND DSTAFF +                                
633.00 60908                           *EQ ' ') (*AND DCURSPF *EQ 'Z1') (*AND +                                   
634.00 60908                           DTXNRELF *EQ 'Y'))                                                         
635.00 140715  /*D4297   ADD Z2 TXN TO WEEKLY TXN PF*/                                                             
636.00 140715  /*D4297*/   CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
637.00 140715                           TOFILE(&WRKLIB/WLYTXN) MBROPT(*ADD) +                                      
638.00 140715                           INCREL((*IF DMARK *EQ 'RET') (*AND DSTAFF +                                
639.00 140715                           *EQ ' ') (*AND DCURSPF *EQ 'Z2') (*AND +                                   
640.00 140715                           DTXNRELF *EQ 'Y'))                                                         
641.00 140715  /*D4297*/   CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
642.00 140715                           TOFILE(&WRKLIB/WLYTXN1) MBROPT(*ADD) +                                     
643.00 140715                           INCREL((*IF DMARK *NE 'RET') (*AND DSTAFF +                                
644.00 140715                           *EQ ' ') (*AND DCURSPF *EQ 'Z2') (*AND +                                   
645.00 140715                           DTXNRELF *EQ 'Y'))                                                         
646.00 60608     /* ADD DAILY STAFF TXN TO WEEKLY STAFF TXN PF */                                                 
647.00 60602              CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
648.00 60519                           TOFILE(&WRKLIB/WLYTXNST) MBROPT(*ADD) +                                    
649.00 60519                           INCREL((*IF DMARK *EQ 'RET') (*AND DSTAFF +                                
650.00 60519                           *NE ' ') (*AND DTXNRELF *EQ 'Y'))                                          
651.00 60602              CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
652.00 60519                           TOFILE(&WRKLIB/WLYTXNST1) MBROPT(*ADD) +                                   
653.00 60519                           INCREL((*IF DMARK *NE 'RET') (*AND DSTAFF +                                
654.00 60519                           *NE ' ') (*AND DTXNRELF *EQ 'Y'))                                          
655.00 60608     /* ADD DAILY SCC TXN TO WEEKLY SCC TXN PF */                                                     
656.00 110221  /* D1057    CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
657.00 60519                           TOFILE(&WRKLIB/WLYTXNSCC) MBROPT(*ADD) +                                   
658.00 60519                           INCREL((*IF DMARK *EQ 'RET') (*AND +                                       
659.00 110221                           DCURSPF *NE ' ') (*AND DTXNRELF *EQ 'Y'))  */                              
660.00 110221  /* D1057    CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
661.00 60519                           TOFILE(&WRKLIB/WLYTXNSCC1) MBROPT(*ADD) +                                  
662.00 60519                           INCREL((*IF DMARK *NE 'RET') (*AND +                                       
663.00 110221                           DCURSPF *NE ' ') (*AND DTXNRELF *EQ 'Y'))  */                              
664.00 110221  /* D1057 */ CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
665.00 110221                           TOFILE(&WRKLIB/WLYTXNSCC) MBROPT(*ADD) +                                   
666.00 110221                           INCREL((*IF DMARK *EQ 'RET') (*AND +                                       
667.00 170331  /*D7121*/                DCURSPF *NE ' ') (*AND DTXNRELF *EQ 'Y'))                                  
668.00 170331  /*D7121                  DCURSPF *NE ' ') (*AND DTXNRELF *EQ 'Y') + */                              
669.00 170331  /*D7121                  (*AND DCURSPF *NE 'LR'))                   */                              
670.00 110221  /* D1057 */ CPYF       FROMFILE(&WRKLIB/AML_DLYTX) +                                                
671.00 110221                           TOFILE(&WRKLIB/WLYTXNSCC1) MBROPT(*ADD) +                                  
672.00 110221                           INCREL((*IF DMARK *NE 'RET') (*AND +                                       
673.00 170331  /*D7121*/                DCURSPF *NE ' ') (*AND DTXNRELF *EQ 'Y'))                                  
674.00 170331  /*D7121                  DCURSPF *NE ' ') (*AND DTXNRELF *EQ 'Y') + */                              
675.00 170331  /*D7121                  (*AND DCURSPF *NE 'LR'))                   */                              
676.00 120725  /* D2016 Start */                                                                                   
677.00 131105  /*D3390     CALL       PGM(AMLCHKDTE) PARM(&GENFLG)           */                                    
678.00 131105  /*D3390*/   CHGVAR     VAR(&DAYS) VALUE(06)                                                         
679.00 131105  /*D3390*/   CALL       PGM(AMLCHKDTE) PARM(&GENFLG &DAYS)                                           
680.00 120822              IF         COND(&GENFLG *EQ 'Y') THEN(DO)                                               
681.00 120725     /*GENERATE MONTHLY LARGE ACCUMULATED DEPOSIT IN CREDIT CARD ACCOUNT*/                            
682.00 120725              CLRPFM     FILE(TXNCD1)                                                                 
683.00 120725              CLRPFM     FILE(TXNCD2)                                                                 
684.00 120725              CLRPFM     FILE(AMLDDNCTX)                                                              
685.00 120725              CLRPFM     FILE(TXNMCDWRK1)                                                             
686.00 120725              CLRPFM     FILE(TXNMCDWRK2)                                                             
687.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNMCDWK1T)                                                     
688.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNMCDWK2T)                                                     
689.00 170606  /*D7196*/   CALL       PGM(AML_GMDCC) PARM('R' 'M' 'C')                                             
690.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNMCDWRK1)                 +                               
691.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNMCDWK1T)                   +                               
692.00 170606  /*D7196*/              INCREL((*IF CDCUPOFF *NE 'PER'))             +                               
693.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
694.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
695.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNMCDWRK2)                 +                               
696.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNMCDWK2T)                   +                               
697.00 170606  /*D7196*/              INCREL((*IF CDCUPOFF *NE 'PER'))             +                               
698.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
699.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
700.00 170606  /*D7196*/   OVRDBF     FILE(TXNMCDWRK1) TOFILE(&WRKLIB/TXNMCDWK1T)                                  
701.00 170606  /*D7196*/   OVRDBF     FILE(TXNMCDWRK2) TOFILE(&WRKLIB/TXNMCDWK2T)                                  
702.00 120725              OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
703.00 120725                           SAVE(*YES) USRDTA(AMLMACCTX1) +                                            
704.00 120725                           SPLFNAME(AMLMACCRP1) SECURE(*YES)                                          
705.00 170606  /*D7196     CALL       PGM(AML_GMDCC) PARM('R' 'M')                */                               
706.00 170606  /*D7196*/   CALL       PGM(AML_GMDCC) PARM('R' 'M' 'P')                                             
707.00 120725              OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
708.00 120725                           SAVE(*YES) USRDTA(AMLMACCTX2) +                                            
709.00 120725                           SPLFNAME(AMLMACCRP2) SECURE(*YES)                                          
710.00 170606  /*D7196     CALL       PGM(AML_GMDCC) PARM('O' 'M')                */                               
711.00 170606  /*D7196*/   CALL       PGM(AML_GMDCC) PARM('O' 'M' 'C')                                             
712.00 170606  /*D7196*/   CALL       PGM(AML_GMDCC) PARM('O' 'M' 'P')                                             
713.00 170606  /*D7196*/   DLTOVR     FILE(TXNMCDWRK1)                                                             
714.00 170606  /*D7196*/   DLTOVR     FILE(TXNMCDWRK2)                                                             
715.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNMCDWK1T)                                                     
716.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNMCDWK2T)                                                     
717.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNMCDWRK1)                 +                               
718.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNMCDWK1T)                   +                               
719.00 170606  /*D7196*/              INCREL((*IF CDCUPOFF *EQ 'PER'))             +                               
720.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
721.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
722.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNMCDWRK2)                 +                               
723.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNMCDWK2T)                   +                               
724.00 170606  /*D7196*/              INCREL((*IF CDCUPOFF *EQ 'PER'))             +                               
725.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
726.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
727.00 170606  /*D7196*/   OVRDBF     FILE(TXNMCDWRK1) TOFILE(&WRKLIB/TXNMCDWK1T)                                  
728.00 170606  /*D7196*/   OVRDBF     FILE(TXNMCDWRK2) TOFILE(&WRKLIB/TXNMCDWK2T)                                  
729.00 170606  /*D7196*/   OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
730.00 170420                           SAVE(*YES) USRDTA(AMLMACCTX1) +                                            
731.00 170609                           SPLFNAME(AMLMACCST1) SECURE(*YES)                                          
732.00 170606  /*D7196*/   CALL       PGM(AML_GMDCC) PARM('R' 'M' 'P')                                             
733.00 120725              DLTOVR     FILE(*ALL)                                                                   
734.00 120725                                                                                                      
735.00 120725     /*GENERATE QUARTERLY LARGE ACCUMULATED DEPOSIT IN CREDIT CARD ACCOUNT*/                          
736.00 120817  /* D2230*/  CALL       PGM(DICBSYMD) PARM(&CURDATD)                                                 
737.00 120817  /* D2230*/  CHGVAR     VAR(&CURDAT) VALUE(&CURDATD)                                                 
738.00 120822  /* D2230*/  CHGVAR     VAR(&QUAFLG) VALUE(%SST(&CURDAT 6 2))                                        
739.00 120817  /* D2230*/  IF         COND(&QUAFLG *EQ '01' *OR &QUAFLG *EQ '04' *OR +                             
740.00 120816                           &QUAFLG *EQ '07' *OR &QUAFLG *EQ '10') THEN(DO)                            
741.00 120725              CLRPFM     FILE(TXNCD1)                                                                 
742.00 120725              CLRPFM     FILE(TXNCD2)                                                                 
743.00 120725              CLRPFM     FILE(AMLDDNCTX)                                                              
744.00 120725              CLRPFM     FILE(TXNMCDWRK1)                                                             
745.00 120725              CLRPFM     FILE(TXNMCDWRK2)                                                             
746.00 120725              OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
747.00 120725                           SAVE(*YES) USRDTA(AMLQACCTX1) +                                            
748.00 120725                           SPLFNAME(AMLQACCRP1) SECURE(*YES)                                          
749.00 170609 /*D7196      CALL       PGM(AML_GMDCC) PARM('R' 'Q')                    */                           
750.00 170609 /*D7196*/    CALL       PGM(AML_GMDCC) PARM('R' 'Q' 'C')                                             
751.00 170609 /*D7196*/    CALL       PGM(AML_GMDCC) PARM('R' 'Q' 'P')                                             
752.00 120725              OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
753.00 120725                           SAVE(*YES) USRDTA(AMLQACCTX2) +                                            
754.00 120725                           SPLFNAME(AMLQACCRP2) SECURE(*YES)                                          
755.00 170609 /*D7196      CALL       PGM(AML_GMDCC) PARM('O' 'Q')                    */                           
756.00 170609 /*D7196*/    CALL       PGM(AML_GMDCC) PARM('O' 'Q' 'C')                                             
757.00 170609 /*D7196*/    CALL       PGM(AML_GMDCC) PARM('O' 'Q' 'P')                                             
758.00 120725              DLTOVR     FILE(*ALL)                                                                   
759.00 120817  /* D2230*/  ENDDO                                                                                   
760.00 120725              ENDDO                                                                                   
761.00 120725  /* D2016 End */                                                                                     
762.00 120725                                                                                                      
763.00 131105 /*D3390  Extract gift card daily transaction */                                                      
764.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLGFCDY)                                                       
765.00 131105 /*D3390*/    RUNSQLSTM  SRCFILE(&WRKLIB/QAMLRSRC) SRCMBR(EXTGFCDAT) +                                
766.00 131002                           COMMIT(*NONE)                                                              
767.00 131105 /*D3390*/    CPYF       FROMFILE(&WRKLIB/AMLGFCDY) +                                                 
768.00 131002                           TOFILE(&WRKLIB/AMLGFCMN) MBROPT(*ADD)                                      
769.00 131002                                                                                                      
770.00 131105 /*D3390  Generate gift card daily report */                                                          
771.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLDDGFCD)                                                      
772.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLGFCWRK)                                                      
773.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/TMPGFCD)                                                        
774.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP1) VALUE('DA')                                                     
775.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP2) VALUE('Y')                                                      
776.00 131108 /*D3390*/    OVRPRTF    FILE(AMLGFCDRP) OUTQ(RPTLIB/MISCOUQMIG) +                                    
777.00 131002                           SAVE(*YES) USRDTA(AMLGFCDYA) +                                             
778.00 131002                           SPLFNAME(AMLGFCDYA) SECURE(*YES)                                           
779.00 131105 /*D3390*/    CALL       PGM(AML_GFCD) PARM(&GFCDP1 &GFCDP2)                                          
780.00 131105 /*D3390  Generate gift card daily exception report */                                                
781.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLDDGFCD)                                                      
782.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLGFCWRK)                                                      
783.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/TMPGFCD)                                                        
784.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP1) VALUE('DE')                                                     
785.00 131108 /*D3390*/    OVRPRTF    FILE(AMLGFCDRP) OUTQ(RPTLIB/MISCOUQMIG) +                                    
786.00 131002                           SAVE(*YES) USRDTA(AMLGFCDYE) +                                             
787.00 131002                           SPLFNAME(AMLGFCDYE) SECURE(*YES)                                           
788.00 131105 /*D3390*/    CALL       PGM(AML_GFCD) PARM(&GFCDP1 &GFCDP2)                                          
789.00 131105 /*D3390*/    DLTOVR     FILE(*ALL)                                                                   
790.00 131002                                                                                                      
791.00 131105 /*D3390  Generate gift card Bi-weekly report */                                                      
792.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLDDGFCD)                                                      
793.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLGFCWRK)                                                      
794.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/TMPGFCD)                                                        
795.00 131105 /*D3390*/    CHGVAR     VAR(&DAYS) VALUE(15)                                                         
796.00 131105 /*D3390*/    CALL       PGM(AMLCHKDTE) PARM(&GENFLG &DAYS)                                           
797.00 131105 /*D3390*/    IF         COND(&GENFLG *EQ 'Y') THEN(DO)                                               
798.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP1) VALUE('BW')                                                     
799.00 131108 /*D3390*/    OVRPRTF    FILE(AMLGFCDRP) OUTQ(RPTLIB/MISCOUQMIG) +                                    
800.00 131002                           SAVE(*YES) USRDTA(AMLGFCBWF) +                                             
801.00 131002                           SPLFNAME(AMLGFCBWF) SECURE(*YES)                                           
802.00 131105 /*D3390*/    CALL       PGM(AML_GFCD) PARM(&GFCDP1 &GFCDP2)                                          
803.00 131105 /*D3390*/    DLTOVR     FILE(*ALL)                                                                   
804.00 131105 /*D3390*/    ENDDO                                                                                   
805.00 131002                                                                                                      
806.00 60517  READF:      RCVF       RCDFMT(TAP0011)                                                              
807.00 60517              MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(EXIT)) +                                     
808.00 60517                           /*END OF FILE*/                                                            
809.00 60608                                                                                                      
810.00 60608                                                                                                      
811.00 60529              IF         COND(&DSBK *EQ 1 *AND &DSWKFG='L') THEN(DO)                                  
812.00 60608     /*BACKUP LAST WEEK TXN */                                                                        
813.00 60519              CPYF       FROMFILE(&WRKLIB/AML_BKCURW) +                                               
814.00 60519                           TOFILE(&WRKLIB/AML_BKLSTW) MBROPT(*REPLACE)                                
815.00 60519              CLRPFM     FILE(&WRKLIB/AML_BKCURW)                                                     
816.00 60928              CLRPFM     FILE(&WRKLIB/WLYTXNF)                                                        
817.00 60928              CLRPFM     FILE(&WRKLIB/WLYTXNF1)                                                       
818.00 60517                                                                                                      
819.00 60608     /*GENERATE WEEKLY TXN REPORT */                                                                  
820.00 60518              CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
821.00 60518              CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
822.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNWKF)                                                      
823.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNWKF1)                                                     
824.00 60518              OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                                
825.00 60523                           USRDTA(AMLWLYTXN1) SPLFNAME(AMLWTXRPT1) +                                  
826.00 60518                           SECURE(*YES)                                                               
827.00 151126 /*D5416      CALL       PGM(AML_GENRPT) PARM('W06' 'R')               */                             
828.00 60523              OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                                
829.00 60523                           USRDTA(AMLWLYTXN2) SPLFNAME(AMLWTXRPT2) +                                  
830.00 60523                           SECURE(*YES)                                                               
831.00 151126 /*D5416      CALL       PGM(AML_GENRPT) PARM('W06' 'O')               */                             
832.00 60519              DLTOVR     FILE(*ALL)                                                                   
833.00 60926                                                                                                      
834.00 60926              RUNSQLSTM  SRCFILE(&WRKLIB/&SRCFILE) SRCMBR(CPYWTXDTA1) +                               
835.00 60926                         COMMIT(*NONE)                                                                
836.00 100825                                                                                                      
837.00 100826  /* D0201 Start */                                                                                   
838.00 100825              CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
839.00 100825              CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
840.00 100825              CLRPFM     FILE(&WRKLIB/WLYTXNWKF)                                                      
841.00 100825              CLRPFM     FILE(&WRKLIB/WLYTXNWKF1)                                                     
842.00 100825              OVRDBF     FILE(NARPARM) TOFILE(NARWK)                                                  
843.00 100825              OVRDBF     FILE(NARPARMLF1) TOFILE(NARWKLF1)                                            
844.00 100825              OVRDBF     FILE(NARPARMLF2) TOFILE(NARWKLF2)                                            
845.00 100825              OVRDBF     FILE(NARPARMLF3) TOFILE(NARWKLF3)                                            
846.00 100825              CALL       PGM(&WRKLIB/ESYSTXN)                                                         
847.00 100825              CPYF       FROMFILE(&WRKLIB/WLYTXN1) TOFILE(&WRKLIB/WLYTXN) +                           
848.00 100825                           MBROPT(*ADD)                                                               
849.00 100825              MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
850.00 110526  /*D1160     OVRPRTF    FILE(LRGTXTAWK) SAVE(*YES) + */                                              
851.00 110526  /*D1160*/   OVRPRTF    FILE(LRGTXTAWK) OUTQ(RPTLIB/MISCOUQMIG) +                                    
852.00 110526                           SAVE(*YES) USRDTA(AMLWLYTXNP) +                                            
853.00 110526                           SPLFNAME(AMLWTXRPTP) SECURE(*YES)                                          
854.00 100825              CALL       PGM(AML_GENWK) PARM('W06' 'P')                                               
855.00 110113  /*D0339*/   CPYF       FROMFILE(&WRKLIB/WLYTXNWKF) +                                                
856.00 110113  /*D0339*/                TOFILE(&WRKLIB/TXNRPTPSL) MBROPT(*REPLACE) CRTFILE(*YES)                   
857.00 110113  /*D0339*/   MONMSG     MSGID(CPF2816 CPF2817) EXEC(CLRPFM FILE(TXNRPTPSL))                          
858.00 100825              CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
859.00 100825              CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
860.00 100825              CLRPFM     FILE(&WRKLIB/WLYTXNWKF)                                                      
861.00 100825              CLRPFM     FILE(&WRKLIB/WLYTXNWKF1)                                                     
862.00 110526  /*D1160     OVRPRTF    FILE(LRGTXTAWK) SAVE(*YES) + */                                              
863.00 110526  /*D1160*/   OVRPRTF    FILE(LRGTXTAWK) OUTQ(RPTLIB/MISCOUQMIG) +                                    
864.00 110526                           SAVE(*YES) USRDTA(AMLWLYTXNN) +                                            
865.00 110526                           SPLFNAME(AMLWTXRPTN) SECURE(*YES)                                          
866.00 100825              CALL       PGM(AML_GENWK) PARM('W06' 'N')                                               
867.00 110113  /*D0339*/   CPYF       FROMFILE(&WRKLIB/WLYTXNWKF) +                                                
868.00 110113  /*D0339*/                TOFILE(&WRKLIB/TXNRPTNPSL) MBROPT(*REPLACE) CRTFILE(*YES)                  
869.00 110113  /*D0339*/   MONMSG     MSGID(CPF2816 CPF2817) EXEC(CLRPFM FILE(TXNRPTNPSL))                         
870.00 110610                                                                                                      
871.00 110610              CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
872.00 110610              CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
873.00 110610              CLRPFM     FILE(&WRKLIB/WLYTXNWKF)                                                      
874.00 110610              CLRPFM     FILE(&WRKLIB/WLYTXNWKF1)                                                     
875.00 131105  /*D1160     OVRPRTF    FILE(LRGTXTAWK) OUTQ(RPTLIB/MISCOUQMIG) + *D3390*/                           
876.00 131105  /*D3390*/   OVRPRTF    FILE(LRGTXTAWK) +                                                            
877.00 110610                           SAVE(*YES) USRDTA(AMLWLYTXRP) +                                            
878.00 110610                           SPLFNAME(AMLWTXRPTP) SECURE(*YES)                                          
879.00 110610              CALL       PGM(AML_GENWK) PARM('W06' 'P')                                               
880.00 110610              CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
881.00 110610              CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
882.00 110610              CLRPFM     FILE(&WRKLIB/WLYTXNWKF)                                                      
883.00 110610              CLRPFM     FILE(&WRKLIB/WLYTXNWKF1)                                                     
884.00 131105  /*D1160     OVRPRTF    FILE(LRGTXTAWK) OUTQ(RPTLIB/MISCOUQMIG) + *D3390*/                           
885.00 131105  /*D3390*/   OVRPRTF    FILE(LRGTXTAWK)  +                                                           
886.00 110610                           SAVE(*YES) USRDTA(AMLWLYTXRN) +                                            
887.00 110610                           SPLFNAME(AMLWTXRPTN) SECURE(*YES)                                          
888.00 110610              CALL       PGM(AML_GENWK) PARM('W06' 'N')                                               
889.00 110610                                                                                                      
890.00 100825              DLTOVR     FILE(*ALL)                                                                   
891.00 100826  /* D0201 End */                                                                                     
892.00 60926                                                                                                      
893.00 60608     /*CLEAR WEEKLY DATA FILE*/                                                                       
894.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXN)                                                         
895.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXN1)                                                        
896.00 60517                                                                                                      
897.00 60608     /*GENERATE WEEKLY SCC TXN REPORT */                                                              
898.00 150427     /* D5111 For SCC in B1/C7 */                                                                     
899.00 60519              CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
900.00 60519              CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
901.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNWKF)                                                      
902.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNWKF1)                                                     
903.00 160920 /*D6262      OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                                
904.00 60523                           USRDTA(AMLWLYSCC1) SPLFNAME(AMLWSCCRT1) +                                  
905.00 160920                           SECURE(*YES)                              */                               
906.00 170331 /*D7121*/    CPYF FROMFILE(&WRKLIB/WLYTXNSCC)                     +                                  
907.00 170302                     TOFILE(&WRKLIB/WYTXSCCT)                      +                                  
908.00 170302                     MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                    
909.00 170331 /*D7121*/    CPYF FROMFILE(&WRKLIB/WLYTXNSCC1)                    +                                  
910.00 170302                     TOFILE(&WRKLIB/WYTXSCC1T)                     +                                  
911.00 170302                     MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                    
912.00 170331 /*D7121*/    RUNSQLSTM  SRCFILE(QAMLRSRC) SRCMBR(WYTXUPDSQL) COMMIT(*NONE)                           
913.00 170331 /*D7121*/    OVRDBF     FILE(WLYTXNSCC ) TOFILE(&WRKLIB/WYTXSCCT)                                    
914.00 170331 /*D7121*/    OVRDBF     FILE(WLYTXNSCC1) TOFILE(&WRKLIB/WYTXSCC1T)                                   
915.00 160920              CALL       PGM(AML_GENRPT) PARM('W07' 'R')                                              
916.00 160920 /*D6262      OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                                
917.00 60523                           USRDTA(AMLWLYSCC2) SPLFNAME(AMLWSCCRT2) +                                  
918.00 160920                           SECURE(*YES)                              */                               
919.00 160920              CALL       PGM(AML_GENRPT) PARM('W07' 'O')                                              
920.00 60519              DLTOVR     FILE(*ALL)                                                                   
921.00 60926              RUNSQLSTM  SRCFILE(&WRKLIB/&SRCFILE) SRCMBR(CPYWTXDTA2) +                               
922.00 60926                         COMMIT(*NONE)                                                                
923.00 150416     /* GENERATE WEEKLY SCC TXN REPORT NOT B1/C7 */                                                   
924.00 150427 /*D5111*/    CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
925.00 150427 /*D5111*/    CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
926.00 150427 /*D5111*/    CLRPFM     FILE(&WRKLIB/WLYTXNWKF)                                                      
927.00 150427 /*D5111*/    CLRPFM     FILE(&WRKLIB/WLYTXNWKF1)                                                     
928.00 160825 /*D6262  D5111  OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                             
929.00 150427                           USRDTA(AMLWLYSCC3) SPLFNAME(AMLWSCCRT3) +                                  
930.00 160825                           SECURE(*YES)                                     */                        
931.00 170331 /*D7121*/    OVRDBF     FILE(WLYTXNSCC ) TOFILE(&WRKLIB/WYTXSCCT)                                    
932.00 170331 /*D7121*/    OVRDBF     FILE(WLYTXNSCC1) TOFILE(&WRKLIB/WYTXSCC1T)                                   
933.00 160920 /*D5111*/    CALL       PGM(AML_GENRPT) PARM('WA7' 'R')                                              
934.00 160825 /*D6262  D5111  OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                             
935.00 150427                           USRDTA(AMLWLYSCC4) SPLFNAME(AMLWSCCRT4) +                                  
936.00 160825                           SECURE(*YES)                                     */                        
937.00 160920 /*D5111*/    CALL       PGM(AML_GENRPT) PARM('WA7' 'O')                                              
938.00 160825 /*D5111*/    DLTOVR     FILE(*ALL)                                                                   
939.00 160825 /*D5111*/    RUNSQLSTM  SRCFILE(&WRKLIB/&SRCFILE) SRCMBR(CPYWTXDTA2) +                               
940.00 160825                         COMMIT(*NONE)                                                                
941.00 161011                                                                                                      
942.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
943.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
944.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWRK)                                                      
945.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWRK1)                                                     
946.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWKF)                                                      
947.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWKF1)                                                     
948.00 161011 /*D6262*/    OVRPRTF    FILE(LRGTXSCRPT) SAVE(*YES) +                                                
949.00 161124                           USRDTA(AMLWSCCRTA) SPLFNAME(AMLWSCCRTA) +                                  
950.00 161011                           OUTQ(RPTLIB/MISCOUQMIG) SECURE(*YES)                                       
951.00 170331 /*D7121*/    OVRDBF     FILE(WLYTXNSCC ) TOFILE(&WRKLIB/WYTXSCCT)                                    
952.00 170331 /*D7121*/    OVRDBF     FILE(WLYTXNSCC1) TOFILE(&WRKLIB/WYTXSCC1T)                                   
953.00 161011 /*D6262*/    CALL       PGM(AML_GENSCC) PARM('W07' 'R' 'P')                                          
954.00 161011 /*D6262*/    OVRPRTF    FILE(LRGTXSCRPT) SAVE(*YES) +                                                
955.00 161124                           USRDTA(AMLWSCCRTC) SPLFNAME(AMLWSCCRTC) +                                  
956.00 161011                           OUTQ(RPTLIB/MISCOUQMIG) SECURE(*YES)                                       
957.00 161011 /*D6262*/    CALL       PGM(AML_GENSCC) PARM('W07' 'O' 'P')                                          
958.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
959.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
960.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWKF)                                                      
961.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWKF1)                                                     
962.00 161011 /*D6262*/    OVRPRTF    FILE(LRGTXSCRPT) SAVE(*YES) +                                                
963.00 161124                           USRDTA(AMLWSCCRTB) SPLFNAME(AMLWSCCRTB) +                                  
964.00 161011                           OUTQ(RPTLIB/MISCOUQMIG) SECURE(*YES)                                       
965.00 161011 /*D6262*/    CALL       PGM(AML_GENSCC) PARM('W07' 'R' 'N')                                          
966.00 161011 /*D6262*/    OVRPRTF    FILE(LRGTXSCRPT) SAVE(*YES) +                                                
967.00 161124                           USRDTA(AMLWSCCRTD) SPLFNAME(AMLWSCCRTD) +                                  
968.00 161011                           OUTQ(RPTLIB/MISCOUQMIG) SECURE(*YES)                                       
969.00 161011 /*D6262*/    CALL       PGM(AML_GENSCC) PARM('W07' 'O' 'N')                                          
970.00 161011 /*D6262*/    DLTOVR     FILE(*ALL)                                                                   
971.00 161011 /*D6262*/                                                                                            
972.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
973.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
974.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWRK)                                                      
975.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWRK1)                                                     
976.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWKF)                                                      
977.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWKF1)                                                     
978.00 161011 /*D6262*/    OVRPRTF    FILE(LRGTXSCRPT) SAVE(*YES) +                                                
979.00 161124                           USRDTA(AMLWSCCRTK) SPLFNAME(AMLWSCCRTK) +                                  
980.00 161011                           OUTQ(RPTLIB/MISCOUQMIG) SECURE(*YES)                                       
981.00 170331 /*D7121*/    OVRDBF     FILE(WLYTXNSCC ) TOFILE(&WRKLIB/WYTXSCCT)                                    
982.00 170331 /*D7121*/    OVRDBF     FILE(WLYTXNSCC1) TOFILE(&WRKLIB/WYTXSCC1T)                                   
983.00 161011 /*D6262*/    CALL       PGM(AML_GENSCC) PARM('WA7' 'R' 'P')                                          
984.00 161011 /*D6262*/    OVRPRTF    FILE(LRGTXSCRPT) SAVE(*YES) +                                                
985.00 161124                           USRDTA(AMLWSCCRTM) SPLFNAME(AMLWSCCRTM) +                                  
986.00 161011                           OUTQ(RPTLIB/MISCOUQMIG) SECURE(*YES)                                       
987.00 161011 /*D6262*/    CALL       PGM(AML_GENSCC) PARM('WA7' 'O' 'P')                                          
988.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
989.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
990.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWKF)                                                      
991.00 161011 /*D6262*/    CLRPFM     FILE(&WRKLIB/WLYSCCWKF1)                                                     
992.00 161011 /*D6262*/    OVRPRTF    FILE(LRGTXSCRPT) SAVE(*YES) +                                                
993.00 170104                           USRDTA(AMLWSCCRTL) SPLFNAME(AMLWSCCRTL) +                                  
994.00 161011                           OUTQ(RPTLIB/MISCOUQMIG) SECURE(*YES)                                       
995.00 161011 /*D6262*/    CALL       PGM(AML_GENSCC) PARM('WA7' 'R' 'N')                                          
996.00 161011 /*D6262*/    OVRPRTF    FILE(LRGTXSCRPT) SAVE(*YES) +                                                
997.00 161124                           USRDTA(AMLWSCCRTN) SPLFNAME(AMLWSCCRTN) +                                  
998.00 161011                           OUTQ(RPTLIB/MISCOUQMIG) SECURE(*YES)                                       
999.00 161011 /*D6262*/    CALL       PGM(AML_GENSCC) PARM('WA7' 'O' 'N')                                          
1000.00 161011 /*D6262*/    DLTOVR     FILE(*ALL)                                                                   
1001.00 161011                                                                                                      
1002.00 161011 /*D6262*/    CPYF       FROMFILE(&WRKLIB/WLYTXNSCC) +                                                
1003.00 161011                           TOFILE(&WRKLIB/WLYTXNSCB) +                                                
1004.00 161011                           MBROPT(*REPLACE) CRTFILE(*YES)                                             
1005.00 161011 /*D6262*/    MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
1006.00 161011 /*D6262*/    CPYF       FROMFILE(&WRKLIB/WLYTXNSCC1) +                                               
1007.00 161011                           TOFILE(&WRKLIB/WLYTXNSC1B) +                                               
1008.00 161011                           MBROPT(*REPLACE) CRTFILE(*YES)                                             
1009.00 161011 /*D6262*/    MONMSG     MSGID(CPC2957 CPF2817 CPF2103)                                               
1010.00 60926                                                                                                      
1011.00 60608     /*CLEAR WEEKLY DATA FILE*/                                                                       
1012.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNSCC)                                                      
1013.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNSCC1)                                                     
1014.00 60519                                                                                                      
1015.00 60608     /*GENERATE WEEKLY STAFF TXN REPORT */                                                            
1016.00 60519              CLRPFM     FILE(&WRKLIB/AMLDDNCTX)                                                      
1017.00 60519              CLRPFM     FILE(&WRKLIB/AMLDDOCTX)                                                      
1018.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNWKF)                                                      
1019.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNWKF1)                                                     
1020.00 60519              OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                                
1021.00 60523                           USRDTA(AMLWLYSTF1) SPLFNAME(AMLWSTFRT1) +                                  
1022.00 60519                           SECURE(*YES)                                                               
1023.00 60523              CALL       PGM(AML_GENRPT) PARM('W08' 'R')                                              
1024.00 60523              OVRPRTF    FILE(LRGTXTARPT) SAVE(*YES) +                                                
1025.00 60523                           USRDTA(AMLWLYSTF2) SPLFNAME(AMLWSTFRT2) +                                  
1026.00 60523                           SECURE(*YES)                                                               
1027.00 60523              CALL       PGM(AML_GENRPT) PARM('W08' 'O')                                              
1028.00 60519              DLTOVR     FILE(*ALL)                                                                   
1029.00 60926              RUNSQLSTM  SRCFILE(&WRKLIB/&SRCFILE) SRCMBR(CPYWTXDTA3) +                               
1030.00 60926                         COMMIT(*NONE)                                                                
1031.00 60608     /*CLEAR WEEKLY DATA FILE*/                                                                       
1032.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNST)                                                       
1033.00 60519              CLRPFM     FILE(&WRKLIB/WLYTXNST1)                                                      
1034.00 60519                                                                                                      
1035.00 60608     /*GENERATE WEEKLY DEPOSIT IN CREDIT CARD ACCOUNT REPORT*/                                        
1036.00 60608              CLRPFM     FILE(AMLDDNCTX)                                                              
1037.00 60608              CLRPFM     FILE(TXNWCDWRK1)                                                             
1038.00 60608              CLRPFM     FILE(TXNWCDWRK2)                                                             
1039.00 120214  /*D2016*/   CLRPFM     FILE(TXNWCD1)                                                                
1040.00 120214  /*D2016*/   CLRPFM     FILE(TXNWCD2)                                                                
1041.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNWCDWK1T)                                                     
1042.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNWCDWK2T)                                                     
1043.00 170606  /*D7196*/   CALL       PGM(AML_GCDCC) PARM('R' 'C')                                                 
1044.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNWCDWRK1)                 +                               
1045.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNWCDWK1T)                   +                               
1046.00 170606  /*D7196*/              INCREL((*IF CDCUPOFF *NE 'PER'))             +                               
1047.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1048.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1049.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNWCDWRK2)                 +                               
1050.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNWCDWK2T)                   +                               
1051.00 170606  /*D7196*/              INCREL((*IF CDCUPOFF *NE 'PER'))             +                               
1052.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1053.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1054.00 170606  /*D7196*/   OVRDBF     FILE(TXNWCDWRK1) TOFILE(&WRKLIB/TXNWCDWK1T)                                  
1055.00 170606  /*D7196*/   OVRDBF     FILE(TXNWCDWRK2) TOFILE(&WRKLIB/TXNWCDWK2T)                                  
1056.00 60608              OVRPRTF    FILE(AML_CCRPT) SAVE(*YES) +                                                 
1057.00 60608                         USRDTA(AMLWCCTXN1) SPLFNAME(AMLWCCRPT1) +                                    
1058.00 60608                         SECURE(*YES)                                                                 
1059.00 170606  /*D7196     CALL       PGM(AML_GCDCC) PARM('R')                    */                               
1060.00 170606  /*D7196*/   CALL       PGM(AML_GCDCC) PARM('R' 'P')                                                 
1061.00 60608              OVRPRTF    FILE(AML_CCRPT) SAVE(*YES) +                                                 
1062.00 60608                         USRDTA(AMLWCCTXN2) SPLFNAME(AMLWCCRPT2) +                                    
1063.00 60608                         SECURE(*YES)                                                                 
1064.00 170606  /*D7196     CALL       PGM(AML_GCDCC) PARM('O')                    */                               
1065.00 170606  /*D7196*/   CALL       PGM(AML_GCDCC) PARM('O' 'C')                                                 
1066.00 170606  /*D7196*/   CALL       PGM(AML_GCDCC) PARM('O' 'P')                                                 
1067.00 170606  /*D7196*/   DLTOVR     FILE(TXNWCDWRK1)                                                             
1068.00 170606  /*D7196*/   DLTOVR     FILE(TXNWCDWRK2)                                                             
1069.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNWCDWRK1)                 +                               
1070.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNWCDWK1T)                   +                               
1071.00 170606  /*D7196*/              INCREL((*IF CDCUPOFF *EQ 'PER'))             +                               
1072.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1073.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1074.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNWCDWRK2)                 +                               
1075.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNWCDWK2T)                   +                               
1076.00 170606  /*D7196*/              INCREL((*IF CDCUPOFF *EQ 'PER'))             +                               
1077.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1078.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1079.00 170606  /*D7196*/   OVRDBF     FILE(TXNWCDWRK1) TOFILE(&WRKLIB/TXNWCDWK1T)                                  
1080.00 170606  /*D7196*/   OVRDBF     FILE(TXNWCDWRK2) TOFILE(&WRKLIB/TXNWCDWK2T)                                  
1081.00 170609  /*D7196*/   OVRPRTF    FILE(AML_CCRPT) SAVE(*YES) +                                                 
1082.00 170609                         USRDTA(AMLWCCTXN1) SPLFNAME(AMLWCCSTF1) +                                    
1083.00 170420                         SECURE(*YES)                                                                 
1084.00 170606  /*D7196*/   CALL       PGM(AML_GCDCC) PARM('R' 'P')                                                 
1085.00 170606  /*D7196*/   DLTOVR     FILE(TXNWCDWRK1)                                                             
1086.00 170606  /*D7196*/   DLTOVR     FILE(TXNWCDWRK2)                                                             
1087.00 111025                                                                                                      
1088.00 111025  /*D1315 COPY DATA TO MONTHLY FILE */                                                                
1089.00 120203  /*D1315*/ /*D2016   CPYF       FROMFILE(&WRKLIB/TXNWCD1) +                                          
1090.00 120203                           TOFILE(&WRKLIB/TXNMCD1) MBROPT(*ADD)  */                                   
1091.00 120203  /*D1315*/ /*D2016  MONMSG     MSGID(CPC2957 CPF2817 CPF2103)   */                                   
1092.00 120203  /*D1315*/ /*D2016  CPYF       FROMFILE(&WRKLIB/TXNWCD2) +                                           
1093.00 120203                           TOFILE(&WRKLIB/TXNMCD2) MBROPT(*ADD)  */                                   
1094.00 120203  /*D1315*/ /*D2016  MONMSG     MSGID(CPC2957 CPF2817 CPF2103)   */                                   
1095.00 60608     /*CLEAR TXN DEPOSIT FILE*/                                                                       
1096.00 120214  /*D2016     CLRPFM     FILE(TXNWCD1)                           */                                   
1097.00 120214  /*D2016     CLRPFM     FILE(TXNWCD2)                           */                                   
1098.00 60608              DLTOVR     FILE(*ALL)                                                                   
1099.00 60519                                                                                                      
1100.00 131105 /*D3390  Generate gift card weekly report */                                                         
1101.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLDDGFCD)                                                      
1102.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLGFCWRK)                                                      
1103.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/TMPGFCD)                                                        
1104.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP1) VALUE('WK')                                                     
1105.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP2) VALUE('Y')                                                      
1106.00 131108 /*D3390*/    OVRPRTF    FILE(AMLGFCDRP) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1107.00 131002                           SAVE(*YES) USRDTA(AMLGFCWKY) +                                             
1108.00 131002                           SPLFNAME(AMLGFCWKY) SECURE(*YES)                                           
1109.00 131105 /*D3390*/    CALL       PGM(AML_GFCD) PARM(&GFCDP1 &GFCDP2)                                          
1110.00 131105 /*D3390*/    DLTOVR     FILE(*ALL)                                                                   
1111.00 131002                                                                                                      
1112.00 60608              ENDDO                                                                                   
1113.00 60608              IF         COND(&DSBK *EQ 1 *AND &DSMOFG='L') THEN(DO)                                  
1114.00 60608                                                                                                      
1115.00 60608     /*GENERATE MONTHLY REPORT OF CREDIT CARD ACCOUNT WITH CREDIT BAL >=5,000*/                       
1116.00 60608              CLRPFM     AML_CRDNO                                                                    
1117.00 60608              CLRPFM     AML_CRDTX                                                                    
1118.00 60608              CLRPFM     CRDTX1                                                                       
1119.00 60608              CLRPFM     CRDTX2                                                                       
1120.00 60608              CLRPFM     AMLDDNCRCD                                                                   
1121.00 60608              CLRPFM     AMLDDOCRCD                                                                   
1122.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/CRDTX1T)                                                        
1123.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/CRDTX2T)                                                        
1124.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GCC) PARM('R' 'C')                                           
1125.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/CRDTX1   )                  +                               
1126.00 170606  /*D7196*/              TOFILE(&WRKLIB/CRDTX1T   )                   +                               
1127.00 170606  /*D7196*/              INCREL((*IF CTXOFF *NE 'PER'))               +                               
1128.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1129.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1130.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/CRDTX2   )                  +                               
1131.00 170606  /*D7196*/              TOFILE(&WRKLIB/CRDTX2T   )                   +                               
1132.00 170606  /*D7196*/              INCREL((*IF CTXOFF *NE 'PER'))               +                               
1133.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1134.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1135.00 170606  /*D7196*/   OVRDBF     FILE(CRDTX1   ) TOFILE(&WRKLIB/CRDTX1T   )                                   
1136.00 170606  /*D7196*/   OVRDBF     FILE(CRDTX2   ) TOFILE(&WRKLIB/CRDTX2T   )                                   
1137.00 60608              OVRPRTF    FILE(AML_CCRPT) SAVE(*YES) +                                                 
1138.00 60608                           USRDTA(AMLMCCTXN1) SPLFNAME(AMLMCCRPT1) +                                  
1139.00 60608                           SECURE(*YES)                                                               
1140.00 70104  /*6248      CALL       PGM(&WRKLIB/GETCCMBR) PARM(&DSDT) */                                         
1141.00 170606  /*D7196     CALL       PGM(&WRKLIB/AML_GCC) PARM('R')              */                               
1142.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GCC) PARM('R' 'P')                                           
1143.00 60608              OVRPRTF    FILE(AML_CCRPT) SAVE(*YES) +                                                 
1144.00 60608                           USRDTA(AMLMCCTXN2) SPLFNAME(AMLMCCRPT2) +                                  
1145.00 60608                           SECURE(*YES)                                                               
1146.00 170606  /*D7196     CALL       PGM(AML_GCC) PARM('O')                      */                               
1147.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GCC) PARM('O' 'C')                                           
1148.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GCC) PARM('O' 'P')                                           
1149.00 60925              CLRPFM     FILE(&WRKLIB/CTRNHS0P_P)                                                     
1150.00 170606  /*D7196*/   DLTOVR     FILE(CRDTX1   )                                                              
1151.00 170606  /*D7196*/   DLTOVR     FILE(CRDTX2   )                                                              
1152.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/CRDTX1   )                  +                               
1153.00 170606  /*D7196*/              TOFILE(&WRKLIB/CRDTX1T   )                   +                               
1154.00 170606  /*D7196*/              INCREL((*IF CTXOFF *EQ 'PER'))               +                               
1155.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1156.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1157.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/CRDTX2   )                  +                               
1158.00 170606  /*D7196*/              TOFILE(&WRKLIB/CRDTX2T   )                   +                               
1159.00 170606  /*D7196*/              INCREL((*IF CTXOFF *EQ 'PER'))               +                               
1160.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1161.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1162.00 170606  /*D7196*/   OVRDBF     FILE(CRDTX1   ) TOFILE(&WRKLIB/CRDTX1T   )                                   
1163.00 170606  /*D7196*/   OVRDBF     FILE(CRDTX2   ) TOFILE(&WRKLIB/CRDTX2T   )                                   
1164.00 170606  /*D7196*/   OVRPRTF    FILE(AML_CCRPT) SAVE(*YES) +                                                 
1165.00 170609                           USRDTA(AMLMCCTXN1) SPLFNAME(AMLMCCSTF1) +                                  
1166.00 170420                           SECURE(*YES)                                                               
1167.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GCC) PARM('R' 'P')                                           
1168.00 60608              DLTOVR     FILE(*ALL)                                                                   
1169.00 120117                                                                                                      
1170.00 120120  /*D2016*/   RUNSQLSTM  SRCFILE(&WRKLIB/&SRCFILE) SRCMBR(AMLCPCRNO) +                                
1171.00 120117                           COMMIT(*NONE)                                                              
1172.00 110526                                                                                                      
1173.00 160929  /*D1160 Phase II start */                                                                           
1174.00 160929  /*D6262 Personal */                                                                                 
1175.00 110527              CLRPFM     FILE(TXNRCD1)                                                                
1176.00 110527              CLRPFM     FILE(TXNRCD2)                                                                
1177.00 110527              CLRPFM     FILE(AMLDDNCRCD)                                                             
1178.00 110527              CLRPFM     FILE(AMLDDOCRCD)                                                             
1179.00 110527              CLRPFM     FILE(TXNRCDWRK1)                                                             
1180.00 110527              CLRPFM     FILE(TXNRCDWRK2)                                                             
1181.00 161031 /*D6262      OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1182.00 110527                           SAVE(*YES) USRDTA(AMLMRCDRM) +                                             
1183.00 161031                           SPLFNAME(AMLMRCDRM) SECURE(*YES)       */                                  
1184.00 161031 /*D6262*/    OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1185.00 161206                           SAVE(*YES) USRDTA(AMLMRCDRM1) +                                            
1186.00 161031                           SPLFNAME(AMLMRCDRM1) SECURE(*YES)                                          
1187.00 160929  /*D6262     CALL       PGM(AML_GENMLR) PARM('R' 'M')                     */                         
1188.00 160929  /*D6262*/   CALL       PGM(AML_GENMLR) PARM('R' 'M' 'P')                                            
1189.00 161031 /*D6262      OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1190.00 110527                           SAVE(*YES) USRDTA(AMLMRCDOM) +                                             
1191.00 161031                           SPLFNAME(AMLMRCDOM) SECURE(*YES)  */                                       
1192.00 161031 /*D6262*/    OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1193.00 161206                           SAVE(*YES) USRDTA(AMLMRCDOM1) +                                            
1194.00 161031                           SPLFNAME(AMLMRCDOM1) SECURE(*YES)                                          
1195.00 160929  /*D6262     CALL       PGM(AML_GENMLR) PARM('O' 'M')                     */                         
1196.00 160929  /*D6262*/   CALL       PGM(AML_GENMLR) PARM('O' 'M' 'P')                                            
1197.00 110527              DLTOVR     FILE(*ALL)                                                                   
1198.00 160929  /*D6262 Non-Personal */                                                                             
1199.00 160929  /*D6262 Start */                                                                                    
1200.00 160929              CLRPFM     FILE(TXNRCD1)                                                                
1201.00 160929              CLRPFM     FILE(TXNRCD2)                                                                
1202.00 160929              CLRPFM     FILE(AMLDDNCRCD)                                                             
1203.00 160929              CLRPFM     FILE(AMLDDOCRCD)                                                             
1204.00 160929              CLRPFM     FILE(TXNRCDWRK1)                                                             
1205.00 160929              CLRPFM     FILE(TXNRCDWRK2)                                                             
1206.00 161110              OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1207.00 161124                           SAVE(*YES) USRDTA(AMLMRCDRM2) +                                            
1208.00 161031                           SPLFNAME(AMLMRCDRM2) SECURE(*YES)                                          
1209.00 160929              CALL       PGM(AML_GENMLR) PARM('R' 'M' 'N')                                            
1210.00 161110              OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1211.00 161124                           SAVE(*YES) USRDTA(AMLMRCDOM2) +                                            
1212.00 161031                           SPLFNAME(AMLMRCDOM2) SECURE(*YES)                                          
1213.00 160929              CALL       PGM(AML_GENMLR) PARM('O' 'M' 'N')                                            
1214.00 160929              DLTOVR     FILE(*ALL)                                                                   
1215.00 160929  /*D6262 End */                                                                                      
1216.00 110530  /*Quarterly*/                                                                                       
1217.00 160929  /*D6262 Personal */                                                                                 
1218.00 120816              CHGVAR     VAR(&CURDAT) VALUE(&DSCDT)                                                   
1219.00 120816              CHGVAR     VAR(&QUAFLG) VALUE(%SST(&CURDAT 4 2))                                        
1220.00 110613  /*          IF         COND(&QUAFLG *EQ '03' *OR &QUAFLG *EQ '06' *OR +                             
1221.00 110613                           &QUAFLG *EQ '09' *OR &QUAFLG *EQ '12') THEN(DO) */                         
1222.00 110530              CLRPFM     FILE(TXNRCD1)                                                                
1223.00 110530              CLRPFM     FILE(TXNRCD2)                                                                
1224.00 110530              CLRPFM     FILE(AMLDDNCRCD)                                                             
1225.00 110530              CLRPFM     FILE(AMLDDOCRCD)                                                             
1226.00 110530              CLRPFM     FILE(TXNRCDWRK1)                                                             
1227.00 110530              CLRPFM     FILE(TXNRCDWRK2)                                                             
1228.00 161124 /*D6262      OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1229.00 110530                           SAVE(*YES) USRDTA(AMLMRCDRQ) +                                             
1230.00 161124                           SPLFNAME(AMLMRCDRQ) SECURE(*YES)        */                                 
1231.00 161124 /*D6262*/    OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1232.00 161124                           SAVE(*YES) USRDTA(AMLMRCDRQ) +                                             
1233.00 161124                           SPLFNAME(AMLMRCDRQ1) SECURE(*YES)                                          
1234.00 160929  /*D6262     CALL       PGM(AML_GENMLR) PARM('R' 'Q')                     */                         
1235.00 160929  /*D6262*/   CALL       PGM(AML_GENMLR) PARM('R' 'Q' 'P')                                            
1236.00 161124 /*D6262      OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1237.00 110530                           SAVE(*YES) USRDTA(AMLMRCDOQ) +                                             
1238.00 161124                           SPLFNAME(AMLMRCDOQ) SECURE(*YES)   */                                      
1239.00 161124 /*D6262*/    OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1240.00 161124                           SAVE(*YES) USRDTA(AMLMRCDOQ) +                                             
1241.00 161124                           SPLFNAME(AMLMRCDOQ1) SECURE(*YES)                                          
1242.00 160929  /*D6262     CALL       PGM(AML_GENMLR) PARM('O' 'Q')                     */                         
1243.00 160929  /*D6262*/   CALL       PGM(AML_GENMLR) PARM('O' 'Q' 'P')                                            
1244.00 110530              DLTOVR     FILE(*ALL)                                                                   
1245.00 160929  /*D6262 Non-Personal */                                                                             
1246.00 160929  /*D6262 Start*/                                                                                     
1247.00 160929              CHGVAR     VAR(&CURDAT) VALUE(&DSCDT)                                                   
1248.00 160929              CHGVAR     VAR(&QUAFLG) VALUE(%SST(&CURDAT 4 2))                                        
1249.00 160929              CLRPFM     FILE(TXNRCD1)                                                                
1250.00 160929              CLRPFM     FILE(TXNRCD2)                                                                
1251.00 160929              CLRPFM     FILE(AMLDDNCRCD)                                                             
1252.00 160929              CLRPFM     FILE(AMLDDOCRCD)                                                             
1253.00 160929              CLRPFM     FILE(TXNRCDWRK1)                                                             
1254.00 160929              CLRPFM     FILE(TXNRCDWRK2)                                                             
1255.00 160929              OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1256.00 161124                           SAVE(*YES) USRDTA(AMLMRCDRQ2) +                                            
1257.00 161124                           SPLFNAME(AMLMRCDRQ2) SECURE(*YES)                                          
1258.00 160929              CALL       PGM(AML_GENMLR) PARM('R' 'Q' 'N')                                            
1259.00 160929              OVRPRTF    FILE(AMLMNTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1260.00 161124                           SAVE(*YES) USRDTA(AMLMRCDOQ2) +                                            
1261.00 161124                           SPLFNAME(AMLMRCDOQ2) SECURE(*YES)                                          
1262.00 160929              CALL       PGM(AML_GENMLR) PARM('O' 'Q' 'N')                                            
1263.00 160929              DLTOVR     FILE(*ALL)                                                                   
1264.00 160929  /*D6262 End */                                                                                      
1265.00 110613  /*          ENDDO                                                        */                         
1266.00 110527  /*D1160 Phase II end */                                                                             
1267.00 111025                                                                                                      
1268.00 111025  /* D1315 Start */                                                                                   
1269.00 111025     /*GENERATE MONTHLY CASH TRANSACTIONS BY CUSTOMER REPORT*/                                        
1270.00 120817     /* D2230 Personal */                                                                             
1271.00 111025              CLRPFM     FILE(AMLDTLCNY)                                                              
1272.00 111025              CLRPFM     FILE(AMLDDOCRCD)                                                             
1273.00 111025              CLRPFM     FILE(AMLDDNCRCD)                                                             
1274.00 111110              CLRPFM     FILE(TXNMCTWRK1)                                                             
1275.00 111110              CLRPFM     FILE(TXNMCTWRK2)                                                             
1276.00 111025              CLRPFM     FILE(TXNCT1)                                                                 
1277.00 111025              CLRPFM     FILE(TXNCT2)                                                                 
1278.00 160825  /*D6262*/   CLRPFM     FILE(TXNCT1S)                                                                
1279.00 160825  /*D6262*/   CLRPFM     FILE(TXNCT2S)                                                                
1280.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('R' 'M' 'P' 'C')                                        
1281.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNMCTWR1T)                                                     
1282.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNMCTWR2T)                                                     
1283.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNMCTWRK1)                 +                               
1284.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNMCTWR1T)                   +                               
1285.00 170606  /*D7196*/              INCREL((*IF CTOFF *NE 'PER'))                +                               
1286.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1287.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1288.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNMCTWRK2)                 +                               
1289.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNMCTWR2T)                   +                               
1290.00 170606  /*D7196*/              INCREL((*IF CTOFF *NE 'PER'))                +                               
1291.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1292.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1293.00 170606  /*D7196*/   OVRDBF     FILE(TXNMCTWRK1) TOFILE(&WRKLIB/TXNMCTWR1T)                                  
1294.00 170606  /*D7196*/   OVRDBF     FILE(TXNMCTWRK2) TOFILE(&WRKLIB/TXNMCTWR2T)                                  
1295.00 111027              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1296.00 111027                           SAVE(*YES) USRDTA(AMLMCTTXN1) +                                            
1297.00 111027                           SPLFNAME(AMLMCTRPT1) SECURE(*YES)                                          
1298.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('R' 'M' 'P' 'P')                                        
1299.00 170606  /*D7196*/                                                                                           
1300.00 120817  /* D2230    CALL       PGM(AML_GENMCT) PARM('R' 'M')               */                               
1301.00 170413  /* D2230    CALL       PGM(AML_GENMCT) PARM('R' 'M' 'P')           +                                
1302.00 170606     D7196                                                           */                               
1303.00 111027              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1304.00 111027                           SAVE(*YES) USRDTA(AMLMCTTXN2) +                                            
1305.00 111027                           SPLFNAME(AMLMCTRPT2) SECURE(*YES)                                          
1306.00 120817  /* D2230    CALL       PGM(AML_GENMCT) PARM('O' 'M')               */                               
1307.00 170420  /* D2230    CALL       PGM(AML_GENMCT) PARM('O' 'M' 'P')           +                                
1308.00 170606     D7196                                                           */                               
1309.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('O' 'M' 'P' 'C')                                        
1310.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('O' 'M' 'P' 'P')                                        
1311.00 170606  /*D7196*/                                                                                           
1312.00 170606  /*D7196*/   DLTOVR     FILE(*ALL)                                                                   
1313.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNMCTWR1T)                                                     
1314.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/TXNMCTWR2T)                                                     
1315.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNMCTWRK1)                 +                               
1316.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNMCTWR1T)                   +                               
1317.00 170606  /*D7196*/              INCREL((*IF CTOFF *EQ 'PER'))                +                               
1318.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1319.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1320.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/TXNMCTWRK2)                 +                               
1321.00 170606  /*D7196*/              TOFILE(&WRKLIB/TXNMCTWR2T)                   +                               
1322.00 170606  /*D7196*/              INCREL((*IF CTOFF *EQ 'PER'))                +                               
1323.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1324.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1325.00 170606  /*D7196*/   OVRDBF     FILE(TXNMCTWRK1) TOFILE(&WRKLIB/TXNMCTWR1T)                                  
1326.00 170606  /*D7196*/   OVRDBF     FILE(TXNMCTWRK2) TOFILE(&WRKLIB/TXNMCTWR2T)                                  
1327.00 170609  /*D7196*/   OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1328.00 170522                           SAVE(*YES) USRDTA(AMLMCTTXN1) +                                            
1329.00 170609                           SPLFNAME(AMLMCTSTF1) SECURE(*YES)                                          
1330.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('R' 'M' 'P' 'P')                                        
1331.00 111025              DLTOVR     FILE(*ALL)                                                                   
1332.00 111025                                                                                                      
1333.00 120817     /* D2230 Start Non-personal */                                                                   
1334.00 120810              CLRPFM     FILE(AMLDTLCNY)                                                              
1335.00 120810              CLRPFM     FILE(AMLDDOCRCD)                                                             
1336.00 120810              CLRPFM     FILE(AMLDDNCRCD)                                                             
1337.00 120810              CLRPFM     FILE(TXNMCTWRK1)                                                             
1338.00 120810              CLRPFM     FILE(TXNMCTWRK2)                                                             
1339.00 120810              CLRPFM     FILE(TXNCT1)                                                                 
1340.00 120810              CLRPFM     FILE(TXNCT2)                                                                 
1341.00 160825  /*D6262*/   CLRPFM     FILE(TXNCT1S)                                                                
1342.00 160825  /*D6262*/   CLRPFM     FILE(TXNCT2S)                                                                
1343.00 120810              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1344.00 120810                           SAVE(*YES) USRDTA(AMLMCTTXN3) +                                            
1345.00 120810                           SPLFNAME(AMLMCTRPT3) SECURE(*YES)                                          
1346.00 170606  /*D7196     CALL       PGM(AML_GENMCT) PARM('R' 'M' 'N')       */                                   
1347.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('R' 'M' 'N' 'C')                                        
1348.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('R' 'M' 'N' 'P')                                        
1349.00 120810              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1350.00 120810                           SAVE(*YES) USRDTA(AMLMCTTXN4) +                                            
1351.00 120810                           SPLFNAME(AMLMCTRPT4) SECURE(*YES)                                          
1352.00 170606  /*D7196     CALL       PGM(AML_GENMCT) PARM('O' 'M' 'N')       */                                   
1353.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('O' 'M' 'N' 'C')                                        
1354.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('O' 'M' 'N' 'P')                                        
1355.00 120810              DLTOVR     FILE(*ALL)                                                                   
1356.00 120817     /* D2230 End */                                                                                  
1357.00 120810                                                                                                      
1358.00 120817  /* D2230*/  IF         COND(&QUAFLG *EQ '03' *OR &QUAFLG *EQ '06' *OR +                             
1359.00 120816                           &QUAFLG *EQ '09' *OR &QUAFLG *EQ '12') THEN(DO)                            
1360.00 111025     /*GENERATE QUARTERLY CASH TRANSACTIONS BY CUSTOMER REPORT*/                                      
1361.00 120817     /* D2230 Personal */                                                                             
1362.00 111025              CLRPFM     FILE(AMLDTLCNY)                                                              
1363.00 111025              CLRPFM     FILE(AMLDDOCRCD)                                                             
1364.00 111025              CLRPFM     FILE(AMLDDNCRCD)                                                             
1365.00 111110              CLRPFM     FILE(TXNMCTWRK1)                                                             
1366.00 111110              CLRPFM     FILE(TXNMCTWRK2)                                                             
1367.00 111025              CLRPFM     FILE(TXNCT1)                                                                 
1368.00 111025              CLRPFM     FILE(TXNCT2)                                                                 
1369.00 160825  /*D6262*/   CLRPFM     FILE(TXNCT1S)                                                                
1370.00 160825  /*D6262*/   CLRPFM     FILE(TXNCT2S)                                                                
1371.00 120103              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1372.00 120813                           SAVE(*YES) USRDTA(AMLQCTTXN1) +                                            
1373.00 120813                           SPLFNAME(AMLQCTRPT1) SECURE(*YES)                                          
1374.00 120817  /* D2230    CALL       PGM(AML_GENMCT) PARM('R' 'Q')               */                               
1375.00 170606  /* D2230 D7196   CALL       PGM(AML_GENMCT) PARM('R' 'Q' 'P')      */                               
1376.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('R' 'Q' 'P' 'C')                                        
1377.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('R' 'Q' 'P' 'P')                                        
1378.00 170502                                                                                                      
1379.00 120103              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1380.00 120813                           SAVE(*YES) USRDTA(AMLQCTTXN2) +                                            
1381.00 120813                           SPLFNAME(AMLQCTRPT2) SECURE(*YES)                                          
1382.00 120817  /* D2230    CALL       PGM(AML_GENMCT) PARM('O' 'Q')               */                               
1383.00 170606  /* D2230 D7196   CALL       PGM(AML_GENMCT) PARM('O' 'Q' 'P')      */                               
1384.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('O' 'Q' 'P' 'C')                                        
1385.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('O' 'Q' 'P' 'P')                                        
1386.00 111110              DLTOVR     FILE(*ALL)                                                                   
1387.00 111025                                                                                                      
1388.00 120817     /* D2230 Start Non-Personal */                                                                   
1389.00 120810              CLRPFM     FILE(AMLDTLCNY)                                                              
1390.00 120810              CLRPFM     FILE(AMLDDOCRCD)                                                             
1391.00 120810              CLRPFM     FILE(AMLDDNCRCD)                                                             
1392.00 120810              CLRPFM     FILE(TXNMCTWRK1)                                                             
1393.00 120810              CLRPFM     FILE(TXNMCTWRK2)                                                             
1394.00 120810              CLRPFM     FILE(TXNCT1)                                                                 
1395.00 120810              CLRPFM     FILE(TXNCT2)                                                                 
1396.00 160825  /*D6262*/   CLRPFM     FILE(TXNCT1S)                                                                
1397.00 160825  /*D6262*/   CLRPFM     FILE(TXNCT2S)                                                                
1398.00 120810              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1399.00 120813                           SAVE(*YES) USRDTA(AMLQCTTXN3) +                                            
1400.00 120813                           SPLFNAME(AMLQCTRPT3) SECURE(*YES)                                          
1401.00 170606  /*D7196     CALL       PGM(AML_GENMCT) PARM('R' 'Q' 'N')       */                                   
1402.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('R' 'Q' 'N' 'C')                                        
1403.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('R' 'Q' 'N' 'P')                                        
1404.00 120810              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1405.00 120813                           SAVE(*YES) USRDTA(AMLQCTTXN4) +                                            
1406.00 120813                           SPLFNAME(AMLQCTRPT4) SECURE(*YES)                                          
1407.00 170606  /*D7196     CALL       PGM(AML_GENMCT) PARM('O' 'Q' 'N')       */                                   
1408.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('O' 'Q' 'N' 'C')                                        
1409.00 170606  /*D7196*/   CALL       PGM(AML_GENMCT) PARM('O' 'Q' 'N' 'P')                                        
1410.00 120810              DLTOVR     FILE(*ALL)                                                                   
1411.00 120817  /* D2230*/  ENDDO                                                                                   
1412.00 120817     /*D2230 End */                                                                                   
1413.00 120810                                                                                                      
1414.00 111025     /*GENERATE TIME DEPOSIT MONTHLY CASH TRANSACTION BY CUSTOMER REPORT*/                            
1415.00 111025              CLRPFM     FILE(TXNTD1)                                                                 
1416.00 111025              CLRPFM     FILE(TXNTD2)                                                                 
1417.00 111025              CLRPFM     FILE(AMLDDNCTX)                                                              
1418.00 111025              CLRPFM     FILE(AMLDDOCTX)                                                              
1419.00 111110              CLRPFM     FILE(TXNMTDWRK1)                                                             
1420.00 111110              CLRPFM     FILE(TXNMTDWRK2)                                                             
1421.00 120103              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1422.00 111027                           SAVE(*YES) USRDTA(AMLMTDTXN1) +                                            
1423.00 111027                           SPLFNAME(AMLMTDRPT1) SECURE(*YES)                                          
1424.00 120810              CALL       PGM(AML_GENMTD) PARM('R' 'M')                                                
1425.00 120103              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1426.00 111027                           SAVE(*YES) USRDTA(AMLMTDTXN2) +                                            
1427.00 111027                           SPLFNAME(AMLMTDRPT2) SECURE(*YES)                                          
1428.00 111025              CALL       PGM(AML_GENMTD) PARM('O' 'M')                                                
1429.00 111025              DLTOVR     FILE(*ALL)                                                                   
1430.00 111025                                                                                                      
1431.00 120817  /* D2230*/  IF         COND(&QUAFLG *EQ '03' *OR &QUAFLG *EQ '06' *OR +                             
1432.00 120816                           &QUAFLG *EQ '09' *OR &QUAFLG *EQ '12') THEN(DO)                            
1433.00 111025     /*GENERATE TIME DEPOSIT QUARTERLY CASH TRANSACTION BY CUSTOMER REPORT*/                          
1434.00 111025              CLRPFM     FILE(TXNTD1)                                                                 
1435.00 111025              CLRPFM     FILE(TXNTD2)                                                                 
1436.00 111025              CLRPFM     FILE(AMLDDNCTX)                                                              
1437.00 111025              CLRPFM     FILE(AMLDDOCTX)                                                              
1438.00 111110              CLRPFM     FILE(TXNMTDWRK1)                                                             
1439.00 111110              CLRPFM     FILE(TXNMTDWRK2)                                                             
1440.00 120103              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1441.00 111027                           SAVE(*YES) USRDTA(AMLQTDTXN1) +                                            
1442.00 111027                           SPLFNAME(AMLQTDRPT1) SECURE(*YES)                                          
1443.00 111025              CALL       PGM(AML_GENMTD) PARM('R' 'Q')                                                
1444.00 120103              OVRPRTF    FILE(AMLMCTRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1445.00 111027                           SAVE(*YES) USRDTA(AMLQTDTXN2) +                                            
1446.00 111027                           SPLFNAME(AMLQTDRPT2) SECURE(*YES)                                          
1447.00 111025              CALL       PGM(AML_GENMTD) PARM('O' 'Q')                                                
1448.00 111025              DLTOVR     FILE(*ALL)                                                                   
1449.00 120817  /* D2230*/  ENDDO                                                                                   
1450.00 111025                                                                                                      
1451.00 111025     /*GENERATE QUARTERLY CREDIT CARD ACCOUNTS WITH CREDIT BALANCE >= 10000*/                         
1452.00 111025              CLRPFM     AML_CRDNO                                                                    
1453.00 111025              CLRPFM     AML_CRDTX                                                                    
1454.00 111025              CLRPFM     CRDTX1                                                                       
1455.00 111025              CLRPFM     CRDTX2                                                                       
1456.00 111025              CLRPFM     AMLDDNCRCD                                                                   
1457.00 111025              CLRPFM     AMLDDOCRCD                                                                   
1458.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/CRDTX1T)                                                        
1459.00 170606  /*D7196*/   CLRPFM     FILE(&WRKLIB/CRDTX2T)                                                        
1460.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GMCC) PARM('R' 'Q' 'C')                                      
1461.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/CRDTX1   )                  +                               
1462.00 170606  /*D7196*/              TOFILE(&WRKLIB/CRDTX1T   )                   +                               
1463.00 170606  /*D7196*/              INCREL((*IF CTXOFF *NE 'PER'))                +                              
1464.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1465.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1466.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/CRDTX2   )                  +                               
1467.00 170606  /*D7196*/              TOFILE(&WRKLIB/CRDTX2T   )                   +                               
1468.00 170606  /*D7196*/              INCREL((*IF CTXOFF *NE 'PER'))                +                              
1469.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1470.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1471.00 170606  /*D7196*/   OVRDBF     FILE(CRDTX1   ) TOFILE(&WRKLIB/CRDTX1T   )                                   
1472.00 170606  /*D7196*/   OVRDBF     FILE(CRDTX2   ) TOFILE(&WRKLIB/CRDTX2T   )                                   
1473.00 120103              OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
1474.00 111027                           SAVE(*YES) USRDTA(AMLQCCTXN1) +                                            
1475.00 111027                           SPLFNAME(AMLQCCRPT1) SECURE(*YES)                                          
1476.00 170606  /*D7196     CALL       PGM(AML_GMCC) PARM('R' 'Q')                 */                               
1477.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GMCC) PARM('R' 'Q' 'P')                                      
1478.00 120103              OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
1479.00 111027                           SAVE(*YES) USRDTA(AMLQCCTXN2) +                                            
1480.00 111027                           SPLFNAME(AMLQCCRPT2) SECURE(*YES)                                          
1481.00 170606  /*D7196     CALL       PGM(AML_GMCC) PARM('O' 'Q')                 */                               
1482.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GMCC) PARM('O' 'Q' 'C')                                      
1483.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GMCC) PARM('O' 'Q' 'P')                                      
1484.00 170606  /*D7196*/   DLTOVR     FILE(CRDTX1   )                                                              
1485.00 170606  /*D7196*/   DLTOVR     FILE(CRDTX2   )                                                              
1486.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/CRDTX1   )                  +                               
1487.00 170606  /*D7196*/              TOFILE(&WRKLIB/CRDTX1T   )                   +                               
1488.00 170606  /*D7196*/              INCREL((*IF CTXOFF *EQ 'PER'))               +                               
1489.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1490.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1491.00 170606  /*D7196*/   CPYF       FROMFILE(&WRKLIB/CRDTX2   )                  +                               
1492.00 170606  /*D7196*/              TOFILE(&WRKLIB/CRDTX2T   )                   +                               
1493.00 170606  /*D7196*/              INCREL((*IF CTXOFF *EQ 'PER'))               +                               
1494.00 170606  /*D7196*/              MBROPT(*REPLACE) CRTFILE(*YES) FMTOPT(*NOCHK)                                
1495.00 170606  /*D7196*/   MONMSG     MSGID(CPF2869 CPF2817)                                                       
1496.00 170606  /*D7196*/   OVRDBF     FILE(CRDTX1   ) TOFILE(&WRKLIB/CRDTX1T   )                                   
1497.00 170606  /*D7196*/   OVRDBF     FILE(CRDTX2   ) TOFILE(&WRKLIB/CRDTX2T   )                                   
1498.00 170606  /*D7196*/   OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
1499.00 170420                           SAVE(*YES) USRDTA(AMLQCCTXN1) +                                            
1500.00 170609                           SPLFNAME(AMLQCCSTF1) SECURE(*YES)                                          
1501.00 170606  /*D7196*/   CALL       PGM(&WRKLIB/AML_GMCC) PARM('R' 'Q' 'P')                                      
1502.00 111025              DLTOVR     FILE(*ALL)                                                                   
1503.00 111025                                                                                                      
1504.00 111025   /*GENERATE SEMI-ANNUALLY CREDIT CARD ACCOUNTS WITH CREDIT BALANCE >= 50000*/                       
1505.00 111025              CLRPFM     AML_CRDNO                                                                    
1506.00 111025              CLRPFM     AML_CRDTX                                                                    
1507.00 111025              CLRPFM     CRDTX1                                                                       
1508.00 111025              CLRPFM     CRDTX2                                                                       
1509.00 111025              CLRPFM     AMLDDNCRCD                                                                   
1510.00 111025              CLRPFM     AMLDDOCRCD                                                                   
1511.00 120103              OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
1512.00 111027                           SAVE(*YES) USRDTA(AMLSCCTXN1) +                                            
1513.00 111027                           SPLFNAME(AMLSCCRPT1) SECURE(*YES)                                          
1514.00 160825   /*D6262    CALL       PGM(AML_GMCC) PARM('R' 'S')                     */                           
1515.00 120103              OVRPRTF    FILE(AML_MCCRPT) OUTQ(RPTLIB/MISCOUQMIG) +                                   
1516.00 111027                           SAVE(*YES) USRDTA(AMLSCCTXN2) +                                            
1517.00 111027                           SPLFNAME(AMLSCCRPT2) SECURE(*YES)                                          
1518.00 160825   /*D6262    CALL       PGM(AML_GMCC) PARM('O' 'S')                     */                           
1519.00 111025              DLTOVR     FILE(*ALL)                                                                   
1520.00 111025  /* D1315 End */                                                                                     
1521.00 60608                                                                                                      
1522.00 131105 /*D3390  Generate gift card Bi-weekly report */                                                      
1523.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLDDGFCD)                                                      
1524.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLGFCWRK)                                                      
1525.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/TMPGFCD)                                                        
1526.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP1) VALUE('BW')                                                     
1527.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP2) VALUE('L')                                                      
1528.00 131108 /*D3390*/    OVRPRTF    FILE(AMLGFCDRP) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1529.00 131113                           SAVE(*YES) USRDTA(AMLGFCBWF) +                                             
1530.00 131113                           SPLFNAME(AMLGFCBWF) SECURE(*YES)                                           
1531.00 131105 /*D3390*/    CALL       PGM(AML_GFCD) PARM(&GFCDP1 &GFCDP2)                                          
1532.00 131105 /*D3390  Generate gift card Monthly report */                                                        
1533.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLDDGFCD)                                                      
1534.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/AMLGFCWRK)                                                      
1535.00 131105 /*D3390*/    CLRPFM     FILE(&WRKLIB/TMPGFCD)                                                        
1536.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP1) VALUE('MN')                                                     
1537.00 131105 /*D3390*/    CHGVAR     VAR(&GFCDP2) VALUE('Y')                                                      
1538.00 131108 /*D3390*/    OVRPRTF    FILE(AMLGFCDRP) OUTQ(RPTLIB/MISCOUQMIG) +                                    
1539.00 131002                           SAVE(*YES) USRDTA(AMLGFCMNY) +                                             
1540.00 131002                           SPLFNAME(AMLGFCMNY) SECURE(*YES)                                           
1541.00 131105 /*D3390*/    CALL       PGM(AML_GFCD) PARM(&GFCDP1 &GFCDP2)                                          
1542.00 131105 /*D3390*/    DLTOVR     FILE(*ALL)                                                                   
1543.00 131002                                                                                                      
1544.00 60608              ENDDO                                                                                   
1545.00 60517              GOTO       CMDLBL(READF)                                                                
1546.00 60516                                                                                                      
1547.00 60516 /***********************END MAIN CL**********************************************/                   
1548.00 60517  EXIT:       IF         COND(&WRKLADD *EQ 'Y') THEN(RMVLIBLE +                                       
1549.00 60517                           LIB(&WRKLIB))                                                              
1550.00 160829              DLTF       FILE(&WRKLIB/PST001B)                                                        
1551.00 60524              IF         COND(&IMODADD *EQ 'Y') THEN(RMVLIBLE +                                       
1552.00 60524                           LIB(&IMODUL))                                                              
1553.00 70104              IF         COND(&CRDADD *EQ 'Y') THEN(RMVLIBLE +                                        
1554.00 70104                           LIB(&CRDLIB))                                                              
1555.00 60516              IF         COND(&DB1ADD *EQ 'Y') THEN(RMVLIBLE +                                        
1556.00 60516                           LIB(&ICBSBCMDB1))                                                          
1557.00 60908              IF         COND(&DB0ADD *EQ 'Y') THEN(RMVLIBLE +                                        
1558.00 60908                           LIB(&ICBSBCMDB0))                                                          
1559.00 60608              IF         COND(&CARDADD *EQ 'Y') THEN(RMVLIBLE +                                       
1560.00 60608                           LIB(&ZCARD))                                                               
1561.00 60608              IF         COND(&SRMADD *EQ 'Y') THEN(RMVLIBLE +                                        
1562.00 60608                           LIB(&IMODICCSRM))                                                          
1563.00 60901              IF         COND(&ZCUSADD *EQ 'Y') THEN(RMVLIBLE +                                       
1564.00 60901                           LIB(&ZCUSPRO))                                                             
1565.00 60908              IF         COND(&I700ADD *EQ 'Y') THEN(RMVLIBLE +                                       
1566.00 60908                           LIB(&I700BCM))                                                             
1567.00 60908              IF         COND(&OPGADD *EQ 'Y') THEN(RMVLIBLE +                                        
1568.00 60908                           LIB(&ZOPGLIB))                                                             
1569.00 160721 /*D6219*/      IF COND(&RMVZOTRMAP *EQ 'Y') THEN(RMVLIBLE LIB(&ZOTRMAPP))                            
1570.00 60516 ENDPGM                                                                                               
1571.00 60516                                                                                                      
1572.00 60516                                                                                                      
