1.00 0       *¬   TA0601 - Create Cheque Book Order                                                        
2.00 0       *¬                                                                                            
3.00 0       *¬ ?************************** Change Log ***************************?   ?                    
4.00 0       *¬ ?Project ID??Pgmr?? Date  ??Project Description                   ?   ?                    
5.00 0       *¬  XXXXXXXXXX  XXX   XXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                         
6.00 0       *¬  R255        RAL   21May98  Dealer Management (UK)                                         
7.00 0       *¬  RETRO9801A  LJV   23Jun98  MASS MOVE OF CODE FROM I9702                                   
8.00 0       *¬  RETRO9801   PEH   05Jan99  Retrofitting code from prior release                           
9.00 0       *¬                             to I9801.00                                                    
10.00 0       *¬¬?*****************************************************************?   ?                    
11.00 0      F*   PROB NBR  PGMR  PROBLEM DESCRIPTION                         *                             
12.00 0      F*     REL97   MJB   Items found in the I9702.00 release         *                             
13.00 0      F*     Q313    LJV   Withholding tax liability and rate          *                             
14.00 0      F*                    calculation                                *                             
15.00 0      F*     Q414    AXR   Cheque Books and Special Answer             *                             
16.00 0      F*                    Processing                                 *                             
17.00 0      F*     Q315    IOD   Periodic service fees                       *                             
18.00 0      F*¬¬-------------------------------------------------------------*                             
19.00 170814       *   Reference No. : CHG-0266-17 (D7266)                         *                             
20.00 170609       *   User ID       : BI77                                        *                             
21.00 170609       *   User Name     : Myles Ieong                                 *                             
22.00 170609       *   Changed Date  : 09 Jun 2017                                 *                             
23.00 170609       *   Changes       : Call module CQNACCM to general record for   *                             
24.00 170609       *                   cheque requisition                          *                             
25.00 170609       *******************************************************************                           
26.00 0      FTA0601FM  CF   E             WORKSTN                                                          
27.00 0      F                                     INFDS(WSDTAS)                                            
28.00 0      F*                                                                                             
29.00 990105 RETROF*AP002    IF   E           K DISK                                                             
30.00 0      F*       CHEQUE BOOK ORDER FILE                                                                
31.00 990105 RETROFTAP002    UF   E           K DISK                                                             
32.00 990105 RETROF*       Transaction Account Master File                                                       
33.00 0      F*                                                                                             
34.00 0      FCFP280    IF   E           K DISK                                                             
35.00 0      F*       COMMON FILE - CHEQUE BOOK STYLE                                                       
36.00 0      F*                                                                                             
37.00 0      FTAP032    UF   E           K DISK                                                             
38.00 0      F*       CHEQUE BOOK DETAIL FILE                                                               
39.00 0      F*                                                                                             
40.00 0      FTAP033    O    E           K DISK                                                             
41.00 0      F*       CHEQUE BOOK ORDER FILE                                                                
42.00 0      F*                                                                                             
43.00 0      FTAP001    IF   E           K DISK                                                             
44.00 0      F*       TRANSACTION BANK CONTROL                                                              
45.00 0      F*                                                                                             
46.00 0      FTAT30001  O    E           K DISK                                                             
47.00 0      F*       CHEQUE BOOK MAINT LOG BOOK                                                            
48.00 0      F*                                                                                             
49.00 0      F*---------------------------------------------------------------*                             
50.00 0      F* ID F  C  M  L    FUNCTION OF INDICATORS                                                     
51.00 0      F* 03            COMMAND KEY 3 - EXIT PROGRAM                                                  
52.00 0      F* 04            COMMAND KEY 4 - PROMPT                                                        
53.00 0      F* 12            COMMAND KEY 12 - CANCEL / RESTART SETUP                                       
54.00 0      F*---------------------------------------------------------------*                             
55.00 0       /COPY CFSORC,SRW000                                                                           
56.00 0      D*---------------------------------------------------------------*                             
57.00 0      D**TAP001  AB  11  16 C                                                                        
58.00 0      D**/COPY TASORC,TASS011I                                                                       
59.00 0      D*                                                                                             
60.00 0      D*       FILE INFO DATA STRUCTURE - WORKSTATION                                                
61.00 0      D*                                                                                             
62.00 0      D WSDTAS          DS                                                                           
63.00 0      D  WSID                 197    206                                                             
64.00 0      D  CSRLOC               370    371B 0                                                          
65.00 0      D*                                                                                             
66.00 0      D                SDS                                                                           
67.00 0      D  DHUSER               254    263                                                             
68.00 0      D*                                                                                             
69.00 0      D                 DS                                                                           
70.00 0      D  DRBFEE                 1     13  2                                                          
71.00 0      D  SCBFEE                 1     13  0                                                          
72.00 0      D*                                                                                             
73.00 0      D                 DS                                                                           
74.00 0      D  DRBTAX                 1     13  2                                                          
75.00 0      D  SCBTAX                 1     13  0                                                          
76.00 0      D*                                                                                             
77.00 0      D*                                                                                             
78.00 0      D/COPY CFSORC,CFLDA                                                                            
79.00 0      D*                                                                                             
80.00 0       *COPY CFSORC,SRW000I                                                                          
81.00 0       /COPY CFSORC,SRC000                                                                           
82.00 0      C*                                                                                             
83.00 0      C*****************************************************************                             
84.00 0      C*         DEFINE INPUT/OUTPUT PARAMET                           *                             
85.00 0      C*****************************************************************                             
86.00 0      C*                                                                                             
87.00 0      C     *ENTRY        PLIST                                                                      
88.00 0      C                   PARM                    G5BK                                               
89.00 0      C                   PARM                    G5TYP                                              
90.00 0      C                   PARM                    G5ACCT                                             
91.00 0      C                   PARM                    G5ORDN                                             
92.00 0      C                   PARM                    PRRTN             1                                
93.00 0      C*                                                                                             
94.00 0      C*** CHEQUE BOOK ORDER NUMBER PARAMETER                                                        
95.00 0      C*                                                                                             
96.00 0      C     PARM01        PLIST                                                                      
97.00 0      C                   PARM                    P1BK              3 0                              
98.00 0      C                   PARM                    P1ORDN           12 0                              
99.00 0      C                   PARM                    P1STAT            3 0                              
100.00 0      C*                                                                                             
101.00 0      C     PARM02        PLIST                                                                      
102.00 0      C                   PARM                    C1WORK            1             WORK FIELD         
103.00 0      C                   PARM                    C1RVAL           10             RET VALUE          
104.00 0      C                   PARM                    C1ERCD            1             ERROR CODE         
105.00 0      C*                                                                                             
106.00 0      C*---------------------------------------------------------------*                             
107.00 0      C*     KEY FIELD DEFINITIONS                                     *                             
108.00 0      C*---------------------------------------------------------------*                             
109.00 0      C*                                                                                             
110.00 0      C*** SEARCH KEY FOR TRANSACTION FILE                                                           
111.00 0      C*                                                                                             
112.00 0      C     TAKEY         KLIST                                                                      
113.00 0      C                   KFLD                    G5BK                           BANK NUMBER         
114.00 0      C                   KFLD                    G5TYP                          ACCOUNT TYPE        
115.00 0      C                   KFLD                    G5ACCT                         ACCOUNT NO.         
116.00 0      C*                                                                                             
117.00 0      C*** SEARCH KEY FOR CHEQUE BOOK STYLE FILE                                                     
118.00 0      C*                                                                                             
119.00 0      C     CFK280        KLIST                                                                      
120.00 0      C                   KFLD                    G5BK                           BANK NUMBER         
121.00 0      C                   KFLD                    DRCBST                         CHK BK STYLE        
122.00 0      C*                                                                                             
123.00 0      C     *LIKE         DEFINE    DRBK          G5BK                                               
124.00 0      C     *LIKE         DEFINE    DRTYP         G5TYP                                              
125.00 0      C     *LIKE         DEFINE    DRACCT        G5ACCT                                             
126.00 0      C     *LIKE         DEFINE    DRORDN        G5ORDN                                             
127.00 0      C*                                                                                             
128.00 0      C*---------------------------------------------------------------*                             
129.00 0      C*** INITIALIZATION ROUTINE                                                                    
130.00 0      C*---------------------------------------------------------------*                             
131.00 0      C*                                                                                             
132.00 0      C***  CLEAR ERROR MESSAGE FILE                                                                 
133.00 0      C*                                                                                             
134.00 0      C                   MOVEL     '*'           MSGQ                           MESSAGE FILE        
135.00 0      C                   EXSR      CLRERR                                                           
136.00 0      C*                                                                                             
137.00 0      C***  CLEAR CHEQUE BOOK RECORD                                                                 
138.00 0      C*                                                                                             
139.00 0      C                   CLEAR                   TAP0331                                            
140.00 0      C                   CLEAR                   T26010                                             
141.00 0      C*                                                                                             
142.00 0      C*** RETRIEVE BANK CONTROL RECORD                                                              
143.00 0      C*                                                                                             
144.00 0      C     DMBK          CHAIN     TAP001                             70                            
145.00 0      C*                                                                                             
146.00 0      C*** RETRIEVE ACCOUNT MASTER RECORD                                                            
147.00 0      C*                                                                                             
148.00 0      C                   Z-ADD     G5ACCT        DRACCT                                             
149.00 0      C     TAKEY         CHAIN     TAP0021                            70                            
150.00 0      C*                                                                                             
151.00 0      C*** RETRIEVE CHEQUE ORDER DETAIL RECORD                                                       
152.00 0      C*                                                                                             
153.00 0      C     TAKEY         CHAIN     TAP0321                            70                            
154.00 0      C*                                                                                             
155.00 0      C*** MOVE INITIAL VALUE                                                                        
156.00 0      C*                                                                                             
157.00 0      C                   MOVE      DMCBST        DRCBST                                             
158.00 0      C                   Z-ADD     DMORDR        DRORDR                                             
159.00 0      C                   Z-ADD     DMCDSP        DRCDSP                                             
160.00 0      C*                                                                                             
161.00 0      C*** RETRIEVE CHEQUE BOOK STYLE RECORD (COMMON FILE)                                           
162.00 0      C*                                                                                             
163.00 0      C                   MOVE      *OFF          *IN96                                              
164.00 0      C     CFK280        CHAIN     CFP2801                            70                            
165.00 0      C*                                                                                             
166.00 0      C*** CALCULATE/CHECK NEXT CHECK NUMBER                                                         
167.00 0      C*                                                                                             
168.00 0      C     DRORDR        MULT      CFCKBK        XXCHKS            8 0                              
169.00 0      C                   ADD       DMCBHN        XXCHKS                                             
170.00 0      C     XXCHKS        IFGT      9999999                                                          
171.00 0      C                   Z-ADD     1             SCSTAR                                             
172.00 0      C                   ELSE                                                                       
173.00 0      C     DMCBHN        ADD       1             SCSTAR                                             
174.00 0      C                   END                                                                        
175.00 0      C*                                                                                             
176.00 0      C*** Set indicator to protect starting number entry,                                           
177.00 0      C*                                                                                             
178.00 0      C     CFCKBK        IFEQ      0                                                                
179.00 0      C                   MOVE      *ON           *IN96                                              
180.00 0      C                   ENDIF                                                                      
181.00 0      C*                                                                                             
182.00 0      C*** CALCULATE TOTAL FEE AND TAX (AMT * NO. OF BOOKS)                                          
183.00 0      C*                                                                                             
184.00 0      C     DRORDR        MULT      CFBFEE        DRBFEE                                             
185.00 0      C     DRORDR        MULT      CFBTAX        DRBTAX                                             
186.00 0      C*                                                                                             
187.00 0      C*****************************************************************                             
188.00 0      C*    MAIN ROUTINE                                                                             
189.00 0      C*****************************************************************                             
190.00 0      C*                                                                                             
191.00 0      C*    RESET ERROR INDICATORS                                                                   
192.00 0      C*                                                                                             
193.00 0      C                   MOVEA     '0000000'     *IN(20)                                            
194.00 0      C                   MOVEA     '00'          *IN(98)                                            
195.00 0      C                   MOVE      ' '           ERRFLG            1                                
196.00 0      C                   MOVE      ' '           PRRTN                                              
197.00 0      C*                                                                                             
198.00 0      C*    DISPLAY/ACCEPT CHECK BOOK INFORMATION                                                    
199.00 0      C*                                                                                             
200.00 0      C     ERRFLG        DOUEQ     ' '                                                              
201.00 0      C                   EXSR      SCRN01                                       FIRST SCREEN        
202.00 0      C     *IN03         CABEQ     '1'           ENDJOB                         END PGM             
203.00 0      C     *IN12         CABEQ     '1'           ENDJOB                         END-1ST SCRN        
204.00 0      C     *IN97         CABEQ     '1'           ENDJOB                         NO ORDER NUM        
205.00 0      C                   END                                                    END ERRFLG          
206.00 0      C*                                                                                             
207.00 0      C*---------------------------------------------------------------*                             
208.00 0      C*    ADD/UPDATE RECORD                                                                        
209.00 0      C*---------------------------------------------------------------*                             
210.00 0      C*                                                                                             
211.00 0      C*** ADD CHEQUE BOOK ORDER                                                                     
212.00 0      C*                                                                                             
213.00 0      C                   MOVE      G5BK          DRBK                           BANK                
214.00 0      C                   Z-ADD     G5TYP         DRTYP                          ACCT TYPE           
215.00 0      C                   Z-ADD     0             DRSTAT                         ORDER STAT          
216.00 0      C  N96              Z-ADD     SCSTAR        DRFRNG                         FROM RANGE          
217.00 0      C                   Z-ADD     *ZEROS        SCAL6             6 0                              
218.00 0      C                   Z-ADD     DSCDT         FRCAL                          * DATE TO JULIA     
219.00 0      C                   EXSR      SRP001                                                           
220.00 0      C                   Z-ADD     TOJUL         DRDORD                         DATE ORDERED        
221.00 0      C                   Z-ADD     1             DRCOUT                         CHARGE OUTSTAND     
222.00 0      C*                                                                                             
223.00 0      C*** GET NEXT ORDER NUMBER                                                                     
224.00 0      C*                                                                                             
225.00 0      C                   Z-ADD     0             P1ORDN                                             
226.00 0      C                   Z-ADD     70            P1STAT                                             
227.00 0      C                   MOVE      G5BK          P1BK                           BANK                
228.00 0      C                   CALL      'CB0100'      PARM01                                             
229.00 0      C                   Z-ADD     P1ORDN        DRORDN                                             
230.00 0      C*                                                                                             
231.00 0      C*** CHECK IF CHEQUE BOOK ACCT NUMBERING HAS BEEN SET UP                                       
232.00 0      C*                                                                                             
233.00 0      C     P1STAT        IFEQ      99                                                               
234.00 0      C                   MOVEL     'TA05032'     MSGID                                              
235.00 0      C                   EXSR      SNDERR                                                           
236.00 0      C                   MOVE      '1'           *IN97                                              
237.00 0      C                   WRITE     SFLCTLM                                                          
238.00 0      C                   EXFMT     T26010                                       WRITE/READ          
239.00 0      C                   GOTO      ENDJOB                                                           
240.00 0      C                   END                                                                        
241.00 0      C*                                                                                             
242.00 0      C                   MOVE      CFDIB         DRDIB                                              
243.00 0      C*                                                                                             
244.00 0      C                   WRITE     TAP0331                                                          
245.00 170814 D7266C*                                                                                             
246.00 170814 D7266C*** Write record to CQNACCPF through module                                                   
247.00 170814 D7266C*                                                                                             
248.00 170814 D7266C                   CALL      'CQNACCM'                                                        
249.00 170814 D7266C                   PARM      'CRT'         PACT                                               
250.00 170814 D7266C                   PARM      DMACCT        PACCT                          Account             
251.00 170814 D7266C                   PARM      DRCBST        PCBST                          Cheque book style   
252.00 170814 D7266C                   PARM      DRORDR        PORDR                          Nbr of books        
253.00 170814 D7266C                   PARM      SCSTAR        PSTAR                          Nbr start from      
254.00 170814 D7266C                   PARM                    PSTS                                               
255.00 170814      C                                                                                              
256.00 0      C*                                                                                             
257.00 0      C*** UPDATE CHEQUE BOOK DETAIL FILE                                                            
258.00 0      C*                                                                                             
259.00 0      C                   Z-ADD     1             DMOOUT                         ORDER OUTSTANDI     
260.00 0      C                   UPDATE    TAP0321                                                          
261.00 990105 Q414 C                   If        DMCBOC = 1                                   Auto reorder        
262.00 990105 RETRO *  Set DMBIT3 in TAP002 to indicate that order requested                                      
263.00 990105 RETROC                   Biton     '1'           DMBIT3                                             
264.00 990105 RETROC                   EXCEPT    T2BITS                                                           
265.00 990105 Q414 C                   Endif                                                                      
266.00 0      C***                                                                                           
267.00 0      C*** WRITE MAINT LOG RECORD - OLD                                                              
268.00 0      C***                                                                                           
269.00 0      C                   Z-ADD     DRDORD        DMLMTN                                             
270.00 0      C                   MOVE      '3'           DSOLNW                                             
271.00 0      C                   TIME                    TIMEST                                             
272.00 0      C                   WRITE     TAT3001                                                          
273.00 0      C*---------------------------------------------------------------*                             
274.00 0      C*    END OF JOB ROUTINE                                                                       
275.00 0      C*---------------------------------------------------------------*                             
276.00 0      C*                                                                                             
277.00 0      C     ENDJOB        TAG                                                                        
278.00 0      C*                                                                                             
279.00 0      C                   MOVE      '1'           *INLR                                              
280.00 0      C     *IN03         IFEQ      '1'                                                              
281.00 0      C                   MOVE      '3'           PRRTN                                              
282.00 0      C                   END                                                                        
283.00 0      C     *IN12         IFEQ      '1'                                                              
284.00 0      C                   MOVE      'C'           PRRTN                                              
285.00 0      C                   END                                                                        
286.00 0      C*                                                                                             
287.00 0      C*****************************************************************                             
288.00 0      C*    ADD NEW CHEQUE BOOK RECORD                                                               
289.00 0      C*****************************************************************                             
290.00 0      C*                                                                                             
291.00 0      C     SCRN01        BEGSR                                                                      
292.00 0      C*                                                                                             
293.00 0      C*    WRITE/READ SCREEN                                                                        
294.00 0      C*                                                                                             
295.00 0      C     ADDREC        TAG                                                                        
296.00 0      C                   WRITE     SFLCTLM                                                    0     
297.00 0      C                   EXFMT     T26010                                       WRITE/READ          
298.00 0      C*                                                                                             
299.00 0      C                   MOVEA     '0000000'     *IN(20)                                            
300.00 0      C                   MOVEA     '00'          *IN(98)                                            
301.00 0      C                   MOVE      ' '           ERRFLG                         RESET ERROR         
302.00 0      C*                                                                                             
303.00 0      C***  CLEAR ERROR MESSAGE FILE                                                                 
304.00 0      C*                                                                                             
305.00 0      C                   MOVEL     '*'           MSGQ                           MESSAGE FILE        
306.00 0      C                   EXSR      CLRERR                                                           
307.00 0      C*                                                                                             
308.00 0      C     SCSTAR        IFLT      DMCBHN                                                           
309.00 0      C     SCSTAR        ANDGT     *ZEROS                                                           
310.00 0      C                   MOVE      '1'           *IN99                                              
311.00 0      C                   MOVEL     'TA05031'     MSGID                                              
312.00 0      C                   EXSR      SNDERR                                                           
313.00 0      C                   END                                                                        
314.00 0      C*                                                                                             
315.00 0      C*---------------------------------------------------------------*                             
316.00 0      C*   VALIDATE FUNCTION KEY PRESSED                                                             
317.00 0      C*---------------------------------------------------------------*                             
318.00 0      C*                                                                                             
319.00 0      C*** F3 OR F12 WAS PRESSED                                                                     
320.00 0      C*                                                                                             
321.00 0      C     *IN03         IFEQ      '1'                                                              
322.00 0      C     *IN12         OREQ      '1'                                                              
323.00 0      C     *IN97         OREQ      '1'                                                              
324.00 0      C                   GOTO      S1END                                                            
325.00 0      C                   END                                                                        
326.00 0      C*                                                                                             
327.00 0      C*** F4 WAS PRESSED                                                                            
328.00 0      C*                                                                                             
329.00 0      C     *IN04         IFEQ      '1'                                                              
330.00 0      C     CSRLOC        DIV       256           ROW               3 0                              
331.00 0      C                   MVR                     COL               3 0                              
332.00 0      C*                                                                                             
333.00 0      C**Q414**   ROW       IFEQ 9                                                                   
334.00 0      C*    CHECK FOR PROMPT AGAINST CHEQUE BOOK STYLE...                                            
335.00 0      C     FLD           IFEQ      'DRCBST'                                                         
336.00 0      C                   MOVE      '1'           C1WORK                                             
337.00 0      C                   MOVE      *BLANKS       C1RVAL                                             
338.00 0      C                   MOVE      *BLANKS       C1ERCD                                             
339.00 0      C                   CALL      'CFD240'      PARM02                                             
340.00 0      C*                                                                                             
341.00 0      C     C1ERCD        CABNE     *BLANKS       ADDREC                                             
342.00 0      C*                                                                                             
343.00 0      C     C1RVAL        CABEQ     *BLANKS       ADDREC                                             
344.00 0      C*                                                                                             
345.00 0      C                   MOVE      '1'           *IN55                                              
346.00 0      C                   MOVEL     C1RVAL        DRCBST                                             
347.00 0      C*                                                                                             
348.00 0      C*** RETRIEVE CHEQUE BOOK STYLE RECORD (COMMON FILE)                                           
349.00 0      C*                                                                                             
350.00 0      C     CFK280        CHAIN     CFP2801                            70                            
351.00 0      C     DRORDR        MULT      CFBFEE        DRBFEE                                             
352.00 0      C     DRORDR        MULT      CFBTAX        DRBTAX                                             
353.00 0      C*                                                                                             
354.00 0      C                   ELSE                                                                       
355.00 0      C                   MOVEL     'TA05030'     MSGID                                              
356.00 0      C                   EXSR      SNDERR                                                           
357.00 0      C                   MOVE      '1'           *IN98                                              
358.00 0      C                   END                                                                        
359.00 0      C*                                                                                             
360.00 0      C                   GOTO      ADDREC                                                           
361.00 0      C                   END                                                                        
362.00 0      C*                                                                                             
363.00 0      C*---------------------------------------------------------------*                             
364.00 0      C*    VALIDATE ENTRIES                                                                         
365.00 0      C*---------------------------------------------------------------*                             
366.00 0      C*                                                                                             
367.00 0      C*** CHEQUE BOOK ORDER MUST NOT BE BLANK                                                       
368.00 0      C*                                                                                             
369.00 0      C     DRCBST        IFEQ      *BLANK                                                           
370.00 0      C                   MOVE      '1'           *IN20                                              
371.00 0      C                   MOVE      'X'           ERRFLG                                             
372.00 0      C                   GOTO      S1END                                                            
373.00 0      C                   END                                                                        
374.00 0      C*                                                                                             
375.00 0      C*** VERIFY FROM CHEQUE BOOK STYLE COMMON FILE IF RECORD EXIST                                 
376.00 0      C*                                                                                             
377.00 0      C     CFK280        CHAIN     CFP2801                            70                            
378.00 0      C     *IN70         IFEQ      '1'                                          NOT FOUND           
379.00 0      C                   MOVE      '1'           *IN20                                              
380.00 0      C                   MOVE      'X'           ERRFLG                                             
381.00 0      C                   GOTO      S1END                                                            
382.00 0      C                   END                                                                        
383.00 0      C*                                                                                             
384.00 0      C*** NUMBER OF BOOKS MUST BE GREATER THAN ZERO                                                 
385.00 0      C*                                                                                             
386.00 0      C     DRORDR        IFLE      *ZEROS                                                           
387.00 0      C                   MOVE      '1'           *IN21                                              
388.00 0      C                   MOVE      'X'           ERRFLG                                             
389.00 0      C                   GOTO      S1END                                                            
390.00 0      C                   END                                                                        
391.00 0      C*                                                                                             
392.00 0      C*** FROM RANGE MUST BE GREATER THAN ZERO                                                      
393.00 0      C*                                                                                             
394.00 0      C     SCSTAR        IFLE      *ZEROS                                                           
395.00 0      C                   MOVE      '1'           *IN22                                              
396.00 0      C                   MOVE      'X'           ERRFLG                                             
397.00 0      C                   GOTO      S1END                                                            
398.00 0      C                   END                                                                        
399.00 170814 D7266C*                                                                                             
400.00 170814 D7266C*** Check if any new cheque nbrs overlap any existed cheque nbr                               
401.00 170814 D7266C*                                                                                             
402.00 170814 D7266C                   CALL      'CQNACCM'                                                        
403.00 170814 D7266C                   PARM      'CHK'         PACT              3                                
404.00 170814 D7266C                   PARM      DMACCT        PACCT            12 0          Account             
405.00 170814 D7266C                   PARM      DRCBST        PCBST            10            Cheque book style   
406.00 170814 D7266C                   PARM      DRORDR        PORDR             5 0          Nbr of books        
407.00 170814 D7266C                   PARM      SCSTAR        PSTAR             7 0          Nbr start from      
408.00 170814 D7266C                   PARM                    PSTS              1 0                              
409.00 170814 D7266C                   IF        PSTS <> 0                                                        
410.00 170814 D7266C                   MOVE      '1'           *IN22                                              
411.00 170814 D7266C                   MOVE      'X'           ERRFLG                                             
412.00 170814 D7266C                   GOTO      S1END                                                            
413.00 170814 D7266C                   ENDIF                                                                      
414.00 0      C*                                                                                             
415.00 0      C*** CALCULATE "TO RANGE" =                                                                    
416.00 0      C***    FROM RANGE + (NO. OF CHECKS PER BOOK * NO. OF BOOKS)                                   
417.00 0      C*                                                                                             
418.00 0      C     DRORDR        MULT      CFCKBK        XXCHKS            8 0                              
419.00 0      C                   ADD       SCSTAR        XXCHKS                                             
420.00 0      C                   SUB       1             XXCHKS                                             
421.00 0      C*                                                                                             
422.00 0      C     XXCHKS        IFGT      9999999                                                          
423.00 0      C                   MOVE      '1'           *IN23                                              
424.00 0      C                   MOVE      'X'           ERRFLG                                             
425.00 0      C                   GOTO      S1END                                                            
426.00 0      C                   END                                                                        
427.00 0      C*                                                                                             
428.00 0      C  N96              Z-ADD     XXCHKS        DRTRNG                                             
429.00 0      C*                                                                                             
430.00 0      C*** DELIVERY OPTION MUST BE 0 OR 1                                                            
431.00 0      C*                                                                                             
432.00 0      C     DRCDSP        IFNE      0                                                                
433.00 0      C     DRCDSP        ANDNE     1                                                                
434.00 0      C                   MOVE      '1'           *IN24                                              
435.00 0      C                   MOVE      'X'           ERRFLG                                             
436.00 0      C                   GOTO      S1END                                                            
437.00 0      C                   END                                                                        
438.00 0      C*                                                                                             
439.00 0      C*** ORDER FEE PER BOOK MUST BE EQUAL OR GREATER THAN ZERO                                     
440.00 0      C*                                                                                             
441.00 0      C     SCBFEE        IFLT      *ZEROS                                                           
442.00 0      C                   MOVE      '1'           *IN25                                              
443.00 0      C                   MOVE      'X'           ERRFLG                                             
444.00 0      C                   GOTO      S1END                                                            
445.00 0      C                   END                                                                        
446.00 0      C*                                                                                             
447.00 0      C*** TAX PER BOOK MUST BE EQUAL OR GREATER THAN ZERO                                           
448.00 0      C*                                                                                             
449.00 0      C     SCBTAX        IFLT      *ZEROS                                                           
450.00 0      C                   MOVE      '1'           *IN26                                              
451.00 0      C                   MOVE      'X'           ERRFLG                                             
452.00 0      C                   GOTO      S1END                                                            
453.00 0      C                   END                                                                        
454.00 0      C*                                                                                             
455.00 0      C***   DISPLAY WARNING MESSAGE IF FROM RANGE IS HIGHER THAN THE                                
456.00 0      C***   HIGHEST CHECK ISSUED.                                                                   
457.00 0      C*                                                                                             
458.00 0      C     SCSTAR        IFLT      DMCBHN                                                           
459.00 0      C                   MOVE      '1'           *IN99                                              
460.00 0      C                   MOVEL     'TA05031'     MSGID                                              
461.00 0      C                   EXSR      SNDERR                                                           
462.00 0      C                   END                                                                        
463.00 0      C*                                                                                             
464.00 0      C   55              MOVE      'X'           ERRFLG                                             
465.00 0      C     S1END         TAG                                                                        
466.00 0      C                   ENDSR                                                                      
467.00 0      C***********************************************************                                   
468.00 0      C***   CLEAR ERROR MSG ROUTINE (FOR PSNDMSG)                                                   
469.00 0      C***********************************************************                                   
470.00 0      C     CLRERR        BEGSR                                                                      
471.00 0      C                   MOVE      *BLANKS       MSGID             7             1ST CYCLE          
472.00 0      C                   MOVE      *BLANKS       MSGDTA           10                                
473.00 0      C                   CALL      'PSNDMSG'                                                        
474.00 0      C                   PARM                    MSGID                                              
475.00 0      C                   PARM                    MSGDTA                                             
476.00 0      C                   ENDSR                                                                      
477.00 0      C***********************************************************                                   
478.00 0      C*    SNDERR - SEND ERROR MSG TO PSNDMSG                                                       
479.00 0      C***********************************************************                                   
480.00 0      C     SNDERR        BEGSR                                                                      
481.00 0      C                   CALL      'PSNDMSG'                                                        
482.00 0      C                   PARM                    MSGID                                              
483.00 0      C                   PARM                    MSGDTA                                             
484.00 0      C                   MOVE      *ON           *IN60                                              
485.00 0      C                   ENDSR                                                                      
486.00 0      C*                                                                                             
487.00 0      C*                                                                                             
488.00 0      C/COPY CFSORC,SRP011                                                                           
489.00 0      C/COPY CFSORC,SRP001                                                                           
490.00 990105 RETROOTAP0021   E            T2BITS                                                                 
491.00 990105 RETROO                       DMBIT3                                                                 
