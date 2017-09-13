1.00 940103      H DATEDIT(*DMY)                                                                                
2.00 970822       ************************************************************************                      
3.00 991125       *  Program Name   : JFMTGLR                                                                   
4.00 990330       *  Author / Date  : Thomas Chan    30/03/99                                                   
5.00 990330       *  Parameters     :                                                    *                      
6.00 990330       *  Program Desc.  : Gen. standard batch file (GLP10001 & GLT00101)                            
7.00 990330       *                   base on input data file CRGLPF & DBGLPF.                                  
8.00 980731       *                   The output files will be used to post to ICBS                             
9.00 990330       *                   through general ledger posting.              .                            
10.00 980828       *  Called by PGM  : -----                                                                     
11.00 980828       *  Call Program/s : DFJJTOYY                                                                  
12.00 980828       *                   DFYYTOJJ                                                                  
13.00 991125       *                   FXLCYGLR                                                                  
14.00 970822       *  Indicator Desc.:                                                                           
15.00 970822       *                                                                                             
16.00 991125       *  Modified / Date: 25 Nov 1999                                                               
17.00 990423       *  Modified Lines : subroutine EXRATE                                                         
18.00 990423       *  Modified Reason: For foreign CCYs record: if both FCY amount &      *                      
19.00 990423       *                   LCY amount provided, calculate the exchange rate;                         
20.00 991125       *                   if only FCY amount provided, use REVALULATION RATE                        
21.00 991125       *                   to find the LCY amount.                                                   
22.00 970822       ************************************************************************                      
22.01 120903       *  Reference      : CHG-249-12 (D2249)                                                        
22.02 120903       *  Changed by     : BA55 Karl                                                                 
22.03 120903       *  Date modified  : 03 Sep 2012                                                               
22.04 120903       *  Reason         : Increase BTHSEQ (Seq no) length from 5 0 to 7 0                           
22.05 120903       ************************************************************************                      
23.00 970822       *                                                                                             
24.00 990330      FCRGLPF    IF   E           K DISK                                                             
25.00 990330      FDBGLPF    IF   E           K DISK                                                             
26.00 990421      FGLC001    IF   E           K DISK                                                             
27.00 990330      FGLP001    IF   E           K DISK                                                             
28.00 990331      FGLP002    IF   E           K DISK                                                             
29.00 990331      FGLP100    UF A E           K DISK                                                             
30.00 990331      FGLT00101  O    E             DISK                                                             
31.00 990331      FQSYSPRT   O    F  132        PRINTER OFLIND(*INOF)                                            
32.00 970822       *                                                                                             
33.00 980824       ************************************************************************                      
34.00 970822       *                                                                                             
35.00 980730       *INIT CONSTANTS                                                                               
36.00 980730      C                   TIME                    SYSTIM            6 0                              
37.00 970822       *                                                                                             
38.00 990421      C                   Z-ADD     0             CCYNUM            3 0          *LCY NO.            
39.00 980730      C                   Z-ADD     001           BANKNO            3 0          *BANK NO.           
40.00 980730      C                   Z-ADD     999           CSTCTR            5 0          *COST CENTER        
41.00 980730      C                   MOVE      '6'           DEBIT             1            *DB TX. CODE        
42.00 980730      C                   MOVE      '0'           CREDIT            1            *CR TX. CODE        
43.00 990330      C                   MOVE      '81'          DBTCD             2            *DB TX. CODE        
44.00 990330      C                   MOVE      '10'          CRTCD             2            *CR TX. CODE        
45.00 980730       *INIT VARIABLES                                                                               
46.00 990330      C                   Z-ADD     0             TOTDBA           19 2          *TOT DB AMT         
47.00 990330      C                   Z-ADD     0             TOTCRA           19 2          *TOT CR AMT         
48.00 120903 D2249C*                  Z-ADD     10            BTHSEQ            5 0          *BATCH SEQ          
48.01 120903 D2249C                   Z-ADD     10            BTHSEQ            7 0          *BATCH SEQ          
49.00 990331      C                   Z-ADD     0             ALLSEQ            7 0          *ALL BATCH SEQ      
50.00 970822       *                                                                                             
51.00 970822       *BEGIN MAIN LOOP                                                                              
52.00 970822       *                                                                                             
53.00 991125      C     *DTAARA       DEFINE    IMMSBTH       BATCH             5 0                              
54.00 990331      C                   IN        BATCH                                                            
55.00 990331       *                                                                                             
56.00 990330      C                   Z-ADD     0             GPWKSQ                         *SEQ. # IN  BATCH   
57.00 990330      C                   Z-ADD     0             BTCH              5 0                              
58.00 990331      C     KEY100        CHAIN     GLP100                             81                            
59.00 990331      C     KEY100        KLIST                                                                      
60.00 990330      C                   KFLD                    BANKNO                                             
61.00 990330      C                   KFLD                    BTCH                                               
62.00 990331       *Get next available batch no.                                                                 
63.00 990331      C  N81              Z-ADD     PGNXSQ        ALLSEQ                                             
64.00 990330      C     BANKNO        CHAIN     GLP001                             81                            
65.00 980730      C                   EXSR      GENDTL                                                           
66.00 970822       *                                                                                             
67.00 980730      C                   EXSR      GENHDR                                                           
68.00 970822       *                                                                                             
69.00 940103      C                   SETON                                            LR                        
70.00 970822       *                                                                                             
71.00 970822       ************************************************************************                      
72.00 980731       * SUBPGM - GENHDR : GENERATE BATCH HEADER                                                     
73.00 970822       ************************************************************************                      
74.00 970822       *                                                                                             
75.00 980731      C     GENHDR        BEGSR                                                                      
76.00 970822       *                                                                                             
77.00 990331      C                   Z-ADD     BANKNO        PGBK                                               
78.00 990331      C                   Z-ADD     BATCH         PGBAT                                              
79.00 990331      C                   Z-ADD     BTHSEQ        PGNXSQ                                             
80.00 990331      C                   Z-ADD     TOTDBA        PGTDR                          *TOT DB AMT         
81.00 990331      C                   Z-ADD     TOTCRA        PGTCR                          *TOT CR AMT         
82.00 990331      C                   MOVE      *BLANK        PGSTAT                                             
83.00 970822       *                                                                                             
84.00 990331      C                   WRITE     GLP1001                                                          
85.00 990331       *Update batch=0 header.                                                                       
86.00 990331      C                   Z-ADD     0             BTCH              5 0                              
87.00 990331      C     KEY100        CHAIN     GLP100                             81                            
88.00 990331       *Update next available batch no.                                                              
89.00 990331      C  N81              Z-ADD     ALLSEQ        PGNXSQ                                             
90.00 990331      C  N81              UPDATE    GLP1001                                                          
91.00 970822       *                                                                                             
92.00 950418      C                   ENDSR                                                                      
93.00 970822       *                                                                                             
94.00 970822       ************************************************************************                      
95.00 980731       * SUBPGM - GENDTL : GENERATE BATCH DETAIL ITEMS                                               
96.00 970822       ************************************************************************                      
97.00 970822       *                                                                                             
98.00 980730      C     GENDTL        BEGSR                                                                      
99.00 970822       *                                                                                             
100.00 990331      C                   EXCEPT    HDG                                                              
101.00 950615      C                   EXSR      GENCR                                                            
102.00 990324      C                   EXSR      GENDB                                                            
103.00 990331      C                   EXCEPT    END                                                              
104.00 970822       *                                                                                             
105.00 950418      C                   ENDSR                                                                      
106.00 970822       *                                                                                             
107.00 970822       ************************************************************************                      
108.00 970822       * SUBPGM - GENCR : GENERATE CR ITEMS                                                          
109.00 970822       ************************************************************************                      
110.00 950504      C     GENCR         BEGSR                                                                      
111.00 970822       *                                                                                             
112.00 990330      C                   READ      CRGLPF                                 80                        
113.00 950504      C     *IN80         DOWEQ     '0'                                                              
114.00 980731       *                                                                                             
115.00 990330      C                   Z-ADD     BANKNO        GPBK                                               
116.00 990330      C                   Z-ADD     CRJCST        GPCNTR                                             
117.00 990330      C                   Z-ADD     CRJACN        GPACT                                              
118.00 990330      C                   MOVE      *BLANK        GPSTAT                                             
119.00 990330      C                   MOVE      CRTCD         GPITC                                              
120.00 990331      C                   MOVE      CREDIT        GPDRCR                                             
121.00 990330      C                   MOVE      CRTCD         GPETC                                              
122.00 990330      C                   Z-ADD     999           GPBTCH                                             
123.00 990330      C                   Z-ADD     0             GPSER                                              
124.00 990330      C                   Z-ADD     0             GPQTY                                              
125.00 990330      C                   Z-ADD     0             GPBUN                                              
126.00 990330      C                   MOVE      CRNAR1        GPDESC                                             
127.00 990330      C                   MOVE      CRNAR2        GPDSC2                                             
128.00 990330      C                   MOVE      CRNAR3        GPDSC3                                             
129.00 990331      C                   MOVE      CREOFA        GPEMPM                                             
130.00 990330      C                   MOVE      CRAOFA        GPOFFA                                             
131.00 990331      C                   Z-ADD     CRJCCY        GPMCDD                                             
132.00 990331      C                   Z-ADD     0             GPEXPD                                             
133.00 990330      C                   MOVE      *BLANK        GPERR                                              
134.00 990330      C                   Z-ADD     BATCH         GPWKBT                                             
135.00 990330       *Define ledger code.                                                                          
136.00 990331      C     KEY002        CHAIN     GLP002                             81                            
137.00 990331      C     KEY002        KLIST                                                                      
138.00 990331      C                   KFLD                    BANKNO                                             
139.00 990331      C                   KFLD                    GPACT                                              
140.00 990331      C                   KFLD                    GPMCDD                                             
141.00 990331      C     *IN81         IFEQ      '1'                                          *A/C NOT FOUND      
142.00 990331      C   OF              EXCEPT    HDG                                                              
143.00 990331      C   OF              SETOFF                                       OF                            
144.00 990331      C                   EXCEPT    CRDTL                                                            
145.00 990331      C                   ELSE                                                                       
146.00 990331      C                   MOVE      GCLEDG        GPLEDG                                             
147.00 990330       *Define sequence no.                                                                          
148.00 990331      C                   Z-ADD     ALLSEQ        GPSEQ                                              
149.00 990331      C                   Z-ADD     BTHSEQ        GPWKSQ                                             
150.00 990331      C                   ADD       10            BTHSEQ                                             
151.00 990331      C                   ADD       10            ALLSEQ                                             
152.00 990324       *Define value date.                                                                           
153.00 990324      C     CRVDAT        IFNE      0                                            *VALUE DATE?        
154.00 990330      C                   CALL      'DFYYTOJJ'                                                       
155.00 990330      C                   PARM                    CRVDAT                                             
156.00 990330      C                   PARM                    GPEFDT                                             
157.00 990324      C                   ELSE                                                   *USE SYSDATE        
158.00 990331      C                   Z-ADD     GLDT          GPEFDT                                             
159.00 990324      C                   END                                                                        
160.00 990330       *Define ccy rate & amount.                                                                    
161.00 990330      C     CRJCCY        IFEQ      0                                            *MOP                
162.00 990330      C                   Z-ADD     CRJAMT        GPAMT                          *LCY AMT            
163.00 990330      C                   Z-ADD     0             GPFCYE                         *FCY AMT            
164.00 990330      C                   Z-ADD     0             GPFCRT                                             
165.00 990401      C                   MOVE      *BLANK        GPOVRC                                             
166.00 990330      C                   ELSE                                                                       
167.00 990420      C     CRJLCY        IFEQ      0                                                                
168.00 990330      C                   Z-ADD     CRJAMT        GPFCYE                         *FCY AMT            
169.00 990330      C                   Z-ADD     0             GPAMT                          *LCY AMT            
170.00 990330      C                   Z-ADD     0             GPFCRT                                             
171.00 991125      C                   CALL      'FXLCYGLR'                                   *USE G/L            
172.00 990330      C                   PARM                    CRJCCY                         *CCY RATE           
173.00 990330      C                   PARM                    GPFCYE                                             
174.00 990330      C                   PARM                    GPFCRT                                             
175.00 990330      C                   PARM                    GPAMT                                              
176.00 990420      C                   ELSE                                                                       
177.00 990420      C                   Z-ADD     CRJAMT        GPFCYE                         *FCY AMT            
178.00 990420      C                   Z-ADD     CRJLCY        GPAMT                          *LCY AMT            
179.00 990421      C                   Z-ADD     CRJCCY        CCYNUM                                             
180.00 990421      C                   EXSR      EXRATE                                                           
181.00 990420      C                   END                                                                        
182.00 990401      C                   MOVE      'Y'           GPOVRC                                             
183.00 990324      C                   END                                                                        
184.00 980730       *                                                                                             
185.00 990331      C                   ADD       GPAMT         TOTCRA                                             
186.00 990330      C                   WRITE     GLT0011                                                          
187.00 990331      C                   END                                                                        
188.00 990331       *                                                                                             
189.00 990330      C                   READ      CRGLPF                                 80                        
190.00 980730      C                   ENDDO                                                                      
191.00 970822       *                                                                                             
192.00 950504      C                   ENDSR                                                                      
193.00 990324       *                                                                                             
194.00 990324       ************************************************************************                      
195.00 990324       * SUBPGM - GENDB : GENERATE DB ITEMS                                                          
196.00 990324       ************************************************************************                      
197.00 990324      C     GENDB         BEGSR                                                                      
198.00 990324       *                                                                                             
199.00 990330      C                   READ      DBGLPF                                 80                        
200.00 990324      C     *IN80         DOWEQ     '0'                                                              
201.00 990331       *                                                                                             
202.00 990331      C                   Z-ADD     BANKNO        GPBK                                               
203.00 990331      C                   Z-ADD     DBJCST        GPCNTR                                             
204.00 990331      C                   Z-ADD     DBJACN        GPACT                                              
205.00 990331      C                   MOVE      *BLANK        GPSTAT                                             
206.00 990331      C                   MOVE      DBTCD         GPITC                                              
207.00 990331      C                   MOVE      DEBIT         GPDRCR                                             
208.00 990331      C                   MOVE      DBTCD         GPETC                                              
209.00 990331      C                   Z-ADD     999           GPBTCH                                             
210.00 990331      C                   Z-ADD     0             GPSER                                              
211.00 990331      C                   Z-ADD     0             GPQTY                                              
212.00 990331      C                   Z-ADD     0             GPBUN                                              
213.00 990331      C                   MOVE      DBNAR1        GPDESC                                             
214.00 990331      C                   MOVE      DBNAR2        GPDSC2                                             
215.00 990331      C                   MOVE      DBNAR3        GPDSC3                                             
216.00 990331      C                   MOVE      DBEOFA        GPEMPM                                             
217.00 990331      C                   MOVE      DBAOFA        GPOFFA                                             
218.00 990331      C                   Z-ADD     DBJCCY        GPMCDD                                             
219.00 990331      C                   Z-ADD     0             GPEXPD                                             
220.00 990331      C                   MOVE      *BLANK        GPERR                                              
221.00 990331      C                   Z-ADD     BATCH         GPWKBT                                             
222.00 990331       *Define ledger code.                                                                          
223.00 990331      C     KEY002        CHAIN     GLP002                             81                            
224.00 990331      C     *IN81         IFEQ      '1'                                          *A/C NOT FOUND      
225.00 990331      C   OF              EXCEPT    HDG                                                              
226.00 990331      C   OF              SETOFF                                       OF                            
227.00 990331      C                   EXCEPT    DBDTL                                                            
228.00 990331      C                   ELSE                                                                       
229.00 990331      C                   MOVE      GCLEDG        GPLEDG                                             
230.00 990331       *Define sequence no.                                                                          
231.00 990331      C                   Z-ADD     ALLSEQ        GPSEQ                                              
232.00 990331      C                   Z-ADD     BTHSEQ        GPWKSQ                                             
233.00 990331      C                   ADD       10            BTHSEQ                                             
234.00 990331      C                   ADD       10            ALLSEQ                                             
235.00 990331       *Define value date.                                                                           
236.00 990331      C     DBVDAT        IFNE      0                                            *VALUE DATE?        
237.00 990331      C                   CALL      'DFYYTOJJ'                                                       
238.00 990331      C                   PARM                    DBVDAT                                             
239.00 990331      C                   PARM                    GPEFDT                                             
240.00 990331      C                   ELSE                                                   *USE SYSDATE        
241.00 990331      C                   Z-ADD     GLDT          GPEFDT                                             
242.00 990331      C                   END                                                                        
243.00 990331       *Define ccy rate & amount.                                                                    
244.00 990331      C     DBJCCY        IFEQ      0                                            *MOP                
245.00 990331      C                   Z-ADD     DBJAMT        GPAMT                          *LCY AMT            
246.00 990331      C                   Z-ADD     0             GPFCYE                         *FCY AMT            
247.00 990331      C                   Z-ADD     0             GPFCRT                                             
248.00 990401      C                   MOVE      *BLANK        GPOVRC                                             
249.00 990331      C                   ELSE                                                                       
250.00 990421      C     DBJLCY        IFEQ      0                                                                
251.00 990331      C                   Z-ADD     DBJAMT        GPFCYE                         *FCY AMT            
252.00 990331      C                   Z-ADD     0             GPAMT                          *LCY AMT            
253.00 990331      C                   Z-ADD     0             GPFCRT                                             
254.00 991125      C                   CALL      'FXLCYGLR'                                   *USE G/L            
255.00 990331      C                   PARM                    DBJCCY                         *CCY RATE           
256.00 990331      C                   PARM                    GPFCYE                                             
257.00 990331      C                   PARM                    GPFCRT                                             
258.00 990331      C                   PARM                    GPAMT                                              
259.00 990421      C                   ELSE                                                                       
260.00 990421      C                   Z-ADD     DBJAMT        GPFCYE                         *FCY AMT            
261.00 990421      C                   Z-ADD     DBJLCY        GPAMT                          *LCY AMT            
262.00 990421      C                   Z-ADD     DBJCCY        CCYNUM                                             
263.00 990421      C                   EXSR      EXRATE                                                           
264.00 990421      C                   END                                                                        
265.00 990401      C                   MOVE      'Y'           GPOVRC                                             
266.00 990331      C                   END                                                                        
267.00 990331       *                                                                                             
268.00 990331      C                   ADD       GPAMT         TOTDBA                                             
269.00 990331      C                   WRITE     GLT0011                                                          
270.00 990331      C                   END                                                                        
271.00 990324       *                                                                                             
272.00 990330      C                   READ      DBGLPF                                 80                        
273.00 990324      C                   ENDDO                                                                      
274.00 990324       *                                                                                             
275.00 990324      C                   ENDSR                                                                      
276.00 990421       *                                                                                             
277.00 990421       ************************************************************************                      
278.00 990421       * SUBPGM - EXRATE : FIND EXCHANGE RATE                                                        
279.00 990421       ************************************************************************                      
280.00 990421      C     EXRATE        BEGSR                                                                      
281.00 990421      C     KEY001        CHAIN     GLC001                             81                            
282.00 990421      C     KEY001        KLIST                                                                      
283.00 990421      C                   KFLD                    BANKNO                                             
284.00 990421      C                   KFLD                    CCYNUM                                             
285.00 990421      C     GCIND         IFEQ      'M'                                                              
286.00 990421      C     GPFCYE        IFEQ      0                                                                
287.00 990421      C                   Z-ADD     0             GPFCRT                                             
288.00 990421      C                   ELSE                                                                       
289.00 990421      C     GPAMT         DIV(H)    GPFCYE        GPFCRT                                             
290.00 990421      C                   END                                                                        
291.00 990421      C                   ELSE                                                                       
292.00 990421      C     GPAMT         IFEQ      0                                                                
293.00 990421      C                   Z-ADD     0             GPFCRT                                             
294.00 990421      C                   ELSE                                                                       
295.00 990421      C     GPFCYE        DIV(H)    GPAMT         GPFCRT                                             
296.00 990421      C                   END                                                                        
297.00 990421      C                   END                                                                        
298.00 990421      C                   ENDSR                                                                      
299.00 990331       **************************************************************************                    
300.00 990331      OQSYSPRT   E            HDG            1 02                                                    
301.00 991229      O                                           12 'ZMMI/JFMTGLR'                                  
302.00 990331      O                                           65 'B A N C O   C O M E R C'                       
303.00 990331      O                                           89 'I A L   D E   M A C A U'                       
304.00 990331      O                                          109 'DATE'                                          
305.00 990331      O                       UDATE              118 '0  /  /  '                                     
306.00 990331      O                                          126 'PAGE'                                          
307.00 990331      O                       PAGE          Z    130                                                 
308.00 990331      O          E            HDG            1                                                       
309.00 990331      O                                          109 'TIME'                                          
310.00 990331      O                       SYSTIM             118 '0  :  :  '                                     
311.00 990331      O          E            HDG            1                                                       
312.00 990331      O                                           74 'ICBS MM G/L INTERFACE PO'                      
313.00 990331      O                                              'STING ERROR LIST'                              
314.00 990331      O          E            HDG            2                                                       
315.00 990331      O                                           74 '------------------------'                      
316.00 990331      O                                              '----------------'                              
317.00 990331      O          E            HDG            1                                                       
318.00 990331      O                                           42 '  ACCOUNT   '                                  
319.00 990331      O                                           48 ' CC  '                                         
320.00 990331      O                                           54 'CCY'                                           
321.00 990331      O                                           74 'AMOUNT'                                        
322.00 991229      O                                          109 'ORIGINAL ACCOUNT NO.'                          
323.00 990331      O          E            HDG            2                                                       
324.00 990331      O                                           42 '------------'                                  
325.00 990331      O                                           48 '-----'                                         
326.00 990331      O                                           54 '---'                                           
327.00 990331      O                                           82 '------------------------'                      
328.00 991229      O                                          109 '--------------------'                          
329.00 990331      O*                                                                                             
330.00 990331      O          E            CRDTL          1                                                       
331.00 990331      O                       CRJACN              42                                                 
332.00 990331      O                       CRJCST              48                                                 
333.00 990331      O                       CRJCCY              54                                                 
334.00 990331      O                       CRJAMT        J     82                                                 
335.00 990331      O                                           86 'CR'                                            
336.00 991229      O                       CRNAR2             118                                                 
337.00 990331      O*                                                                                             
338.00 990331      O          E            DBDTL          1                                                       
339.00 990331      O                       DBJACN              42                                                 
340.00 990331      O                       DBJCST              48                                                 
341.00 990331      O                       DBJCCY              54                                                 
342.00 990331      O                       DBJAMT        J     82                                                 
343.00 990331      O                                           86 'DB'                                            
344.00 991229      O                       DBNAR2             118                                                 
345.00 990331      O*                                                                                             
346.00 990331      O          E            END         2                                                          
347.00 990331      O                                           66 '***   E N D   O F'                             
348.00 990331      O                                           82 'L I S T   ***'                                 
