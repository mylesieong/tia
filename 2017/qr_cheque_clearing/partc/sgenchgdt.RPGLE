1.00 140317      /*************************************************************/            
2.00 140410      /*   FILE      : SGENCHGDT                                   */            
3.00 140902      /*   REFERENCE : CHG-179-14                                  */            
4.00 140410      /*   USER      : BG58 Wine Chan                              */            
5.00 140410      /*   DATE      : 09 Apr 2014                                 */            
6.00 140410      /*   PURPOSE   : Get The Cheque Number And Account Number    */            
7.00 140317      /*                                                           */            
8.00 140317      /*************************************************************/            
9.00 170906      /*   REFERENCE : CHG-266-17 (D7266)                          */            
10.00 170804      /*   USER      : BI77 Myles Ieong                            */            
11.00 170804      /*   DATE      : 04 Aug 2017                                 */            
12.00 170804      /*   PURPOSE   : Add QR Code Cheque to Working File          */            
13.00 170804      /*                                                           */            
14.00 170804      /*************************************************************/            
15.00 140408      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
16.00 140408       **************************************************************************
17.00 140408       * File Specification                                                     *
18.00 140408       **************************************************************************
19.00 140902 D4179F*ULCHQDTA  IF   E           K DISK    USROPN                              
20.00 140902      FULCHQDTA  UF A E           K DISK    USROPN                               
21.00 170906 D7266FULCHQDTAQ UF A E           K DISK    USROPN                               
22.00 140417      FSCHQWRK   UF A E             DISK    USROPN                               
23.00 140422      FSCHQBKL1  IF   E           K DISK                                         
24.00 140415      FTAP002L5  IF   E           K DISK                                         
25.00 140724      FSCHQDSP   CF   E             WORKSTN                                      
26.00 140417       *Report Format                                                            
27.00 140417      FSGENBNORPTO    E             PRINTER OFLIND(*IN98)                        
28.00 140417      F                                     USROPN                               
29.00 140317       **************************************************************************
30.00 140423       * DEFINE VARIABLE                                                        *
31.00 140317       **************************************************************************
32.00 140414      D DSPGID         SDS                                                       
33.00 140414      D  WUSER                254    263                                         
34.00 140317       *                                                                         
35.00 140415      D BKNO            S              3S 0 INZ(1)                               
36.00 140317      D FRCHAR          S              1A                                        
37.00 140317      D MINUM           S              2S 0                                      
38.00 140317      D LANUM           S              2S 0                                      
39.00 140317      D FLAG            S              1A                                        
40.00 140605      D CHECK           S              2S 0                                      
41.00 140415      D CCYFLAG         S              1A                                        
42.00 140417      D TSRECCHQ        S              5S 0                                      
43.00 140422      D TSCHBATNO       S             10A                                        
44.00 140410      D TSCHACCNUM      S             10A                                        
45.00 140508      D TSCHCHQNUM      S              8A                                        
46.00 140508      D TCHQNUM         S              8A                                        
47.00 140508      D KSCHACCNUM      S             10S 0                                      
48.00 140508      D KSCHCHQNUM      S              7S 0                                      
49.00 140408       **************************************************************************
50.00 140415       * KEY DEFINE                                                             *
51.00 140408       **************************************************************************
52.00 140415       * Key of SCHQBKL1                                                         
53.00 140408      C     KEYCHQ        KLIST                                                  
54.00 140508      C                   KFLD                    KSCHACCNUM                     
55.00 140508      C                   KFLD                    KSCHCHQNUM                     
56.00 140408      C                                                                          
57.00 140415       * Key of TAP002L5                                                         
58.00 140415      C     KTAP002L5     KLIST                                                  
59.00 140415      C                   KFLD                    BKNO                           
60.00 140415      C                   KFLD                    SCHACCNUM                      
61.00 140415      C                                                                          
62.00 140317       **************************************************************************
63.00 140423       * MAIN ROUTINE                                                           *
64.00 140317       **************************************************************************
65.00 140317      C                                                                          
66.00 170824      C                   EXSR      REFRESH                                      
67.00 140415      C                   DOW       *IN03 = *OFF                                 
68.00 140415      C                   EXFMT     SMAINDSP                                     
69.00 140416      C                   SETOFF                                       41        
70.00 140417      C                   EVAL      DSPMSG = ' '                                 
71.00 140414      C                                                                          
72.00 140415      C                   IF        *IN12 = *ON                                  
73.00 140415      C                   EXSR      CLRDTA                                       
74.00 140415      C                   ENDIF                                                  
75.00 140415      C                                                                          
76.00 140417      C                   IF        *IN05 = *ON                                  
77.00 170906 D7266 *    Process income chq if file not empty, else process QR income chq     
78.00 170906 D7266C                   EXSR      HasDTA                                       
79.00 170906 D7266C                   IF        *IN71 = *OFF                                 
80.00 140417      C                   EXSR      REFRESH                                      
81.00 170906 D7266C                   ELSE                                                   
82.00 170906 D7266C                   EXSR      REFRESHQ                                     
83.00 170906 D7266C                   ENDIF                                                  
84.00 140417      C                   ENDIF                                                  
85.00 140417      C                                                                          
86.00 140415      C                   IF        *IN07 = *ON                                  
87.00 170906 D7266 *    Process income chq if file not empty, else process QR income chq     
88.00 170906 D7266C                   EXSR      HasDTA                                       
89.00 170906 D7266C                   IF        *IN71 = *OFF                                 
90.00 140422      C                   EXSR      REFRESH                                      
91.00 140423      C                   EXSR      IPTCCY                                       
92.00 140417      C                   EXSR      PECHK                                        
93.00 170906 D7266C                   ELSE                                                   
94.00 170906 D7266C                   EXSR      REFRESHQ                                     
95.00 170906 D7266C                   EXSR      IPTCCY                                       
96.00 170906 D7266C                   EXSR      PECHKQ                                       
97.00 170906 D7266C                   ENDIF                                                  
98.00 140415      C                   ENDIF                                                  
99.00 140415      C                                                                          
100.00 140415      C                   IF        *IN10 = *ON                                  
101.00 170906 D7266 *    Process income chq if file not empty, else process QR income chq     
102.00 170906 D7266C                   EXSR      HasDTA                                       
103.00 170906 D7266C                   IF        *IN71 = *OFF                                 
104.00 140423      C                   EXSR      REFRESH                                      
105.00 140423      C                   EXSR      IPTCCY                                       
106.00 140423      C                   IF        CCYFLAG = 'Y'                                
107.00 140423      C                   EVAL      SLYNMSG = 'Post This Cheque Info Data ?'     
108.00 140415      C                   EVAL      SYNLOG = 'N'                                 
109.00 140415      C                   EXFMT     SELECTYN                                     
110.00 140415      C                   IF        SYNLOG = 'Y'                                 
111.00 140417      C                   EXSR      PECHK                                        
112.00 140417      C                   EXSR      POSTDA                                       
113.00 140415      C                   ENDIF                                                  
114.00 140415      C                   ENDIF                                                  
115.00 170906 D7266C                   ELSE                                                   
116.00 170906 D7266C                   EXSR      REFRESHQ                                     
117.00 170906 D7266C                   EXSR      IPTCCY                                       
118.00 170906 D7266C                   IF        CCYFLAG = 'Y'                                
119.00 170906 D7266C                   EVAL      SLYNMSG = 'Post This QR Cheque Info Data ?'  
120.00 170906 D7266C                   EVAL      SYNLOG = 'N'                                 
121.00 170906 D7266C                   EXFMT     SELECTYN                                     
122.00 170906 D7266C                   IF        SYNLOG = 'Y'                                 
123.00 170906 D7266C                   EXSR      PECHKQ                                       
124.00 170906 D7266C                   EXSR      POSTDA                                       
125.00 170906 D7266C                   ENDIF                                                  
126.00 170906 D7266C                   ENDIF                                                  
127.00 170906 D7266C                   ENDIF                                                  
128.00 140415      C                   ENDIF                                                  
129.00 140415      C                                                                          
130.00 140417      C                   IF        *IN05 = *OFF And *IN07 = *OFF And            
131.00 140417      C                             *IN10 = *OFF And *IN12 = *OFF                
132.00 140423      C                   EXSR      IPTCCY                                       
133.00 140417      C                   ENDIF                                                  
134.00 140417      C                                                                          
135.00 140415      C                   ENDDO                                                  
136.00 140415      C                                                                          
137.00 140415      C                   SETON                                        LR        
138.00 140415      C                                                                          
139.00 140423       ************************************************************************* 
140.00 140423       * Subroutine IPTCCY - Check Input Current is it correct                 * 
141.00 140423       ************************************************************************* 
142.00 140423      C                                                                          
143.00 140423      C     IPTCCY        BEGSR                                                  
144.00 140423      C                                                                          
145.00 140423      C                                                                          
146.00 140423      C                   EVAL      CCYFLAG = 'Y'                                
147.00 140423      C                   CALL      'CCCYCHK'                                    
148.00 140423      C                   PARM                    SCCY                           
149.00 140423      C                   PARM                    OIPTCCY           3            
150.00 140423      C                   PARM                    ERRIND            1            
151.00 140423      C                   IF        ERRIND = '0'                                 
152.00 140423      C                   EVAL      CCYFLAG = 'Y'                                
153.00 140423      C                   ELSE                                                   
154.00 140423      C                   EVAL      CCYFLAG = 'N'                                
155.00 140423      C                   EVAL      DSPMSG = 'Invaid Input Current Code.'        
156.00 140423      C                   ENDIF                                                  
157.00 140423      C                                                                          
158.00 140423      C                   ENDSR                                                  
159.00 140423      C                                                                          
160.00 140415       ************************************************************************* 
161.00 140423       * Subroutine PECHK - Pe-Check the Account Status                        * 
162.00 140415       ************************************************************************* 
163.00 140415      C                                                                          
164.00 140417      C     PECHK         BEGSR                                                  
165.00 140422      C                                                                          
166.00 140423      C                   IF        CCYFLAG = 'Y'                                
167.00 140422      C                   CALL      'SCHQCLRPF'                                  
168.00 140416      C                   OPEN      SCHQWRK                                      
169.00 140415      C                   OPEN      ULCHQDTA                                     
170.00 140415      C                   READ      ULCHQDTA                                     
171.00 140415      C                   DOW       NOT %EOF(ULCHQDTA)                           
172.00 140318      C                   EVAL      FLAG = 'N'                                   
173.00 140318      C                   EVAL      FRCHAR = ' '                                 
174.00 140318      C                   EVAL      MINUM = 0                                    
175.00 140318      C                   EVAL      LANUM = 0                                    
176.00 140318      C                                                                          
177.00 140317      C                   IF        CLKEY = ' '                                  
178.00 140317      C                   EVAL      FLAG = 'S'                                   
179.00 140606      C                   ELSE                                                   
180.00 140606      C                   EVAL      FRCHAR = %SUBST(%TRIM(CLKEY):1:1)            
181.00 140410      C                   ENDIF                                                  
182.00 140606      C                                                                          
183.00 140606      C                   IF        FRCHAR = '<' And FLAG = 'N'                  
184.00 140606      C                   EVAL      MINUM = %SCAN('<:':CLKEY:1)                  
185.00 140606      C                   IF        MINUM <> 0                                   
186.00 140606      C                   EVAL      LANUM = %SCAN('<':CLKEY:MINUM+1)             
187.00 140606      C                   IF        LANUM <> 0                                   
188.00 140508      C                   EVAL      TCHQNUM = %SUBST(%TRIM(CLKEY):2:8)           
189.00 140425      C                   EVAL      FLAG = 'Y'                                   
190.00 140606      C                   ENDIF                                                  
191.00 140606      C                   ENDIF                                                  
192.00 140318      C                   ENDIF                                                  
193.00 140318      C                                                                          
194.00 140606      C                   EVAL      TSCHCHQNUM = ' '                             
195.00 140606      C                   EVAL      TSCHACCNUM = ' '                             
196.00 140425      C                   IF        FLAG = 'Y'                                   
197.00 140509      C                   IF        %CHECK('1234567890':%TRIM(TCHQNUM)) <> 0     
198.00 140508      C                   EVAL      TSCHCHQNUM = %SUBST(%TRIM(CLKEY):2:7)        
199.00 140508      C                   EVAL      TSCHACCNUM = %SUBST(%TRIM(CLKEY):11:10)      
200.00 140508      C                   ELSE                                                   
201.00 140508      C                   EVAL      TSCHCHQNUM = %SUBST(%TRIM(CLKEY):2:8)        
202.00 140508      C                   EVAL      TSCHACCNUM = %SUBST(%TRIM(CLKEY):12:10)      
203.00 140508      C                   ENDIF                                                  
204.00 140606      C                   ENDIF                                                  
205.00 140508      C                                                                          
206.00 140425      C                   IF        %CHECK('0123456789':%TRIM(TSCHACCNUM)) <> 0  
207.00 140425      C                             OR                                           
208.00 140425      C                             %CHECK('0123456789':%TRIM(TSCHCHQNUM)) <> 0  
209.00 140606      C                             OR FLAG = 'N'                                
210.00 140425      C                   EVAL      SCHACCNUM = 0                                
211.00 140425      C                   EVAL      SCHCHQNUM = 0                                
212.00 140425      C                   MOVE      *DATE         SCHDATE                        
213.00 140425      C                   TIME                    SCHTIME                        
214.00 140425      C                   EVAL      SCHSTATUS = 'N'                              
215.00 140606      C                   EVAL      SCHREASON = 'Invaid Number ' + %TRIM(CLKEY)  
216.00 140425      C                   WRITE     RSCHQWRK                                     
217.00 140425      C                   EVAL      FLAG = 'E'                                   
218.00 140425      C                   ENDIF                                                  
219.00 140425      C                                                                          
220.00 140425      C                   IF        FLAG = 'Y'                                   
221.00 140509      C                   EVAL      SCHACCNUM = %Dec(TSCHACCNUM:10:0)            
222.00 140509      C                   EVAL      SCHCHQNUM = %Dec(TSCHCHQNUM:8:0)             
223.00 140408      C                   MOVE      *DATE         SCHDATE                        
224.00 140408      C                   TIME                    SCHTIME                        
225.00 140509      C                   EVAL      KSCHACCNUM = SCHACCNUM                       
226.00 140509      C                   MOVE      SCHCHQNUM     KSCHCHQNUM                     
227.00 140408      C     KEYCHQ        CHAIN     SCHQBKL1                                     
228.00 140416      C                                                                          
229.00 140408      C                   IF        NOT %FOUND(SCHQBKL1)                         
230.00 140409      C                   EVAL      FLAG = 'T'                                   
231.00 140409      C                   ELSE                                                   
232.00 140409      C                   EVAL      FLAG = 'F'                                   
233.00 140409      C                   EVAL      SCHSTATUS = 'N'                              
234.00 140815 D4179C*                  EVAL      SCHREASON = 'Already Format'                 
235.00 140815 D4179C                   EVAL      SCHREASON = 'Duplicate Chq No.'              
236.00 140409      C                   ENDIF                                                  
237.00 140409      C                                                                          
238.00 140409      C                   IF        FLAG = 'T'                                   
239.00 140416      C                   CALL      'ACHECK1'                                    
240.00 140416      C                   PARM                    SCHACCNUM                      
241.00 140416      C                   PARM                    ACNIND            1            
242.00 140409      C                   SELECT                                                 
243.00 140409      C     ACNIND        WHENEQ    '0'                                          
244.00 140815 D4179C*    ACNIND        OREQ      '1'                                          
245.00 140806      C                   EVAL      SCHSTATUS = 'Y'                              
246.00 140806      C                   EVAL      SCHREASON = 'Success.'                       
247.00 140815 D4179C     ACNIND        WHENEQ    '1'                                          
248.00 140815 D4179C                   EVAL      SCHSTATUS = 'N'                              
249.00 140815 D4179C                   EVAL      SCHREASON = 'Blocked A/C.'                   
250.00 140409      C     ACNIND        WHENEQ    '2'                                          
251.00 140409      C                   EVAL      SCHSTATUS = 'N'                              
252.00 140815 D4179C*                  EVAL      SCHREASON = 'A/C Close'                      
253.00 140815 D4179C                   EVAL      SCHREASON = 'A/C Close.'                     
254.00 140409      C     ACNIND        WHENEQ    '3'                                          
255.00 140409      C                   EVAL      SCHSTATUS = 'N'                              
256.00 140815 D4179C*                  EVAL      SCHREASON = 'Invalid A/C'                    
257.00 140815 D4179C                   EVAL      SCHREASON = 'Invalid A/C No.'                
258.00 140409      C                   END                                                    
259.00 140408      C                   ENDIF                                                  
260.00 140423      C                                                                          
261.00 140423      C                   IF        FLAG = 'T'                                   
262.00 140423      C     KTAP002L5     CHAIN     TAP002L5                                     
263.00 140429      C                   IF        %FOUND(TAP002L5)                             
264.00 140423      C                   CALL      'CCCYCHK1'                                   
265.00 140423      C                   PARM                    DMCMCN                         
266.00 140423      C                   PARM                    OCHKCCY           3            
267.00 140423      C                   PARM                    ERRIND            1            
268.00 140423      C                   IF        OCHKCCY <> SCCY                              
269.00 140423      C                   EVAL      SCHSTATUS = 'N'                              
270.00 140815 D4179C*                  EVAL      SCHREASON = 'Invaid Current Code'            
271.00 140815 D4179C                   EVAL      SCHREASON = 'Ccy Code Not Match.'            
272.00 140423      C                   ENDIF                                                  
273.00 140423      C                   ENDIF                                                  
274.00 140429      C                   ENDIF                                                  
275.00 140425      C                                                                          
276.00 140410      C                   WRITE     RSCHQWRK                                     
277.00 140409      C                   ENDIF                                                  
278.00 140902      C                                                                          
279.00 140902 D4179C                   IF        *IN10 = *ON                                  
280.00 140902 D4179C                   DELETE    RULCHQDTA                                    
281.00 140902 D4179C                   ENDIF                                                  
282.00 140425      C                                                                          
283.00 140408      C                   READ      ULCHQDTA                                     
284.00 140317      C                   ENDDO                                                  
285.00 140415      C                   CLOSE     ULCHQDTA                                     
286.00 140416      C                   CLOSE     SCHQWRK                                      
287.00 140317      C                                                                          
288.00 140425      C                   IF        *IN07 = *ON                                  
289.00 140422      C                   EXSR      PRTGENRPT                                    
290.00 140422      C                   EVAL      DSPMSG = 'Report already print out.'         
291.00 140425      C                   ENDIF                                                  
292.00 140425      C                                                                          
293.00 140423      C                   ENDIF                                                  
294.00 140422      C                                                                          
295.00 140415      C                   ENDSR                                                  
296.00 140415      C                                                                          
297.00 170906 D7266 ************************************************************************* 
298.00 170906 D7266 * Subroutine HasDTA  - Check wether ULCHQDTA has data (*ON = No Data)   * 
299.00 170906 D7266 ************************************************************************* 
300.00 170906 D7266C     HasDTA        BEGSR                                                  
301.00 170906 D7266C                                                                          
302.00 170906 D7266C                   SETOFF                                       71        
303.00 170906 D7266C                   OPEN      ULCHQDTA                                     
304.00 170906 D7266C                   READ      ULCHQDTA                                     
305.00 170906 D7266C                   IF        %EOF(ULCHQDTA)                               
306.00 170906 D7266C                   SETON                                        71        
307.00 170906 D7266C                   ENDIF                                                  
308.00 170906 D7266C                   CLOSE     ULCHQDTA                                     
309.00 170906 D7266C                                                                          
310.00 170906 D7266C                   ENDSR                                                  
311.00 170906 D7266 ************************************************************************* 
312.00 170906 D7266 * Subroutine PECHKQ - Pe-Check the incoming QR Code cheque              * 
313.00 170906 D7266 ************************************************************************* 
314.00 170906 D7266C     PECHKQ        BEGSR                                                  
315.00 170906 D7266C                                                                          
316.00 170906 D7266C                   IF        CCYFLAG = 'Y'                                
317.00 170906 D7266C                                                                          
318.00 170906 D7266 *    Search entry by ccy from ULCHQDTAQT, insert into ULCHQDTAQ           
319.00 170906 D7266C                   CALL      'ULQRCFMT'                                   
320.00 170906 D7266C                   PARM                    SCCY                           
321.00 170906 D7266C                                                                          
322.00 170906 D7266C                   CALL      'SCHQCLRPF'                                  
323.00 170906 D7266C                   OPEN      SCHQWRK                                      
324.00 170906 D7266C                   OPEN      ULCHQDTAQ                                    
325.00 170906 D7266C                   READ      ULCHQDTAQ                                    
326.00 170906 D7266C                   DOW       NOT %EOF(ULCHQDTAQ)                          
327.00 170906 D7266C                                                                          
328.00 170906 D7266 *    Process only selected ccy                                            
329.00 170906 D7266C                   IF        SCCY = CLQCPET                               
330.00 170906 D7266C                                                                          
331.00 170906 D7266 **   Write A/C number, Chq Number, Datetime                               
332.00 170906 D7266C                   MOVE      CLQOACT       SCHACCNUM                      
333.00 170906 D7266C                   MOVE      CLQCHQ        SCHCHQNUM                      
334.00 170906 D7266C                   MOVE      CLQAMT        SCHAMT                         
335.00 170906 D7266C                   MOVE      *DATE         SCHDATE                        
336.00 170906 D7266C                   TIME                    SCHTIME                        
337.00 170906 D7266C                   EVAL      SCHBATNO = ''                                
338.00 170906 D7266C                                                                          
339.00 170906 D7266 *    Check A/C Status and write to Status, Reason                         
340.00 170906 D7266C                   CALL      'ACHECK1'                                    
341.00 170906 D7266C                   PARM                    SCHACCNUM                      
342.00 170906 D7266C                   PARM                    ACNIND            1            
343.00 170906 D7266C                   SELECT                                                 
344.00 170906 D7266C     ACNIND        WHENEQ    '0'                                          
345.00 170906 D7266C                   EVAL      SCHSTATUS = 'Y'                              
346.00 170906 D7266C                   EVAL      SCHREASON = 'Success.'                       
347.00 170906 D7266C     ACNIND        WHENEQ    '1'                                          
348.00 170906 D7266C                   EVAL      SCHSTATUS = 'N'                              
349.00 170906 D7266C                   EVAL      SCHREASON = 'Blocked A/C.'                   
350.00 170906 D7266C     ACNIND        WHENEQ    '2'                                          
351.00 170906 D7266C                   EVAL      SCHSTATUS = 'N'                              
352.00 170906 D7266C                   EVAL      SCHREASON = 'A/C Close.'                     
353.00 170906 D7266C     ACNIND        WHENEQ    '3'                                          
354.00 170906 D7266C                   EVAL      SCHSTATUS = 'N'                              
355.00 170906 D7266C                   EVAL      SCHREASON = 'Invalid A/C No.'                
356.00 170906 D7266C                   END                                                    
357.00 170906 D7266C                                                                          
358.00 170906 D7266 *    Check Ccy match and write to Status, Reason                          
359.00 170906 D7266C     KTAP002L5     CHAIN     TAP002L5                                     
360.00 170906 D7266C                   IF        %FOUND(TAP002L5)                             
361.00 170906 D7266C                   CALL      'CCCYCHK1'                                   
362.00 170906 D7266C                   PARM                    DMCMCN                         
363.00 170906 D7266C                   PARM                    OCHKCCY           3            
364.00 170906 D7266C                   PARM                    ERRIND            1            
365.00 170906 D7266C                   IF        OCHKCCY <> CLQCPET                           
366.00 170906 D7266C                   EVAL      SCHSTATUS = 'N'                              
367.00 170906 D7266C                   EVAL      SCHREASON = 'Ccy Code Not Match.'            
368.00 170906 D7266C                   ENDIF                                                  
369.00 170906 D7266C                   ENDIF                                                  
370.00 170906 D7266C                                                                          
371.00 170906 D7266 *    Consolidate to PF SCHQWRK                                            
372.00 170906 D7266C                   WRITE     RSCHQWRK                                     
373.00 170906 D7266C                                                                          
374.00 170906 D7266 *    If in process mode, delete record in upload file                     
375.00 170906 D7266C                   IF        *IN10 = *ON                                  
376.00 170906 D7266C                   DELETE    RULCHQQ                                      
377.00 170906 D7266C                   ENDIF                                                  
378.00 170906 D7266C                                                                          
379.00 170906 D7266C                   ENDIF                                                  
380.00 170906 D7266C                                                                          
381.00 170906 D7266C                   READ      ULCHQDTAQ                                    
382.00 170906 D7266C                   ENDDO                                                  
383.00 170906 D7266C                   CLOSE     ULCHQDTAQ                                    
384.00 170906 D7266C                   CLOSE     SCHQWRK                                      
385.00 170906 D7266C                                                                          
386.00 170906 D7266C                   IF        *IN07 = *ON                                  
387.00 170906 D7266C                   EXSR      PRTGENRPT                                    
388.00 170906 D7266C                   EVAL      DSPMSG = 'Report already print out.'         
389.00 170906 D7266C                   ENDIF                                                  
390.00 170906 D7266C                                                                          
391.00 170906 D7266C                   ENDIF                                                  
392.00 170906 D7266C                                                                          
393.00 170906 D7266C                   ENDSR                                                  
394.00 170906 D7266C                                                                          
395.00 170906       ************************************************************************* 
396.00 170906       * Subroutine POSTDA - Post Data And Get the Batch Number                * 
397.00 140417       ************************************************************************* 
398.00 140417      C                                                                          
399.00 140417      C     POSTDA        BEGSR                                                  
400.00 140417      C                                                                          
401.00 140422      C                   OPEN      SCHQWRK                                      
402.00 140422      C                   READ      SCHQWRK                                      
403.00 140422      C                   EVAL      FLAG = 'N'                                   
404.00 140422      C                   DOW       NOT %EOF(SCHQWRK)                            
405.00 140422      C                   IF        SCHSTATUS = 'Y'                              
406.00 140422      C                   EVAL      FLAG = 'Y'                                   
407.00 140422      C                   ENDIF                                                  
408.00 140422      C                   READ      SCHQWRK                                      
409.00 140422      C                   ENDDO                                                  
410.00 140422      C                   CLOSE     SCHQWRK                                      
411.00 140417      C                                                                          
412.00 140422      C                   CALL      'SGENBTH'                                    
413.00 140422      C                   PARM                    SBATID                         
414.00 140422      C                   IF        FLAG = 'Y'                                   
415.00 140724      C                   CALL      'SCBATALL'                                   
416.00 140509      C                   PARM                    SBATID                         
417.00 140509      C                   PARM                    SCCY                           
418.00 140509      C                   PARM                    FLAG                           
419.00 140422      C                   SETON                                        41        
420.00 140425      C                   EXSR      PRTGENRPT                                    
421.00 140422      C                   EVAL      DSPMSG = 'Post Cheque Data Success.'         
422.00 140422      C                   ELSE                                                   
423.00 140422      C                   EVAL      DSPMSG = 'Post Cheque Data Failure.'         
424.00 140422      C                   ENDIF                                                  
425.00 140417      C                                                                          
426.00 140417      C                   ENDSR                                                  
427.00 140417      C                                                                          
428.00 170816       **************************************************************************
429.00 170816       * Subroutine REFRESH - Refresh to count records in Cheque Scanning File  *
430.00 140417       **************************************************************************
431.00 140417      C     REFRESH       BEGSR                                                  
432.00 140417      C                                                                          
433.00 140417      C                   EVAL      TSRECCHQ = 0                                 
434.00 140417      C                   OPEN      ULCHQDTA                                     
435.00 140417      C                   READ      ULCHQDTA                                     
436.00 140417      C                   DOW       NOT %EOF(ULCHQDTA)                           
437.00 140609      C                   IF        CLKEY <> ' '                                 
438.00 140425      C                   EVAL      TSRECCHQ = TSRECCHQ + 1                      
439.00 140609      C                   ENDIF                                                  
440.00 140417      C                   READ      ULCHQDTA                                     
441.00 140417      C                   ENDDO                                                  
442.00 140417      C                   CLOSE     ULCHQDTA                                     
443.00 140417      C                                                                          
444.00 140609      C                   EVAL      SRECCHQ = TSRECCHQ                           
445.00 140417      C                                                                          
446.00 140417      C                   ENDSR                                                  
447.00 140417      C                                                                          
448.00 170906 D7266 **************************************************************************
449.00 170906 D7266 * Subroutine REFRESHQ- Refresh to count records in ULCHQDTAQ             *
450.00 170906 D7266 **************************************************************************
451.00 170906 D7266C     REFRESHQ      BEGSR                                                  
452.00 170906 D7266C                                                                          
453.00 170906 D7266C                   EVAL      TSRECCHQ = 0                                 
454.00 170906 D7266C                                                                          
455.00 170906 D7266C                   OPEN      ULCHQDTAQ                                    
456.00 170906 D7266C                   READ      ULCHQDTAQ                                    
457.00 170906 D7266C                                                                          
458.00 170906 D7266C                   DOW       NOT %EOF(ULCHQDTAQ)                          
459.00 170906 D7266C                   EVAL      TSRECCHQ = TSRECCHQ + 1                      
460.00 170906 D7266C                   READ      ULCHQDTAQ                                    
461.00 170906 D7266C                   ENDDO                                                  
462.00 170906 D7266C                                                                          
463.00 170906 D7266C                   CLOSE     ULCHQDTAQ                                    
464.00 170906 D7266C                                                                          
465.00 170906 D7266C                   EVAL      SRECCHQ = TSRECCHQ                           
466.00 170906 D7266C                                                                          
467.00 170906 D7266C                   ENDSR                                                  
468.00 170906 D7266C                                                                          
469.00 170906       **************************************************************************
470.00 140415       * Subroutine CLRDATA - Clear Main screen input value                     *
471.00 140415       **************************************************************************
472.00 140415      C     CLRDTA        BEGSR                                                  
473.00 140415      C                                                                          
474.00 140415      C                   CLEAR                   SRECCHQ                        
475.00 140415      C                   CLEAR                   SCCY                           
476.00 140415      C                   CLEAR                   SBATID                         
477.00 140415      C                   CLEAR                   DSPMSG                         
478.00 140416      C                   SETOFF                                       41        
479.00 140425      C                   EXSR      REFRESH                                      
480.00 140415      C                                                                          
481.00 140415      C                   ENDSR                                                  
482.00 140415      C                                                                          
483.00 140417       ************************************************************************  
484.00 140417       * Subroutine PRTGENRPT - Print Gensaction Log                          *  
485.00 140417       ************************************************************************  
486.00 140417      C     PRTGENRPT     BEGSR                                                  
487.00 140417      C                                                                          
488.00 140827 D4179C                   EVAL      OUT009 = 0                                   
489.00 140827 D4179C                   EVAL      OUT010 = 0                                   
490.00 140417      C                   OPEN      SGENBNORPT                                   
491.00 140417      C                   WRITE     EXHDG1                                       
492.00 140417      C                   WRITE     EXHDG2                                       
493.00 140417      C                   OPEN      SCHQWRK                                      
494.00 140417      C                   READ      SCHQWRK                                      
495.00 140417      C                   DOW       NOT %EOF(SCHQWRK)                            
496.00 140417      C                   EVAL      OUT001 = SCHACCNUM                           
497.00 140509      C                   MOVE      SCHCHQNUM     OUT002                         
498.00 140417      C                   EVAL      OUT005 = SCHDATE                             
499.00 140417      C                   EVAL      OUT008 = SCHTIME                             
500.00 140417      C                   EVAL      OUT003 = SCHSTATUS                           
501.00 140417      C                   EVAL      OUT004 = SCHREASON                           
502.00 140417      C                   IF        *IN10 = *ON                                  
503.00 140417      C                   EVAL      OUT006 = SCHBATNO                            
504.00 140417      C                   ENDIF                                                  
505.00 140417      C                   WRITE     EXDLT1                                       
506.00 140424      C                                                                          
507.00 140424      C                   IF        *IN98 = *ON                                  
508.00 140424      C                   SETOFF                                       98        
509.00 140424      C                   WRITE     EXHDG1                                       
510.00 140424      C                   WRITE     EXHDG2                                       
511.00 140424      C                   ENDIF                                                  
512.00 140704      C                                                                          
513.00 140704      C                   IF        SCHSTATUS = 'Y'                              
514.00 140704      C                   EVAL      OUT009 = OUT009 + 1                          
515.00 140704      C                   ELSE                                                   
516.00 140704      C                   EVAL      OUT010 = OUT010 + 1                          
517.00 140704      C                   ENDIF                                                  
518.00 140424      C                                                                          
519.00 140417      C                   READ      SCHQWRK                                      
520.00 140417      C                   ENDDO                                                  
521.00 140417      C                   CLOSE     SCHQWRK                                      
522.00 140417      C                   WRITE     ENDRPT                                       
523.00 140417      C                   CLOSE     SGENBNORPT                                   
524.00 140417      C                                                                          
525.00 140417      C                   ENDSR                                                  
526.00 140417      C                                                                          
