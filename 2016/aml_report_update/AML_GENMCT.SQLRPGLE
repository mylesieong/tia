1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                                       
2.00 60608      H********************************************************************************************** 
3.00 111019      H* Program      : AML_GENMCT                                                                    
4.00 111019      H* Reference    : CHG-315-11 (D1315)                                                            
5.00 111019      H* Created By   : Karl (BA55PGM)                                                                
6.00 111019      H* Changed Date : 19 Oct 2011                                                                   
7.00 111019      H* Description  : Generate Monthly CASH TRANSACTION for AML report                              
8.00 111019      H********************************************************************************************** 
9.00 120817      H* Reference    : CHG-230-12 (D2230)                                                            
10.00 120817      H* Created By   : Karl (BA55PGM)                                                                
11.00 120817      H* Changed Date : 17 AUG 2012                                                                   
12.00 120817      H* Description  : 1. Add 1 more PARM to specify the customer type (P/N)                         
13.00 120817      H*                2. Add logic to handle the new PARM                                           
14.00 120817      H*                3. Change the gen report criteria (accumulated amount &                       
15.00 120817      H*                   no. of txn)                                                                
16.00 120817      H********************************************************************************************** 
17.00 120914      H* Reference    : CHG-216-12 (D2216)                                                            
18.00 120914      H* Created By   : Joanna(BE95PGM)                                                               
19.00 120914      H* Changed Date : 14 SEP 2012                                                                   
20.00 120914      H* Description  : Add new field Scc code2                                                       
21.00 120914      H*                                                                                              
22.00 120914      H********************************************************************************************** 
23.00 160825      H* Reference    : CHG-262-16 (D6262)                                                            
24.00 160825      H* Created By   : Myles Ieong (BI77PGM)                                                         
25.00 160825      H* Changed Date : 04 Aug 2016                                                                   
26.00 160825      H* Description  : AML report parameter changing and revoking                                    
27.00 160825      H*                                                                                              
28.00 160825      H********************************************************************************************** 
29.00 170606      H* Reference    : CHG-196-17 (D7196)                                                            
30.00 170420      H* Created By   : Albert Au   (BG09PGM)                                                         
31.00 170420      H* Changed Date : 10 Apr 2017                                                                   
32.00 170420      H* Description  : Remove the transaction for CIF's with officer code as 'PER'                   
33.00 170420      H*                                                                                              
34.00 170420      H********************************************************************************************** 
35.00 111020      FTXNCT1    UF A E           K DISK    USROPN                                                    
36.00 111020      FTXNCT2    UF A E           K DISK    USROPN                                                    
37.00 60527      FCUP003    IF   E           K DISK                                                              
38.00 60527      FTAP00101B IF   E             DISK                                                              
39.00 60529      FAMLDDNCRCDUF A E           K DISK                                                              
40.00 60529      FAMLDDOCRCDUF A E           K DISK                                                              
41.00 60603      FAMLDTLCNY UF A E           K DISK                                                              
42.00 111109      FTXNMCTWRK1IF   E           K DISK                                                              
43.00 111109      FTXNMCTWRK2IF   E           K DISK                                                              
44.00 111020      FAMLMCTRPT O    E             PRINTER OFLIND(*IN98)                                             
45.00 170606 D7196F                                     USROPN                                                    
46.00 60516      D                                                                                               
47.00 60516      C*----------------------------------------------------------------------------------------------
48.00 60516      C* Initial Variable                                                                             
49.00 60516      C*----------------------------------------------------------------------------------------------
50.00 60602      C                                                                                               
51.00 60602      C                                                                                               
52.00 60602      C                                                                                               
53.00 60602      C                                                                                               
54.00 60517      C                                                                                               
55.00 60519      C*----------------------------------------------------------------------------------------------
56.00 60519      C* PARM LIST                                                                                    
57.00 60519      C*----------------------------------------------------------------------------------------------
58.00 60517      C     *ENTRY        PLIST                                                                       
59.00 111019      C                   PARM                    RNO               1                                 
60.00 111020      C                   PARM                    RFLG              1                                 
61.00 120817 D2230C                   PARM                    RPSN              1                                 
62.00 170606 D7196C                   PARM                    PRPT              1                                 
63.00 60517      C                                                                                               
64.00 60519      C*----------------------------------------------------------------------------------------------
65.00 60519      C* KEY LIST                                                                                     
66.00 60519      C*----------------------------------------------------------------------------------------------
67.00 60529      C     KRCD          KLIST                                                                       
68.00 60519      C                   KFLD                    KTCIF            10                                 
69.00 60529      C                   KFLD                    KTINOUT           3                                 
70.00 60516      C                                                                                               
71.00 60527      C     KC03          KLIST                                                                       
72.00 60527      C                   KFLD                    K03BNO            3 0                               
73.00 60630      C                   KFLD                    K03CIF           10                                 
74.00 60630      C                   Z-ADD     001           K03BNO                                              
75.00 60630      C*                                                                                              
76.00 60615      C                                                                                               
77.00 60516      C*----------------------------------------------------------------------------------------------
78.00 60527      C* Main Program                                                                                 
79.00 60516      C*----------------------------------------------------------------------------------------------
80.00 60527      C                   EXSR      GETFLDTE                                                          
81.00 170606 D7196C                   IF        PRPT = 'C'                                                        
82.00 111020      C                   IF        RNO='R'                                                           
83.00 111020      C***EXTRACT DATA FROM TXNMCT1 & 2                                                               
84.00 111020      C                   EXSR      CLSQL                                                             
85.00 60527      C                                                                                               
86.00 60529      C                   EXSR      CALTMPTLAMT                                                       
87.00 60602      C                   OPEN      TXNCT1                                                            
88.00 60602      C                   READ      TXNCT1                                 50                         
89.00 60529      C                   DOW       *IN50='0'                                                         
90.00 60529      C                   EXSR      CALTLAMT                                                          
91.00 60602      C                   UPDATE    RCT1                                                              
92.00 60602      C                   READ      TXNCT1                                 50                         
93.00 60529      C                   ENDDO                                                                       
94.00 60602      C                   CLOSE     TXNCT1                                                            
95.00 60529      C                                                                                               
96.00 60602      C                   OPEN      TXNCT2                                                            
97.00 60602      C                   READ      TXNCT2                                 40                         
98.00 60529      C                   DOW       *IN40='0'                                                         
99.00 60529      C                   EXSR      CALTLAMT                                                          
100.00 60602      C                   UPDATE    RCT2                                                              
101.00 60602      C                   READ      TXNCT2                                 40                         
102.00 60529      C                   ENDDO                                                                       
103.00 60602      C                   CLOSE     TXNCT2                                                            
104.00 60529      C                                                                                               
105.00 60519      C                                                                                               
106.00 60518      C                   EXSR      GWKTXN                                                            
107.00 111020      C                   ENDIF                                                                       
108.00 170606 D7196C                   ENDIF                                                                       
109.00 60519      C                                                                                               
110.00 170606 D7196C                   IF        PRPT = 'P'                                                        
111.00 170606 D7196C                   OPEN      AMLMCTRPT                                                         
112.00 60603      C                   EXSR      GENRPT                                                            
113.00 170606 D7196C                   CLOSE     AMLMCTRPT                                                         
114.00 170606 D7196C                   ENDIF                                                                       
115.00 60516      C                   SETON                                        LR                             
116.00 60527      C                                                                                               
117.00 60516      C*----------------------------------------------------------------------------------------------
118.00 60516      C* SQL                                                                                          
119.00 60516      C*----------------------------------------------------------------------------------------------
120.00 60516      C     CLSQL         BEGSR                                                                       
121.00 111020      C                                                                                               
122.00 111020      C***RET TXN                                                                                     
123.00 60603      C                                                                                               
124.00 60603      C/EXEC SQL                                                                                      
125.00 60603      C+ INSERT INTO TXNCT1                                                                           
126.00 120817 D2230C* SELECT * FROM TXNMCT1                                                                        
127.00 120817 D2230C+ SELECT A.CTMARK, B.CUBRCH, B.CUPOFF, A.CTCIF, A.CTNAME, A.CTACCNO,                           
128.00 120817 D2230C+ A.CTDATE, A.CTTYPE, A.CTINOUT, A.CTCCYN, A.CTCCY, A.CTDSC,                                   
129.00 120817 D2230C+ A.CTTXNAMT, A.CTMAMT, A.CTMCRAMT, A.CTMDRAMT, A.CTMTTLAMT,                                   
130.00 120817 D2230C+ A.CTCNYAMT, A.CTNOTXN, A.CTREL, A.CTTXNBRN, A.CTOB                                           
131.00 120817 D2230C+ FROM TXNMCT1 A, CUP00301 B                                                                   
132.00 111020      C+ WHERE CTMARK = 'RET'                                                                         
133.00 111020      C+ AND ZONED(SUBSTR(DIGITS(CTDATE),1,6),6,0) >= :STRMON                                         
134.00 111020      C+ AND ZONED(SUBSTR(DIGITS(CTDATE),1,6),6,0) <= :ENDMON                                         
135.00 120817 D2230C+ AND A.CTCIF = B.CUNBR AND B.CUPERS = :RPSN                                                   
136.00 160825 D6262C+ AND A.CTTYPE<>'TRF'                                                                          
137.00 60603      C/END-EXEC                                                                                      
138.00 60603      C                                                                                               
139.00 111020      C***CORP TXN                                                                                    
140.00 60603      C                                                                                               
141.00 60603      C/EXEC SQL                                                                                      
142.00 111020      C+ INSERT INTO TXNCT2                                                                           
143.00 120817 D2230C* SELECT * FROM TXNMCT2                                                                        
144.00 120817 D2230C+ SELECT A.CTMARK, B.CUBRCH, B.CUPOFF, A.CTCIF, A.CTNAME, A.CTACCNO,                           
145.00 120817 D2230C+ A.CTDATE, A.CTTYPE, A.CTINOUT, A.CTCCYN, A.CTCCY, A.CTDSC,                                   
146.00 120817 D2230C+ A.CTTXNAMT, A.CTMAMT, A.CTMCRAMT, A.CTMDRAMT, A.CTMTTLAMT,                                   
147.00 120817 D2230C+ A.CTCNYAMT, A.CTNOTXN, A.CTREL, A.CTTXNBRN, A.CTOB                                           
148.00 120817 D2230C+ FROM TXNMCT2 A, CUP00301 B                                                                   
149.00 111020      C+ WHERE CTMARK <> 'RET'                                                                        
150.00 111020      C+ AND ZONED(SUBSTR(DIGITS(CTDATE),1,6),6,0) >= :STRMON                                         
151.00 111020      C+ AND ZONED(SUBSTR(DIGITS(CTDATE),1,6),6,0) <= :ENDMON                                         
152.00 120817 D2230C+ AND A.CTCIF = B.CUNBR AND B.CUPERS = :RPSN                                                   
153.00 160825 D6262C+ AND A.CTTYPE <> 'TRF'                                                                        
154.00 60603      C/END-EXEC                                                                                      
155.00 60603      C                                                                                               
156.00 161108 D6262C* Remove cheque txn except cheque encashment(CBW)                                              
157.00 161104 D6262C/EXEC SQL                                                                                      
158.00 161104 D6262C+ DELETE FROM TXNCT1                                                                           
159.00 161108 D6262C+ WHERE CTTYPE = 'CDW' AND (SUBSTR(CTDSC,4,1) ='-' AND                                         
160.00 161108 D6262C+ TRANSLATE (subStr(CTDSC,1,3),'NNNNNNNNNNX', '1234567890N') = 'NNN'                           
161.00 161117 D6262C+ OR subStr(CTDSC,1,3) IN ('CBD','CBT','CCO')                                                  
162.00 161117 D6262C+ OR TRANSLATE (subStr(CTDSC,1,7),'NNNNNNNNNNX', '1234567890N') =                              
163.00 161117 D6262C+ 'NNNNNNN')                                                                                   
164.00 161104 D6262C/END-EXEC                                                                                      
165.00 161104 D6262C                                                                                               
166.00 161104 D6262C/EXEC SQL                                                                                      
167.00 161104 D6262C+ DELETE FROM TXNCT2                                                                           
168.00 161108 D6262C+ WHERE CTTYPE = 'CDW' AND (SUBSTR(CTDSC,4,1) ='-' AND                                         
169.00 161108 D6262C+ TRANSLATE (subStr(CTDSC,1,3),'NNNNNNNNNNX', '1234567890N') = 'NNN'                           
170.00 161117 D6262C+ OR subStr(CTDSC,1,3) IN ('CBD','CBT','CCO')                                                  
171.00 161117 D6262C+ OR TRANSLATE (subStr(CTDSC,1,7),'NNNNNNNNNNX', '1234567890N') =                              
172.00 161117 D6262C+ 'NNNNNNN')                                                                                   
173.00 161104 D6262C/END-EXEC                                                                                      
174.00 161116 D6262 *                                                                                              
175.00 161116 D6262C* Remove REVERSED TXN                                                                          
176.00 161116 D6262C/EXEC SQL                                                                                      
177.00 161116 D6262C+ DELETE FROM TXNCT1 WHERE CTDSC LIKE '%REVERSED%'                                             
178.00 161116 D6262C/END-EXEC                                                                                      
179.00 161116 D6262C                                                                                               
180.00 161116 D6262C/EXEC SQL                                                                                      
181.00 161116 D6262C+ DELETE FROM TXNCT2 WHERE CTDSC LIKE '%REVERSED%'                                             
182.00 161116 D6262C/END-EXEC                                                                                      
183.00 60603      C                                                                                               
184.00 60516      C                   ENDSR                                                                       
185.00 60518      C                                                                                               
186.00 60602      C                                                                                               
187.00 60602      C                                                                                               
188.00 60518      C*----------------------------------------------------------------------------------------------
189.00 60518      C* CAL TOTAL AMOUNT IN TMP PF                                                                   
190.00 60518      C*----------------------------------------------------------------------------------------------
191.00 60518      C     CALTMPTLAMT   BEGSR                                                                       
192.00 60518      C*--Calculate Cr/Db transaction total amount                                                    
193.00 60518      C*------------------------------------------                                                    
194.00 60518      C/EXEC SQL                                                                                      
195.00 60529      C+ INSERT INTO AMLDDOCRCD                                                                       
196.00 60602      C+ SELECT CTCIF,CTINOUT ,SUM(CTMAMT)                                                            
197.00 111020      C+ FROM TXNCT1                                                                                  
198.00 60602      C+ GROUP BY CTCIF,CTINOUT                                                                       
199.00 60518      C/END-EXEC                                                                                      
200.00 60518      C                                                                                               
201.00 60518      C/EXEC SQL                                                                                      
202.00 60529      C+ INSERT INTO AMLDDOCRCD                                                                       
203.00 60602      C+ SELECT CTCIF,CTINOUT ,SUM(CTMAMT)                                                            
204.00 60602      C+ FROM TXNCT2                                                                                  
205.00 60602      C+ GROUP BY CTCIF,CTINOUT                                                                       
206.00 60518      C/END-EXEC                                                                                      
207.00 60518      C                                                                                               
208.00 60518      C                                                                                               
209.00 60518      C*--Calculate Cr and Db transaction total amount                                                
210.00 60518      C*------------------------------------------                                                    
211.00 60518      C/EXEC SQL                                                                                      
212.00 60529      C+ INSERT INTO AMLDDNCRCD                                                                       
213.00 60602      C+ SELECT CTCIF, SUM(CTMAMT) ,COUNT(CTCIF)                                                      
214.00 60602      C+ FROM TXNCT1                                                                                  
215.00 60602      C+ GROUP BY CTCIF                                                                               
216.00 60518      C/END-EXEC                                                                                      
217.00 60518      C                                                                                               
218.00 60518      C/EXEC SQL                                                                                      
219.00 60529      C+ INSERT INTO AMLDDNCRCD                                                                       
220.00 60602      C+ SELECT CTCIF, SUM(CTMAMT)  ,COUNT(CTCIF)                                                     
221.00 60602      C+ FROM TXNCT2                                                                                  
222.00 60602      C+ GROUP BY CTCIF                                                                               
223.00 60518      C/END-EXEC                                                                                      
224.00 60518      C                                                                                               
225.00 60603      C***CALCULATE TOTAL CR AND DR TRANSACTION AMOUNT                                                
226.00 60603      C/EXEC SQL                                                                                      
227.00 60603      C+ INSERT INTO AMLDTLCNY                                                                        
228.00 60603      C+ SELECT CTCIF, SUM(CTTXNAMT) ,COUNT(CTCIF)                                                    
229.00 60603      C+ FROM TXNCT1                                                                                  
230.00 60603      C+ WHERE CTCCYN='CNY'                                                                           
231.00 60603      C+ GROUP BY CTCIF                                                                               
232.00 60603      C/END-EXEC                                                                                      
233.00 60603      C                                                                                               
234.00 60603      C/EXEC SQL                                                                                      
235.00 60603      C+ INSERT INTO AMLDTLCNY                                                                        
236.00 60603      C+ SELECT CTCIF, SUM(CTTXNAMT)  ,COUNT(CTCIF)                                                   
237.00 60603      C+ FROM TXNCT2                                                                                  
238.00 60603      C+ WHERE CTCCYN='CNY'                                                                           
239.00 60603      C+ GROUP BY CTCIF                                                                               
240.00 60603      C/END-EXEC                                                                                      
241.00 60518      C                                                                                               
242.00 60518      C                   ENDSR                                                                       
243.00 60518      C                                                                                               
244.00 111020      C*----------------------------------------------------------------------------------------------
245.00 111020      C* CAL DATES                                                                                    
246.00 111020      C*----------------------------------------------------------------------------------------------
247.00 60524      C     GETFLDTE      BEGSR                                                                       
248.00 60524      C                   READ      TAP00101B                              10                         
249.00 60524      C                   DOW       *IN10='0'                                                         
250.00 60524      C                   IF        DSBK=1                                                            
251.00 60529      C                   CALL      'DFJJTOYY'                                                        
252.00 60524      C                   PARM                    DSDT                                                
253.00 111020      C                   PARM                    CURDATE           8 0                               
254.00 111020      C                   MOVEL     CURDATE       TODTE             6 0                               
255.00 111020      C                   MOVE      TODTE         CURMNTH           2 0                               
256.00 111024      C                   Z-ADD     0             TODTE2            6 0                               
257.00 111020      C                   IF        CURMNTH >= 3                                                      
258.00 111020      C                   EVAL      TODTE2 = TODTE - 2                                                
259.00 111020      C                   ELSE                                                                        
260.00 111024      C                   EVAL      TODTE2 = TODTE - 100 + 12 - 2                                     
261.00 111020      C                   ENDIF                                                                       
262.00 60524      C                   ENDIF                                                                       
263.00 60524      C                   READ      TAP00101B                              10                         
264.00 60524      C                   ENDDO                                                                       
265.00 111020       * Decide which date to use                                                                     
266.00 111020      C                   MOVE      TODTE         ENDMON            6 0                               
267.00 111020      C                   IF        RFLG = 'M'                                                        
268.00 111020      C                   MOVE      TODTE         STRMON            6 0                               
269.00 111020      C                   ELSE                                                                        
270.00 111020      C                   MOVE      TODTE2        STRMON            6 0                               
271.00 111020      C                   ENDIF                                                                       
272.00 60524      C                                                                                               
273.00 60524      C                   ENDSR                                                                       
274.00 60518      C                                                                                               
275.00 111020      C*----------------------------------------------------------------------------------------------
276.00 111020      C* SCAN TXNS. FOR REPORT                                                                        
277.00 111020      C*----------------------------------------------------------------------------------------------
278.00 60518      C     GWKTXN        BEGSR                                                                       
279.00 60519      C                                                                                               
280.00 111019       * Monthly                                                                                      
281.00 120817 D2230C*                  IF        RFLG = 'M'                                                        
282.00 120817 D2230C                   IF        RFLG = 'M' AND RPSN = 'P'                                         
283.00 60519      C/EXEC SQL                                                                                      
284.00 120810      C+ INSERT INTO TXNMCTWRK1                                                                       
285.00 120810      C+ SELECT *                                                                                     
286.00 120810      C+ FROM TXNCT1                                                                                  
287.00 160825 D6262C+ WHERE CTMTTLAMT>=500000 OR CTCNYAMT>=200000                                                  
288.00 160825 D2230C*+ D6262 WHERE (CTMTTLAMT>=1000000 OR CTCNYAMT>=200000) AND CTNOTXN>=10                        
289.00 120817 D2230C* WHERE (CTMTTLAMT>=500000 OR CTCNYAMT>=200000)                                                
290.00 60519      C/END-EXEC                                                                                      
291.00 60519      C                                                                                               
292.00 60519      C/EXEC SQL                                                                                      
293.00 111109      C+ INSERT INTO TXNMCTWRK2                                                                       
294.00 60519      C+ SELECT *                                                                                     
295.00 120810      C+ FROM TXNCT2                                                                                  
296.00 160825 D6262C+ WHERE CTMTTLAMT>=500000 OR CTCNYAMT>=200000                                                  
297.00 160825 D2230C*+ D6262 WHERE (CTMTTLAMT>=1000000 OR CTCNYAMT>=200000) AND CTNOTXN>=10                        
298.00 120817 D2230C* WHERE (CTMTTLAMT>=500000 OR CTCNYAMT>=200000)                                                
299.00 60519      C/END-EXEC                                                                                      
300.00 111019       *                                                                                              
301.00 120817 D2230 * Monthly & Non-personal                                                                       
302.00 120810   |  C                   ELSEIF    RFLG = 'M' AND RPSN = 'N'                                         
303.00 120810   |  C/EXEC SQL                                                                                      
304.00 120810   |  C+ INSERT INTO TXNMCTWRK1                                                                       
305.00 120810   |  C+ SELECT *                                                                                     
306.00 120810   |  C+ FROM TXNCT1 WHERE                                                                            
307.00 160825 D6262C+ CTMTTLAMT>=1000000 OR CTCNYAMT>=200000                                                       
308.00 160825 D6262C*+ (CTMTTLAMT>=3000000 OR CTCNYAMT>=200000) AND  CTNOTXN>=20                                   
309.00 120810   |  C/END-EXEC                                                                                      
310.00 120810   |  C                                                                                               
311.00 120810   |  C/EXEC SQL                                                                                      
312.00 120810   |  C+ INSERT INTO TXNMCTWRK2                                                                       
313.00 120810   |  C+ SELECT *                                                                                     
314.00 120810   |  C+ FROM TXNCT2 WHERE                                                                            
315.00 160825 D6262C+ CTMTTLAMT>=1000000 OR CTCNYAMT>=200000                                                       
316.00 160825 D6262C*+ (CTMTTLAMT>=3000000 OR CTCNYAMT>=200000) AND CTNOTXN>=20                                    
317.00 120810   |  C/END-EXEC                                                                                      
318.00 120817 D2230 *                                                                                              
319.00 111019       * Quarterly                                                                                    
320.00 120817 D2230C*                  ELSE                                                                        
321.00 120817 D2230C                   ELSEIF    RFLG = 'Q' AND RPSN = 'P'                                         
322.00 111019      C/EXEC SQL                                                                                      
323.00 111109      C+ INSERT INTO TXNMCTWRK1                                                                       
324.00 111019      C+ SELECT *                                                                                     
325.00 111020      C+ FROM TXNCT1                                                                                  
326.00 120817 D2230C+ WHERE (CTMTTLAMT>=3000000 OR CTCNYAMT>=1000000) AND CTNOTXN>=30                              
327.00 120817 D2230C* WHERE (CTMTTLAMT>=3000000 OR CTCNYAMT>=1000000)                                              
328.00 111019      C/END-EXEC                                                                                      
329.00 111019      C                                                                                               
330.00 111019      C/EXEC SQL                                                                                      
331.00 111109      C+ INSERT INTO TXNMCTWRK2                                                                       
332.00 111019      C+ SELECT *                                                                                     
333.00 111020      C+ FROM TXNCT2                                                                                  
334.00 120817 D2230C+ WHERE (CTMTTLAMT>=3000000 OR CTCNYAMT>=1000000) AND CTNOTXN>=30                              
335.00 120817 D2230C* WHERE (CTMTTLAMT>=3000000 OR CTCNYAMT>=1000000)                                              
336.00 111019      C/END-EXEC                                                                                      
337.00 120817 D2230 * Quarterly & Non-personal                                                                     
338.00 120810   |  C                   ELSEIF    RFLG = 'Q' AND RPSN = 'N'                                         
339.00 120810   |  C/EXEC SQL                                                                                      
340.00 120810   |  C+ INSERT INTO TXNMCTWRK1                                                                       
341.00 120810   |  C+ SELECT *                                                                                     
342.00 120810   |  C+ FROM TXNCT1                                                                                  
343.00 120814   |  C+ WHERE (CTMTTLAMT>=9000000 OR CTCNYAMT>=1000000) AND CTNOTXN>=50                              
344.00 120810   |  C/END-EXEC                                                                                      
345.00 120810   |  C                                                                                               
346.00 120810   |  C/EXEC SQL                                                                                      
347.00 120810   |  C+ INSERT INTO TXNMCTWRK2                                                                       
348.00 120810   |  C+ SELECT *                                                                                     
349.00 120810   |  C+ FROM TXNCT2                                                                                  
350.00 120814   |  C+ WHERE (CTMTTLAMT>=9000000 OR CTCNYAMT>=1000000) AND CTNOTXN>=50                              
351.00 120817 D2230C/END-EXEC                                                                                      
352.00 111020      C                   ENDIF                                                                       
353.00 60518      C                   ENDSR                                                                       
354.00 60518      C                                                                                               
355.00 60518      C*----------------------------------------------------------------------------------------------
356.00 60518      C* CALCULATE CREDIT OR DEBIT AND TOTAL CR+DB DAILY TXN AMOUNT                                   
357.00 60518      C*----------------------------------------------------------------------------------------------
358.00 60518      C     CALTLAMT      BEGSR                                                                       
359.00 60529      C***GET CREDIT OR DEBIT TOTAL WEEKLY TXN AMOUNT                                                 
360.00 60602      C                   EVAL      KTCIF =CTCIF                                                      
361.00 60529      C                   EVAL      KTINOUT='IN'                                                      
362.00 161118 D6262C                   EVAL      CTMCRAMT = 0                                                      
363.00 60529      C     KRCD          CHAIN     AMLDDOCRCD                         55                             
364.00 60519      C                   IF        *IN55='0'                                                         
365.00 60602      C                   EVAL      CTMCRAMT=DOCTMTXAMT                                               
366.00 60519      C                   ENDIF                                                                       
367.00 60519      C                                                                                               
368.00 60529      C                   EVAL      KTINOUT='OUT'                                                     
369.00 161118 D6262C                   EVAL      CTMDRAMT = 0                                                      
370.00 60529      C     KRCD          CHAIN     AMLDDOCRCD                         55                             
371.00 60519      C                   IF        *IN55='0'                                                         
372.00 60602      C                   EVAL      CTMDRAMT=DOCTMTXAMT                                               
373.00 60519      C                   ENDIF                                                                       
374.00 60519      C                                                                                               
375.00 60529      C*** GET IN + OUT TOTAL TXN AMOUNT                                                              
376.00 161118 D6262C                   EVAL      CTMTTLAMT = 0                                                     
377.00 161118 D6262C                   EVAL      CTNOTXN   = 0                                                     
378.00 60602      C     CTCIF         CHAIN     AMLDDNCRCD                         45                             
379.00 60519      C                   IF        *IN45='0'                                                         
380.00 60602      C                   EVAL      CTMTTLAMT =DNCTMTXAMT                                             
381.00 60602      C                   EVAL      CTNOTXN   =DNCTNOTXN                                              
382.00 60519      C                   ENDIF                                                                       
383.00 60603      C                                                                                               
384.00 60603      C*** GET IN OUT TOTAL CNY AMOUNT                                                                
385.00 161118 D6262C                   EVAL      CTCNYAMT  = 0                                                     
386.00 60603      C     CTCIF         CHAIN     AMLDTLCNY                          35                             
387.00 111020      C                   IF        *IN35='0'                                                         
388.00 60603      C                   EVAL      CTCNYAMT  =CNYTMTXAMT                                             
389.00 60603      C                   ENDIF                                                                       
390.00 60603      C                                                                                               
391.00 60518      C                   ENDSR                                                                       
392.00 60516      C*----------------------------------------------------------------------------------------------
393.00 60516      C* Generate Report                                                                              
394.00 60516      C*----------------------------------------------------------------------------------------------
395.00 60516      C     GENRPT        BEGSR                                                                       
396.00 60523      C                                                                                               
397.00 120817 D2230C*                  IF        RFLG = 'M'                                                        
398.00 120810   |  C*                  EVAL      RPTTYPE = 'Monthly'                                               
399.00 120810   |  C*                  ELSE                                                                        
400.00 120810   |  C*                  EVAL      RPTTYPE = 'Quarterly'                                             
401.00 120810   |  C*                  ENDIF                                                                       
402.00 120810   |  C                   IF        RFLG = 'M' AND RPSN = 'P'                                         
403.00 120810   |  C                   EVAL      RPTTYPE = 'Monthly (Personal)'                                    
404.00 120810   |  C                   ELSEIF    RFLG = 'M' AND RPSN = 'N'                                         
405.00 120810   |  C                   EVAL      RPTTYPE = 'Monthly (Non-Per)'                                     
406.00 120810   |  C                   ELSEIF    RFLG = 'Q' AND RPSN = 'N'                                         
407.00 120810   |  C                   EVAL      RPTTYPE = 'Quarterly (Non-Per)'                                   
408.00 120810   |  C                   ELSEIF    RFLG = 'Q' AND RPSN = 'P'                                         
409.00 120810   |  C                   EVAL      RPTTYPE = 'Quarterly (Personal)'                                  
410.00 120817 D2230C                   ENDIF                                                                       
411.00 111020      C                                                                                               
412.00 60523      C                   Z-ADD     39            LTLN              2 0                               
413.00 60523      C                                                                                               
414.00 60523      C                   IF        RNO='R'                                                           
415.00 60516      C*READ RETAIL CUSTOMER                                                                          
416.00 60516      C                   MOVE      *BLANK        OFFI              3                                 
417.00 60517      C                   Z-ADD     0             BRANCH            3 0                               
418.00 60516      C                   MOVE      *BLANK        TMPCIF           10                                 
419.00 60516      C                   Z-ADD     1             LINE              2 0                               
420.00 60517      C                   SETOFF                                       89                             
421.00 111109      C                   READ      TXNMCTWRK1                             80                         
422.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
423.00 60517      C                   IF        *IN80='1'                                                         
424.00 60517      C                   SETON                                        89                             
425.00 60517      C                   ENDIF                                                                       
426.00 60516      C                   DOW       *IN80='0'                                                         
427.00 60516      C                   SELECT                                                                      
428.00 60517      C                   WHEN      BRANCH=0 AND OFFI=*BLANK                                          
429.00 60516      C***FIRST PAGE                                                                                  
430.00 60602      C                   WRITE     HEADERCT                                                          
431.00 60517      C                   EXSR      DTLLINE                                                           
432.00 60516      C                   WRITE     DTL1                                                              
433.00 60602      C                   WRITE     DTLCT                                                             
434.00 60519      C                   ADD       4             LINE                                                
435.00 60516      C                                                                                               
436.00 60602      C                   WHEN      BRANCH<>CTBRN OR OFFI<>CTOFF OR LINE>LTLN                         
437.00 60516      C***BREAK PAGE                                                                                  
438.00 60602      C                   IF        TMPCIF<>CTCIF                                                     
439.00 60517      C***NOT SAME CIF                                                                                
440.00 60602      C                   WRITE     DTLCT1                                                            
441.00 60517      C                   WRITE     RECLINE                                                           
442.00 60519      C                   ADD       3             LINE                                                
443.00 60519      C                   ENDIF                                                                       
444.00 60519      C                                                                                               
445.00 60623      C                   WRITE     REMARKCT                                     new                  
446.00 60519      C                   SETON                                        98                             
447.00 60602      C                   WRITE     HEADERCT                                                          
448.00 60519      C                   SETOFF                                       98                             
449.00 60519      C                   Z-ADD     1             LINE                                                
450.00 60519      C                                                                                               
451.00 60517      C                   EXSR      DTLLINE                                                           
452.00 60517      C                   WRITE     DTL1                                                              
453.00 60602      C                   WRITE     DTLCT                                                             
454.00 60519      C                   ADD       4             LINE                                                
455.00 60518      C                   WHEN      LINE<=LTLN                                                        
456.00 60516      C***WRITE CURRENT PAGE                                                                          
457.00 60602      C                   IF        TMPCIF<>CTCIF                                                     
458.00 60602      C                   WRITE     DTLCT1                                                            
459.00 60517      C                   WRITE     RECLINE                                                           
460.00 60519      C                   ADD       3             LINE                                                
461.00 60519      C                   EXSR      DTLLINE                                                           
462.00 60519      C                   WRITE     DTL1                                                              
463.00 60602      C                   WRITE     DTLCT                                                             
464.00 60519      C                   ADD       4             LINE                                                
465.00 60519      C                   ELSE                                                                        
466.00 60517      C                   EXSR      DTLLINE                                                           
467.00 60602      C                   WRITE     DTLCT                                                             
468.00 60519      C                   ADD       1             LINE                                                
469.00 60519      C                   ENDIF                                                                       
470.00 60517      C                   ENDSL                                                                       
471.00 60602      C                   EVAL      BRANCH   = CTBRN                                                  
472.00 60602      C                   EVAL      OFFI     = CTOFF                                                  
473.00 60602      C                   EVAL      TMPCIF   = CTCIF                                                  
474.00 60602      C                   EVAL      AWTLCRAMT= CTMCRAMT                                               
475.00 60602      C                   EVAL      AWTLDBAMT= CTMDRAMT                                               
476.00 111109      C                   READ      TXNMCTWRK1                             80                         
477.00 60516      C                   ENDDO                                                                       
478.00 60602      C  N89              WRITE     DTLCT1                                                            
479.00 60517      C                                                                                               
480.00 60523      C                   ENDIF                                                  *END RETAIL RPT      
481.00 60523      C                                                                                               
482.00 60523      C                                                                                               
483.00 60523      C                   IF        RNO='O'                                                           
484.00 60517      C*READ CORP AND PRI CUSTOMER                                                                    
485.00 60517      C                   MOVE      *BLANK        TMPMARK           4                                 
486.00 60517      C                   MOVE      *BLANK        OFFI              3                                 
487.00 60517      C                   MOVE      *BLANK        TMPCIF           10                                 
488.00 60517      C                   Z-ADD     1             LINE              2 0                               
489.00 60517      C                   Z-ADD     0             PRETLAMT         13 2                               
490.00 60523      C                   SETOFF                                       89                             
491.00 111109      C                   READ      TXNMCTWRK2                             70                         
492.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
493.00 60523      C                   IF        *IN70<>'0'                                                        
494.00 60523      C                   SETON                                        89                             
495.00 60517      C                   ENDIF                                                                       
496.00 60517      C                                                                                               
497.00 60517      C                   DOW       *IN70='0'                                                         
498.00 60517      C                   SELECT                                                                      
499.00 60517      C                   WHEN      TMPMARK=*BLANK AND OFFI=*BLANK                                    
500.00 60517      C***FIRST PAGE                                                                                  
501.00 60602      C                   WRITE     HEADERCT                                                          
502.00 60517      C                   EXSR      DTLLINE                                                           
503.00 60517      C                   WRITE     DTL1                                                              
504.00 60602      C                   WRITE     DTLCT                                                             
505.00 60519      C                   ADD       4             LINE                                                
506.00 60517      C                                                                                               
507.00 60602      C                   WHEN      TMPMARK<>CTMARK OR OFFI<>CTOFF OR LINE>LTLN                       
508.00 60517      C***BREAK PAGE                                                                                  
509.00 60602      C                   IF        TMPCIF<>CTCIF                                                     
510.00 60517      C***NOT SAME CIF                                                                                
511.00 60602      C                   WRITE     DTLCT1                                                            
512.00 60517      C                   WRITE     RECLINE                                                           
513.00 60519      C                   ENDIF                                                                       
514.00 60623      C                   WRITE     REMARKCT                                     new                  
515.00 60519      C                                                                                               
516.00 60519      C                   Z-ADD     1             LINE                                                
517.00 60517      C                   SETON                                        98                             
518.00 60602      C                   WRITE     HEADERCT                                                          
519.00 60517      C                   SETOFF                                       98                             
520.00 60517      C                   EXSR      DTLLINE                                                           
521.00 60517      C                   WRITE     DTL1                                                              
522.00 60602      C                   WRITE     DTLCT                                                             
523.00 60519      C                   ADD       4             LINE                                                
524.00 60518      C                   WHEN      LINE<=LTLN                                                        
525.00 60517      C***WRITE CURRENT PAGE                                                                          
526.00 60602      C                   IF        TMPCIF<>CTCIF                                                     
527.00 60602      C                   WRITE     DTLCT1                                                            
528.00 60517      C                   WRITE     RECLINE                                                           
529.00 60519      C                   ADD       3             LINE                                                
530.00 60517      C                   EXSR      DTLLINE                                                           
531.00 60517      C                   WRITE     DTL1                                                              
532.00 60602      C                   WRITE     DTLCT                                                             
533.00 60519      C                   ADD       4             LINE                                                
534.00 60517      C                   ELSE                                                                        
535.00 60517      C                   EXSR      DTLLINE                                                           
536.00 60602      C                   WRITE     DTLCT                                                             
537.00 60519      C                   ADD       1             LINE                                                
538.00 60517      C                   ENDIF                                                                       
539.00 60517      C                   ENDSL                                                                       
540.00 60602      C                   EVAL      TMPMARK  = CTMARK                                                 
541.00 60602      C                   EVAL      OFFI     = CTOFF                                                  
542.00 60602      C                   EVAL      TMPCIF   = CTCIF                                                  
543.00 60602      C                   EVAL      AWTLCRAMT= CTMCRAMT                                               
544.00 60602      C                   EVAL      AWTLDBAMT= CTMDRAMT                                               
545.00 111109      C                   READ      TXNMCTWRK2                             70                         
546.00 60517      C                   ENDDO                                                                       
547.00 60602      C  N89              WRITE     DTLCT1                                                            
548.00 60523      C                   ENDIF                                                  *EXCLUDE RETAIL RPT  
549.00 60602      C   89              WRITE     HEADERCT                                                          
550.00 60623      C                   WRITE     REMARKCT                                                          
551.00 60602      C   89              WRITE     RNOREC                                                            
552.00 60517      C  N89              WRITE     ENDREC                                                            
553.00 60516      C                   ENDSR                                                                       
554.00 60516      C                                                                                               
555.00 60517      C                                                                                               
556.00 60517      C     DTLLINE       BEGSR                                                                       
557.00 60517      C                                                                                               
558.00 60602      C                   EVAL      AWCIF  = CTCIF                                                    
559.00 60602      C                   EVAL      AWMARK = CTMARK                                                   
560.00 60602      C                   EVAL      AWBRNO = CTBRN                                                    
561.00 60602      C                   EVAL      AWOFF  = CTOFF                                                    
562.00 60602      C                   EVAL      AWNAME = CTNAME                                                   
563.00 111020      C                   EVAL      AWSCCDE = ' '                                                     
564.00 120914 D2216C                   EVAL      AWSCCDE2 = ' '                                                    
565.00 111020      C                   EVAL      K03CIF = AWCIF                                                    
566.00 111020      C     KC03          CHAIN     CUP003                                                            
567.00 111020      C                   IF        %FOUND(CUP003)                                                    
568.00 111020      C                   EVAL      AWSCCDE = CURSPF                                                  
569.00 120914 D2216C                   EVAL      AWSCCDE2 = CUBHVF                                                 
570.00 111020      C                   ENDIF                                                                       
571.00 60529      C                                                                                               
572.00 60602      C                   EVAL      AWACTYP= CTTYPE                                                   
573.00 60605      C                   EVAL      AWACCNO= CTACCNO                                                  
574.00 60617      C                   EVAL      AWREL=CTREL                                                       
575.00 60602      C                   EVAL      AWDATE = CTDATE                                                   
576.00 60620      C                                                                                               
577.00 60620      C                   IF        CTINOUT='OUT'                                                     
578.00 60620      C                   EVAL      CTMAMT=CTMAMT*-1                                                  
579.00 60615      C                   ENDIF                                                                       
580.00 60621      C                   EVAL      AWTXBRN=CTTXNBRN                                                  
581.00 60602      C                   EVAL      AWCCY  = CTCCY                                                    
582.00 60602      C                   EVAL      AWAMT  = CTMAMT                                                   
583.00 60602      C                   EVAL      AWNAR  = CTDSC                                                    
584.00 60621      C                   EVAL      AWOB   = CTOB                                                     
585.00 60517      C                   ENDSR                                                                       
