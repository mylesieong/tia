1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                                       
2.00 60608      H********************************************************************************************** 
3.00 60608      H* Program      : AML_GCDCC                                                                     
4.00 60608      H* Reference    : CHG-166-06                                                                    
5.00 60608      H* Created By   : Aries Lung (B454PGM)                                                          
6.00 60608      H* Changed Date : 08 Jun 2006                                                                   
7.00 60608      H* Description  : Generate Deposit in Credit Card Account for AML report (9)                    
8.00 60608      H********************************************************************************************** 
9.00 111019      H* Reference    : CHG-315-11 (D1315)                                                            
10.00 111019      H* Created By   : Karl (BA55PGM)                                                                
11.00 111019      H* Changed Date : 19 Oct 2011                                                                   
12.00 111019      H* Description  : Add SCC code in report                                                        
13.00 111019      H********************************************************************************************** 
14.00 120214      H* Reference    : CHG-016-12 (D2016)                                                            
15.00 120214      H* Created By   : Karl (BA55PGM)                                                                
16.00 120214      H* Changed Date : 14 Feb 2012                                                                   
17.00 120214      H* Description  : Get the transactions from ZPDCRTDC                                            
18.00 120214      H********************************************************************************************** 
19.00 120914      H* Reference    : CHG-216-12 (D2216)                                                            
20.00 120914      H* Created By   : Joanna(BE95PGM)                                                               
21.00 120914      H* Changed Date : 14 SEP 2012                                                                   
22.00 120914      H* Description  : Add new field Scc code2                                                       
23.00 120914      H*                                                                                              
24.00 120914      H********************************************************************************************** 
25.00 160825      H* Reference    : CHG-262-16 (D6262)                                                            
26.00 160825      H* Created By   : Myles Ieong (BI77PGM)                                                         
27.00 160825      H* Changed Date : 04 Aug 2016                                                                   
28.00 160825      H* Description  : AML report parameter changing and revoking                                    
29.00 160825      H*                                                                                              
30.00 160825      H********************************************************************************************** 
31.00 170606      H* Reference    : CHG-196-17 (D7196)                                                            
32.00 170420      H* Created By   : Albert Au   (BG09PGM)                                                         
33.00 170420      H* Changed Date : 10 Apr 2017                                                                   
34.00 170420      H* Description  : Remove the transaction for CIF's with officer code as 'PER'                   
35.00 170420      H*                                                                                              
36.00 170420      H********************************************************************************************** 
37.00 60530      FTXNWCD1   UF   E           K DISK    USROPN                                                    
38.00 60530      FTXNWCD2   UF   E           K DISK    USROPN                                                    
39.00 60527      FCUP003    IF   E           K DISK                                                              
40.00 60527      FTAP00101B IF   E             DISK                                                              
41.00 60530      FAMLDDNCTX UF A E           K DISK                                                              
42.00 60530      FTXNWCDWRK1IF   E           K DISK                                                              
43.00 60530      FTXNWCDWRK2IF   E           K DISK                                                              
44.00 60529      FICBSRATE  IF   E             DISK    USROPN                                                    
45.00 60529      F                                                                                               
46.00 60530      FAML_CCRPT O    E             PRINTER OFLIND(*IN98)                                             
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
58.00 170606 D7196C                   PARM                    PRPT              1                                 
59.00 60517      C                                                                                               
60.00 60519      C*----------------------------------------------------------------------------------------------
61.00 60519      C* KEY LIST                                                                                     
62.00 60519      C*----------------------------------------------------------------------------------------------
63.00 60530      C     KTD           KLIST                                                                       
64.00 60519      C                   KFLD                    KTCIF            10                                 
65.00 60530      C                   KFLD                    KTINOUT           2                                 
66.00 60516      C                                                                                               
67.00 60527      C     KC03          KLIST                                                                       
68.00 60527      C                   KFLD                    K03BNO            3 0                               
69.00 60527      C                   KFLD                    K03CIF           10                                 
70.00 60527      C                   Z-ADD     001           K03BNO                                              
71.00 60516      C*----------------------------------------------------------------------------------------------
72.00 60527      C* Main Program                                                                                 
73.00 60516      C*----------------------------------------------------------------------------------------------
74.00 60527      C                   EXSR      GETFLDTE                                                          
75.00 170606 D7196C                   IF        PRPT = 'C'                                                        
76.00 60527      C                   IF        RNO='R'                                                           
77.00 120214 D2016C                   EXSR      GETTXNS                                                           
78.00 60529      C***EXTRACT DATA FROM AML003                                                                    
79.00 60529      C                   EXSR      CLSQL                                                             
80.00 60529      C***GET BRANCH NO AND MOP AMOUNT                                                                
81.00 60530      C                   OPEN      TXNWCD1                                                           
82.00 60530      C                   READ      TXNWCD1                                50                         
83.00 60529      C                   DOW       *IN50='0'                                                         
84.00 60527      C                   EXSR      GETFLD                                                            
85.00 60530      C                   UPDATE    RWCD1                                                             
86.00 60530      C                   READ      TXNWCD1                                50                         
87.00 60529      C                   ENDDO                                                                       
88.00 60530      C                   CLOSE     TXNWCD1                                                           
89.00 60529      C                                                                                               
90.00 60530      C                   OPEN      TXNWCD2                                                           
91.00 60530      C                   READ      TXNWCD2                                40                         
92.00 60529      C                   DOW       *IN40='0'                                                         
93.00 60529      C                   EXSR      GETFLD                                                            
94.00 60530      C                   UPDATE    RWCD2                                                             
95.00 60530      C                   READ      TXNWCD2                                40                         
96.00 60529      C                   ENDDO                                                                       
97.00 60530      C                   CLOSE     TXNWCD2                                                           
98.00 60527      C                                                                                               
99.00 60529      C                   EXSR      CALTMPTLAMT                                                       
100.00 60530      C                   OPEN      TXNWCD1                                                           
101.00 60530      C                   READ      TXNWCD1                                50                         
102.00 60529      C                   DOW       *IN50='0'                                                         
103.00 60529      C                   EXSR      CALTLAMT                                                          
104.00 60530      C                   UPDATE    RWCD1                                                             
105.00 60530      C                   READ      TXNWCD1                                50                         
106.00 60530      C                   ENDDO                                                                       
107.00 60530      C                   CLOSE     TXNWCD1                                                           
108.00 60529      C                                                                                               
109.00 60530      C                   OPEN      TXNWCD2                                                           
110.00 60530      C                   READ      TXNWCD2                                40                         
111.00 60529      C                   DOW       *IN40='0'                                                         
112.00 60529      C                   EXSR      CALTLAMT                                                          
113.00 60530      C                   UPDATE    RWCD2                                                             
114.00 60530      C                   READ      TXNWCD2                                40                         
115.00 60529      C                   ENDDO                                                                       
116.00 60530      C                   CLOSE     TXNWCD2                                                           
117.00 60529      C                                                                                               
118.00 60519      C                                                                                               
119.00 60518      C                   EXSR      GWKTXN                                                            
120.00 60523      C                   ENDIF                                                                       
121.00 170606 D7196C                   ENDIF                                                                       
122.00 60519      C                                                                                               
123.00 170606 D7196C                   IF        PRPT = 'P'                                                        
124.00 170606 D7196C                   OPEN      AML_CCRPT                                                         
125.00 60517      C                   EXSR      GENRPT                                                            
126.00 170606 D7196C                   CLOSE     AML_CCRPT                                                         
127.00 170606 D7196C                   ENDIF                                                                       
128.00 60516      C                   SETON                                        LR                             
129.00 60527      C                                                                                               
130.00 60527      C*----------------------------------------------------------------------------------------------
131.00 60527      C* GET BRANCH NO AND CCY CODE                                                                   
132.00 60527      C*----------------------------------------------------------------------------------------------
133.00 60527      C     GETFLD        BEGSR                                                                       
134.00 60527      C                                                                                               
135.00 60527      C***GET CCY CODE AND CALCULATE MOP AMOUNT                                                       
136.00 60530      C                   MOVE      CDTETRCC      TMPCCY            3 0                               
137.00 60529      C                   OPEN      ICBSRATE                                                          
138.00 60527      C                   READ      ICBSRATE                               55                         
139.00 60527      C                   DOW       *IN55='0'                                                         
140.00 60530      C                   IF        RCCY=TMPCCY                                                       
141.00 60530      C                   EVAL      CDMAMT     = CDTETRNA*RCCRTE                                      
142.00 60530      C                   CLOSE     ICBSRATE                                                          
143.00 60530      C                   LEAVESR                                                                     
144.00 60527      C                   ENDIF                                                                       
145.00 60527      C                   READ      ICBSRATE                               55                         
146.00 60527      C                   ENDDO                                                                       
147.00 60529      C                   CLOSE     ICBSRATE                                                          
148.00 60527      C                   ENDSR                                                                       
149.00 60527      C                                                                                               
150.00 60527      C                                                                                               
151.00 60516      C*----------------------------------------------------------------------------------------------
152.00 60516      C* SQL                                                                                          
153.00 60516      C*----------------------------------------------------------------------------------------------
154.00 60516      C     CLSQL         BEGSR                                                                       
155.00 60530      C*********EXTRACT RETAIL DAILY CASH DEPOSIT IN CREDIT CARD ACCOUNT                              
156.00 60527      C                                                                                               
157.00 60527      C                                                                                               
158.00 60608      C*EXEC SQL                                                                                      
159.00 60608      C* INSERT INTO TXNWCD1(CDCUMARK,CDCUPOFF,CDCUBRCH,                                              
160.00 60608      C* CDSDMLBR,CDCUSHRT,CDTEACCT,CDSHPRIM,CDTETRDT,                                                
161.00 60608      C* CDTETRCC,CDTETRNA,CDTEPDS1)                                                                  
162.00 60608      C* SELECT  TRIM(C03.CUMARK) ,C03.CUPOFF, C03.CUBRCH , SC.SDMLBR ,                               
163.00 60608      C* C03.CUSHRT , C0P.TEACCT , SC.SHPRIM , C0P.TETRDT ,                                           
164.00 60608      C* C0P.TETRCC , C0P.TETRNA ,  C0P.TEPDS1                                                        
165.00 60608      C* FROM C0P C0P,SCRDPRF SC,CUP00301 C03                                                         
166.00 60608      C* WHERE C0P.TEACCT = SC.SHCARD AND SC.SHACTV ='A'                                              
167.00 60608      C* AND SC.SDMLBR= C03.CUNBR AND CUMARK='RET'                                                    
168.00 60608      C*                                                                                              
169.00 60608      C*                                                                                              
170.00 60608      C*END-EXEC                                                                                      
171.00 60527      C                                                                                               
172.00 60530      C*********EXTRACT EXCLUDE RETAIL DAILY CASH DEPOSIT IN CREDIT CARD ACCOUNT                      
173.00 60527      C                                                                                               
174.00 60608      C*EXEC SQL                                                                                      
175.00 60608      C* INSERT INTO TXNWCD2 (CDCUMARK,CDCUPOFF,CDCUBRCH,                                             
176.00 60608      C* CDSDMLBR,CDCUSHRT,CDTEACCT,CDSHPRIM,CDTETRDT,                                                
177.00 60608      C* CDTETRCC,CDTETRNA,CDTEPDS1)                                                                  
178.00 60608      C* SELECT  TRIM(C03.CUMARK) ,C03.CUPOFF, C03.CUBRCH , SC.SDMLBR ,                               
179.00 60608      C* C03.CUSHRT , C0P.TEACCT , SC.SHPRIM , C0P.TETRDT ,                                           
180.00 60608      C* C0P.TETRCC , C0P.TETRNA ,  C0P.TEPDS1                                                        
181.00 60608      C* FROM C0P C0P,SCRDPRF SC,CUP00301 C03                                                         
182.00 60608      C* WHERE C0P.TEACCT = SC.SHCARD AND SC.SHACTV ='A'                                              
183.00 60608      C* AND SC.SDMLBR= C03.CUNBR AND CUMARK<>'RET'                                                   
184.00 60608      C*END-EXEC                                                                                      
185.00 60527      C                                                                                               
186.00 60516      C                                                                                               
187.00 60516      C                   ENDSR                                                                       
188.00 60518      C                                                                                               
189.00 60518      C*----------------------------------------------------------------------------------------------
190.00 60518      C* CAL TOTAL AMOUNT IN TMP PF                                                                   
191.00 60518      C*----------------------------------------------------------------------------------------------
192.00 60518      C     CALTMPTLAMT   BEGSR                                                                       
193.00 60518      C                                                                                               
194.00 60530      C*--Calculate TOTAL DEPOSIT IN CREDIT CARD ACC                                                  
195.00 60530      C*---------------------------------------------                                                 
196.00 60518      C/EXEC SQL                                                                                      
197.00 60530      C+ INSERT INTO AMLDDNCTX                                                                        
198.00 60530      C+ SELECT  CDSDMLBR, SUM(CDMAMT) ,COUNT(CDSDMLBR)                                               
199.00 60530      C+ FROM TXNWCD1                                                                                 
200.00 60530      C+ GROUP BY CDSDMLBR                                                                            
201.00 60518      C/END-EXEC                                                                                      
202.00 60518      C                                                                                               
203.00 60530      C/EXEC SQL                                                                                      
204.00 60530      C+ INSERT INTO AMLDDNCTX                                                                        
205.00 60530      C+ SELECT  CDSDMLBR, SUM(CDMAMT) ,COUNT(CDSDMLBR)                                               
206.00 60530      C+ FROM TXNWCD2                                                                                 
207.00 60530      C+ GROUP BY CDSDMLBR                                                                            
208.00 60530      C/END-EXEC                                                                                      
209.00 60518      C                                                                                               
210.00 60518      C                                                                                               
211.00 60518      C                   ENDSR                                                                       
212.00 60518      C                                                                                               
213.00 60524      C     GETFLDTE      BEGSR                                                                       
214.00 60524      C                   READ      TAP00101B                              10                         
215.00 60524      C                   DOW       *IN10='0'                                                         
216.00 60524      C                   IF        DSBK=1                                                            
217.00 60530      C                   CALL      'DFJJTOYY'                                                        
218.00 60530      C                   PARM                    DSFDW                                               
219.00 60530      C                   PARM                    FDTE                                                
220.00 60530      C                                                                                               
221.00 60530      C                   CALL      'DFJJTOYY'                                                        
222.00 60530      C                   PARM                    DSLDW                                               
223.00 60530      C                   PARM                    LDTE                                                
224.00 60530      C                                                                                               
225.00 60530      C*                  CALL      'DFJJTOYY'                                                        
226.00 60530      C*                  PARM                    DSDT                                                
227.00 60530      C*                  PARM                    TODTE                                               
228.00 60530      C                   ENDIF                                                                       
229.00 60524      C                   READ      TAP00101B                              10                         
230.00 60524      C                   ENDDO                                                                       
231.00 60524      C                                                                                               
232.00 60524      C                   ENDSR                                                                       
233.00 60518      C                                                                                               
234.00 60518      C     GWKTXN        BEGSR                                                                       
235.00 60519      C                                                                                               
236.00 60519      C/EXEC SQL                                                                                      
237.00 60530      C+ INSERT INTO TXNWCDWRK1                                                                       
238.00 60519      C+ SELECT *                                                                                     
239.00 60530      C+ FROM TXNWCD1                                                                                 
240.00 160825 D6262C*+ WHERE CDMTTLAMT>=100000 OR CDNOTXN>=3                                                       
241.00 160825 D6262C+ WHERE CDMTTLAMT>=20000 AND CDNOTXN>=5                                                        
242.00 60519      C/END-EXEC                                                                                      
243.00 60519      C                                                                                               
244.00 60519      C/EXEC SQL                                                                                      
245.00 60605      C+ INSERT INTO TXNWCDWRK2                                                                       
246.00 60519      C+ SELECT *                                                                                     
247.00 60530      C+ FROM TXNWCD2                                                                                 
248.00 160825 D6262C*+ WHERE CDMTTLAMT>=100000 OR CDNOTXN>=3                                                       
249.00 160825 D6262C+ WHERE CDMTTLAMT>=20000 AND CDNOTXN>=5                                                        
250.00 60519      C/END-EXEC                                                                                      
251.00 60518      C                   ENDSR                                                                       
252.00 60518      C                                                                                               
253.00 60518      C*----------------------------------------------------------------------------------------------
254.00 60518      C* CALCULATE CREDIT OR DEBIT AND TOTAL CR+DB DAILY TXN AMOUNT                                   
255.00 60518      C*----------------------------------------------------------------------------------------------
256.00 60518      C     CALTLAMT      BEGSR                                                                       
257.00 60529      C*** GET IN + OUT TOTAL TXN AMOUNT                                                              
258.00 60530      C     CDSDMLBR      CHAIN     AMLDDNCTX                          45                             
259.00 60519      C                   IF        *IN45='0'                                                         
260.00 60530      C                   EVAL      CDMTTLAMT =DTMTXAMT                                               
261.00 60530      C                   EVAL      CDNOTXN   =DTNOTXN                                                
262.00 60519      C                   ENDIF                                                                       
263.00 60519      C                                                                                               
264.00 60518      C                   ENDSR                                                                       
265.00 60516      C*----------------------------------------------------------------------------------------------
266.00 60516      C* Generate Report                                                                              
267.00 60516      C*----------------------------------------------------------------------------------------------
268.00 60516      C     GENRPT        BEGSR                                                                       
269.00 60523      C                                                                                               
270.00 60523      C                   Z-ADD     39            LTLN              2 0                               
271.00 60523      C                                                                                               
272.00 60523      C                   IF        RNO='R'                                                           
273.00 60516      C*READ RETAIL CUSTOMER                                                                          
274.00 60516      C                   MOVE      *BLANK        OFFI              3                                 
275.00 60530      C                   Z-ADD     0             BRCH              3 0                               
276.00 60516      C                   MOVE      *BLANK        TMPCIF           10                                 
277.00 60516      C                   Z-ADD     1             LINE              2 0                               
278.00 60517      C                   SETOFF                                       89                             
279.00 60530      C                   READ      TXNWCDWRK1                             80                         
280.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
281.00 60517      C                   IF        *IN80='1'                                                         
282.00 60517      C                   SETON                                        89                             
283.00 60517      C                   ENDIF                                                                       
284.00 60516      C                   DOW       *IN80='0'                                                         
285.00 60516      C                   SELECT                                                                      
286.00 60530      C                   WHEN      BRCH=0 AND OFFI=*BLANK                                            
287.00 60516      C***FIRST PAGE                                                                                  
288.00 60530      C                   WRITE     HEADERCD                                                          
289.00 60517      C                   EXSR      DTLLINE                                                           
290.00 60516      C                   WRITE     DTL1                                                              
291.00 60530      C                   WRITE     DTLCD                                                             
292.00 60519      C                   ADD       4             LINE                                                
293.00 60516      C                                                                                               
294.00 60530      C                   WHEN      BRCH<>CDCUBRCH OR OFFI<>CDCUPOFF OR LINE>LTLN                     
295.00 60516      C***BREAK PAGE                                                                                  
296.00 60530      C                   IF        TMPCIF<>CDSDMLBR                                                  
297.00 60517      C***NOT SAME CIF                                                                                
298.00 60530      C                   WRITE     DTLCD1                                                            
299.00 60517      C                   WRITE     RECLINE                                                           
300.00 60519      C                   ADD       3             LINE                                                
301.00 60519      C                   ENDIF                                                                       
302.00 60519      C                                                                                               
303.00 60519      C                   SETON                                        98                             
304.00 60530      C                   WRITE     HEADERCD                                                          
305.00 60519      C                   SETOFF                                       98                             
306.00 60519      C                   Z-ADD     1             LINE                                                
307.00 60519      C                                                                                               
308.00 60517      C                   EXSR      DTLLINE                                                           
309.00 60517      C                   WRITE     DTL1                                                              
310.00 60530      C                   WRITE     DTLCD                                                             
311.00 60519      C                   ADD       4             LINE                                                
312.00 60518      C                   WHEN      LINE<=LTLN                                                        
313.00 60516      C***WRITE CURRENT PAGE                                                                          
314.00 60530      C                   IF        TMPCIF<>CDSDMLBR                                                  
315.00 60530      C                   WRITE     DTLCD1                                                            
316.00 60517      C                   WRITE     RECLINE                                                           
317.00 60519      C                   ADD       3             LINE                                                
318.00 60519      C                   EXSR      DTLLINE                                                           
319.00 60519      C                   WRITE     DTL1                                                              
320.00 60530      C                   WRITE     DTLCD                                                             
321.00 60519      C                   ADD       4             LINE                                                
322.00 60519      C                   ELSE                                                                        
323.00 60517      C                   EXSR      DTLLINE                                                           
324.00 60530      C                   WRITE     DTLCD                                                             
325.00 60519      C                   ADD       1             LINE                                                
326.00 60519      C                   ENDIF                                                                       
327.00 60517      C                   ENDSL                                                                       
328.00 60530      C                   EVAL      BRCH   = CDCUBRCH                                                 
329.00 60530      C                   EVAL      OFFI     = CDCUPOFF                                               
330.00 60530      C                   EVAL      TMPCIF   = CDSDMLBR                                               
331.00 60530      C                   EVAL      AWTLCRAMT= CDMTTLAMT                                              
332.00 60530      C                   READ      TXNWCDWRK1                             80                         
333.00 60516      C                   ENDDO                                                                       
334.00 60530      C  N89              WRITE     DTLCD1                                                            
335.00 60517      C                                                                                               
336.00 60523      C                   ENDIF                                                  *END RETAIL RPT      
337.00 60523      C                                                                                               
338.00 60523      C                                                                                               
339.00 60523      C                   IF        RNO='O'                                                           
340.00 60517      C*READ CORP AND PRI CUSTOMER                                                                    
341.00 60530      C                   MOVE      *BLANK        MARK              4                                 
342.00 60517      C                   MOVE      *BLANK        OFFI              3                                 
343.00 60517      C                   MOVE      *BLANK        TMPCIF           10                                 
344.00 60517      C                   Z-ADD     1             LINE              2 0                               
345.00 60517      C                   Z-ADD     0             PRETLAMT         13 2                               
346.00 60523      C                   SETOFF                                       89                             
347.00 60530      C                   READ      TXNWCDWRK2                             70                         
348.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
349.00 60523      C                   IF        *IN70<>'0'                                                        
350.00 60523      C                   SETON                                        89                             
351.00 60517      C                   ENDIF                                                                       
352.00 60517      C                                                                                               
353.00 60517      C                   DOW       *IN70='0'                                                         
354.00 60517      C                   SELECT                                                                      
355.00 60530      C                   WHEN      MARK=*BLANK AND OFFI=*BLANK                                       
356.00 60517      C***FIRST PAGE                                                                                  
357.00 60530      C                   WRITE     HEADERCD                                                          
358.00 60517      C                   EXSR      DTLLINE                                                           
359.00 60517      C                   WRITE     DTL1                                                              
360.00 60530      C                   WRITE     DTLCD                                                             
361.00 60519      C                   ADD       4             LINE                                                
362.00 60517      C                                                                                               
363.00 60530      C                   WHEN      MARK<>CDCUMARK OR OFFI<>CDCUPOFF OR LINE>LTLN                     
364.00 60517      C***BREAK PAGE                                                                                  
365.00 60530      C                   IF        TMPCIF<>CDSDMLBR                                                  
366.00 60517      C***NOT SAME CIF                                                                                
367.00 60530      C                   WRITE     DTLCD1                                                            
368.00 60517      C                   WRITE     RECLINE                                                           
369.00 60519      C                   ENDIF                                                                       
370.00 60519      C                                                                                               
371.00 60519      C                   Z-ADD     1             LINE                                                
372.00 60517      C                   SETON                                        98                             
373.00 60530      C                   WRITE     HEADERCD                                                          
374.00 60517      C                   SETOFF                                       98                             
375.00 60517      C                   EXSR      DTLLINE                                                           
376.00 60517      C                   WRITE     DTL1                                                              
377.00 60530      C                   WRITE     DTLCD                                                             
378.00 60519      C                   ADD       4             LINE                                                
379.00 60518      C                   WHEN      LINE<=LTLN                                                        
380.00 60517      C***WRITE CURRENT PAGE                                                                          
381.00 60530      C                   IF        TMPCIF<>CDSDMLBR                                                  
382.00 60530      C                   WRITE     DTLCD1                                                            
383.00 60517      C                   WRITE     RECLINE                                                           
384.00 60519      C                   ADD       3             LINE                                                
385.00 60517      C                   EXSR      DTLLINE                                                           
386.00 60517      C                   WRITE     DTL1                                                              
387.00 60530      C                   WRITE     DTLCD                                                             
388.00 60519      C                   ADD       4             LINE                                                
389.00 60517      C                   ELSE                                                                        
390.00 60517      C                   EXSR      DTLLINE                                                           
391.00 60530      C                   WRITE     DTLCD                                                             
392.00 60519      C                   ADD       1             LINE                                                
393.00 60517      C                   ENDIF                                                                       
394.00 60517      C                   ENDSL                                                                       
395.00 60530      C                   EVAL      MARK  = CDCUMARK                                                  
396.00 60530      C                   EVAL      OFFI     = CDCUPOFF                                               
397.00 60530      C                   EVAL      TMPCIF   = CDSDMLBR                                               
398.00 60530      C                   EVAL      AWTLCRAMT= CDMTTLAMT                                              
399.00 60530      C                   READ      TXNWCDWRK2                             70                         
400.00 60517      C                   ENDDO                                                                       
401.00 60530      C  N89              WRITE     DTLCD1                                                            
402.00 60523      C                   ENDIF                                                  *EXCLUDE RETAIL RPT  
403.00 60530      C   89              WRITE     HEADERCD                                                          
404.00 60519      C   89              WRITE     RNOREC                                                            
405.00 60517      C  N89              WRITE     ENDREC                                                            
406.00 60516      C                   ENDSR                                                                       
407.00 60516      C                                                                                               
408.00 60517      C                                                                                               
409.00 60517      C     DTLLINE       BEGSR                                                                       
410.00 60517      C                                                                                               
411.00 60530      C                   EVAL      AWCIF  = CDSDMLBR                                                 
412.00 60530      C                   MOVEL     CDCUMARK      AWMARK                                              
413.00 60530      C                   EVAL      AWBRNO = CDCUBRCH                                                 
414.00 60530      C                   EVAL      AWOFF  = CDCUPOFF                                                 
415.00 60530      C                   EVAL      AWNAME = CDCUSHRT                                                 
416.00 111019 D1315C                   EVAL      AWSCCCD = ' '                                                     
417.00 120914 D2216C                   EVAL      AWSCCCD2 = ' '                                                    
418.00 111019   |  C                   EVAL      K03CIF = AWCIF                                                    
419.00 111019   |  C     KC03          CHAIN     CUP003                                                            
420.00 111019   |  C                   IF        %FOUND(CUP003)                                                    
421.00 120914 D1315C                   EVAL      AWSCCCD = CURSPF                                                  
422.00 120914 D2216C                   EVAL      AWSCCCD2 = CUBHVF                                                 
423.00 111019 D1315C                   ENDIF                                                                       
424.00 60529      C                                                                                               
425.00 60530      C                   EVAL      AWCCNO = CDTEACCT                                                 
426.00 60530      C                   EVAL      AWDATE = CDTETRDT                                                 
427.00 60530      C                   EVAL      AWPRISEC = CDSHPRIM                                               
428.00 60530      C                   MOVE      CDTETRCC      AWCCY                                               
429.00 60530      C                   Z-ADD     CDMAMT        AWAMT                                               
430.00 60530      C                   EVAL      AWNAR  = CDTEPDS1                                                 
431.00 60530      C                                                                                               
432.00 60530      C                   ENDSR                                                                       
433.00 60530      C                                                                                               
434.00 60530      C                                                                                               
435.00 60530      C                                                                                               
436.00 120214 D2016C*----------------------------------------------------------------------------------------------
437.00 120214   |  C* Get transactions of that week                                                                
438.00 120214   |  C*----------------------------------------------------------------------------------------------
439.00 120214   |  C     GETTXNS       BEGSR                                                                       
440.00 120214   |  C                                                                                               
441.00 120214   |  C/EXEC SQL                                                                                      
442.00 120214   |  C+ INSERT INTO TXNWCD1(CDCUMARK,CDCUPOFF,CDCUBRCH,                                              
443.00 120214   |  C+ CDSDMLBR,CDCUSHRT,CDTEACCT,CDSHPRIM,CDTETRDT,                                                
444.00 120214   |  C+ CDTETRCC,CDTETRNA,CDTEPDS1)                                                                  
445.00 120214   |  C+ SELECT TRIM(C.CUMARK), C.CUPOFF, C.CUBRCH, C.CUNBR, C.CUSHRT,                                
446.00 120214   |  C+ CHAR(A.CTXCARDNO), ' ', A.CTXPSTDATE, CASE WHEN B.CHLCCYCDE='MOP'                            
447.00 120214   |  C+ THEN '000' WHEN B.CHLCCYCDE ='HKD' THEN '344' WHEN B.CHLCCYCDE                               
448.00 120214   |  C+ ='CNY' THEN '156' ELSE '000' END CASE, -1*A.CTXTXAMT, A.CTXDESC                              
449.00 120214   |  C+ FROM ZPDCRTDC A, ZPDCRCDC B, CUP00301 C                                                      
450.00 120214   |  C+ WHERE A.CTXCARDNO = B.CHLCARDNO AND SUBSTR(                                                  
451.00 120214   |  C+ DIGITS(B.CHLACHACCT),7,10) = C.CUNBR AND A.CTXDESC LIKE                                      
452.00 120214   |  C+ '%PAYMENT%' AND A.CTXTXCODE = 20 AND A.CTXPSTDATE >= :FDTE                                   
453.00 120214   |  C+ AND A.CTXPSTDATE <= :LDTE AND C.CUMARK = 'RET' AND                                           
454.00 120214   |  C+ B.CHLBLKCDE NOT IN ('E','Z','K', 'O','X','Y','Q','I','T')                                    
455.00 120214   |  C+ AND B.CHLCRDSTS IN ('1','2','0')                                                             
456.00 120214   |  C/END-EXEC                                                                                      
457.00 120214   |  C                                                                                               
458.00 120214   |  C/EXEC SQL                                                                                      
459.00 120214   |  C+ INSERT INTO TXNWCD2(CDCUMARK,CDCUPOFF,CDCUBRCH,                                              
460.00 120214   |  C+ CDSDMLBR,CDCUSHRT,CDTEACCT,CDSHPRIM,CDTETRDT,                                                
461.00 120214   |  C+ CDTETRCC,CDTETRNA,CDTEPDS1)                                                                  
462.00 120214   |  C+ SELECT TRIM(C.CUMARK), C.CUPOFF, C.CUBRCH, C.CUNBR, C.CUSHRT,                                
463.00 120214   |  C+ CHAR(A.CTXCARDNO), ' ', A.CTXPSTDATE, CASE WHEN B.CHLCCYCDE='MOP'                            
464.00 120214   |  C+ THEN '000' WHEN B.CHLCCYCDE ='HKD' THEN '344' WHEN B.CHLCCYCDE                               
465.00 120214   |  C+ ='CNY' THEN '156' ELSE '000' END CASE, -1*A.CTXTXAMT, A.CTXDESC                              
466.00 120214   |  C+ FROM ZPDCRTDC A, ZPDCRCDC B, CUP00301 C                                                      
467.00 120214   |  C+ WHERE A.CTXCARDNO = B.CHLCARDNO AND SUBSTR(                                                  
468.00 120214   |  C+ DIGITS(B.CHLACHACCT),7,10) = C.CUNBR AND A.CTXDESC LIKE                                      
469.00 120214   |  C+ '%PAYMENT%' AND A.CTXTXCODE = 20 AND A.CTXPSTDATE >= :FDTE                                   
470.00 120214   |  C+ AND A.CTXPSTDATE <= :LDTE AND C.CUMARK <> 'RET' AND                                          
471.00 120214   |  C+ B.CHLBLKCDE NOT IN ('E','Z','K', 'O','X','Y','Q','I','T')                                    
472.00 120214   |  C+ AND B.CHLCRDSTS IN ('1','2','0')                                                             
473.00 120214   |  C/END-EXEC                                                                                      
474.00 120214   |  C                                                                                               
475.00 120214 D2016C                   ENDSR                                                                       
