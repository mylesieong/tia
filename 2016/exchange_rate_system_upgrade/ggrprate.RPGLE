1.00 50614      H*DATEDIT(*DMY)                                                            
2.00 101216       ************************************************************************* 
3.00 160608       *  Program ID.  : GDRTRATE                                              * 
4.00 160729       *  Written by   : Myles Ieong (BI77PGM)                                 * 
5.00 160729       *  Reference    : CHG-0250-16 (D6250)                                   * 
6.00 160729       *  Date         : 29-Jul-2016                                           * 
7.00 160729       *  Parameters   : In -    CIF                10A                        * 
8.00 160608       *                         From Currency       3S 0                      * 
9.00 160520       *                         To Currency         3S 0                      * 
10.00 160520       *                         Ccy Exchange Type   1A                        * 
11.00 110516       *                           'C' - Cash                                  * 
12.00 110516       *                           'T' - Transfer                              * 
13.00 160729       *                         Transfer Function   4A   (for futurn use)     * 
14.00 160729       *                         Group type          6A                        * 
15.00 160729       *                         Channel type        6A                        * 
16.00 110518       *                         Date (YYYYMMDD)     8S 0 (0 for the lastest;  * 
17.00 110518       *                                                   if Date = 0, Time   * 
18.00 110518       *                                                   must be 0)          * 
19.00 110517       *                         Time (HHMMSS)       6S 0 (If Date = 0, Time   * 
20.00 110517       *                                                   is 0 mean lastest;  * 
21.00 110517       *                                                   while Date<>0, Time * 
22.00 110517       *                                                   is 0 mean 00:00:00) * 
23.00 160729       *                 Out-    Rate               11S 7                      * 
24.00 110517       *                         From Exchange Ccy  11S 0                      * 
25.00 110518       *                         From Ccy Date       8S 0                      * 
26.00 110518       *                         From Ccy Time       6S 0                      * 
27.00 110517       *                         To Exchange Ccy    11S 0                      * 
28.00 110518       *                         To Ccy Date         8S 0                      * 
29.00 110518       *                         To Ccy Time         6S 0                      * 
30.00 160608       *                         Display Rate       11S 7                      * 
31.00 110517       *                         Return Status       1A                        * 
32.00 110210       *                           '0' - successful                            * 
33.00 110517       *                           '1' - input parameter error                 * 
34.00 110518       *                           '2' - other error                           * 
35.00 110518       *                                                                       * 
36.00 110518       *    Indicator    : *IN41 = Invalid input parameter value               * 
37.00 110518       *                   *IN42 = Other error                                 * 
38.00 160926       *                   *IN43 = from ccy suspend                            * 
39.00 160926       *                   *IN44 = to ccy suspend                              * 
40.00 110518       *                   *IN91 = From currency not found                     * 
41.00 160613       *                   *IN92 = To currency not found                       * 
42.00 160613       *                   *IN99 = Use AG HKD rate to calculate the direct rate* 
43.00 160613       *                                                                       * 
44.00 160613       *  Description    : Get the driect rate from one currency exchange into * 
45.00 160613       *                   another currency                                    * 
46.00 160613       **************************************************************************
47.00 160613      FGLC001    IF   E           K DISK                                         
48.00 160613      FGLC002    IF   E           K DISK                                         
49.00 160729      FRTGVARLOG IF   E           K DISK                                         
50.00 160613      FRTGGRPLST IF   E           K DISK                                         
51.00 160608      FRTGCHNLST IF   E           K DISK                                         
52.00 160608       ************************************************************************* 
53.00 110519      DFR_INNERRT       S             11S 7                                      
54.00 110519      DTO_INNERRT       S             11S 7                                      
55.00 110517      DCCY_IND          S              2A                                        
56.00 110516      DFR_IND           S              1A                                        
57.00 110516      DTO_IND           S              1A                                        
58.00 110517      DMDIND            S              1A                                        
59.00 50614       **************************************************************************
60.00 160608       * GLC001 & GLC002 FILE KEY LIST                                           
61.00 160608      C     KGLC          KLIST                                                  
62.00 101215      C                   KFLD                    KBK               3 0          
63.00 110516      C                   KFLD                    KCCY              3 0          
64.00 110517      C                   KFLD                    KJDATE            7 0          
65.00 110516      C                   KFLD                    KTIME             6 0          
66.00 160729       * RTGVARLOG FILE KEY LIST                                                 
67.00 160729      C     KRTGVARLOG    KLIST                                                  
68.00 160608      C                   KFLD                    KBK                            
69.00 160608      C                   KFLD                    KCCY                           
70.00 160608      C                   KFLD                    KGRP              6            
71.00 160608      C                   KFLD                    KCHN              6            
72.00 160608      C                   KFLD                    KJDATE                         
73.00 160608      C                   KFLD                    KTIME                          
74.00 160608       * Valid group list pf key list                                            
75.00 160608      C     KRTGGRPLST    KLIST                                                  
76.00 160608      C                   KFLD                    KGRP                           
77.00 160608       * Valid channel list pf key list                                          
78.00 160608      C     KRTGCHNLST    KLIST                                                  
79.00 160608      C                   KFLD                    KCHN                           
80.00 160608       **************************************************************************
81.00 160608       *                                                                         
82.00 101215      C     *ENTRY        PLIST                                                  
83.00 160613       *in                                                                       
84.00 160613      C                   PARM                    PCIF             10            
85.00 160613      C                   PARM                    PFRCCY            3 0          
86.00 160729      C                   PARM                    PFRAMT           13 2          
87.00 160613      C                   PARM                    PTOCCY            3 0          
88.00 160729      C                   PARM                    PTOAMT           13 2          
89.00 160613      C                   PARM                    PEXCHGTYP         1            
90.00 160613      C                   PARM                    PFUNC             4            
91.00 160613      C                   PARM                    PGROUP            6            
92.00 160613      C                   PARM                    PCHANNEL          6            
93.00 160613      C                   PARM                    PEXCHGDT          8 0          
94.00 160613      C                   PARM                    PEXCHGTM          6 0          
95.00 160613       *out                                                                      
96.00 160613      C                   PARM                    PRATE            11 7          
97.00 160613      C                   PARM                    PFRCCYRATE       11 7          
98.00 160613      C                   PARM                    PFRDATE           8 0          
99.00 160613      C                   PARM                    PFRTIME           6 0          
100.00 160613      C                   PARM                    PTOCCYRATE       11 7          
101.00 160613      C                   PARM                    PTODATE           8 0          
102.00 160613      C                   PARM                    PTOTIME           6 0          
103.00 160613      C                   PARM                    PDSPCCYRT        11 7          
104.00 160729      C                   PARM                    PIND1             1            
105.00 160729      C                   PARM                    PIND2             1            
106.00 160729      C                   PARM                    PIND3             1            
107.00 160613      C                   PARM                    PSTATUS           1            
108.00 160608      C*                                                                         
109.00 160608      C**********************************************************************    
110.00 160608      C*                          MAIN ROUTINE                              *    
111.00 160608      C**********************************************************************    
112.00 101214      C                   Z-ADD     1             KBK                            
113.00 160729      C                   Z-ADD     9999999       KJDATE                         
114.00 160729      C                   Z-ADD     999999        KTIME                          
115.00 110516      C                                                                          
116.00 110518      C                   IF        PEXCHGTYP = 'C' OR PEXCHGTYP = 'T'           
117.00 160613      C*                                                                         
118.00 160613      C*    validate from currency                                               
119.00 160613      C*                                                                         
120.00 110516      C                   EVAL      KCCY = PFRCCY                                
121.00 160608      C     KGLC          SETGT     GLC001                                       
122.00 110516      C                   READP     GLC001                                       
123.00 110516      C                   IF        NOT %EOF(GLC001) AND GCCODE = PFRCCY         
124.00 110516      C                   EVAL      FR_IND = GCIND                               
125.00 110517      C                   SETON                                        91        
126.00 110516      C                   ENDIF                                                  
127.00 160613      C*                                                                         
128.00 160613      C*    validate to currency                                                 
129.00 160613      C*                                                                         
130.00 110516      C                   EVAL      KCCY = PTOCCY                                
131.00 160608      C     KGLC          SETGT     GLC001                                       
132.00 110516      C                   READP     GLC001                                       
133.00 110516      C                   IF        NOT %EOF(GLC001) AND GCCODE = PTOCCY         
134.00 110516      C                   EVAL      TO_IND = GCIND                               
135.00 110517      C                   SETON                                        92        
136.00 160613      C                   ENDIF                                                  
137.00 160613      C*                                                                         
138.00 160613      C*    validate group using cif                                             
139.00 160613      C*                                                                         
140.00 160729      C                   IF        PCIF<>''                                     
141.00 160613      C                   CALL      'GEXCIFGPCL'                                 
142.00 160613      C                   PARM                    PCIF                           
143.00 160613      C                   PARM                    PCHANNEL                       
144.00 160613      C                   PARM                    TGROUP            6            
145.00 160613      C                   PARM                    ERRIND            1            
146.00 160613      C                   IF        ERRIND = '0'                                 
147.00 160613      C                   EVAL      PGROUP=TGROUP                                
148.00 160613      C                   ELSEIF    ERRIND = '1'                                 
149.00 160809      C                   EVAL      PGROUP = '      '                            
150.00 160613      C                   ENDIF                                                  
151.00 160613      C                   EVAL      KGRP=PGROUP                                  
152.00 160614      C                                                                          
153.00 160729      C                   ELSE                                                   
154.00 160729      C                                                                          
155.00 160729      C                   EVAL      KGRP = PGROUP                                
156.00 160729      C     KRTGGRPLST    CHAIN     RTGGRPLST                                    
157.00 160729      C                   IF        NOT %FOUND(RTGGRPLST)                        
158.00 160809      C                   EVAL      PGROUP = '      '                            
159.00 160729      C                   ENDIF                                                  
160.00 160729      C                   EVAL      KGRP = PGROUP                                
161.00 160729      C                                                                          
162.00 160729      C                   ENDIF                                                  
163.00 160613      C*                                                                         
164.00 160613      C*    validate channel and set default                                     
165.00 160613      C*                                                                         
166.00 160729      C                   IF        PGROUP = ''                                  
167.00 160729      C                   EVAL      PCHANNEL='      '                            
168.00 160801      C                   EVAL      KCHN=PCHANNEL                                
169.00 160729      C                   ENDIF                                                  
170.00 160729      C                   IF        PGROUP = 'NET   '                            
171.00 160801      C                   EVAL      PCHANNEL='ECHAN '                            
172.00 160801      C                   EVAL      KCHN=PCHANNEL                                
173.00 160729      C                   ENDIF                                                  
174.00 160729      C                   IF        PGROUP = 'VIP   '                            
175.00 160801      C                   EVAL      PCHANNEL='ECHAN '                            
176.00 160801      C                   EVAL      KCHN=PCHANNEL                                
177.00 160801      C                   ENDIF                                                  
178.00 160729      C                   IF        PGROUP = 'CORP  '                            
179.00 160801      C                   EVAL      PCHANNEL='ECHAN '                            
180.00 160801      C                   EVAL      KCHN=PCHANNEL                                
181.00 160729      C                   ENDIF                                                  
182.00 160613      C*                                                                         
183.00 160613      C*currency is valid                                                        
184.00 160613      C*                                                                         
185.00 160613      C                   IF        *IN91 = *ON AND *IN92 = *ON                  
186.00 160613      C                                                                          
187.00 160906      C                   IF        PCHANNEL<>''                                 
188.00 160613      C                                                                          
189.00 160613      C                   IF        (PFRCCY = 344 AND PTOCCY <> 0) OR            
190.00 160613      C                             (PFRCCY <> 0 AND PTOCCY = 344)               
191.00 160613      C                   SETON                                        99        
192.00 160613      C                   ENDIF                                                  
193.00 160613      C                                                                          
194.00 160613      C                   IF        PEXCHGDT <> 0 OR PEXCHGTM <> 0               
195.00 160613      C                   EXSR      CHKDTTM                                      
196.00 160613      C                   ENDIF                                                  
197.00 160613       *get from ccy rate                                                        
198.00 160613      C                   MOVE      'FR'          CCY_IND                        
199.00 110517      C                   EXSR      GETRATE                                      
200.00 110517       *get to ccy rate                                                          
201.00 110517      C                   MOVE      'TO'          CCY_IND                        
202.00 110517      C                   EXSR      GETRATE                                      
203.00 110517      C                                                                          
204.00 160906       *get group rate                                                           
205.00 110517      C                   IF        PTOCCYRATE = 0                               
206.00 110518      C                   CLEAR                   PRATE                          
207.00 110518      C                   CLEAR                   PFRCCYRATE                     
208.00 110518      C                   CLEAR                   PFRDATE                        
209.00 110518      C                   CLEAR                   PFRTIME                        
210.00 110518      C                   CLEAR                   PTOCCYRATE                     
211.00 110518      C                   CLEAR                   PTODATE                        
212.00 110518      C                   CLEAR                   PTOTIME                        
213.00 110518      C                   SETON                                        42        
214.00 110517      C                   ELSE                                                   
215.00 110517      C                   EVAL      PRATE = PFRCCYRATE/PTOCCYRATE                
216.00 110517      C                   ENDIF                                                  
217.00 160809      C                                                                          
218.00 160906      C                   ELSE                                                   
219.00 160613      C                                                                          
220.00 160613      C                   CALL      'GDRTRATE'                                   
221.00 160613      C                   PARM                    PFRCCY                         
222.00 160613      C                   PARM                    PTOCCY                         
223.00 160613      C                   PARM                    PEXCHGTYP                      
224.00 160613      C                   PARM                    PEXCHGDT                       
225.00 160613      C                   PARM                    PEXCHGTM                       
226.00 160613      C                   PARM                    PRATE                          
227.00 160613      C                   PARM                    PFRCCYRATE                     
228.00 160613      C                   PARM                    PFRDATE                        
229.00 160613      C                   PARM                    PFRTIME                        
230.00 160613      C                   PARM                    PTOCCYRATE                     
231.00 160613      C                   PARM                    PTODATE                        
232.00 160613      C                   PARM                    PTOTIME                        
233.00 160613      C                   PARM                    PSTATUS                        
234.00 160613      C                                                                          
235.00 160906      C                   ENDIF                                                  
236.00 160926      C                                                                          
237.00 160926       *    Final check whether from-ccy and to-ccy are same ccy                 
238.00 160926      C                   IF        PFRCCY = PTOCCY                              
239.00 160926      C                   EVAL      PRATE = 1                                    
240.00 160926      C                   ENDIF                                                  
241.00 160926      C                                                                          
242.00 160613       *currency not found/channel group not valid                               
243.00 160613      C                   ELSE                                                   
244.00 160613      C                   SETON                                        41        
245.00 160613      C                   ENDIF                                                  
246.00 160613       *invalid type (c/t)                                                       
247.00 110517      C                   ELSE                                                   
248.00 110518      C                   SETON                                        41        
249.00 110516      C                   ENDIF                                                  
250.00 110516      C                                                                          
251.00 110517       *return status                                                            
252.00 110518      C                   IF        *IN41 = *OFF                                 
253.00 110517      C                   EVAL      PSTATUS = '0'                                
254.00 110517      C                   ELSE                                                   
255.00 110517      C                   EVAL      PSTATUS = '1'                                
256.00 110517      C                   ENDIF                                                  
257.00 110518      C                                                                          
258.00 110518      C                   IF        *IN41 = *OFF AND *IN42 = *ON                 
259.00 110518      C                   EVAL      PSTATUS = '2'                                
260.00 110518      C                   ENDIF                                                  
261.00 50614       *                                                                         
262.00 50614      C                   SETON                                            LR    
263.00 110210       **************************************************************************
264.00 110516       * CMPRATE   -  Compute the rate according to the Multiply/divide Indicator
265.00 110210       **************************************************************************
266.00 110516      C     CMPRATE       BEGSR                                                  
267.00 110516      C                                                                          
268.00 110518       *from currency                                                            
269.00 110518      C                   IF        CCY_IND = 'FR'                               
270.00 110518      C                   EVAL      MDIND = FR_IND                               
271.00 110517      C                   CALL      'DFJJTOYY'                                   
272.00 160729      C                   PARM                    LRTGBEFDT                      
273.00 160613      C                   PARM                    PFRDATE                        
274.00 160729      C                   EVAL      PFRTIME = LRTGBEFTM                          
275.00 160613       *to currency                                                              
276.00 160613      C                   ELSEIF    CCY_IND = 'TO'                               
277.00 160613      C                   EVAL      MDIND = TO_IND                               
278.00 160613      C                   CALL      'DFJJTOYY'                                   
279.00 160729      C                   PARM                    LRTGBEFDT                      
280.00 160613      C                   PARM                    PTODATE                        
281.00 160729      C                   EVAL      PTOTIME = LRTGBEFTM                          
282.00 160613      C                   ENDIF                                                  
283.00 110517      C                                                                          
284.00 110518       *using multiply computing                                                 
285.00 160613      C                   IF        MDIND = 'M'                                  
286.00 160613      C                   SELECT                                                 
287.00 160613      C                   WHEN      CCY_IND = 'FR'                               
288.00 160613      C                   EVAL      PFRCCYRATE = GBBKXR - FR_INNERRT             
289.00 160613      C                   WHEN      CCY_IND = 'TO'                               
290.00 160613      C                   EVAL      PTOCCYRATE = GBBKXR + TO_INNERRT             
291.00 160613      C                   ENDSL                                                  
292.00 160613       *using divide computing                                                   
293.00 160613      C                   ELSEIF    MDIND = 'D'                                  
294.00 160613      C                   SELECT                                                 
295.00 160613      C                   WHEN      CCY_IND = 'FR'                               
296.00 160613      C                   EVAL      PFRCCYRATE = GBBKXR + FR_INNERRT             
297.00 160613      C                   WHEN      CCY_IND = 'TO'                               
298.00 160613      C                   EVAL      PTOCCYRATE = GBBKXR - TO_INNERRT             
299.00 160613      C                   ENDSL                                                  
300.00 160613      C                   ENDIF                                                  
301.00 160613      C                                                                          
302.00 160613       *convert the rate when the ccy using divide computing                     
303.00 160613      C                   IF        MDIND = 'D'                                  
304.00 160613      C                   IF        CCY_IND = 'FR'                               
305.00 160613      C                   EVAL      PFRCCYRATE = 1/PFRCCYRATE                    
306.00 160613      C                   ELSEIF    CCY_IND = 'TO'                               
307.00 160613      C                   EVAL      PTOCCYRATE = 1/PTOCCYRATE                    
308.00 160613      C                   ENDIF                                                  
309.00 160613      C                   ENDIF                                                  
310.00 110516      C                                                                          
311.00 110516      C                   ENDSR                                                  
312.00 110516       **************************************************************************
313.00 110517       * GETRATE   -   Get rate procedure                                        
314.00 110516       **************************************************************************
315.00 110516      C     GETRATE       BEGSR                                                  
316.00 110516      C                                                                          
317.00 110517      C                   IF        CCY_IND = 'FR'                               
318.00 110517      C                   EVAL      KCCY = PFRCCY                                
319.00 110517      C                   ELSEIF    CCY_IND = 'TO'                               
320.00 110517      C                   EVAL      KCCY = PTOCCY                                
321.00 110517      C                   ENDIF                                                  
322.00 160613      C                                                                          
323.00 160809       * Get book rate from glc002 by time                                       
324.00 160613      C     KGLC          SETGT     GLC002                                       
325.00 160613      C                   READP     GLC002                                       
326.00 160613      C                   IF        GBCODE <> KCCY                               
327.00 160613      C                   SETON                                        41        
328.00 160613      C                   CLEAR                   PFRCCYRATE                     
329.00 160613      C                   CLEAR                   PFRDATE                        
330.00 160613      C                   CLEAR                   PFRTIME                        
331.00 160613      C                   ENDIF                                                  
332.00 160613      C                                                                          
333.00 160809       * Get group variant from rtgvarlog by time                                
334.00 160729      C     KRTGVARLOG    SETGT     RTGVARLOG                                    
335.00 160729      C                   READP     RTGVARLOG                                    
336.00 160809      C                   IF        LRTGBCODE <> KCCY                            
337.00 160613      C                   SETON                                        41        
338.00 160613      C                   CLEAR                   PFRCCYRATE                     
339.00 160613      C                   CLEAR                   PFRDATE                        
340.00 160613      C                   CLEAR                   PFRTIME                        
341.00 160608      C                   ENDIF                                                  
342.00 160809      C                                                                          
343.00 160926       * Check whether ccy is suspend in new channel                             
344.00 160926      C                   IF        LRTGBCODE = KCCY AND LRTGSTAT = '0'          
345.00 160926      C                   IF        CCY_IND = 'FR'                               
346.00 160926      C                   SETON                                        43        
347.00 160926      C                   ELSEIF    CCY_IND = 'TO'                               
348.00 160926      C                   SETON                                        44        
349.00 160926      C                   ENDIF                                                  
350.00 160926      C                   ENDIF                                                  
351.00 160926      C                                                                          
352.00 160809       * Rate calculation                                                        
353.00 110518      C                   IF        *IN41 = *OFF                                 
354.00 110518      C                   IF        *IN99 = *ON                                  
355.00 110517      C                   SELECT                                                 
356.00 160613      C                   WHEN      PEXCHGTYP = 'C'                              
357.00 160926      C                   IF        CCY_IND = 'FR'                               
358.00 160926      C                   IF        *IN43 = *OFF                                 
359.00 160926      C                   EVAL      FR_INNERRT = LRTGBFCBS                       
360.00 160926      C                   ELSE                                                   
361.00 160926      C                   EVAL      FR_INNERRT = GBFCBS                          
362.00 160926      C                   ENDIF                                                  
363.00 160613      C                   EXSR      CMPRATE                                      
364.00 160613      C                   ELSEIF    CCY_IND = 'TO'                               
365.00 160926      C                   IF        *IN44 = *OFF                                 
366.00 160926      C                   EVAL      TO_INNERRT = LRTGBFCSS                       
367.00 160926      C                   ELSE                                                   
368.00 160926      C                   EVAL      TO_INNERRT = GBFCSS                          
369.00 160926      C                   ENDIF                                                  
370.00 160926      C                   EXSR      CMPRATE                                      
371.00 160926      C                   ENDIF                                                  
372.00 160926      C                                                                          
373.00 160926      C                   WHEN      PEXCHGTYP = 'T'                              
374.00 160926      C                   IF        CCY_IND = 'FR'                               
375.00 160926      C                   IF        *IN43 = *OFF                                 
376.00 160926      C                   EVAL      FR_INNERRT = LRTGBFTBS                       
377.00 160926      C                   ELSE                                                   
378.00 160926      C                   EVAL      FR_INNERRT = GBFTBS                          
379.00 160926      C                   ENDIF                                                  
380.00 160926      C                   EXSR      CMPRATE                                      
381.00 160926      C                   ELSEIF    CCY_IND = 'TO'                               
382.00 160926      C                   IF        *IN44 = *OFF                                 
383.00 160926      C                   EVAL      TO_INNERRT = LRTGBFTSS                       
384.00 160926      C                   ELSE                                                   
385.00 160926      C                   EVAL      TO_INNERRT = GBFTSS                          
386.00 160926      C                   ENDIF                                                  
387.00 160926      C                   EXSR      CMPRATE                                      
388.00 160926      C                   ENDIF                                                  
389.00 110517      C                                                                          
390.00 110517      C                   ENDSL                                                  
391.00 110517      C                   ELSE                                                   
392.00 110517      C                   SELECT                                                 
393.00 160613      C                   WHEN      PEXCHGTYP = 'C'                              
394.00 160613      C                   IF        CCY_IND = 'FR'                               
395.00 160926      C                   IF        *IN43 = *OFF                                 
396.00 160926      C                   EVAL      FR_INNERRT = LRTGBTNBS                       
397.00 160926      C                   ELSE                                                   
398.00 160926      C                   EVAL      FR_INNERRT = GBTNBS                          
399.00 160926      C                   ENDIF                                                  
400.00 160926      C                   EXSR      CMPRATE                                      
401.00 160926      C                   ELSEIF    CCY_IND = 'TO'                               
402.00 160926      C                   IF        *IN44 = *OFF                                 
403.00 160926      C                   EVAL      TO_INNERRT = LRTGBTNSS                       
404.00 160926      C                   ELSE                                                   
405.00 160926      C                   EVAL      TO_INNERRT = GBTNSS                          
406.00 160926      C                   ENDIF                                                  
407.00 160926      C                   EXSR      CMPRATE                                      
408.00 160926      C                   ENDIF                                                  
409.00 160926      C                                                                          
410.00 160926      C                   WHEN      PEXCHGTYP = 'T'                              
411.00 160926      C                   IF        CCY_IND = 'FR'                               
412.00 160926      C                   IF        *IN43 = *OFF                                 
413.00 160729      C                   EVAL      FR_INNERRT = LRTGBATBS                       
414.00 160926      C                   ELSE                                                   
415.00 160926      C                   EVAL      FR_INNERRT = GBATBS                          
416.00 160926      C                   ENDIF                                                  
417.00 160926      C                   EXSR      CMPRATE                                      
418.00 160926      C                   ELSEIF    CCY_IND = 'TO'                               
419.00 160926      C                   IF        *IN44 = *OFF                                 
420.00 160926      C                   EVAL      TO_INNERRT = LRTGBATSS                       
421.00 160926      C                   ELSE                                                   
422.00 160926      C                   EVAL      TO_INNERRT = GBATSS                          
423.00 160926      C                   ENDIF                                                  
424.00 160926      C                   EXSR      CMPRATE                                      
425.00 160926      C                   ENDIF                                                  
426.00 160926      C                                                                          
427.00 110517      C                   ENDSL                                                  
428.00 110517      C                   ENDIF                                                  
429.00 110518      C                   ENDIF                                                  
430.00 110516      C                                                                          
431.00 110516      C                   ENDSR                                                  
432.00 110517       **************************************************************************
433.00 110517       * CHKDTTM   -  Check Date and Time                                        
434.00 110517       **************************************************************************
435.00 110517      C     CHKDTTM       BEGSR                                                  
436.00 110517      C                                                                          
437.00 110517       *Check Date                                                               
438.00 110517      C     *ISO          TEST(DE)                PEXCHGDT                       
439.00 110517      C                   IF        %ERROR                                       
440.00 110518      C                   SETON                                        41        
441.00 110517      C                   ENDIF                                                  
442.00 110517      C                                                                          
443.00 110517       *Check Time                                                               
444.00 110517      C     *HMS          TEST(TE)                PEXCHGTM                       
445.00 110517      C                   IF        %ERROR                                       
446.00 110518      C                   SETON                                        41        
447.00 110517      C                   ENDIF                                                  
448.00 110517      C                                                                          
449.00 110518      C                   IF        *IN41 = *OFF                                 
450.00 110517      C                   CALL      'DFYYTOJJ'                                   
451.00 110517      C                   PARM                    PEXCHGDT                       
452.00 110517      C                   PARM                    KJDATE                         
453.00 110517      C                   EVAL      KTIME = PEXCHGTM                             
454.00 110517      C                   ENDIF                                                  
455.00 110517      C                                                                          
456.00 110517      C                   ENDSR                                                  
