1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                                       
2.00 60608      H********************************************************************************************** 
3.00 111021      H* Program      : AML_GMDCC                                                                     
4.00 111019      H* Reference    : CHG-315-11 (D1315)                                                            
5.00 111019      H* Created By   : Karl (BA55PGM)                                                                
6.00 111021      H* Changed Date : 21 Oct 2011                                                                   
7.00 111021      H* Description  : Generate Deposit in Credit Card Account for AML                               
8.00 111021      H*                Monthly Report                                                                
9.00 111019      H********************************************************************************************** 
10.00 120214      H* Reference    : CHG-016-12 (D2016)                                                            
11.00 120214      H* Created By   : Karl (BA55PGM)                                                                
12.00 120214      H* Changed Date : 14 Feb 2012                                                                   
13.00 120214      H* Description  : Get the transactions from ZPDCRTDC                                            
14.00 120214      H********************************************************************************************** 
15.00 120914      H* Reference    : CHG-216-12 (D2216)                                                            
16.00 120914      H* Created By   : Joanna(BE95PGM)                                                               
17.00 120914      H* Changed Date : 14 SEP 2012                                                                   
18.00 120914      H* Description  : Add new field Scc code2                                                       
19.00 120914      H*                                                                                              
20.00 120914      H********************************************************************************************** 
21.00 130108      H* Reference    : CHG-007-13 (D3007)                                                            
22.00 130108      H* Created By   : Karl (BA55PGM)                                                                
23.00 130108      H* Changed Date : 08 Jan 2013                                                                   
24.00 130108      H* Description  : Get the correct started month for quarterly report                            
25.00 130108      H********************************************************************************************** 
26.00 160825      H* Reference    : CHG-262-16 (D6262)                                                            
27.00 160825      H* Created By   : Myles Ieong (BI77PGM)                                                         
28.00 160825      H* Changed Date : 14 Jul 2016                                                                   
29.00 160825      H* Description  : AML report parameter changing and revoking                                    
30.00 160825      H********************************************************************************************** 
31.00 170606      H* Reference    : CHG-196-17 (D7196)                                                            
32.00 170420      H* Created By   : Albert Au   (BG09PGM)                                                         
33.00 170420      H* Changed Date : 10 Apr 2017                                                                   
34.00 170420      H* Description  : Remove the transaction for CIF's with officer code as 'PER'                   
35.00 170420      H*                                                                                              
36.00 170420      H********************************************************************************************** 
37.00 111206      FTXNCD1    UF   E           K DISK    USROPN                                                    
38.00 111206      FTXNCD2    UF   E           K DISK    USROPN                                                    
39.00 60527      FCUP003    IF   E           K DISK                                                              
40.00 60527      FTAP00101B IF   E             DISK                                                              
41.00 60530      FAMLDDNCTX UF A E           K DISK                                                              
42.00 111109      FTXNMCDWRK1IF   E           K DISK                                                              
43.00 111109      FTXNMCDWRK2IF   E           K DISK                                                              
44.00 120209      FICBSRATE  IF   E             DISK    USROPN                                                    
45.00 60529      F                                                                                               
46.00 111021      FAML_MCCRPTO    E             PRINTER OFLIND(*IN98)                                             
47.00 170606 D7196F                                     USROPN                                                    
48.00 60516      D                                                                                               
49.00 60516      C*----------------------------------------------------------------------------------------------
50.00 60516      C* Initial Variable                                                                             
51.00 60516      C*----------------------------------------------------------------------------------------------
52.00 60517      C                                                                                               
53.00 60519      C*----------------------------------------------------------------------------------------------
54.00 60519      C* PARM LIST                                                                                    
55.00 60519      C*----------------------------------------------------------------------------------------------
56.00 60517      C     *ENTRY        PLIST                                                                       
57.00 60523      C                   PARM                    RNO               1                                 
58.00 111021      C                   PARM                    RFLG              1                                 
59.00 170606 D7196C                   PARM                    PRPT              1                                 
60.00 60517      C                                                                                               
61.00 60519      C*----------------------------------------------------------------------------------------------
62.00 60519      C* KEY LIST                                                                                     
63.00 60519      C*----------------------------------------------------------------------------------------------
64.00 60527      C     KC03          KLIST                                                                       
65.00 60527      C                   KFLD                    K03BNO            3 0                               
66.00 60527      C                   KFLD                    K03CIF           10                                 
67.00 60527      C                   Z-ADD     001           K03BNO                                              
68.00 60516      C*----------------------------------------------------------------------------------------------
69.00 60527      C* Main Program                                                                                 
70.00 60516      C*----------------------------------------------------------------------------------------------
71.00 60527      C                   EXSR      GETFLDTE                                                          
72.00 170606 D7196C                   IF        PRPT = 'C'                                                        
73.00 60527      C                   IF        RNO='R'                                                           
74.00 120214 D2016C                   EXSR      GETTXNS                                                           
75.00 60529      C***EXTRACT DATA FROM AML003                                                                    
76.00 120214      C                   EXSR      CLSQL                                                             
77.00 60529      C***GET BRANCH NO AND MOP AMOUNT                                                                
78.00 120209      C                   OPEN      TXNCD1                                                            
79.00 120209      C                   READ      TXNCD1                                 50                         
80.00 120209      C                   DOW       *IN50='0'                                                         
81.00 120209      C                   EXSR      GETFLD                                                            
82.00 120209      C                   UPDATE    RWCD1                                                             
83.00 120209      C                   READ      TXNCD1                                 50                         
84.00 120209      C                   ENDDO                                                                       
85.00 120209      C                   CLOSE     TXNCD1                                                            
86.00 111021      C*                                                                                              
87.00 120209      C                   OPEN      TXNCD2                                                            
88.00 120209      C                   READ      TXNCD2                                 40                         
89.00 120209      C                   DOW       *IN40='0'                                                         
90.00 120209      C                   EXSR      GETFLD                                                            
91.00 120209      C                   UPDATE    RWCD2                                                             
92.00 120209      C                   READ      TXNCD2                                 40                         
93.00 120209      C                   ENDDO                                                                       
94.00 120209      C                   CLOSE     TXNCD2                                                            
95.00 60527      C                                                                                               
96.00 60529      C                   EXSR      CALTMPTLAMT                                                       
97.00 111206      C                   OPEN      TXNCD1                                                            
98.00 111206      C                   READ      TXNCD1                                 50                         
99.00 60529      C                   DOW       *IN50='0'                                                         
100.00 60529      C                   EXSR      CALTLAMT                                                          
101.00 60530      C                   UPDATE    RWCD1                                                             
102.00 111206      C                   READ      TXNCD1                                 50                         
103.00 60530      C                   ENDDO                                                                       
104.00 111206      C                   CLOSE     TXNCD1                                                            
105.00 60529      C                                                                                               
106.00 111206      C                   OPEN      TXNCD2                                                            
107.00 111206      C                   READ      TXNCD2                                 40                         
108.00 60529      C                   DOW       *IN40='0'                                                         
109.00 60529      C                   EXSR      CALTLAMT                                                          
110.00 60530      C                   UPDATE    RWCD2                                                             
111.00 111206      C                   READ      TXNCD2                                 40                         
112.00 60529      C                   ENDDO                                                                       
113.00 111206      C                   CLOSE     TXNCD2                                                            
114.00 60529      C                                                                                               
115.00 60519      C                                                                                               
116.00 60518      C                   EXSR      GWKTXN                                                            
117.00 60523      C                   ENDIF                                                                       
118.00 170606 D7196C                   ENDIF                                                                       
119.00 60519      C                                                                                               
120.00 170606 D7196C                   IF        PRPT = 'P'                                                        
121.00 170606 D7196C                   OPEN      AML_MCCRPT                                                        
122.00 60517      C                   EXSR      GENRPT                                                            
123.00 170606 D7196C                   CLOSE     AML_MCCRPT                                                        
124.00 170606 D7196C                   ENDIF                                                                       
125.00 60516      C                   SETON                                        LR                             
126.00 60527      C                                                                                               
127.00 60527      C*----------------------------------------------------------------------------------------------
128.00 60527      C* GET BRANCH NO AND CCY CODE                                                                   
129.00 60527      C*----------------------------------------------------------------------------------------------
130.00 120209      C     GETFLD        BEGSR                                                                       
131.00 120209      C                                                                                               
132.00 60527      C***GET CCY CODE AND CALCULATE MOP AMOUNT                                                       
133.00 120209      C                   MOVE      CDTETRCC      TMPCCY            3 0                               
134.00 120209      C                   OPEN      ICBSRATE                                                          
135.00 120209      C                   READ      ICBSRATE                               55                         
136.00 120209      C                   DOW       *IN55='0'                                                         
137.00 120209      C                   IF        RCCY=TMPCCY                                                       
138.00 120209      C                   EVAL      CDMAMT     = CDTETRNA*RCCRTE                                      
139.00 120209      C                   CLOSE     ICBSRATE                                                          
140.00 120209      C                   LEAVESR                                                                     
141.00 120209      C                   ENDIF                                                                       
142.00 120209      C                   READ      ICBSRATE                               55                         
143.00 120209      C                   ENDDO                                                                       
144.00 120209      C                   CLOSE     ICBSRATE                                                          
145.00 120209      C                   ENDSR                                                                       
146.00 60527      C                                                                                               
147.00 60527      C                                                                                               
148.00 60516      C*----------------------------------------------------------------------------------------------
149.00 60516      C* SQL                                                                                          
150.00 60516      C*----------------------------------------------------------------------------------------------
151.00 60516      C     CLSQL         BEGSR                                                                       
152.00 60527      C                                                                                               
153.00 120214 D2016C*EXEC SQL                                                                                      
154.00 120214 D2016C* INSERT INTO TXNCD1                                                                           
155.00 120214 D2016C* SELECT * FROM TXNMCD1                                                                        
156.00 120214 D2016C* WHERE ZONED(SUBSTR(DIGITS(CDTETRDT),1,6),6,0) >= :STRMON                                     
157.00 120214 D2016C* AND ZONED(SUBSTR(DIGITS(CDTETRDT),1,6),6,0) <= :ENDMON                                       
158.00 120214 D2016C*END-EXEC                                                                                      
159.00 60527      C                                                                                               
160.00 120214 D2016C*EXEC SQL                                                                                      
161.00 120214 D2016C* INSERT INTO TXNCD2                                                                           
162.00 120214 D2016C* SELECT * FROM TXNMCD2                                                                        
163.00 120214 D2016C* WHERE ZONED(SUBSTR(DIGITS(CDTETRDT),1,6),6,0) >= :STRMON                                     
164.00 120214 D2016C* AND ZONED(SUBSTR(DIGITS(CDTETRDT),1,6),6,0) <= :ENDMON                                       
165.00 120214 D2016C*END-EXEC                                                                                      
166.00 60516      C                                                                                               
167.00 60516      C                   ENDSR                                                                       
168.00 60518      C                                                                                               
169.00 60518      C*----------------------------------------------------------------------------------------------
170.00 60518      C* CAL TOTAL AMOUNT IN TMP PF                                                                   
171.00 60518      C*----------------------------------------------------------------------------------------------
172.00 60518      C     CALTMPTLAMT   BEGSR                                                                       
173.00 60518      C                                                                                               
174.00 60530      C*--Calculate TOTAL DEPOSIT IN CREDIT CARD ACC                                                  
175.00 60530      C*---------------------------------------------                                                 
176.00 60518      C/EXEC SQL                                                                                      
177.00 60530      C+ INSERT INTO AMLDDNCTX                                                                        
178.00 60530      C+ SELECT  CDSDMLBR, SUM(CDMAMT) ,COUNT(CDSDMLBR)                                               
179.00 111206      C+ FROM TXNCD1                                                                                  
180.00 60530      C+ GROUP BY CDSDMLBR                                                                            
181.00 60518      C/END-EXEC                                                                                      
182.00 60518      C                                                                                               
183.00 60530      C/EXEC SQL                                                                                      
184.00 60530      C+ INSERT INTO AMLDDNCTX                                                                        
185.00 60530      C+ SELECT  CDSDMLBR, SUM(CDMAMT) ,COUNT(CDSDMLBR)                                               
186.00 111206      C+ FROM TXNCD2                                                                                  
187.00 60530      C+ GROUP BY CDSDMLBR                                                                            
188.00 60530      C/END-EXEC                                                                                      
189.00 60518      C                                                                                               
190.00 60518      C                   ENDSR                                                                       
191.00 60518      C                                                                                               
192.00 60524      C     GETFLDTE      BEGSR                                                                       
193.00 60524      C                   READ      TAP00101B                              10                         
194.00 60524      C                   DOW       *IN10='0'                                                         
195.00 60524      C                   IF        DSBK=1                                                            
196.00 60530      C                                                                                               
197.00 111021      C                   CALL      'DFJJTOYY'                                                        
198.00 111021      C                   PARM                    DSDT                                                
199.00 111021      C                   PARM                    CURDATE           8 0                               
200.00 111021      C                   MOVEL     CURDATE       TODTE             6 0                               
201.00 120807      C                   MOVE      TODTE         CURMNTH           2 0                               
202.00 120807 D2016C                   IF        CURMNTH = 1                                                       
203.00 120807 D2016C                   EVAL      TODTE = TODTE - 101 + 12                                          
204.00 120807 D2016C                   ELSE                                                                        
205.00 120807 D2016C                   EVAL      TODTE = TODTE - 1                                                 
206.00 120807 D2016C                   ENDIF                                                                       
207.00 130108 D3007C                   MOVE      TODTE         CURMNTH                                             
208.00 111024      C                   Z-ADD     0             TODTE2            6 0                               
209.00 120807 D2016C*                  IF        CURMNTH >= 3                                                      
210.00 130108 D3007C                   IF        CURMNTH >= 3                                                      
211.00 130108 D2016C*D3007             IF        CURMNTH >= 4                                                      
212.00 120807      C                   EVAL      TODTE2 = TODTE - 2                                                
213.00 111021      C                   ELSE                                                                        
214.00 120807      C                   EVAL      TODTE2 = TODTE - 100 + 12 - 2                                     
215.00 111021      C                   ENDIF                                                                       
216.00 60530      C                   ENDIF                                                                       
217.00 60524      C                   READ      TAP00101B                              10                         
218.00 60524      C                   ENDDO                                                                       
219.00 111021       * Decide which date to use                                                                     
220.00 111021      C                   MOVE      TODTE         ENDMON            6 0                               
221.00 111021      C                   IF        RFLG = 'M'                                                        
222.00 111021      C                   MOVE      TODTE         STRMON            6 0                               
223.00 111021      C                   ELSE                                                                        
224.00 111021      C                   MOVE      TODTE2        STRMON            6 0                               
225.00 111021      C                   ENDIF                                                                       
226.00 60524      C                                                                                               
227.00 60524      C                   ENDSR                                                                       
228.00 60518      C                                                                                               
229.00 60518      C     GWKTXN        BEGSR                                                                       
230.00 60519      C                                                                                               
231.00 111021       * Monthly                                                                                      
232.00 111021      C                   IF        RFLG = 'M'                                                        
233.00 60519      C/EXEC SQL                                                                                      
234.00 111109      C+ INSERT INTO TXNMCDWRK1                                                                       
235.00 60519      C+ SELECT *                                                                                     
236.00 111206      C+ FROM TXNCD1                                                                                  
237.00 160825 D6262C*+ WHERE CDMTTLAMT >= 300000 OR CDNOTXN >= 5                                                   
238.00 160825 D6262C+ WHERE CDMTTLAMT >= 300000                                                                    
239.00 60519      C/END-EXEC                                                                                      
240.00 60519      C                                                                                               
241.00 60519      C/EXEC SQL                                                                                      
242.00 111109      C+ INSERT INTO TXNMCDWRK2                                                                       
243.00 60519      C+ SELECT *                                                                                     
244.00 111206      C+ FROM TXNCD2                                                                                  
245.00 160825 D6262C*+ WHERE CDMTTLAMT >= 300000 OR CDNOTXN >= 5                                                   
246.00 160825 D6262C+ WHERE CDMTTLAMT >= 300000                                                                    
247.00 60519      C/END-EXEC                                                                                      
248.00 111021       *                                                                                              
249.00 111021       * Quarterly                                                                                    
250.00 111021      C                   ELSE                                                                        
251.00 111021      C/EXEC SQL                                                                                      
252.00 111109      C+ INSERT INTO TXNMCDWRK1                                                                       
253.00 111021      C+ SELECT *                                                                                     
254.00 111206      C+ FROM TXNCD1                                                                                  
255.00 111021      C+ WHERE CDMTTLAMT >= 1000000 OR CDNOTXN >= 10                                                  
256.00 111021      C/END-EXEC                                                                                      
257.00 111021      C                                                                                               
258.00 111021      C/EXEC SQL                                                                                      
259.00 111109      C+ INSERT INTO TXNMCDWRK2                                                                       
260.00 111021      C+ SELECT *                                                                                     
261.00 111206      C+ FROM TXNCD2                                                                                  
262.00 111021      C+ WHERE CDMTTLAMT >= 1000000 OR CDNOTXN >= 10                                                  
263.00 111021      C/END-EXEC                                                                                      
264.00 111021      C                   ENDIF                                                                       
265.00 60518      C                   ENDSR                                                                       
266.00 60518      C                                                                                               
267.00 60518      C*----------------------------------------------------------------------------------------------
268.00 60518      C* CALCULATE CREDIT OR DEBIT AND TOTAL CR+DB DAILY TXN AMOUNT                                   
269.00 60518      C*----------------------------------------------------------------------------------------------
270.00 60518      C     CALTLAMT      BEGSR                                                                       
271.00 60529      C*** GET IN + OUT TOTAL TXN AMOUNT                                                              
272.00 60530      C     CDSDMLBR      CHAIN     AMLDDNCTX                          45                             
273.00 60519      C                   IF        *IN45='0'                                                         
274.00 60530      C                   EVAL      CDMTTLAMT =DTMTXAMT                                               
275.00 60530      C                   EVAL      CDNOTXN   =DTNOTXN                                                
276.00 60519      C                   ENDIF                                                                       
277.00 60519      C                                                                                               
278.00 60518      C                   ENDSR                                                                       
279.00 60516      C*----------------------------------------------------------------------------------------------
280.00 60516      C* Generate Report                                                                              
281.00 60516      C*----------------------------------------------------------------------------------------------
282.00 60516      C     GENRPT        BEGSR                                                                       
283.00 111021      C                                                                                               
284.00 111021      C                   IF        RFLG = 'M'                                                        
285.00 111021      C                   EVAL      RPTTYPE = 'Monthly'                                               
286.00 111021      C                   ELSE                                                                        
287.00 111021      C                   EVAL      RPTTYPE = 'Quarterly'                                             
288.00 111021      C                   ENDIF                                                                       
289.00 60523      C                                                                                               
290.00 60523      C                   Z-ADD     39            LTLN              2 0                               
291.00 60523      C                                                                                               
292.00 60523      C                   IF        RNO='R'                                                           
293.00 60516      C*READ RETAIL CUSTOMER                                                                          
294.00 60516      C                   MOVE      *BLANK        OFFI              3                                 
295.00 60530      C                   Z-ADD     0             BRCH              3 0                               
296.00 60516      C                   MOVE      *BLANK        TMPCIF           10                                 
297.00 60516      C                   Z-ADD     1             LINE              2 0                               
298.00 60517      C                   SETOFF                                       89                             
299.00 111109      C                   READ      TXNMCDWRK1                             80                         
300.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
301.00 60517      C                   IF        *IN80='1'                                                         
302.00 60517      C                   SETON                                        89                             
303.00 60517      C                   ENDIF                                                                       
304.00 60516      C                   DOW       *IN80='0'                                                         
305.00 60516      C                   SELECT                                                                      
306.00 60530      C                   WHEN      BRCH=0 AND OFFI=*BLANK                                            
307.00 60516      C***FIRST PAGE                                                                                  
308.00 60530      C                   WRITE     HEADERCD                                                          
309.00 60517      C                   EXSR      DTLLINE                                                           
310.00 60516      C                   WRITE     DTL1                                                              
311.00 60530      C                   WRITE     DTLCD                                                             
312.00 60519      C                   ADD       4             LINE                                                
313.00 60516      C                                                                                               
314.00 60530      C                   WHEN      BRCH<>CDCUBRCH OR OFFI<>CDCUPOFF OR LINE>LTLN                     
315.00 60516      C***BREAK PAGE                                                                                  
316.00 60530      C                   IF        TMPCIF<>CDSDMLBR                                                  
317.00 60517      C***NOT SAME CIF                                                                                
318.00 60530      C                   WRITE     DTLCD1                                                            
319.00 60517      C                   WRITE     RECLINE                                                           
320.00 60519      C                   ADD       3             LINE                                                
321.00 60519      C                   ENDIF                                                                       
322.00 60519      C                                                                                               
323.00 60519      C                   SETON                                        98                             
324.00 60530      C                   WRITE     HEADERCD                                                          
325.00 60519      C                   SETOFF                                       98                             
326.00 60519      C                   Z-ADD     1             LINE                                                
327.00 60519      C                                                                                               
328.00 60517      C                   EXSR      DTLLINE                                                           
329.00 60517      C                   WRITE     DTL1                                                              
330.00 60530      C                   WRITE     DTLCD                                                             
331.00 60519      C                   ADD       4             LINE                                                
332.00 60518      C                   WHEN      LINE<=LTLN                                                        
333.00 60516      C***WRITE CURRENT PAGE                                                                          
334.00 60530      C                   IF        TMPCIF<>CDSDMLBR                                                  
335.00 60530      C                   WRITE     DTLCD1                                                            
336.00 60517      C                   WRITE     RECLINE                                                           
337.00 60519      C                   ADD       3             LINE                                                
338.00 60519      C                   EXSR      DTLLINE                                                           
339.00 60519      C                   WRITE     DTL1                                                              
340.00 60530      C                   WRITE     DTLCD                                                             
341.00 60519      C                   ADD       4             LINE                                                
342.00 60519      C                   ELSE                                                                        
343.00 60517      C                   EXSR      DTLLINE                                                           
344.00 60530      C                   WRITE     DTLCD                                                             
345.00 60519      C                   ADD       1             LINE                                                
346.00 60519      C                   ENDIF                                                                       
347.00 60517      C                   ENDSL                                                                       
348.00 60530      C                   EVAL      BRCH   = CDCUBRCH                                                 
349.00 60530      C                   EVAL      OFFI     = CDCUPOFF                                               
350.00 60530      C                   EVAL      TMPCIF   = CDSDMLBR                                               
351.00 60530      C                   EVAL      AWTLCRAMT= CDMTTLAMT                                              
352.00 111109      C                   READ      TXNMCDWRK1                             80                         
353.00 60516      C                   ENDDO                                                                       
354.00 60530      C  N89              WRITE     DTLCD1                                                            
355.00 60517      C                                                                                               
356.00 60523      C                   ENDIF                                                  *END RETAIL RPT      
357.00 60523      C                                                                                               
358.00 60523      C                                                                                               
359.00 60523      C                   IF        RNO='O'                                                           
360.00 60517      C*READ CORP AND PRI CUSTOMER                                                                    
361.00 60530      C                   MOVE      *BLANK        MARK              4                                 
362.00 60517      C                   MOVE      *BLANK        OFFI              3                                 
363.00 60517      C                   MOVE      *BLANK        TMPCIF           10                                 
364.00 60517      C                   Z-ADD     1             LINE              2 0                               
365.00 60517      C                   Z-ADD     0             PRETLAMT         13 2                               
366.00 60523      C                   SETOFF                                       89                             
367.00 111109      C                   READ      TXNMCDWRK2                             70                         
368.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
369.00 60523      C                   IF        *IN70<>'0'                                                        
370.00 60523      C                   SETON                                        89                             
371.00 60517      C                   ENDIF                                                                       
372.00 60517      C                                                                                               
373.00 60517      C                   DOW       *IN70='0'                                                         
374.00 60517      C                   SELECT                                                                      
375.00 60530      C                   WHEN      MARK=*BLANK AND OFFI=*BLANK                                       
376.00 60517      C***FIRST PAGE                                                                                  
377.00 60530      C                   WRITE     HEADERCD                                                          
378.00 60517      C                   EXSR      DTLLINE                                                           
379.00 60517      C                   WRITE     DTL1                                                              
380.00 60530      C                   WRITE     DTLCD                                                             
381.00 60519      C                   ADD       4             LINE                                                
382.00 60517      C                                                                                               
383.00 60530      C                   WHEN      MARK<>CDCUMARK OR OFFI<>CDCUPOFF OR LINE>LTLN                     
384.00 60517      C***BREAK PAGE                                                                                  
385.00 60530      C                   IF        TMPCIF<>CDSDMLBR                                                  
386.00 60517      C***NOT SAME CIF                                                                                
387.00 60530      C                   WRITE     DTLCD1                                                            
388.00 60517      C                   WRITE     RECLINE                                                           
389.00 60519      C                   ENDIF                                                                       
390.00 60519      C                                                                                               
391.00 60519      C                   Z-ADD     1             LINE                                                
392.00 60517      C                   SETON                                        98                             
393.00 60530      C                   WRITE     HEADERCD                                                          
394.00 60517      C                   SETOFF                                       98                             
395.00 60517      C                   EXSR      DTLLINE                                                           
396.00 60517      C                   WRITE     DTL1                                                              
397.00 60530      C                   WRITE     DTLCD                                                             
398.00 60519      C                   ADD       4             LINE                                                
399.00 60518      C                   WHEN      LINE<=LTLN                                                        
400.00 60517      C***WRITE CURRENT PAGE                                                                          
401.00 60530      C                   IF        TMPCIF<>CDSDMLBR                                                  
402.00 60530      C                   WRITE     DTLCD1                                                            
403.00 60517      C                   WRITE     RECLINE                                                           
404.00 60519      C                   ADD       3             LINE                                                
405.00 60517      C                   EXSR      DTLLINE                                                           
406.00 60517      C                   WRITE     DTL1                                                              
407.00 60530      C                   WRITE     DTLCD                                                             
408.00 60519      C                   ADD       4             LINE                                                
409.00 60517      C                   ELSE                                                                        
410.00 60517      C                   EXSR      DTLLINE                                                           
411.00 60530      C                   WRITE     DTLCD                                                             
412.00 60519      C                   ADD       1             LINE                                                
413.00 60517      C                   ENDIF                                                                       
414.00 60517      C                   ENDSL                                                                       
415.00 60530      C                   EVAL      MARK  = CDCUMARK                                                  
416.00 60530      C                   EVAL      OFFI     = CDCUPOFF                                               
417.00 60530      C                   EVAL      TMPCIF   = CDSDMLBR                                               
418.00 60530      C                   EVAL      AWTLCRAMT= CDMTTLAMT                                              
419.00 111109      C                   READ      TXNMCDWRK2                             70                         
420.00 60517      C                   ENDDO                                                                       
421.00 60530      C  N89              WRITE     DTLCD1                                                            
422.00 60523      C                   ENDIF                                                  *EXCLUDE RETAIL RPT  
423.00 60530      C   89              WRITE     HEADERCD                                                          
424.00 60519      C   89              WRITE     RNOREC                                                            
425.00 60517      C  N89              WRITE     ENDREC                                                            
426.00 60516      C                   ENDSR                                                                       
427.00 60516      C                                                                                               
428.00 60517      C                                                                                               
429.00 60517      C     DTLLINE       BEGSR                                                                       
430.00 60517      C                                                                                               
431.00 60530      C                   EVAL      AWCIF  = CDSDMLBR                                                 
432.00 60530      C                   MOVEL     CDCUMARK      AWMARK                                              
433.00 60530      C                   EVAL      AWBRNO = CDCUBRCH                                                 
434.00 60530      C                   EVAL      AWOFF  = CDCUPOFF                                                 
435.00 60530      C                   EVAL      AWNAME = CDCUSHRT                                                 
436.00 111108      C                   EVAL      AWSCCCD = ' '                                                     
437.00 120914 D2216C                   EVAL      AWSCCCD2 = ' '                                                    
438.00 111108      C                   EVAL      K03CIF = AWCIF                                                    
439.00 111108      C     KC03          CHAIN     CUP003                                                            
440.00 111108      C                   IF        %FOUND(CUP003)                                                    
441.00 111108      C                   EVAL      AWSCCCD = CURSPF                                                  
442.00 120914 D2216C                   EVAL      AWSCCCD2 = CUBHVF                                                 
443.00 111108      C                   ENDIF                                                                       
444.00 60529      C                                                                                               
445.00 60530      C                   EVAL      AWCCNO = CDTEACCT                                                 
446.00 60530      C                   EVAL      AWDATE = CDTETRDT                                                 
447.00 60530      C                   EVAL      AWPRISEC = CDSHPRIM                                               
448.00 60530      C                   MOVE      CDTETRCC      AWCCY                                               
449.00 60530      C                   Z-ADD     CDMAMT        AWAMT                                               
450.00 60530      C                   EVAL      AWNAR  = CDTEPDS1                                                 
451.00 60530      C                                                                                               
452.00 60530      C                   ENDSR                                                                       
453.00 60530      C                                                                                               
454.00 60530      C                                                                                               
455.00 120214 D2016C*----------------------------------------------------------------------------------------------
456.00 120214   |  C* Get transactions of that week                                                                
457.00 120214   |  C*----------------------------------------------------------------------------------------------
458.00 120214   |  C     GETTXNS       BEGSR                                                                       
459.00 120214   |  C                                                                                               
460.00 120214   |  C/EXEC SQL                                                                                      
461.00 120214   |  C+ INSERT INTO TXNCD1(CDCUMARK,CDCUPOFF,CDCUBRCH,                                               
462.00 120214   |  C+ CDSDMLBR,CDCUSHRT,CDTEACCT,CDSHPRIM,CDTETRDT,                                                
463.00 120214   |  C+ CDTETRCC,CDTETRNA,CDTEPDS1)                                                                  
464.00 120214   |  C+ SELECT TRIM(C.CUMARK), C.CUPOFF, C.CUBRCH, C.CUNBR, C.CUSHRT,                                
465.00 120214   |  C+ CHAR(A.CTXCARDNO), ' ', A.CTXPSTDATE, CASE WHEN B.CHLCCYCDE='MOP'                            
466.00 120214   |  C+ THEN '000' WHEN B.CHLCCYCDE ='HKD' THEN '344' WHEN B.CHLCCYCDE                               
467.00 120214   |  C+ ='CNY' THEN '156' ELSE '000' END CASE, -1*A.CTXTXAMT, A.CTXDESC                              
468.00 120214   |  C+ FROM ZPDCRTDC A, ZPDCRCDC B, CUP00301 C                                                      
469.00 120214   |  C+ WHERE A.CTXCARDNO = B.CHLCARDNO AND SUBSTR(                                                  
470.00 120214   |  C+ DIGITS(B.CHLACHACCT),7,10) = C.CUNBR AND A.CTXDESC LIKE                                      
471.00 120214   |  C+ '%PAYMENT%' AND A.CTXTXCODE = 20 AND                                                         
472.00 120214   |  C+ ZONED(SUBSTR(DIGITS(A.CTXPSTDATE),1,6),6,0) >= :STRMON AND                                   
473.00 120214   |  C+ ZONED(SUBSTR(DIGITS(A.CTXPSTDATE),1,6),6,0) <= :ENDMON                                       
474.00 120214   |  C+ AND C.CUMARK = 'RET' AND                                                                     
475.00 120214   |  C+ B.CHLBLKCDE NOT IN ('E','Z','K', 'O','X','Y','Q','I','T')                                    
476.00 120214   |  C+ AND B.CHLCRDSTS IN ('1','2','0')                                                             
477.00 120214   |  C/END-EXEC                                                                                      
478.00 120214   |  C                                                                                               
479.00 120214   |  C/EXEC SQL                                                                                      
480.00 120214   |  C+ INSERT INTO TXNCD2(CDCUMARK,CDCUPOFF,CDCUBRCH,                                               
481.00 120214   |  C+ CDSDMLBR,CDCUSHRT,CDTEACCT,CDSHPRIM,CDTETRDT,                                                
482.00 120214   |  C+ CDTETRCC,CDTETRNA,CDTEPDS1)                                                                  
483.00 120214   |  C+ SELECT TRIM(C.CUMARK), C.CUPOFF, C.CUBRCH, C.CUNBR, C.CUSHRT,                                
484.00 120214   |  C+ CHAR(A.CTXCARDNO), ' ', A.CTXPSTDATE, CASE WHEN B.CHLCCYCDE='MOP'                            
485.00 120214   |  C+ THEN '000' WHEN B.CHLCCYCDE ='HKD' THEN '344' WHEN B.CHLCCYCDE                               
486.00 120214   |  C+ ='CNY' THEN '156' ELSE '000' END CASE, -1*A.CTXTXAMT, A.CTXDESC                              
487.00 120214   |  C+ FROM ZPDCRTDC A, ZPDCRCDC B, CUP00301 C                                                      
488.00 120214   |  C+ WHERE A.CTXCARDNO = B.CHLCARDNO AND SUBSTR(                                                  
489.00 120214   |  C+ DIGITS(B.CHLACHACCT),7,10) = C.CUNBR AND A.CTXDESC LIKE                                      
490.00 120214   |  C+ '%PAYMENT%' AND A.CTXTXCODE = 20 AND                                                         
491.00 120214   |  C+ ZONED(SUBSTR(DIGITS(A.CTXPSTDATE),1,6),6,0) >= :STRMON AND                                   
492.00 120214   |  C+ ZONED(SUBSTR(DIGITS(A.CTXPSTDATE),1,6),6,0) <= :ENDMON                                       
493.00 120214   |  C+ AND C.CUMARK <> 'RET' AND                                                                    
494.00 120214   |  C+ B.CHLBLKCDE NOT IN ('E','Z','K', 'O','X','Y','Q','I','T')                                    
495.00 120214   |  C+ AND B.CHLCRDSTS IN ('1','2','0')                                                             
496.00 120214   |  C/END-EXEC                                                                                      
497.00 120214   |  C                                                                                               
498.00 120214 D2016C                   ENDSR                                                                       
499.00 60530      C                                                                                               
