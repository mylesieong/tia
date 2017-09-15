1.00 170626      H DATEDIT(*YMD)                                                                                
2.00 170626      H************************************************************************                      
3.00 170906      H*   REFERENCE NO. : CHG-266-17 (D7266)                                 *                      
4.00 170906      H*   Program ID.   : CQRIRPT                                            *                      
5.00 170906      H*   Description   : Cheque QR Print Report Program                     *                      
6.00 170906      H*   Author        : Myles Ieong (BI77PGM)                              *                      
7.00 170626      H*   Date written  : 26 Jun 2017                                        *                      
8.00 170626      H************************************************************************                      
9.00 170626       ************************************************************************                      
10.00 170626       * File Specification                                                                          
11.00 170710       ************************************************************************                      
12.00 170626      FCQRXPF    IF   E           K DISK                                                             
13.00 170710      FCQRIRPTF  O    E             PRINTER USROPN                                                   
14.00 170712      F                                     OFLIND(*IN98)                                            
15.00 170710       **************************************************************************                    
16.00 170626       * DEFINE VARIABLE                                                        *                    
17.00 170626       **************************************************************************                    
18.00 170711       *    Constant value                                                                           
19.00 170711      DTTYPE01          S             10A   INZ('(NQR Code)')                                        
20.00 170711      DTTYPE02          S             10A   INZ('(QR Code) ')                                        
21.00 170711      DTTYPE03          S             10A   INZ('(Unmatch) ')                                        
22.00 170713      DTTYPE04          S             10A   INZ('(Summary) ')                                        
23.00 170626       **************************************************************************                    
24.00 170710       * Parameter                                                              *                    
25.00 170626       **************************************************************************                    
26.00 170710      C     *ENTRY        PLIST                                                                      
27.00 170718      C                   PARM                    PBRN              5 0                              
28.00 170626       **************************************************************************                    
29.00 170626       * MAIN ROUTINE                                                           *                    
30.00 170626       **************************************************************************                    
31.00 170711      C                   MOVE      '   '         VCCY              3                                
32.00 170821      C                   MOVE      '   '         VTYP              3                                
33.00 170821      C                   MOVE      ' '           VMTH              1                                
34.00 170719      C                   MOVE      0             VCOUNT            5 0                              
35.00 170913 D7266C                   EVAL      OPBRN = PBRN                                                     
36.00 170710      C                                                                                              
37.00 170710      C                   OPEN      CQRIRPTF                                                         
38.00 170710      C                                                                                              
39.00 170713       *    Write Detail: QR x MOP x Matched                                                         
40.00 170719      C                   EVAL      VCCY = 'MOP'                                                     
41.00 170719      C                   EVAL      VTYP = 'CHQ'                                                     
42.00 170719      C                   EVAL      VMTH = 'M'                                                       
43.00 170719      C                   EVAL      VCOUNT = 0                                                       
44.00 170719      C                   EXSR      XCOUNT                                                           
45.00 170719      C                   IF        VCOUNT <> 0                                                      
46.00 170713      C                   EVAL      OTYPE = TTYPE02                                                  
47.00 170711      C                   WRITE     HEADER                                                           
48.00 170713      C                   WRITE     HDTL                                                             
49.00 170711      C                   EXSR      XDTL                                                             
50.00 170906      C                   EXSR      XDTLTTL                                                          
51.00 170719      C                   ENDIF                                                                      
52.00 170711      C                                                                                              
53.00 170713       *    Write Detail: QR x HKD x Matched                                                         
54.00 170719      C                   EVAL      VCCY = 'HKD'                                                     
55.00 170719      C                   EVAL      VTYP = 'CHQ'                                                     
56.00 170719      C                   EVAL      VMTH = 'M'                                                       
57.00 170719      C                   EVAL      VCOUNT = 0                                                       
58.00 170719      C                   EXSR      XCOUNT                                                           
59.00 170719      C                   IF        VCOUNT <> 0                                                      
60.00 170713      C                   EVAL      OTYPE = TTYPE02                                                  
61.00 170711      C                   WRITE     HEADER                                                           
62.00 170713      C                   WRITE     HDTL                                                             
63.00 170711      C                   EXSR      XDTL                                                             
64.00 170906      C                   EXSR      XDTLTTL                                                          
65.00 170719      C                   ENDIF                                                                      
66.00 170710      C                                                                                              
67.00 170713       *    Write Detail: NQ x MOP x Matched                                                         
68.00 170719      C                   EVAL      VCCY = 'MOP'                                                     
69.00 170719      C                   EVAL      VTYP = '   '                                                     
70.00 170719      C                   EVAL      VMTH = 'M'                                                       
71.00 170719      C                   EVAL      VCOUNT = 0                                                       
72.00 170719      C                   EXSR      XCOUNT                                                           
73.00 170719      C                   IF        VCOUNT <> 0                                                      
74.00 170713      C                   EVAL      OTYPE = TTYPE01                                                  
75.00 170713      C                   WRITE     HEADER                                                           
76.00 170713      C                   WRITE     HDTL                                                             
77.00 170710      C                   EXSR      XDTL                                                             
78.00 170906      C                   EXSR      XDTLTTL                                                          
79.00 170719      C                   ENDIF                                                                      
80.00 170710      C                                                                                              
81.00 170713       *    Write Detail: NQ x HKD x Matched                                                         
82.00 170719      C                   EVAL      VCCY = 'HKD'                                                     
83.00 170719      C                   EVAL      VTYP = '   '                                                     
84.00 170719      C                   EVAL      VMTH = 'M'                                                       
85.00 170719      C                   EVAL      VCOUNT = 0                                                       
86.00 170719      C                   EXSR      XCOUNT                                                           
87.00 170719      C                   IF        VCOUNT <> 0                                                      
88.00 170713      C                   EVAL      OTYPE = TTYPE01                                                  
89.00 170713      C                   WRITE     HEADER                                                           
90.00 170713      C                   WRITE     HDTL                                                             
91.00 170710      C                   EXSR      XDTL                                                             
92.00 170906      C                   EXSR      XDTLTTL                                                          
93.00 170719      C                   ENDIF                                                                      
94.00 170710      C                                                                                              
95.00 170821       *    Write Detail: QR/NQ x MOP/HKD x Unmatched (no matter exist or not)                       
96.00 170821      C                   EVAL      OTYPE = TTYPE03                                                  
97.00 170713      C                   WRITE     HEADER                                                           
98.00 170713      C                   WRITE     HDTL                                                             
99.00 170713      C                                                                                              
100.00 170821      C                   EVAL      VMTH = 'U'                                                       
101.00 170821      C                                                                                              
102.00 170711      C                   EVAL      VCCY = 'MOP'                                                     
103.00 170713      C                   EVAL      VTYP = 'CHQ'                                                     
104.00 170710      C                   EXSR      XDTL                                                             
105.00 170713      C                                                                                              
106.00 170713      C                   EVAL      VCCY = 'MOP'                                                     
107.00 170713      C                   EVAL      VTYP = '   '                                                     
108.00 170713      C                   EXSR      XDTL                                                             
109.00 170713      C                                                                                              
110.00 170713      C                   EVAL      VCCY = 'HKD'                                                     
111.00 170713      C                   EVAL      VTYP = 'CHQ'                                                     
112.00 170713      C                   EXSR      XDTL                                                             
113.00 170713      C                                                                                              
114.00 170713      C                   EVAL      VCCY = 'HKD'                                                     
115.00 170713      C                   EVAL      VTYP = '   '                                                     
116.00 170713      C                   EXSR      XDTL                                                             
117.00 170713      C                                                                                              
118.00 170713       *    Write Detail: Summary Report                                                             
119.00 170719      C                   EVAL      OTYPE = TTYPE04                                                  
120.00 170719      C                   WRITE     HEADER                                                           
121.00 170719      C                   WRITE     HSUM                                                             
122.00 170719      C                   EVAL      VMTH = 'M'                                                       
123.00 170719      C                                                                                              
124.00 170719      C                   EVAL      VCCY = 'MOP'                                                     
125.00 170719      C                   EVAL      VTYP = 'CHQ'                                                     
126.00 170719      C                   EXSR      XSUM                                                             
127.00 170719      C                   EXSR      XSUMTTL                                                          
128.00 170719      C                   WRITE     EMPLNE                                                           
129.00 170710      C                                                                                              
130.00 170719      C                   EVAL      VCCY = 'HKD'                                                     
131.00 170719      C                   EVAL      VTYP = 'CHQ'                                                     
132.00 170719      C                   EXSR      XSUM                                                             
133.00 170719      C                   EXSR      XSUMTTL                                                          
134.00 170719      C                   WRITE     EMPLNE                                                           
135.00 170719      C                                                                                              
136.00 170719      C                   EVAL      VCCY = 'MOP'                                                     
137.00 170719      C                   EVAL      VTYP = '   '                                                     
138.00 170719      C                   EXSR      XSUM                                                             
139.00 170719      C                   EXSR      XSUMTTL                                                          
140.00 170719      C                   WRITE     EMPLNE                                                           
141.00 170719      C                                                                                              
142.00 170719      C                   EVAL      VCCY = 'HKD'                                                     
143.00 170719      C                   EVAL      VTYP = '   '                                                     
144.00 170719      C                   EXSR      XSUM                                                             
145.00 170719      C                   EXSR      XSUMTTL                                                          
146.00 170719      C                                                                                              
147.00 170711       *    Write report endding                                                                     
148.00 170711      C                   WRITE     ENDRPT                                                           
149.00 170711      C                                                                                              
150.00 170711      C                   CLOSE     CQRIRPTF                                                         
151.00 170711      C                   SETON                                        LR                            
152.00 170821       ************************************************************************                      
153.00 170821       * Subroutine XCOUNT return VCOUNT that represent count(*)                                     
154.00 170821       ************************************************************************                      
155.00 170821      C     XCOUNT        BEGSR                                                                      
156.00 170821      C                                                                                              
157.00 170821      C                   MOVE      VCCY          V@CCY             3                                
158.00 170821      C                   MOVE      VTYP          V@TYP             3                                
159.00 170821      C                   MOVE      VMTH          V@MTH             1                                
160.00 170821      C                                                                                              
161.00 170821      C                   IF        PBRN <> 999                                                      
162.00 170821      C                                                                                              
163.00 170821       *    Get row count                                                                            
164.00 170821      C/EXEC SQL                                                                                     
165.00 170821      C+  DECLARE TCOUNT CURSOR FOR                                                                  
166.00 170821      C+  SELECT COUNT(*)                                                                            
167.00 170821      C+  FROM CQRXPF                                                                                
168.00 170821      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
169.00 170821      C+        AND CXTLTBRN = :PBRN                                                                 
170.00 170821      C/END-EXEC                                                                                     
171.00 170821      C                                                                                              
172.00 170821      C/EXEC SQL                                                                                     
173.00 170821      C+  OPEN TCOUNT                                                                                
174.00 170821      C/END-EXEC                                                                                     
175.00 170821      C                   EVAL      SQLCOD = 0                                                       
176.00 170821      C                   DOW       SQLCOD = 0                                                       
177.00 170821      C/EXEC SQL                                                                                     
178.00 170821      C+  FETCH TCOUNT INTO :VCOUNT                                                                  
179.00 170821      C/END-EXEC                                                                                     
180.00 170821      C                   IF        SQLCOD <> 0                                                      
181.00 170821      C                   LEAVE                                                                      
182.00 170821      C                   ENDIF                                                                      
183.00 170821      C                   ENDDO                                                                      
184.00 170821      C/EXEC SQL                                                                                     
185.00 170821      C+  CLOSE TCOUNT                                                                               
186.00 170821      C/END-EXEC                                                                                     
187.00 170821      C                                                                                              
188.00 170821      C                   ELSE                                                                       
189.00 170821      C                                                                                              
190.00 170821       *    Get count of all branch                                                                  
191.00 170821      C/EXEC SQL                                                                                     
192.00 170821      C+  DECLARE TCOUNTALL CURSOR FOR                                                               
193.00 170821      C+  SELECT COUNT(*)                                                                            
194.00 170821      C+  FROM CQRXPF                                                                                
195.00 170821      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
196.00 170821      C/END-EXEC                                                                                     
197.00 170821      C                                                                                              
198.00 170821      C/EXEC SQL                                                                                     
199.00 170821      C+  OPEN TCOUNTALL                                                                             
200.00 170821      C/END-EXEC                                                                                     
201.00 170821      C                   EVAL      SQLCOD = 0                                                       
202.00 170821      C                   DOW       SQLCOD = 0                                                       
203.00 170821      C/EXEC SQL                                                                                     
204.00 170821      C+  FETCH TCOUNTALL INTO :VCOUNT                                                               
205.00 170821      C/END-EXEC                                                                                     
206.00 170821      C                   IF        SQLCOD <> 0                                                      
207.00 170821      C                   LEAVE                                                                      
208.00 170821      C                   ENDIF                                                                      
209.00 170821      C                   ENDDO                                                                      
210.00 170821      C/EXEC SQL                                                                                     
211.00 170821      C+  CLOSE TCOUNTALL                                                                            
212.00 170821      C/END-EXEC                                                                                     
213.00 170821      C                   ENDIF                                                                      
214.00 170719      C                                                                                              
215.00 170719      C                   ENDSR                                                                      
216.00 170711       ************************************************************************                      
217.00 170711       * Subroutine XDTL - Extract Details                                                           
218.00 170711       ************************************************************************                      
219.00 170711      C     XDTL          BEGSR                                                                      
220.00 170711      C                                                                                              
221.00 170711      C                   MOVE      VCCY          V@CCY             3                                
222.00 170711      C                   MOVE      VTYP          V@TYP             3                                
223.00 170711      C                   MOVE      VMTH          V@MTH             1                                
224.00 170711      C                                                                                              
225.00 170719      C                   IF        PBRN <> 999                                                      
226.00 170719      C                                                                                              
227.00 170719       *    Print report detail by branch w/ cursor TDTL                                             
228.00 170719      C/EXEC SQL                                                                                     
229.00 170719      C+  DECLARE TDTL CURSOR FOR                                                                    
230.00 170711      C+  SELECT CXTLTBRN, CXCPET, CXOBNK, CXCHQ, CXTLTAPP,                                          
231.00 170713      C+         CXTLTACT, CXAMT, SUBSTR(CXTLTAL1,1,30), CXTLTUSR,                                   
232.00 170713      C+         CXENV                                                                               
233.00 170711      C+  FROM CQRXPF                                                                                
234.00 170711      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
235.00 170821      C+        AND CXTLTBRN = :PBRN                                                                 
236.00 170719      C+  ORDER BY CXOBNK                                                                            
237.00 170711      C/END-EXEC                                                                                     
238.00 170719      C                                                                                              
239.00 170719      C/EXEC SQL                                                                                     
240.00 170719      C+  OPEN TDTL                                                                                  
241.00 170719      C/END-EXEC                                                                                     
242.00 170719      C                   EVAL      SQLCOD = 0                                                       
243.00 170719      C                   DOW       SQLCOD = 0                                                       
244.00 170719      C/EXEC SQL                                                                                     
245.00 170719      C+  FETCH TDTL INTO :OCXBRN, :OCXCPET, :OCXOBNK, :OCXCHQ, :OCXTLTAPP,                          
246.00 170719      C+                     :OCXTLTACT, :OCXAMT, :OCXTLTAL1, :OCXTLTUSR,                            
247.00 170719      C+                     :OCXENV                                                                 
248.00 170719      C/END-EXEC                                                                                     
249.00 170719      C                   IF        SQLCOD <> 0                                                      
250.00 170719      C                   LEAVE                                                                      
251.00 170719      C                   ENDIF                                                                      
252.00 170719      C                   WRITE     RDTL                                                             
253.00 170906      C                   EXSR      CHKPRTH                                                          
254.00 170719      C                   ENDDO                                                                      
255.00 170719      C/EXEC SQL                                                                                     
256.00 170719      C+  CLOSE TDTL                                                                                 
257.00 170719      C/END-EXEC                                                                                     
258.00 170719      C                                                                                              
259.00 170719      C                   ELSE                                                                       
260.00 170719      C                                                                                              
261.00 170719       *    Print report detail of ALL branch w/ cursor TDTLALL                                      
262.00 170719      C/EXEC SQL                                                                                     
263.00 170719      C+  DECLARE TDTLALL CURSOR FOR                                                                 
264.00 170719      C+  SELECT CXTLTBRN, CXCPET, CXOBNK, CXCHQ, CXTLTAPP,                                          
265.00 170719      C+         CXTLTACT, CXAMT, SUBSTR(CXTLTAL1,1,30), CXTLTUSR,                                   
266.00 170719      C+         CXENV                                                                               
267.00 170719      C+  FROM CQRXPF                                                                                
268.00 170719      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
269.00 170719      C+  ORDER BY CXOBNK                                                                            
270.00 170719      C/END-EXEC                                                                                     
271.00 170719      C                                                                                              
272.00 170719      C/EXEC SQL                                                                                     
273.00 170719      C+  OPEN TDTLALL                                                                               
274.00 170719      C/END-EXEC                                                                                     
275.00 170719      C                   EVAL      SQLCOD = 0                                                       
276.00 170719      C                   DOW       SQLCOD = 0                                                       
277.00 170719      C/EXEC SQL                                                                                     
278.00 170719      C+  FETCH TDTLALL INTO :OCXBRN, :OCXCPET, :OCXOBNK, :OCXCHQ, :OCXTLTAPP,                       
279.00 170719      C+                     :OCXTLTACT, :OCXAMT, :OCXTLTAL1, :OCXTLTUSR,                            
280.00 170719      C+                     :OCXENV                                                                 
281.00 170719      C/END-EXEC                                                                                     
282.00 170719      C                   IF        SQLCOD <> 0                                                      
283.00 170719      C                   LEAVE                                                                      
284.00 170719      C                   ENDIF                                                                      
285.00 170719      C                   WRITE     RDTL                                                             
286.00 170906      C                   EXSR      CHKPRTH                                                          
287.00 170719      C                   ENDDO                                                                      
288.00 170719      C/EXEC SQL                                                                                     
289.00 170719      C+  CLOSE TDTLALL                                                                              
290.00 170719      C/END-EXEC                                                                                     
291.00 170719      C                   ENDIF                                                                      
292.00 170711      C                                                                                              
293.00 170719      C                   ENDSR                                                                      
294.00 170711       ************************************************************************                      
295.00 170711       * Subroutine XSUM - Extract Summary                                                           
296.00 170711       ************************************************************************                      
297.00 170711      C     XSUM          BEGSR                                                                      
298.00 170719      C                                                                                              
299.00 170719      C                   MOVE      VCCY          V@CCY             3                                
300.00 170719      C                   MOVE      VTYP          V@TYP             3                                
301.00 170719      C                   MOVE      VMTH          V@MTH             1                                
302.00 170711      C                                                                                              
303.00 170719      C                   IF        PBRN <> 999                                                      
304.00 170719      C                                                                                              
305.00 170719       *    Print report summary of specific branch w/ cursor TSUM                                   
306.00 170719      C/EXEC SQL                                                                                     
307.00 170719      C+  DECLARE TSUM CURSOR FOR                                                                    
308.00 170713      C+  SELECT CASE CXTYP WHEN 'CHQ' THEN 'QR' WHEN '   ' THEN 'NQ' END,                           
309.00 170713      C+         CXCPET, CXOBNK, COUNT(*), SUM(CXAMT)                                                
310.00 170713      C+  FROM CQRXPF                                                                                
311.00 170719      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
312.00 170821      C+        AND CXTLTBRN = :PBRN                                                                 
313.00 170719      C+  GROUP BY CXTYP, CXCPET, CXOBNK                                                             
314.00 170719      C+  ORDER BY CXOBNK                                                                            
315.00 170711      C/END-EXEC                                                                                     
316.00 170711      C                                                                                              
317.00 170711      C/EXEC SQL                                                                                     
318.00 170719      C+  OPEN TSUM                                                                                  
319.00 170711      C/END-EXEC                                                                                     
320.00 170711      C                   EVAL      SQLCOD = 0                                                       
321.00 170711      C                   DOW       SQLCOD = 0                                                       
322.00 170711      C/EXEC SQL                                                                                     
323.00 170719      C+  FETCH TSUM INTO :OCXTYP, :OCXCPET, :OCXOBNK, :OQTY, :OSUM                                  
324.00 170711      C/END-EXEC                                                                                     
325.00 170711      C                   IF        SQLCOD <> 0                                                      
326.00 170711      C                   LEAVE                                                                      
327.00 170711      C                   ENDIF                                                                      
328.00 170711      C                   WRITE     RSUM                                                             
329.00 170906      C                   EXSR      CHKPRTH                                                          
330.00 170711      C                   ENDDO                                                                      
331.00 170711      C/EXEC SQL                                                                                     
332.00 170719      C+  CLOSE TSUM                                                                                 
333.00 170711      C/END-EXEC                                                                                     
334.00 170719      C                                                                                              
335.00 170719      C                   ELSE                                                                       
336.00 170719      C                                                                                              
337.00 170719       *    Print report summary of ALL branch w/ cursor TSUMALL                                     
338.00 170719      C/EXEC SQL                                                                                     
339.00 170719      C+  DECLARE TSUMALL CURSOR FOR                                                                 
340.00 170719      C+  SELECT CASE CXTYP WHEN 'CHQ' THEN 'QR' WHEN '   ' THEN 'NQ' END,                           
341.00 170719      C+         CXCPET, CXOBNK, COUNT(*), SUM(CXAMT)                                                
342.00 170719      C+  FROM CQRXPF                                                                                
343.00 170719      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
344.00 170719      C+  GROUP BY CXTYP, CXCPET, CXOBNK                                                             
345.00 170719      C+  ORDER BY CXOBNK                                                                            
346.00 170719      C/END-EXEC                                                                                     
347.00 170719      C                                                                                              
348.00 170719      C/EXEC SQL                                                                                     
349.00 170719      C+  OPEN TSUMALL                                                                               
350.00 170719      C/END-EXEC                                                                                     
351.00 170719      C                   EVAL      SQLCOD = 0                                                       
352.00 170719      C                   DOW       SQLCOD = 0                                                       
353.00 170719      C/EXEC SQL                                                                                     
354.00 170719      C+  FETCH TSUMALL INTO :OCXTYP, :OCXCPET, :OCXOBNK, :OQTY, :OSUM                               
355.00 170719      C/END-EXEC                                                                                     
356.00 170719      C                   IF        SQLCOD <> 0                                                      
357.00 170719      C                   LEAVE                                                                      
358.00 170719      C                   ENDIF                                                                      
359.00 170719      C                   WRITE     RSUM                                                             
360.00 170906      C                   EXSR      CHKPRTH                                                          
361.00 170719      C                   ENDDO                                                                      
362.00 170719      C/EXEC SQL                                                                                     
363.00 170719      C+  CLOSE TSUMALL                                                                              
364.00 170719      C/END-EXEC                                                                                     
365.00 170719      C                                                                                              
366.00 170719      C                   ENDIF                                                                      
367.00 170711      C                                                                                              
368.00 170711      C                   ENDSR                                                                      
369.00 170906      C**********************************************************************                        
370.00 170906      C*           SR: XDTLTTL - Write total of details                     *                        
371.00 170906      C**********************************************************************                        
372.00 170906      C     XDTLTTL       BEGSR                                                                      
373.00 170906      C                                                                                              
374.00 170906      C                   MOVE      VCCY          V@CCY             3                                
375.00 170906      C                   MOVE      VTYP          V@TYP             3                                
376.00 170906      C                   MOVE      VMTH          V@MTH             1                                
377.00 170906      C                                                                                              
378.00 170906      C                   IF        PBRN <> 999                                                      
379.00 170906      C                                                                                              
380.00 170906       *    Print report summary of specific branch w/ cursor TSUM                                   
381.00 170906      C/EXEC SQL                                                                                     
382.00 170906      C+  DECLARE TDTLTTL CURSOR FOR                                                                 
383.00 170906      C+  SELECT COUNT(*), SUM(CXAMT)                                                                
384.00 170906      C+  FROM CQRXPF                                                                                
385.00 170906      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
386.00 170906      C+        AND CXTLTBRN = :PBRN                                                                 
387.00 170906      C+  GROUP BY CXTYP, CXCPET                                                                     
388.00 170906      C/END-EXEC                                                                                     
389.00 170906      C                                                                                              
390.00 170906      C/EXEC SQL                                                                                     
391.00 170906      C+  OPEN TDTLTTL                                                                               
392.00 170906      C/END-EXEC                                                                                     
393.00 170906      C                   EVAL      SQLCOD = 0                                                       
394.00 170906      C                   DOW       SQLCOD = 0                                                       
395.00 170906      C/EXEC SQL                                                                                     
396.00 170906      C+  FETCH TDTLTTL INTO :OQTY, :OSUM                                                            
397.00 170906      C/END-EXEC                                                                                     
398.00 170906      C                   IF        SQLCOD <> 0                                                      
399.00 170906      C                   LEAVE                                                                      
400.00 170906      C                   ENDIF                                                                      
401.00 170906      C                   WRITE     RDTLTTL                                                          
402.00 170906      C                   EXSR      CHKPRTH                                                          
403.00 170906      C                   ENDDO                                                                      
404.00 170906      C/EXEC SQL                                                                                     
405.00 170906      C+  CLOSE TDTLTTL                                                                              
406.00 170906      C/END-EXEC                                                                                     
407.00 170906      C                                                                                              
408.00 170906      C                   ELSE                                                                       
409.00 170906      C                                                                                              
410.00 170906       *    Print report summary of ALL branch w/ cursor TDTLALL                                     
411.00 170906      C/EXEC SQL                                                                                     
412.00 170906      C+  DECLARE TDTLTTLALL CURSOR FOR                                                              
413.00 170906      C+  SELECT COUNT(*), SUM(CXAMT)                                                                
414.00 170906      C+  FROM CQRXPF                                                                                
415.00 170906      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
416.00 170906      C+  GROUP BY CXTYP, CXCPET                                                                     
417.00 170906      C/END-EXEC                                                                                     
418.00 170906      C                                                                                              
419.00 170906      C/EXEC SQL                                                                                     
420.00 170906      C+  OPEN TDTLTTLALL                                                                            
421.00 170906      C/END-EXEC                                                                                     
422.00 170906      C                   EVAL      SQLCOD = 0                                                       
423.00 170906      C                   DOW       SQLCOD = 0                                                       
424.00 170906      C/EXEC SQL                                                                                     
425.00 170906      C+  FETCH TDTLTTLALL INTO :OQTY, :OSUM                                                         
426.00 170906      C/END-EXEC                                                                                     
427.00 170906      C                   IF        SQLCOD <> 0                                                      
428.00 170906      C                   LEAVE                                                                      
429.00 170906      C                   ENDIF                                                                      
430.00 170906      C                   WRITE     RDTLTTL                                                          
431.00 170906      C                   EXSR      CHKPRTH                                                          
432.00 170906      C                   ENDDO                                                                      
433.00 170906      C/EXEC SQL                                                                                     
434.00 170906      C+  CLOSE TDTLTTLALL                                                                           
435.00 170906      C/END-EXEC                                                                                     
436.00 170906      C                                                                                              
437.00 170906      C                   ENDIF                                                                      
438.00 170906      C                                                                                              
439.00 170906      C                   ENDSR                                                                      
440.00 170906      C**********************************************************************                        
441.00 170719      C*           SR: XSUMTTL - Write total of summary                     *                        
442.00 170719      C**********************************************************************                        
443.00 170719      C     XSUMTTL       BEGSR                                                                      
444.00 170719      C                                                                                              
445.00 170719      C                   MOVE      VCCY          V@CCY             3                                
446.00 170719      C                   MOVE      VTYP          V@TYP             3                                
447.00 170719      C                   MOVE      VMTH          V@MTH             1                                
448.00 170719      C                                                                                              
449.00 170719      C                   IF        PBRN <> 999                                                      
450.00 170719      C                                                                                              
451.00 170719       *    Print report summary of specific branch w/ cursor TSUM                                   
452.00 170719      C/EXEC SQL                                                                                     
453.00 170719      C+  DECLARE TSUMTTL CURSOR FOR                                                                 
454.00 170719      C+  SELECT COUNT(*), SUM(CXAMT)                                                                
455.00 170719      C+  FROM CQRXPF                                                                                
456.00 170719      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
457.00 170821      C+        AND CXTLTBRN = :PBRN                                                                 
458.00 170719      C+  GROUP BY CXTYP, CXCPET                                                                     
459.00 170719      C/END-EXEC                                                                                     
460.00 170719      C                                                                                              
461.00 170719      C/EXEC SQL                                                                                     
462.00 170719      C+  OPEN TSUMTTL                                                                               
463.00 170719      C/END-EXEC                                                                                     
464.00 170719      C                   EVAL      SQLCOD = 0                                                       
465.00 170719      C                   DOW       SQLCOD = 0                                                       
466.00 170719      C/EXEC SQL                                                                                     
467.00 170719      C+  FETCH TSUMTTL INTO :OQTY, :OSUM                                                            
468.00 170719      C/END-EXEC                                                                                     
469.00 170719      C                   IF        SQLCOD <> 0                                                      
470.00 170719      C                   LEAVE                                                                      
471.00 170719      C                   ENDIF                                                                      
472.00 170719      C                   WRITE     RSUMTTL                                                          
473.00 170906      C                   EXSR      CHKPRTH                                                          
474.00 170719      C                   ENDDO                                                                      
475.00 170719      C/EXEC SQL                                                                                     
476.00 170719      C+  CLOSE TSUMTTL                                                                              
477.00 170719      C/END-EXEC                                                                                     
478.00 170719      C                                                                                              
479.00 170719      C                   ELSE                                                                       
480.00 170719      C                                                                                              
481.00 170719       *    Print report summary of ALL branch w/ cursor TSUMALL                                     
482.00 170719      C/EXEC SQL                                                                                     
483.00 170719      C+  DECLARE TSUMTTLALL CURSOR FOR                                                              
484.00 170719      C+  SELECT COUNT(*), SUM(CXAMT)                                                                
485.00 170719      C+  FROM CQRXPF                                                                                
486.00 170719      C+  WHERE CXCPET = :V@CCY AND CXTYP = :V@TYP AND CXSTS = :V@MTH                                
487.00 170719      C+  GROUP BY CXTYP, CXCPET                                                                     
488.00 170719      C/END-EXEC                                                                                     
489.00 170719      C                                                                                              
490.00 170719      C/EXEC SQL                                                                                     
491.00 170719      C+  OPEN TSUMTTLALL                                                                            
492.00 170719      C/END-EXEC                                                                                     
493.00 170719      C                   EVAL      SQLCOD = 0                                                       
494.00 170719      C                   DOW       SQLCOD = 0                                                       
495.00 170719      C/EXEC SQL                                                                                     
496.00 170719      C+  FETCH TSUMTTLALL INTO :OQTY, :OSUM                                                         
497.00 170719      C/END-EXEC                                                                                     
498.00 170719      C                   IF        SQLCOD <> 0                                                      
499.00 170719      C                   LEAVE                                                                      
500.00 170719      C                   ENDIF                                                                      
501.00 170719      C                   WRITE     RSUMTTL                                                          
502.00 170906      C                   EXSR      CHKPRTH                                                          
503.00 170719      C                   ENDDO                                                                      
504.00 170719      C/EXEC SQL                                                                                     
505.00 170719      C+  CLOSE TSUMTTLALL                                                                           
506.00 170719      C/END-EXEC                                                                                     
507.00 170719      C                                                                                              
508.00 170719      C                   ENDIF                                                                      
509.00 170719      C                                                                                              
510.00 170719      C                   ENDSR                                                                      
511.00 170712      C**********************************************************************                        
512.00 170712      C*           SR: CHKPRTH - check and print header if overflow         *                        
513.00 170712      C**********************************************************************                        
514.00 170712      C     CHKPRTH       BEGSR                                                                      
515.00 170821      C                                                                                              
516.00 170712      C     *IN98         IFEQ      *ON                                                              
517.00 170821      C                                                                                              
518.00 170906       *    First turn off page flipping indicator                                                   
519.00 170906      C                   SETOFF                                       98                            
520.00 170906      C                                                                                              
521.00 170906       *    Write main header and sub-header                                                         
522.00 170906      C                   WRITE     HEADER                                                           
523.00 170906      C                   IF        OTYPE = TTYPE04                                                  
524.00 170906      C                   WRITE     HSUM                                                             
525.00 170906      C                   ELSE                                                                       
526.00 170906      C                   WRITE     HDTL                                                             
527.00 170906      C                   ENDIF                                                                      
528.00 170821      C                                                                                              
529.00 170712      C                   ENDIF                                                                      
530.00 170821      C                                                                                              
531.00 170712      C                   ENDSR                                                                      
532.00 170711       **                                                                                            
