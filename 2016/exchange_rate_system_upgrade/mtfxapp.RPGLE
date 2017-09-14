1.00 20307      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 20319       **************************************************************************
3.00 160913       * REFERENCE NO. : CHG-0250-16 (D6250)                                     
4.00 160526       * PROGRAM ID.   : MTFXAPP                                                 
5.00 160526       * DESC          : Multi currency transaction application                  
6.00 160526       * AUTHOR        : Myles Ieong                                             
7.00 160526       * USER ID.      : BI77PGM                                                 
8.00 160525       * DATE WRITTEN  : 25 May 2016                                             
9.00 150727       **************************************************************************
10.00 160725      F**********************************************************                
11.00 160530      F*                  FILE SPECIFICATION                    *                
12.00 160530      F**********************************************************                
13.00 160526      FMTFXAPPD  CF   E             WORKSTN                                      
14.00 160530      F                                     SFILE(RMTFX001S:SRRN)                
15.00 160909      F                                     SFILE(RMFPS001S:SRRNMOV)             
16.00 160909      F                                     SFILE(RMFCY001S:SRRNCCY)             
17.00 160907      FMTFXTXPF  IF   E           K DISK                                         
18.00 160913      FMTFXMOVPF IF   E           K DISK                                         
19.00 160913      FMTFXCCYPF IF   E           K DISK                                         
20.00 20425      F                                                                          
21.00 160530      D**********************************************************                
22.00 160530      D*            Variables / constant defination             *                
23.00 160530      D**********************************************************                
24.00 160913       * Screen identity variables                                               
25.00 20305      D DSPGID         SDS                                                       
26.00 30113      D  WKDATE               191    198  0                                      
27.00 20425      D  WKSTN                244    253                                         
28.00 70118      D  WUSER                254    263                                         
29.00 150527      DWSDTAS           DS                                                       
30.00 150527      DCSRLOC                 370    371B 0                                      
31.00 160913       * Data structure for shortening numeric from 15 2 to 11 2                 
32.00 160621      D  ODD                    1      4  0                                      
33.00 160621      D  NEWNUM                 5     15  0                                      
34.00 160621      D  OLDNUM                 1     15  0                                      
35.00 160913       * Not authorized msg                                                      
36.00 160823      DTMSG             S             70    INZ('YOU ARE NOT AUTHORIZED TO PERFO-
37.00 160823      D                                     RM THIS FUNCTION')                   
38.00 160621      D*                                                                         
39.00 160530      C**********************************************************                
40.00 160530      C*                  Key List define                       *                
41.00 160530      C**********************************************************                
42.00 160530      C**********************************************************                
43.00 160530      C*                   MAIN PROGRAM                         *                
44.00 160530      C**********************************************************                
45.00 160623      C                   EXSR      PPRSCN                                       
46.00 160602      C                   EXSR      INZSR                                        
47.00 160602      C                   EXSR      WRTSFL                                       
48.00 160525      C                                                                          
49.00 160525      C                   DOW       *IN03 = *OFF                                 
50.00 160525      C                                                                          
51.00 160912      C                   EVAL      SMSG=''                                      
52.00 160526      C                   WRITE     RMTFX001WN                                   
53.00 160526      C                   EXFMT     RMTFX001                                     
54.00 160823       *    Present Summmary Sceen                                               
55.00 160621      C                   IF        *IN09 = *ON                                  
56.00 160823       **   Check authority at level 1                                           
57.00 160912      C                   CALL      'CHKAUT'                                     
58.00 160912      C                   PARM                    WUSER                          
59.00 160912      C                   PARM      'MTFXAP'      PMOPT             6            
60.00 160912      C                   PARM      '1'           PLEVEL            1            
61.00 160912      C                   PARM      '09'          TOPT              2            
62.00 160912      C                   PARM                    PBRN              3            
63.00 160912      C                   PARM                    PIBRN             3            
64.00 160912      C                   PARM                    PBNAME           30            
65.00 160912      C                   PARM                    PAUT              1            
66.00 160912      C                                                                          
67.00 160912      C                   IF        PAUT <> 'Y'                                  
68.00 160912      C                   EVAL      SMSG = TMSG                                  
69.00 160912      C                   ELSE                                                   
70.00 160912      C                   EXSR      PPRSCNCCY                                    
71.00 160621      C                   EXSR      INZSRCCY                                     
72.00 160621      C                   EXSR      WRTSFLCCY                                    
73.00 160913       *               ***a screen prompt loop***                                
74.00 160621      C                   DOW       *IN03 = *OFF                                 
75.00 160621      C                   WRITE     RMFCY001WN                                   
76.00 160621      C                   EXFMT     RMFCY001                                     
77.00 160823       **   Refresh in Summary Screen                                            
78.00 160623      C                   IF        *IN05 = *ON                                  
79.00 160623      C                   EXSR      PPRSCNCCY                                    
80.00 160623      C                   EXSR      INZSRCCY                                     
81.00 160623      C                   EXSR      WRTSFLCCY                                    
82.00 160623      C                   SETOFF                                       05        
83.00 160623      C                   ENDIF                                                  
84.00 160823       **   Reload sfl base on selection criteria                                
85.00 160725      C                   EXSR      INZSRCCY                                     
86.00 160725      C                   EXSR      WRTSFLCCY                                    
87.00 160623      C                                                                          
88.00 160621      C                   ENDDO                                                  
89.00 160913       *               ***/a screen prompt loop***                               
90.00 160621      C                   SETOFF                                       0309      
91.00 160912      C                   ENDIF                                                  
92.00 160624      C                   ENDIF                                                  
93.00 160823       *    Present Movement Sceen                                               
94.00 160823      C                   IF        *IN11 = *ON                                  
95.00 160823       **   Check authority at level 1                                           
96.00 160912      C                   CALL      'CHKAUT'                                     
97.00 160912      C                   PARM                    WUSER                          
98.00 160912      C                   PARM      'MTFXAP'      PMOPT             6            
99.00 160912      C                   PARM      '1'           PLEVEL            1            
100.00 160912      C                   PARM      '11'          TOPT              2            
101.00 160912      C                   PARM                    PBRN              3            
102.00 160912      C                   PARM                    PIBRN             3            
103.00 160912      C                   PARM                    PBNAME           30            
104.00 160912      C                   PARM                    PAUT              1            
105.00 160912      C                                                                          
106.00 160912      C                   IF        PAUT <> 'Y'                                  
107.00 160912      C                   EVAL      SMSG = TMSG                                  
108.00 160912      C                   ELSE                                                   
109.00 160912      C                   EXSR      PPRSCNMOV                                    
110.00 160621      C                   EXSR      INZSRMOV                                     
111.00 160621      C                   EXSR      WRTSFLMOV                                    
112.00 160913       *               ***a screen prompt loop***                                
113.00 160621      C                   DOW       *IN03 = *OFF                                 
114.00 160621      C                   WRITE     RMFPS001WN                                   
115.00 160621      C                   EXFMT     RMFPS001                                     
116.00 160823       **   Refresh in Movement Screen                                           
117.00 160623      C                   IF        *IN05 = *ON                                  
118.00 160623      C                   EXSR      PPRSCNMOV                                    
119.00 160623      C                   EXSR      INZSRMOV                                     
120.00 160623      C                   EXSR      WRTSFLMOV                                    
121.00 160623      C                   SETOFF                                       05        
122.00 160623      C                   ENDIF                                                  
123.00 160823       **   Reload sfl base on selection criteria                                
124.00 160725      C                   EXSR      INZSRMOV                                     
125.00 160725      C                   EXSR      WRTSFLMOV                                    
126.00 160623      C                                                                          
127.00 160621      C                   ENDDO                                                  
128.00 160913       *               ***/a screen prompt loop***                               
129.00 160621      C                   SETOFF                                       0311      
130.00 160912      C                   ENDIF                                                  
131.00 160621      C                   ENDIF                                                  
132.00 160913      C                                                                          
133.00 160913       *    Refresh the screen                                                   
134.00 160623      C                   IF        *IN05 = *ON                                  
135.00 160623      C                   EXSR      PPRSCN                                       
136.00 160623      C                   EXSR      INZSR                                        
137.00 160623      C                   EXSR      WRTSFL                                       
138.00 160623      C                   SETOFF                                       05        
139.00 160623      C                   ENDIF                                                  
140.00 160913      C                                                                          
141.00 160913       *    Reload sfl base on selection criteria                                
142.00 160624      C                   EXSR      INZSR                                        
143.00 160624      C                   EXSR      WRTSFL                                       
144.00 160621      C                                                                          
145.00 160525      C                   ENDDO                                                  
146.00 160525      C                                                                          
147.00 61106      C                   SETON                                        LR        
148.00 160623      C**********************************************************                
149.00 160623      C*           PPRSCN - Prepare Main Screen                 *                
150.00 160623      C**********************************************************                
151.00 160623      C     PPRSCN        BEGSR                                                  
152.00 160624      C                   CALL      'DICBSYMD'                                   
153.00 160623      C                   PARM                    VYMD              8 0          
154.00 160623      C                   CALL      'DFYYTODD'                                   
155.00 160623      C                   PARM                    VYMD              8 0          
156.00 160623      C                   PARM                    VSDMY             6 0          
157.00 160623      C                   PARM                    VLDMY             8 0          
158.00 160623      C                   EVAL      SDTE = VSDMY                                 
159.00 160727      C                   EVAL      SFCCY=''                                     
160.00 160727      C                   EVAL      STCCY=''                                     
161.00 160623      C                   ENDSR                                                  
162.00 160623      C**********************************************************                
163.00 160623      C*           PPRSCNSUM - Prepare Currency Scn             *                
164.00 160623      C**********************************************************                
165.00 160822      C     PPRSCNCCY     BEGSR                                                  
166.00 160912      C                   EVAL      SDTESUM = SDTE                               
167.00 160623      C                   ENDSR                                                  
168.00 160623      C**********************************************************                
169.00 160623      C*           PPRSCNMOV - Prepare Movement Scn             *                
170.00 160623      C**********************************************************                
171.00 160822      C     PPRSCNMOV     BEGSR                                                  
172.00 160912      C                   EVAL      SDTEMOV = SDTE                               
173.00 160623      C                   ENDSR                                                  
174.00 160530      C**********************************************************                
175.00 160530      C*           INZSR - SubFile initialization               *                
176.00 160530      C**********************************************************                
177.00 160525      C     INZSR         BEGSR                                                  
178.00 160530      C                   Z-ADD     0             SRRN                           
179.00 160530      C                   SETON                                        53        
180.00 160530      C                   SETOFF                                       51        
181.00 160526      C                   WRITE     RMTFX001                                     
182.00 160530      C                   SETOFF                                       53        
183.00 160530      C                   SETON                                        51        
184.00 150527      C                   ENDSR                                                  
185.00 160621      C**********************************************************                
186.00 160725      C*           INZSRMOVE - MOV SubFile initialization       *                
187.00 160621      C**********************************************************                
188.00 160621      C     INZSRMOV      BEGSR                                                  
189.00 160621      C                   Z-ADD     0             SRRNMOV                        
190.00 160621      C                   SETON                                        53        
191.00 160621      C                   SETOFF                                       51        
192.00 160621      C                   WRITE     RMFPS001                                     
193.00 160621      C                   SETOFF                                       53        
194.00 160621      C                   SETON                                        51        
195.00 160621      C                   ENDSR                                                  
196.00 160621      C**********************************************************                
197.00 160725      C*           INZSRCCY - CCY SubFile initialization        *                
198.00 160621      C**********************************************************                
199.00 160621      C     INZSRCCY      BEGSR                                                  
200.00 160621      C                   Z-ADD     0             SRRNCCY                        
201.00 160621      C                   SETON                                        53        
202.00 160621      C                   SETOFF                                       51        
203.00 160621      C                   WRITE     RMFCY001                                     
204.00 160621      C                   SETOFF                                       53        
205.00 160621      C                   SETON                                        51        
206.00 160621      C                   ENDSR                                                  
207.00 160530      C**********************************************************                
208.00 160531      C*           WRTSFL - Record Load and Update SF           *                
209.00 160530      C**********************************************************                
210.00 160621      C     WRTSFL        BEGSR                                                  
211.00 160913      C                                                                          
212.00 160913       *    Read master file record by time decending sequence                   
213.00 160913       *    And hide the ccy pair with same from ccy and to ccy                  
214.00 160907      C     *END          SETLL     MTFXTXPF                                     
215.00 160907      C                   READP     MTFXTXPF                               52    
216.00 160621      C                   DOW       (NOT *IN52) AND (SRRN <999)                  
217.00 160526      C                                                                          
218.00 160624      C                   Z-ADD     1             IWRT              1 0          
219.00 160913      C                                                                          
220.00 160913       **   write only ccy pair with diff from ccy & to ccy to sfl***            
221.00 160624      C                   IF        MFTXCUR = MFTXTCUR                           
222.00 160624      C                   Z-ADD     0             IWRT                           
223.00 160624      C                   ENDIF                                                  
224.00 160913      C                                                                          
225.00 160913       **   if from ccy selection criteria is on                                 
226.00 160624      C                   IF        SFCCY <>'' AND SFCCY <> MFTXPET              
227.00 160624      C                   Z-ADD     0             IWRT                           
228.00 160624      C                   ENDIF                                                  
229.00 160913      C                                                                          
230.00 160913       **   if to ccy selection criteria is on                                   
231.00 160624      C                   IF        STCCY <>'' AND STCCY <> MFTXTPET             
232.00 160624      C                   Z-ADD     0             IWRT                           
233.00 160624      C                   ENDIF                                                  
234.00 160913      C                                                                          
235.00 160913       **   Present with date selection                                          
236.00 160727      C                   CALL      'DFDDTOYY'                                   
237.00 160727      C                   PARM                    SDTE                           
238.00 160727      C                   PARM                    SDTEYMD           8 0          
239.00 160907      C                   IF        SDTEYMD <> MFTXDT                            
240.00 160727      C                   Z-ADD     0             IWRT                           
241.00 160727      C                   ENDIF                                                  
242.00 160913      C                                                                          
243.00 160913       **   Write to sub file with checking the write indicator                  
244.00 160624      C                   IF        IWRT = 1                                     
245.00 160624      C                                                                          
246.00 160621      C                   EVAL      SMFTXCHN = MFTXCHN                           
247.00 160912      C                   MOVE      MFTXTM        SMFTXTM                        
248.00 160912      C                   EVAL      SMFTXPET = MFTXPET                           
249.00 160912      C                   MOVEL     MFTXTC        OLDNUM                         
250.00 160912      C                   MOVEL     NEWNUM        SMFTXTC                        
251.00 160912      C                   EVAL      SMFTXTPET = MFTXTPET                         
252.00 160912      C                   MOVEL     MFTXTTC       OLDNUM                         
253.00 160912      C                   MOVEL     NEWNUM        SMFTXTTC                       
254.00 160912      C                   EVAL      SRATE= MFTXTC/MFTXTTC                        
255.00 160912      C                   EVAL      SRATER = MFTXTTC/MFTXTC                      
256.00 160913      C                   EVAL      SMFTXCIF = 'INTERNAL'                        
257.00 160913      C                   IF        MFTXCIF <> 'INTERNAL'                        
258.00 160919      C                   MOVE      MFTXCIF       SMFTXCIF                       
259.00 160913      C                   ELSEIF    MFTXTCIF <> 'INTERNAL'                       
260.00 160919      C                   MOVE      MFTXTCIF      SMFTXCIF                       
261.00 160913      C                   ENDIF                                                  
262.00 160530      C                   EVAL      SRRN = SRRN + 1                              
263.00 160526      C                   WRITE     RMTFX001S                                    
264.00 160624      C                                                                          
265.00 160621      C                   ENDIF                                                  
266.00 160526      C                                                                          
267.00 160907      C                   READP     MTFXTXPF                               52    
268.00 160526      C                   ENDDO                                                  
269.00 160530      C                                                                          
270.00 160530      C                   IF        SRRN > 0                                     
271.00 160621      C                   EVAL      SRRN=1                                       
272.00 160621      C                   SETON                                        50        
273.00 160621      C                   ELSE                                                   
274.00 160621      C                   SETOFF                                       50        
275.00 160526      C                   ENDIF                                                  
276.00 160530      C                                                                          
277.00 160526      C                   ENDSR                                                  
278.00 160621      C**********************************************************                
279.00 160725      C*           WRTSFLMOV - Record Load and Update SF        *                
280.00 160621      C**********************************************************                
281.00 160621      C     WRTSFLMOV     BEGSR                                                  
282.00 160913      C                                                                          
283.00 160913      C     *START        SETLL     MTFXMOVPF                                    
284.00 160913      C                   READ      MTFXMOVPF                              52    
285.00 160913      C                                                                          
286.00 160913       *    Iterate MTFXMOV file                                                 
287.00 160621      C                   DOW       (NOT *IN52) AND (SRRNMOV <999)               
288.00 160621      C                                                                          
289.00 160725      C                   Z-ADD     1             IWRT              1 0          
290.00 160913      C                                                                          
291.00 160913       **   Present with date selection                                          
292.00 160727      C                   CALL      'DFDDTOYY'                                   
293.00 160727      C                   PARM                    SDTEMOV                        
294.00 160727      C                   PARM                    SDTEYMD           8 0          
295.00 160727      C                   IF        SDTEYMD <> MFPSDTE                           
296.00 160727      C                   Z-ADD     0             IWRT                           
297.00 160727      C                   ENDIF                                                  
298.00 160913      C                                                                          
299.00 160913       **   Write to sub file with checking the write indicator                  
300.00 160727      C                   IF        IWRT = 1                                     
301.00 160621      C                   EVAL      SMFPSPET =  MFPSPET                          
302.00 160621      C                   EVAL      SMFPSAMT =  MFPSAMT                          
303.00 160621      C                   EVAL      SMFPSTAMT = MFPSTAMT                         
304.00 160621      C                   EVAL      SMOVEMENT = MFPSAMT - MFPSTAMT               
305.00 160621      C                   EVAL      SRRNMOV = SRRNMOV + 1                        
306.00 160621      C                   WRITE     RMFPS001S                                    
307.00 160727      C                   ENDIF                                                  
308.00 160621      C                                                                          
309.00 160913      C                   READ      MTFXMOVPF                              52    
310.00 160621      C                   ENDDO                                                  
311.00 160621      C                                                                          
312.00 160621      C                   IF        SRRNMOV > 0                                  
313.00 160621      C                   EVAL      SRRNMOV=1                                    
314.00 160621      C                   SETON                                        50        
315.00 160621      C                   ELSE                                                   
316.00 160621      C                   SETOFF                                       50        
317.00 160621      C                   ENDIF                                                  
318.00 160621      C                                                                          
319.00 160621      C                   ENDSR                                                  
320.00 160621      C**********************************************************                
321.00 160725      C*           WRTSFLCCY - Record Load and Update SF        *                
322.00 160621      C**********************************************************                
323.00 160621      C     WRTSFLCCY     BEGSR                                                  
324.00 160621      C                                                                          
325.00 160912      C     *START        SETLL     MTFXCCYPF                                    
326.00 160912      C                   READ      MTFXCCYPF                              52    
327.00 160913      C                                                                          
328.00 160913       *    Iterate MTFXCCY                                                      
329.00 160621      C                   DOW       (NOT *IN52) AND (SRRNCCY <999)               
330.00 160621      C                                                                          
331.00 160725      C                   Z-ADD     1             IWRT              1 0          
332.00 160913      C                                                                          
333.00 160913       **   Present with date selection                                          
334.00 160727      C                   CALL      'DFDDTOYY'                                   
335.00 160727      C                   PARM                    SDTESUM                        
336.00 160727      C                   PARM                    SDTEYMD           8 0          
337.00 160727      C                   IF        SDTEYMD <> MFCYDTE                           
338.00 160727      C                   Z-ADD     0             IWRT                           
339.00 160727      C                   ENDIF                                                  
340.00 160913      C                                                                          
341.00 160913       **   Write to sub file with checking the write indicator                  
342.00 160727      C                   IF        IWRT = 1                                     
343.00 160621      C                   EVAL      SMFCYPET = MFCYPET                           
344.00 160621      C                   EVAL      SMFCYTPET = MFCYTPET                         
345.00 160621      C                   EVAL      SMFCYAMT = MFCYAMT                           
346.00 160621      C                   EVAL      SMFCYTAMT = MFCYTAMT                         
347.00 160621      C                   EVAL      SMFCYFRT = MFCYFRT                           
348.00 160621      C                   EVAL      SREVRTE = 1/MFCYFRT                          
349.00 160621      C                   EVAL      SRRNCCY = SRRNCCY + 1                        
350.00 160621      C                   WRITE     RMFCY001S                                    
351.00 160727      C                   ENDIF                                                  
352.00 160621      C                                                                          
353.00 160912      C                   READ      MTFXCCYPF                              52    
354.00 160621      C                   ENDDO                                                  
355.00 160621      C                                                                          
356.00 160621      C                   IF        SRRNCCY > 0                                  
357.00 160621      C                   EVAL      SRRNCCY=1                                    
358.00 160621      C                   SETON                                        50        
359.00 160621      C                   ELSE                                                   
360.00 160621      C                   SETOFF                                       50        
361.00 160621      C                   ENDIF                                                  
362.00 160621      C                                                                          
363.00 160621      C                   ENDSR                                                  
364.00 160621      C*                                                                         
