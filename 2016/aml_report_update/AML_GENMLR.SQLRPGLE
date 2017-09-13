1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                                       
2.00 60608      H********************************************************************************************** 
3.00 110526      H* Program      : AML_GENMLR                                                                    
4.00 110526      H* Reference    : CHG-160-11                                                                    
5.00 110526      H* Created By   : Karl H.JR (BA55PGM)                                                           
6.00 110526      H* Changed Date : 26 May 2011                                                                   
7.00 110601      H* Description  : GEN MONTHLY & QUARTERLY LARGE AMOUNT TXNS. REPORT OF                          
8.00 110601      H*                REMIT/CASHIER ODR/DEMAND DRAFT                                                
9.00 60608      H********************************************************************************************** 
10.00 111020      H* Reference    : CHG-315-11 (D1315)                                                            
11.00 111020      H* Created By   : Karl (BA55PGM)                                                                
12.00 111020      H* Changed Date : 20 Oct 2011                                                                   
13.00 111025      H* Description  : Fix the time band & market seqment when gen quarterly report                  
14.00 111020      H********************************************************************************************** 
15.00 120914      H* Reference    : CHG-216-12 (D2216)                                                            
16.00 120914      H* Created By   : Joanna(BE95PGM)                                                               
17.00 120914      H* Changed Date : 14 SEP 2012                                                                   
18.00 120914      H* Description  : Add new field Scc code2                                                       
19.00 120914      H*                                                                                              
20.00 120914      H********************************************************************************************** 
21.00 141120      H* Reference    : CHG-466-14 (D4466)                                                            
22.00 141120      H* Created By   : Karl (BA55PGM)                                                                
23.00 141120      H* Changed Date : 20 Nov 2014                                                                   
24.00 141120      H* Description  : Change logic on getting high risk SCC code                                    
25.00 141120      H********************************************************************************************** 
26.00 160927      H* Reference    : CHG-262-14 (D6262)                                                            
27.00 160927      H* Created By   : Myles(BI77PGM)                                                                
28.00 160927      H* Changed Date : 29 Sep 2016                                                                   
29.00 160927      H* Description  : AML Report Parameter Changing and Revoking                                    
30.00 160927      H********************************************************************************************** 
31.00 110527      FTXNRCD1   UF   E           K DISK    USROPN                                                    
32.00 110527      FTXNRCD2   UF   E           K DISK    USROPN                                                    
33.00 60527      FCUP003    IF   E           K DISK                                                              
34.00 60527      FTAP00101B IF   E             DISK                                                              
35.00 60529      FAMLDDNCRCDUF A E           K DISK                                                              
36.00 60529      FAMLDDOCRCDUF A E           K DISK                                                              
37.00 110608      FTXNRCDW1L1IF   E           K DISK                                                              
38.00 110608      FTXNRCDW2L1IF   E           K DISK                                                              
39.00 60529      F                                                                                               
40.00 110526      FAMLMNTRPT O    E             PRINTER OFLIND(*IN98)                                             
41.00 60516      D                                                                                               
42.00 60516      C*----------------------------------------------------------------------------------------------
43.00 60516      C* Initial Variable                                                                             
44.00 60516      C*----------------------------------------------------------------------------------------------
45.00 60517      C                                                                                               
46.00 60519      C*----------------------------------------------------------------------------------------------
47.00 60519      C* PARM LIST                                                                                    
48.00 60519      C*----------------------------------------------------------------------------------------------
49.00 60517      C     *ENTRY        PLIST                                                                       
50.00 60523      C                   PARM                    RNO               1                                 
51.00 110527      C                   PARM                    RTYP              1                                 
52.00 160927 D6262C                   PARM                    RPSN              1                                 
53.00 60517      C                                                                                               
54.00 60519      C*----------------------------------------------------------------------------------------------
55.00 60519      C* KEY LIST                                                                                     
56.00 60519      C*----------------------------------------------------------------------------------------------
57.00 60529      C     KRCD          KLIST                                                                       
58.00 60519      C                   KFLD                    KTCIF            10                                 
59.00 60529      C                   KFLD                    KTINOUT           3                                 
60.00 60516      C                                                                                               
61.00 60527      C     KC03          KLIST                                                                       
62.00 60527      C                   KFLD                    K03BNO            3 0                               
63.00 60527      C                   KFLD                    K03CIF           10                                 
64.00 60527      C                   Z-ADD     001           K03BNO                                              
65.00 60516      C*----------------------------------------------------------------------------------------------
66.00 60527      C* Main Program                                                                                 
67.00 60516      C*----------------------------------------------------------------------------------------------
68.00 110527      C* Get date                                                                                     
69.00 110527      C                   EXSR      GETFLDTE                                                          
70.00 110527      C                   IF        RNO = 'R'                                                         
71.00 110527      C* Extract data                                                                                 
72.00 110527      C                   EXSR      CLSQL                                                             
73.00 60527      C                                                                                               
74.00 60529      C                   EXSR      CALTMPTLAMT                                                       
75.00 110527      C                   OPEN      TXNRCD1                                                           
76.00 110527      C                   READ      TXNRCD1                                50                         
77.00 60529      C                   DOW       *IN50='0'                                                         
78.00 60529      C                   EXSR      CALTLAMT                                                          
79.00 60529      C                   UPDATE    RRCD1                                                             
80.00 110527      C                   READ      TXNRCD1                                50                         
81.00 60529      C                   ENDDO                                                                       
82.00 110527      C                   CLOSE     TXNRCD1                                                           
83.00 60529      C                                                                                               
84.00 110527      C                   OPEN      TXNRCD2                                                           
85.00 110527      C                   READ      TXNRCD2                                40                         
86.00 110527      C                   DOW       *IN40='0'                                                         
87.00 110527      C                   EXSR      CALTLAMT                                                          
88.00 110527      C                   UPDATE    RRCD2                                                             
89.00 110527      C                   READ      TXNRCD2                                40                         
90.00 110527      C                   ENDDO                                                                       
91.00 110527      C                   CLOSE     TXNRCD2                                                           
92.00 60519      C                                                                                               
93.00 110527      C                   IF        RTYP = 'M'                                                        
94.00 60518      C                   EXSR      GWKTXN                                                            
95.00 110527      C                   ELSE                                                                        
96.00 110527      C                   EXSR      GWKTXN2                                                           
97.00 110527      C                   ENDIF                                                                       
98.00 60523      C                   ENDIF                                                                       
99.00 60519      C                                                                                               
100.00 60517      C                   EXSR      GENRPT                                                            
101.00 60516      C                   SETON                                        LR                             
102.00 60527      C                                                                                               
103.00 60527      C*----------------------------------------------------------------------------------------------
104.00 110527      C* GET RISK CODE                                                                                
105.00 60527      C*----------------------------------------------------------------------------------------------
106.00 60527      C     GETFLD        BEGSR                                                                       
107.00 60527      C                                                                                               
108.00 60602      C                   EVAL      K03CIF=RCDCIF                                                     
109.00 60602      C     KC03          CHAIN     CUP003                             45                             
110.00 60602      C                   IF        *IN45='0'                                                         
111.00 110527      C                   EVAL      AWSCCDE = CURSPF                                                  
112.00 120914 D2216C                   EVAL      AWSCCDE2 = CUBHVF                                                 
113.00 110531      C                   ELSE                                                                        
114.00 110531      C                   EVAL      AWSCCDE = ' '                                                     
115.00 120914 D2216C                   EVAL      AWSCCDE2 = ' '                                                    
116.00 60602      C                   ENDIF                                                                       
117.00 60527      C                   ENDSR                                                                       
118.00 60527      C                                                                                               
119.00 60527      C                                                                                               
120.00 60516      C*----------------------------------------------------------------------------------------------
121.00 60516      C* SQL                                                                                          
122.00 60516      C*----------------------------------------------------------------------------------------------
123.00 60516      C     CLSQL         BEGSR                                                                       
124.00 110527       * Decide which date to use                                                                     
125.00 110608      C                   MOVE      TODTE         ENDMON            6 0                               
126.00 110527      C                   IF        RTYP = 'M'                                                        
127.00 110608      C                   MOVE      TODTE         STRMON            6 0                               
128.00 110527      C                   ELSE                                                                        
129.00 110608      C                   MOVE      TODTE2        STRMON            6 0                               
130.00 110527      C                   ENDIF                                                                       
131.00 110527      C* Exclude data by risk code                                                                    
132.00 60527      C                                                                                               
133.00 110527      C* In Txns.                                                                                     
134.00 60518      C/EXEC SQL                                                                                      
135.00 60527      C+ INSERT INTO TXNRCD1                                                                          
136.00 160927 D6262C*+ SELECT *                                                                                    
137.00 160927 D6262C+ SELECT A.RCDMARK, A.RCDBRN, A.RCDOFF, A.RCDCIF, A.RCDNAME, A.RCDDATE,                        
138.00 160929 D6262C+ A.RCDTYPE, A.RCDINOUT, A.RCDCCYN, A.RCDCCY, A.RCDDSC, A.RCDTXNAMT,                           
139.00 160927 D6262C+ A.RCDMAMT, A.RCDMCRAMT, A.RCDMDRAMT, A.RCDMTTLAMT, A.RCDNOTXN                                
140.00 160927 D6262C*+ FROM TXNRCDM2                                                                               
141.00 160927 D6262C+ FROM TXNRCDM2 A, CUP00301 B                                                                  
142.00 110527      C+ WHERE RCDMARK = 'RET ' AND RCDINOUT = 'IN'                                                   
143.00 111020      C+ AND ZONED(SUBSTR(DIGITS(RCDDATE),1,6),6,0) >= :STRMON                                        
144.00 110608      C+ AND ZONED(SUBSTR(DIGITS(RCDDATE),1,6),6,0) <= :ENDMON                                        
145.00 110527      C+ AND RCDCIF IN (SELECT CUNBR FROM CUP00301 WHERE                                              
146.00 141120 D4466C* CURSPF NOT IN ('B1','B2','C1','C2','C3','C4','C5','C6','N1'))                                
147.00 141120 D4466C+ CURSPF NOT IN (SELECT FVVAL FROM FRP00501 WHERE FVBK=1 AND                                   
148.00 141120 D4466C+ FVAPP=90 AND FVFLD='CURSPF' AND SUBSTR(FVDSC1,39,1)='H'))                                    
149.00 160927 D6262C+ AND A.RCDCIF = B.CUNBR AND B.CUPERS = :RPSN                                                  
150.00 110608      C+ ORDER BY RCDDATE                                                                             
151.00 60518      C/END-EXEC                                                                                      
152.00 60527      C                                                                                               
153.00 110527      C/EXEC SQL                                                                                      
154.00 110527      C+ INSERT INTO TXNRCD2                                                                          
155.00 160927 D6262C*+ SELECT *                                                                                    
156.00 160927 D6262C+ SELECT A.RCDMARK, A.RCDBRN, A.RCDOFF, A.RCDCIF, A.RCDNAME, A.RCDDATE,                        
157.00 160929 D6262C+ A.RCDTYPE, A.RCDINOUT, A.RCDCCYN, A.RCDCCY, A.RCDDSC, A.RCDTXNAMT,                           
158.00 160927 D6262C+ A.RCDMAMT, A.RCDMCRAMT, A.RCDMDRAMT, A.RCDMTTLAMT, A.RCDNOTXN                                
159.00 160927 D6262C*+ FROM TXNRCDM2                                                                               
160.00 160927 D6262C+ FROM TXNRCDM2 A, CUP00301 B                                                                  
161.00 111020 D1315C* WHERE RCDMARK = 'CORP' AND RCDINOUT = 'IN'                                                   
162.00 111020 D1315C+ WHERE RCDMARK <> 'RET' AND RCDINOUT = 'IN'                                                   
163.00 111020      C+ AND ZONED(SUBSTR(DIGITS(RCDDATE),1,6),6,0) >= :STRMON                                        
164.00 110608      C+ AND ZONED(SUBSTR(DIGITS(RCDDATE),1,6),6,0) <= :ENDMON                                        
165.00 110527      C+ AND RCDCIF IN (SELECT CUNBR FROM CUP00301 WHERE                                              
166.00 141120 D4466C* CURSPF NOT IN ('B1','B2','C1','C2','C3','C4','C5','C6','N1'))                                
167.00 141120 D4466C+ CURSPF NOT IN (SELECT FVVAL FROM FRP00501 WHERE FVBK=1 AND                                   
168.00 141120 D4466C+ FVAPP=90 AND FVFLD='CURSPF' AND SUBSTR(FVDSC1,39,1)='H'))                                    
169.00 160927 D6262C+ AND A.RCDCIF = B.CUNBR AND B.CUPERS = :RPSN                                                  
170.00 110608      C+ ORDER BY RCDDATE                                                                             
171.00 110527      C/END-EXEC                                                                                      
172.00 110527      C                                                                                               
173.00 60527      C***OUT TXN                                                                                     
174.00 60527      C                                                                                               
175.00 110527      C/EXEC SQL                                                                                      
176.00 160927      C+ INSERT INTO TXNRCD1                                                                          
177.00 160927 D6262C*+ SELECT *                                                                                    
178.00 160927 D6262C+ SELECT A.RCDMARK, A.RCDBRN, A.RCDOFF, A.RCDCIF, A.RCDNAME, A.RCDDATE,                        
179.00 160929 D6262C+ A.RCDTYPE, A.RCDINOUT, A.RCDCCYN, A.RCDCCY, A.RCDDSC, A.RCDTXNAMT,                           
180.00 160927 D6262C+ A.RCDMAMT, A.RCDMCRAMT, A.RCDMDRAMT, A.RCDMTTLAMT, A.RCDNOTXN                                
181.00 160927 D6262C*+ FROM TXNRCDM2                                                                               
182.00 160927 D6262C+ FROM TXNRCDM2 A, CUP00301 B                                                                  
183.00 110527      C+ WHERE RCDMARK = 'RET ' AND RCDINOUT = 'OUT'                                                  
184.00 111020      C+ AND ZONED(SUBSTR(DIGITS(RCDDATE),1,6),6,0) >= :STRMON                                        
185.00 110608      C+ AND ZONED(SUBSTR(DIGITS(RCDDATE),1,6),6,0) <= :ENDMON                                        
186.00 110527      C+ AND RCDCIF IN (SELECT CUNBR FROM CUP00301 WHERE                                              
187.00 141120 D4466C* CURSPF NOT IN ('B1','C1','C2','C3','C4','C5','C6','N1'))                                     
188.00 141120 D4466C+ CURSPF NOT IN (SELECT FVVAL FROM FRP00501 WHERE FVBK=1 AND                                   
189.00 141120 D4466C+ FVAPP=90 AND FVFLD='CURSPF' AND SUBSTR(FVDSC1,39,1)='H'))                                    
190.00 160927 D6262C+ AND A.RCDCIF = B.CUNBR AND B.CUPERS = :RPSN                                                  
191.00 110608      C+ ORDER BY RCDDATE                                                                             
192.00 110527      C/END-EXEC                                                                                      
193.00 110527      C                                                                                               
194.00 110527      C/EXEC SQL                                                                                      
195.00 110527      C+ INSERT INTO TXNRCD2                                                                          
196.00 160927 D6262C*+ SELECT *                                                                                    
197.00 160927 D6262C+ SELECT A.RCDMARK, A.RCDBRN, A.RCDOFF, A.RCDCIF, A.RCDNAME, A.RCDDATE,                        
198.00 160929 D6262C+ A.RCDTYPE, A.RCDINOUT, A.RCDCCYN, A.RCDCCY, A.RCDDSC, A.RCDTXNAMT,                           
199.00 160927 D6262C+ A.RCDMAMT, A.RCDMCRAMT, A.RCDMDRAMT, A.RCDMTTLAMT, A.RCDNOTXN                                
200.00 160927 D6262C*+ FROM TXNRCDM2                                                                               
201.00 160927 D6262C+ FROM TXNRCDM2 A, CUP00301 B                                                                  
202.00 111020 D1315C* WHERE RCDMARK = 'CORP' AND RCDINOUT = 'OUT'                                                  
203.00 111020 D1315C+ WHERE RCDMARK <> 'RET' AND RCDINOUT = 'OUT'                                                  
204.00 111020      C+ AND ZONED(SUBSTR(DIGITS(RCDDATE),1,6),6,0) >= :STRMON                                        
205.00 110608      C+ AND ZONED(SUBSTR(DIGITS(RCDDATE),1,6),6,0) <= :ENDMON                                        
206.00 110527      C+ AND RCDCIF IN (SELECT CUNBR FROM CUP00301 WHERE                                              
207.00 141120 D4466C* CURSPF NOT IN ('B1','C1','C2','C3','C4','C5','C6','N1'))                                     
208.00 141120 D4466C+ CURSPF NOT IN (SELECT FVVAL FROM FRP00501 WHERE FVBK=1 AND                                   
209.00 141120 D4466C+ FVAPP=90 AND FVFLD='CURSPF' AND SUBSTR(FVDSC1,39,1)='H'))                                    
210.00 160927 D6262C+ AND A.RCDCIF = B.CUNBR AND B.CUPERS = :RPSN                                                  
211.00 110608      C+ ORDER BY RCDDATE                                                                             
212.00 110527      C/END-EXEC                                                                                      
213.00 60516      C                                                                                               
214.00 60516      C                   ENDSR                                                                       
215.00 60518      C                                                                                               
216.00 60518      C*----------------------------------------------------------------------------------------------
217.00 60518      C* CAL TOTAL AMOUNT IN TMP PF                                                                   
218.00 60518      C*----------------------------------------------------------------------------------------------
219.00 60518      C     CALTMPTLAMT   BEGSR                                                                       
220.00 60518      C*--Calculate Cr/Db transaction total amount                                                    
221.00 60518      C*------------------------------------------                                                    
222.00 60518      C/EXEC SQL                                                                                      
223.00 60529      C+ INSERT INTO AMLDDOCRCD                                                                       
224.00 60530      C+ SELECT RCDCIF,RCDINOUT ,SUM(RCDMAMT)                                                         
225.00 110527      C+ FROM TXNRCD1                                                                                 
226.00 60529      C+ GROUP BY RCDCIF,RCDINOUT                                                                     
227.00 60518      C/END-EXEC                                                                                      
228.00 60518      C                                                                                               
229.00 110527      C/EXEC SQL                                                                                      
230.00 110527      C+ INSERT INTO AMLDDOCRCD                                                                       
231.00 110527      C+ SELECT RCDCIF,RCDINOUT ,SUM(RCDMAMT)                                                         
232.00 110527      C+ FROM TXNRCD2                                                                                 
233.00 110527      C+ GROUP BY RCDCIF,RCDINOUT                                                                     
234.00 110527      C/END-EXEC                                                                                      
235.00 60518      C                                                                                               
236.00 60518      C*--Calculate Cr and Db transaction total amount                                                
237.00 60518      C*------------------------------------------                                                    
238.00 60518      C/EXEC SQL                                                                                      
239.00 60529      C+ INSERT INTO AMLDDNCRCD                                                                       
240.00 60530      C+ SELECT RCDCIF, SUM(RCDMAMT) ,COUNT(RCDCIF)                                                   
241.00 110527      C+ FROM TXNRCD1                                                                                 
242.00 60529      C+ GROUP BY RCDCIF                                                                              
243.00 60518      C/END-EXEC                                                                                      
244.00 60518      C                                                                                               
245.00 110527      C/EXEC SQL                                                                                      
246.00 110527      C+ INSERT INTO AMLDDNCRCD                                                                       
247.00 110527      C+ SELECT RCDCIF, SUM(RCDMAMT)  ,COUNT(RCDCIF)                                                  
248.00 110527      C+ FROM TXNRCD2                                                                                 
249.00 110527      C+ GROUP BY RCDCIF                                                                              
250.00 110527      C/END-EXEC                                                                                      
251.00 110527      C                                                                                               
252.00 60518      C                   ENDSR                                                                       
253.00 60518      C                                                                                               
254.00 60524      C     GETFLDTE      BEGSR                                                                       
255.00 60524      C                   READ      TAP00101B                              10                         
256.00 60524      C                   DOW       *IN10='0'                                                         
257.00 60524      C                   IF        DSBK=1                                                            
258.00 60529      C                   CALL      'DFJJTOYY'                                                        
259.00 60524      C                   PARM                    DSDT                                                
260.00 110527      C                   PARM                    CURDATE           8 0                               
261.00 110527      C                   MOVEL     CURDATE       TODTE                                               
262.00 110527       * for quarterly report use                                                                     
263.00 111028 D1315C*                  EVAL      TODTE2 = TODTE - 2                                                
264.00 111028   |  C                   MOVE      TODTE         CURMNTH           2 0                               
265.00 111025   |  C                   Z-ADD     0             TODTE2            6 0                               
266.00 111028   |  C                   IF        CURMNTH >= 3                                                      
267.00 111028   |  C                   EVAL      TODTE2 = TODTE - 2                                                
268.00 111028   |  C                   ELSE                                                                        
269.00 111025   |  C                   EVAL      TODTE2 = TODTE - 100 + 12 - 2                                     
270.00 111020 D1315C                   ENDIF                                                                       
271.00 60524      C                   ENDIF                                                                       
272.00 60524      C                   READ      TAP00101B                              10                         
273.00 60524      C                   ENDDO                                                                       
274.00 60524      C                                                                                               
275.00 60524      C                   ENDSR                                                                       
276.00 60518      C                                                                                               
277.00 110527       **Generate monthly data to working file                                                        
278.00 60518      C     GWKTXN        BEGSR                                                                       
279.00 60519      C                                                                                               
280.00 160928 D6262C                   IF        RPSN = 'P'                                                        
281.00 60519      C/EXEC SQL                                                                                      
282.00 110527      C+ INSERT INTO TXNRCDWRK1                                                                       
283.00 110527      C+ SELECT * FROM TXNRCD1 WHERE                                                                  
284.00 160928 D6262C*+ RCDMTTLAMT>=5000000 OR RCDNOTXN>=5                                                          
285.00 160928 D6262C+ RCDMTTLAMT>=3000000                                                                          
286.00 110527      C+ ORDER BY RCDDATE                                                                             
287.00 60519      C/END-EXEC                                                                                      
288.00 60519      C                                                                                               
289.00 60519      C/EXEC SQL                                                                                      
290.00 60529      C+ INSERT INTO TXNRCDWRK2                                                                       
291.00 110527      C+ SELECT * FROM TXNRCD2 WHERE                                                                  
292.00 160928 D6262C*+ RCDMTTLAMT>=5000000 OR RCDNOTXN>=5                                                          
293.00 160928 D6262C+ RCDMTTLAMT>=3000000                                                                          
294.00 110527      C+ ORDER BY RCDDATE                                                                             
295.00 60519      C/END-EXEC                                                                                      
296.00 160928 D6262C                   ELSE                                                                        
297.00 160928 D6262C/EXEC SQL                                                                                      
298.00 160928 D6262C+ INSERT INTO TXNRCDWRK1                                                                       
299.00 160928 D6262C+ SELECT * FROM TXNRCD1 WHERE                                                                  
300.00 160928 D6262C+ RCDMTTLAMT>=5000000                                                                          
301.00 160928 D6262C+ ORDER BY RCDDATE                                                                             
302.00 160928 D6262C/END-EXEC                                                                                      
303.00 160928 D6262C                                                                                               
304.00 160928 D6262C/EXEC SQL                                                                                      
305.00 160928 D6262C+ INSERT INTO TXNRCDWRK2                                                                       
306.00 160928 D6262C+ SELECT * FROM TXNRCD2 WHERE                                                                  
307.00 160928 D6262C+ RCDMTTLAMT>=5000000                                                                          
308.00 160928 D6262C+ ORDER BY RCDDATE                                                                             
309.00 160928 D6262C/END-EXEC                                                                                      
310.00 160928 D6262C                   ENDIF                                                                       
311.00 160928      C                                                                                               
312.00 60518      C                   ENDSR                                                                       
313.00 60518      C                                                                                               
314.00 110527       **Generate quarterly data to working file                                                      
315.00 110527      C     GWKTXN2       BEGSR                                                                       
316.00 110527      C                                                                                               
317.00 110527      C/EXEC SQL                                                                                      
318.00 110527      C+ INSERT INTO TXNRCDWRK1                                                                       
319.00 110527      C+ SELECT * FROM TXNRCD1 WHERE                                                                  
320.00 110527      C+ RCDMTTLAMT>=12000000 OR RCDNOTXN>=8                                                          
321.00 110527      C+ ORDER BY RCDDATE                                                                             
322.00 110527      C/END-EXEC                                                                                      
323.00 110527      C                                                                                               
324.00 110527      C/EXEC SQL                                                                                      
325.00 110527      C+ INSERT INTO TXNRCDWRK2                                                                       
326.00 110527      C+ SELECT * FROM TXNRCD2 WHERE                                                                  
327.00 110527      C+ RCDMTTLAMT>=12000000 OR RCDNOTXN>=8                                                          
328.00 110527      C+ ORDER BY RCDDATE                                                                             
329.00 110527      C/END-EXEC                                                                                      
330.00 160928      C                                                                                               
331.00 110527      C                   ENDSR                                                                       
332.00 110527      C                                                                                               
333.00 60518      C*----------------------------------------------------------------------------------------------
334.00 60518      C* CALCULATE CREDIT OR DEBIT AND TOTAL CR+DB DAILY TXN AMOUNT                                   
335.00 60518      C*----------------------------------------------------------------------------------------------
336.00 60518      C     CALTLAMT      BEGSR                                                                       
337.00 60529      C***GET CREDIT OR DEBIT TOTAL WEEKLY TXN AMOUNT                                                 
338.00 60529      C                   EVAL      KTCIF =RCDCIF                                                     
339.00 60529      C                   EVAL      KTINOUT='IN'                                                      
340.00 60529      C     KRCD          CHAIN     AMLDDOCRCD                         55                             
341.00 60519      C                   IF        *IN55='0'                                                         
342.00 60529      C                   EVAL      RCDMCRAMT=DOCTMTXAMT                                              
343.00 60519      C                   ENDIF                                                                       
344.00 60519      C                                                                                               
345.00 60529      C                   EVAL      KTINOUT='OUT'                                                     
346.00 60529      C     KRCD          CHAIN     AMLDDOCRCD                         55                             
347.00 60519      C                   IF        *IN55='0'                                                         
348.00 60529      C                   EVAL      RCDMDRAMT=DOCTMTXAMT                                              
349.00 60519      C                   ENDIF                                                                       
350.00 60519      C                                                                                               
351.00 60529      C*** GET IN + OUT TOTAL TXN AMOUNT                                                              
352.00 60529      C     RCDCIF        CHAIN     AMLDDNCRCD                         45                             
353.00 60519      C                   IF        *IN45='0'                                                         
354.00 60529      C                   EVAL      RCDMTTLAMT =DNCTMTXAMT                                            
355.00 60529      C                   EVAL      RCDNOTXN   =DNCTNOTXN                                             
356.00 60519      C                   ENDIF                                                                       
357.00 60519      C                                                                                               
358.00 60518      C                   ENDSR                                                                       
359.00 60518      C                                                                                               
360.00 60518      C                                                                                               
361.00 60516      C*----------------------------------------------------------------------------------------------
362.00 60516      C* Generate Report                                                                              
363.00 60516      C*----------------------------------------------------------------------------------------------
364.00 60516      C     GENRPT        BEGSR                                                                       
365.00 160929      C                                                                                               
366.00 60523      C                   Z-ADD     39            LTLN              2 0                               
366.01 161117 D6262C                   IF        RPSN = 'P'                                                        
366.02 161117 D6262C                   EVAL      CUSTPE = 'Personal'                                               
366.03 161117 D6262C                   ELSE                                                                        
366.04 161117 D6262C                   EVAL      CUSTPE = 'Non-per'                                                
366.05 161117 D6262C                   ENDIF                                                                       
367.00 161117      C                                                                                               
368.00 60523      C                   IF        RNO='R'                                                           
369.00 60516      C*READ RETAIL CUSTOMER                                                                          
370.00 60516      C                   MOVE      *BLANK        OFFI              3                                 
371.00 60517      C                   Z-ADD     0             BRANCH            3 0                               
372.00 60516      C                   MOVE      *BLANK        TMPCIF           10                                 
373.00 60516      C                   Z-ADD     1             LINE              2 0                               
374.00 60517      C                   SETOFF                                       89                             
375.00 110608      C                   READ      TXNRCDW1L1                             80                         
376.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
377.00 60517      C                   IF        *IN80='1'                                                         
378.00 60517      C                   SETON                                        89                             
379.00 60517      C                   ENDIF                                                                       
380.00 60516      C                   DOW       *IN80='0'                                                         
381.00 60516      C                   SELECT                                                                      
382.00 60517      C                   WHEN      BRANCH=0 AND OFFI=*BLANK                                          
383.00 110527      C***FIRST PAGE                                                                                  
384.00 110527      C                   IF        RTYP = 'M'                                                        
385.00 60529      C                   WRITE     HEADERRCD                                                         
386.00 110527      C                   ELSE                                                                        
387.00 110527      C                   WRITE     HEADERRCD2                                                        
388.00 110527      C                   ENDIF                                                                       
389.00 60517      C                   EXSR      DTLLINE                                                           
390.00 60516      C                   WRITE     DTL1                                                              
391.00 60529      C                   WRITE     DTLRCD                                                            
392.00 60519      C                   ADD       4             LINE                                                
393.00 60516      C                                                                                               
394.00 60529      C                   WHEN      BRANCH<>RCDBRN OR OFFI<>RCDOFF OR LINE>LTLN                       
395.00 60516      C***BREAK PAGE                                                                                  
396.00 60529      C                   IF        TMPCIF<>RCDCIF                                                    
397.00 60517      C***NOT SAME CIF                                                                                
398.00 60529      C                   WRITE     DTLRCD1                                                           
399.00 60517      C                   WRITE     RECLINE                                                           
400.00 60519      C                   ADD       3             LINE                                                
401.00 60519      C                   ENDIF                                                                       
402.00 60519      C                                                                                               
403.00 60519      C                   SETON                                        98                             
404.00 110527      C                   IF        RTYP = 'M'                                                        
405.00 60529      C                   WRITE     HEADERRCD                                                         
406.00 110527      C                   ELSE                                                                        
407.00 110527      C                   WRITE     HEADERRCD2                                                        
408.00 110527      C                   ENDIF                                                                       
409.00 60519      C                   SETOFF                                       98                             
410.00 60519      C                   Z-ADD     1             LINE                                                
411.00 60519      C                                                                                               
412.00 60517      C                   EXSR      DTLLINE                                                           
413.00 60517      C                   WRITE     DTL1                                                              
414.00 60529      C                   WRITE     DTLRCD                                                            
415.00 60519      C                   ADD       4             LINE                                                
416.00 60518      C                   WHEN      LINE<=LTLN                                                        
417.00 60516      C***WRITE CURRENT PAGE                                                                          
418.00 60529      C                   IF        TMPCIF<>RCDCIF                                                    
419.00 60529      C                   WRITE     DTLRCD1                                                           
420.00 60517      C                   WRITE     RECLINE                                                           
421.00 60519      C                   ADD       3             LINE                                                
422.00 60519      C                   EXSR      DTLLINE                                                           
423.00 60519      C                   WRITE     DTL1                                                              
424.00 60529      C                   WRITE     DTLRCD                                                            
425.00 60519      C                   ADD       4             LINE                                                
426.00 60519      C                   ELSE                                                                        
427.00 60517      C                   EXSR      DTLLINE                                                           
428.00 60529      C                   WRITE     DTLRCD                                                            
429.00 60519      C                   ADD       1             LINE                                                
430.00 60519      C                   ENDIF                                                                       
431.00 60517      C                   ENDSL                                                                       
432.00 60529      C                   EVAL      BRANCH   = RCDBRN                                                 
433.00 60529      C                   EVAL      OFFI     = RCDOFF                                                 
434.00 60529      C                   EVAL      TMPCIF   = RCDCIF                                                 
435.00 60529      C                   EVAL      AWTLCRAMT= RCDMCRAMT                                              
436.00 60529      C                   EVAL      AWTLDBAMT= RCDMDRAMT                                              
437.00 110608      C                   READ      TXNRCDW1L1                             80                         
438.00 60516      C                   ENDDO                                                                       
439.00 60529      C  N89              WRITE     DTLRCD1                                                           
440.00 60517      C                                                                                               
441.00 60523      C                   ENDIF                                                  *END RETAIL RPT      
442.00 60523      C                                                                                               
443.00 60523      C                                                                                               
444.00 60523      C                   IF        RNO='O'                                                           
445.00 60517      C*READ CORP AND PRI CUSTOMER                                                                    
446.00 60517      C                   MOVE      *BLANK        TMPMARK           4                                 
447.00 60517      C                   MOVE      *BLANK        OFFI              3                                 
448.00 60517      C                   MOVE      *BLANK        TMPCIF           10                                 
449.00 60517      C                   Z-ADD     1             LINE              2 0                               
450.00 60517      C                   Z-ADD     0             PRETLAMT         13 2                               
451.00 60523      C                   SETOFF                                       89                             
452.00 110608      C                   READ      TXNRCDW2L1                             70                         
453.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
454.00 60523      C                   IF        *IN70<>'0'                                                        
455.00 60523      C                   SETON                                        89                             
456.00 60517      C                   ENDIF                                                                       
457.00 60517      C                                                                                               
458.00 60517      C                   DOW       *IN70='0'                                                         
459.00 60517      C                   SELECT                                                                      
460.00 60517      C                   WHEN      TMPMARK=*BLANK AND OFFI=*BLANK                                    
461.00 60517      C***FIRST PAGE                                                                                  
462.00 110527      C                   IF        RTYP = 'M'                                                        
463.00 60529      C                   WRITE     HEADERRCD                                                         
464.00 110527      C                   ELSE                                                                        
465.00 110527      C                   WRITE     HEADERRCD2                                                        
466.00 110527      C                   ENDIF                                                                       
467.00 60517      C                   EXSR      DTLLINE                                                           
468.00 60517      C                   WRITE     DTL1                                                              
469.00 60529      C                   WRITE     DTLRCD                                                            
470.00 60519      C                   ADD       4             LINE                                                
471.00 60517      C                                                                                               
472.00 60529      C                   WHEN      TMPMARK<>RCDMARK OR OFFI<>RCDOFF OR LINE>LTLN                     
473.00 60517      C***BREAK PAGE                                                                                  
474.00 60529      C                   IF        TMPCIF<>RCDCIF                                                    
475.00 60517      C***NOT SAME CIF                                                                                
476.00 60529      C                   WRITE     DTLRCD1                                                           
477.00 60517      C                   WRITE     RECLINE                                                           
478.00 60519      C                   ENDIF                                                                       
479.00 60519      C                                                                                               
480.00 60519      C                   Z-ADD     1             LINE                                                
481.00 60517      C                   SETON                                        98                             
482.00 110527      C                   IF        RTYP = 'M'                                                        
483.00 60529      C                   WRITE     HEADERRCD                                                         
484.00 110527      C                   ELSE                                                                        
485.00 110527      C                   WRITE     HEADERRCD2                                                        
486.00 110527      C                   ENDIF                                                                       
487.00 60517      C                   SETOFF                                       98                             
488.00 60517      C                   EXSR      DTLLINE                                                           
489.00 60517      C                   WRITE     DTL1                                                              
490.00 60529      C                   WRITE     DTLRCD                                                            
491.00 60519      C                   ADD       4             LINE                                                
492.00 60518      C                   WHEN      LINE<=LTLN                                                        
493.00 60517      C***WRITE CURRENT PAGE                                                                          
494.00 60529      C                   IF        TMPCIF<>RCDCIF                                                    
495.00 60529      C                   WRITE     DTLRCD1                                                           
496.00 60517      C                   WRITE     RECLINE                                                           
497.00 60519      C                   ADD       3             LINE                                                
498.00 60517      C                   EXSR      DTLLINE                                                           
499.00 60517      C                   WRITE     DTL1                                                              
500.00 60529      C                   WRITE     DTLRCD                                                            
501.00 60519      C                   ADD       4             LINE                                                
502.00 60517      C                   ELSE                                                                        
503.00 60517      C                   EXSR      DTLLINE                                                           
504.00 60529      C                   WRITE     DTLRCD                                                            
505.00 60519      C                   ADD       1             LINE                                                
506.00 60517      C                   ENDIF                                                                       
507.00 60517      C                   ENDSL                                                                       
508.00 60529      C                   EVAL      TMPMARK  = RCDMARK                                                
509.00 60529      C                   EVAL      OFFI     = RCDOFF                                                 
510.00 60529      C                   EVAL      TMPCIF   = RCDCIF                                                 
511.00 60529      C                   EVAL      AWTLCRAMT= RCDMCRAMT                                              
512.00 60529      C                   EVAL      AWTLDBAMT= RCDMDRAMT                                              
513.00 110608      C                   READ      TXNRCDW2L1                             70                         
514.00 60517      C                   ENDDO                                                                       
515.00 60529      C  N89              WRITE     DTLRCD1                                                           
516.00 60523      C                   ENDIF                                                  *EXCLUDE RETAIL RPT  
517.00 110527      C   89              IF        RTYP = 'M'                                                        
518.00 60529      C   89              WRITE     HEADERRCD                                                         
519.00 110527      C                   ELSE                                                                        
520.00 110527      C   89              WRITE     HEADERRCD2                                                        
521.00 110527      C                   ENDIF                                                                       
522.00 60519      C   89              WRITE     RNOREC                                                            
523.00 60517      C  N89              WRITE     ENDREC                                                            
524.00 60516      C                   ENDSR                                                                       
525.00 60516      C                                                                                               
526.00 60517      C                                                                                               
527.00 60517      C     DTLLINE       BEGSR                                                                       
528.00 60517      C                                                                                               
529.00 110527       * Get risk code                                                                                
530.00 110527      C                   EXSR      GETFLD                                                            
531.00 110527      C                                                                                               
532.00 60529      C                   EVAL      AWCIF  = RCDCIF                                                   
533.00 60529      C                   EVAL      AWMARK = RCDMARK                                                  
534.00 60529      C                   EVAL      AWBRNO = RCDBRN                                                   
535.00 60529      C                   EVAL      AWOFF  = RCDOFF                                                   
536.00 60529      C                   EVAL      AWNAME = RCDNAME                                                  
537.00 60529      C                                                                                               
538.00 60615      C                   EVAL      AWACTYP= RCDTYPE                                                  
539.00 60529      C                   EVAL      AWDATE = RCDDATE                                                  
540.00 60529      C                   EVAL      AWCRDB = RCDINOUT                                                 
541.00 60529      C                   EVAL      AWCCY  = RCDCCY                                                   
542.00 60529      C                   EVAL      AWAMT  = RCDMAMT                                                  
543.00 60529      C                   EVAL      AWNAR  = RCDDSC                                                   
544.00 60517      C                                                                                               
545.00 60517      C                   ENDSR                                                                       
546.00 60517      C                                                                                               
547.00 60517      C                                                                                               
548.00 60516      C                                                                                               
