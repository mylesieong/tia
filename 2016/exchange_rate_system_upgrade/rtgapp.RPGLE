1.00 20307      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 20319       **************************************************************************
3.00 160729       * REFERENCE NO. : CHG-0250-16 (D6250)                                     
4.00 160525       * PROGRAM ID.   : RTGAPP                                                  
5.00 160525       * DESC          : Exchange Rate for Customer Group Application            
6.00 150727       * AUTHOR        : Albert Au                                               
7.00 160525       * USER ID.      : BG09PGM                                                 
8.00 160830       * DATE WRITTEN  : 25 May 2016                                             
9.00 160830       * FUNCTIONS     : Opt 1- Enquiry                                          
10.00 160830       *                 Opt 2- Modify                                           
11.00 160830       *                 Opt 3- Suspend                                          
12.00 160830       *                 Opt 4- Reactivate                                       
13.00 160830       *                 Opt 5- Susp ccy chns                                    
14.00 160831       *                 Opt 6- React ccy chns                                   
15.00 150727       **************************************************************************
16.00 160608      F*********************************************************************     
17.00 160608      F*                        File Specification                         *     
18.00 160608      F*********************************************************************     
19.00 160608       *ICBS System files                                                        
20.00 160608      FGLC002    IF   E           K DISK                                         
21.00 160608       *Custom Application File                                                  
22.00 160525      FRTGAPPD   CF   E             WORKSTN                                      
23.00 160624      F                                     SFILE(ST001S:SRRN)                   
24.00 150527      F                                     INFDS(WSDTAS)                        
25.00 160831      FRTGVARPF  UF A E           K DISK                                         
26.00 160727      FRTGGRPLST IF   E           K DISK                                         
27.00 160831      FRTGVARLOG UF A E           K DISK                                         
28.00 20425      F                                                                          
29.00 160608      D*********************************************************************     
30.00 160608      D*                 Variables / constant defination                   *     
31.00 160608      D*********************************************************************     
32.00 20305      D DSPGID         SDS                                                       
33.00 30113      D  WKDATE               191    198  0                                      
34.00 20425      D  WKSTN                244    253                                         
35.00 70118      D  WUSER                254    263                                         
36.00 150527      DWSDTAS           DS                                                       
37.00 150527      DCSRLOC                 370    371B 0                                      
38.00 160525       *Tmp. Var.                                                                
39.00 160525      DTPOSITION        S              3S 0 INZ(0)                               
40.00 160525      DTCNY             S              3S 0 INZ(156)                             
41.00 160608      DTMSG             S             70    INZ('YOU ARE NOT AUTHORIZED TO PERFO-
42.00 160531      D                                     RM THIS FUNCTION')                   
43.00 160608      DTMSG2            S             70    INZ('INVALID OPTION')                
44.00 160920 D6250DTMSG3            S             70    INZ('GROUP NOT FOUND')               
45.00 160601      D                                                                          
46.00 160531       *                                                                         
47.00 160608      C*********************************************************************     
48.00 160608      C*                         Key List define                           *     
49.00 160608      C*********************************************************************     
50.00 160831       *    GLC001 GLC002 KEY LIST                                               
51.00 160608      C     KGLC          KLIST                                                  
52.00 160608      C                   KFLD                    KGBBANK           3 0          
53.00 160608      C                   KFLD                    KGBCODE           3 0          
54.00 160608      C                   KFLD                    KGBEFDT           7 0          
55.00 160608      C                   KFLD                    KGBEFTM           6 0          
56.00 160831      C                                                                          
57.00 160831       *    RTGVARPF KEY LIST                                                    
58.00 160831      C     KRTGVARPF     KLIST                                                  
59.00 160831      C                   KFLD                    KRTGBANK          3 0          
60.00 160831      C                   KFLD                    KRTGBCODE         3 0          
61.00 160831      C                   KFLD                    KRTGROUP          6            
62.00 160831      C                   KFLD                    KRTGCHN           6            
63.00 160608      C*                                                                         
64.00 160608      C*********************************************************************     
65.00 160608      C*                          MAIN PROGRAM                             *     
66.00 160608      C*********************************************************************     
67.00 160624      C                                                                          
68.00 160727      C                   EXSR      INZSR                                        
69.00 160727      C                   EXSR      RECLOAD                                      
70.00 160525      C                                                                          
71.00 160525      C                   DOW       *IN03 = *OFF                                 
72.00 160525      C                                                                          
73.00 160525      C                   WRITE     ST001WN                                      
74.00 160525      C                   EXFMT     ST001                                        
75.00 160920 D6250C                   EVAL      SMSG=''                                      
76.00 160831      C                                                                          
77.00 160831       *    Catch F6 Action                                                      
78.00 160601      C                   IF        *IN06 = *ON                                  
79.00 160920      C                   EVAL      DOPT = 'C'                                   
80.00 160601      C                   EXSR      OPTPGM                                       
81.00 160601      C                   ENDIF                                                  
82.00 160601      C                                                                          
83.00 160831       *    Catch Option Input Action                                            
84.00 160525      C                   IF        *IN50 = *ON                                  
85.00 160525      C                   READC     ST001S                                 88    
86.00 160525      C                   DOW       *IN88 = *OFF                                 
87.00 160831      C                                                                          
88.00 160831       **   Call Program for Mod/Enq/Sus/Ract                                    
89.00 160525      C                   EXSR      OPTPGM                                       
90.00 160525      C                   READC     ST001S                                 88    
91.00 160831      C                                                                          
92.00 160525      C                   ENDDO                                                  
93.00 160525      C                   ENDIF                                                  
94.00 160624      C                                                                          
95.00 160624      C                   EXSR      INZSR                                        
96.00 160624      C                   EXSR      RECLOAD                                      
97.00 160525      C                                                                          
98.00 160525      C                   ENDDO                                                  
99.00 160525      C                                                                          
100.00 61106      C                   SETON                                        LR        
101.00 160608      C*********************************************************************     
102.00 160608      C*                 INZSR - SubFile initialization                    *     
103.00 160608      C*********************************************************************     
104.00 160525      C     INZSR         BEGSR                                                  
105.00 160624      C                   Z-ADD     0             SRRN                           
106.00 160624      C                   SETON                                        53        
107.00 160624      C                   SETOFF                                       51        
108.00 150527      C                   WRITE     ST001                                        
109.00 160624      C                   SETOFF                                       53        
110.00 160624      C                   SETON                                        51        
111.00 160608      C                   ENDSR                                                  
112.00 160608      C*********************************************************************     
113.00 160608      C*               RECLOAD - Record Load and Update SF                 *     
114.00 160608      C*********************************************************************     
115.00 160608      C     RECLOAD       BEGSR                                                  
116.00 160831      C                                                                          
117.00 160920 D6250C*                  EVAL      SMSG=''                                      
118.00 160728      C                   EVAL      DCHANNEL='ECHAN'                             
119.00 160831      C                                                                          
120.00 160831       *    Check/ initiate the Group value                                      
121.00 160728      C                   IF        DGROUP<>''                                   
122.00 160627      C     DGROUP        CHAIN     RTGGRPLST                                    
123.00 160627      C                   IF        NOT %FOUND(RTGGRPLST)                        
124.00 160920 D6250C*                  EVAL      SMSG='Group not valid.'                      
125.00 160920 D6250C                   EVAL      SMSG=TMSG3                                   
126.00 160627      C                   ENDIF                                                  
127.00 160728      C                   ENDIF                                                  
128.00 160831      C                                                                          
129.00 160831       *    Iterate master file and show value                                   
130.00 160608      C     *START        SETLL     RTGVARPF                                     
131.00 160728      C                   READ      RTGVARPF                               52    
132.00 160728      C                   DOW       (NOT *IN52) AND (SRRN <999)                  
133.00 160624      C                                                                          
134.00 160608      C                   IF        DPOSITION = *BLANK                           
135.00 160608      C                   EVAL      DPOSITION = '000'                            
136.00 160608      C                   ENDIF                                                  
137.00 160624      C                                                                          
138.00 160525      C                   EVAL      TPOSITION = %INT(DPOSITION)                  
139.00 160624      C                   MOVE      TPOSITION     DPOSITION                      
140.00 160624      C                                                                          
141.00 160525      C                   IF        RTGROUP   = DGROUP   AND                     
142.00 160525      C                             RTGCHN    = DCHANNEL AND                     
143.00 160920      C                             RTGBCODE >= TPOSITION AND                    
144.00 160921 D6250C*                            RTGBCODE <> 0 AND                            
145.00 160921 D6250C*                            RTGBCODE <> 344                              
146.00 160921 D6250C                             RTGBCODE <> 0                                
147.00 160525      C                   SELECT                                                 
148.00 160525      C                   WHEN      RTGSTAT = '0'                                
149.00 160601      C                   EVAL      DSTATUS = 'SUS'                              
150.00 160525      C                   WHEN      RTGSTAT = '1'                                
151.00 160525      C                   EVAL      DSTATUS = 'ACT'                              
152.00 160525      C                   ENDSL                                                  
153.00 160525      C                                                                          
154.00 160525      C                   CALL      'CCCYCHK1'                                   
155.00 160525      C                   PARM                    RTGBCODE                       
156.00 160525      C                   PARM                    OUTCCY            3            
157.00 160525      C                   PARM                    ERRIND            1            
158.00 160525      C                                                                          
159.00 160525      C                   IF        ERRIND  = '0'                                
160.00 160525      C                   EVAL      DOPT      = ' '                              
161.00 160525      C                   EVAL      DRTGBBANK = RTGBBANK                         
162.00 160525      C                   EVAL      DRTGBCODE = RTGBCODE                         
163.00 160525      C                   EVAL      DRTGROUP  = RTGROUP                          
164.00 160525      C                   EVAL      DRTGCHN   = RTGCHN                           
165.00 160525      C                                                                          
166.00 160525      C                   EVAL      DCCYCDE = %EDITC(RTGBCODE:'X')+' '+OUTCCY    
167.00 160831      C                                                                          
168.00 160831       *    READ BOOK RATE AND VAR FROM GLC002                                   
169.00 160608      C                   Z-ADD     1             KGBBANK                        
170.00 160608      C                   MOVE      RTGBCODE      KGBCODE                        
171.00 160728      C                   MOVE      9999999       KGBEFDT                        
172.00 160728      C                   MOVE      999999        KGBEFTM                        
173.00 160728      C                                                                          
174.00 160728      C     KGLC          SETGT     GLC002                                       
175.00 160728      C                   IF        %FOUND(GLC002)                               
176.00 160728      C                                                                          
177.00 160728       *    Normal ccy rate fetching                                             
178.00 160728      C                   READP     GLC002                                       
179.00 160608      C                   IF        KGBCODE = GBCODE                             
180.00 160608      C                   MOVEL     GBBKXR        DEXCRTE                        
181.00 160608      C                   ENDIF                                                  
182.00 160728      C                   ELSE                                                   
183.00 160728      C                                                                          
184.00 160728       *    Exception handling                                                   
185.00 160819      C     *END          SETLL     GLC002                                       
186.00 160819      C                   READP     GLC002                                       
187.00 160819      C                   IF        KGBCODE = GBCODE                             
188.00 160819      C                   MOVEL     GBBKXR        DEXCRTE                        
189.00 160819      C                   ENDIF                                                  
190.00 160728      C                                                                          
191.00 160608      C                   ENDIF                                                  
192.00 160608      C                                                                          
193.00 160608      C                   IF        RTGBCODE= TCNY                               
194.00 160608      C                   EVAL      DSELLRTE= DEXCRTE + RTGBNOBS                 
195.00 160608      C                   EVAL      DBUGRTE = DEXCRTE - RTGBNOSS                 
196.00 160608      C                   ELSE                                                   
197.00 160608      C                   EVAL      DSELLRTE= DEXCRTE - RTGBNOBS                 
198.00 160608      C                   EVAL      DBUGRTE = DEXCRTE + RTGBNOSS                 
199.00 160525      C                   ENDIF                                                  
200.00 160525      C                                                                          
201.00 160525      C                   CALL      'DFJJTOYY'                                   
202.00 160525      C                   PARM                    RTGBEFDT                       
203.00 160525      C                   PARM                    PLNDAT            8 0          
204.00 160525      C                   EVAL      DLSTUPD = %EDITC(PLNDAT:'X')                 
205.00 160525      C                   EVAL      DLSTUPD = %SUBST(DLSTUPD:7:2)+'-'+           
206.00 160525      C                                       %SUBST(DLSTUPD:5:2)+'-'+           
207.00 160525      C                                       %SUBST(DLSTUPD:3:2)                
208.00 160525      C                                                                          
209.00 160624      C                   EVAL      SRRN = SRRN + 1                              
210.00 160525      C                   WRITE     ST001S                                       
211.00 160525      C                   ENDIF                                                  
212.00 160525      C                                                                          
213.00 160525      C                   ENDIF                                                  
214.00 160525      C                                                                          
215.00 160728      C                   READ      RTGVARPF                               52    
216.00 160608      C                   ENDDO                                                  
217.00 160608       * no record found                                                         
218.00 160624      C                   IF        SRRN > 0                                     
219.00 160624      C                   EVAL      SRRN=1                                       
220.00 160624      C                   SETON                                        50        
221.00 160624      C                   ELSE                                                   
222.00 160624      C                   SETOFF                                       50        
223.00 160608      C                   ENDIF                                                  
224.00 160624      C                                                                          
225.00 160608      C                   ENDSR                                                  
226.00 160608      C*********************************************************************     
227.00 160608      C*                     OPTPGM - Option Program                       *     
228.00 160608      C*********************************************************************     
229.00 160608      C     OPTPGM        BEGSR                                                  
230.00 160525      C                                                                          
231.00 160819       *    Avoid double suspend or double activate                              
232.00 160601      C                   IF        (DOPT = '3' AND DSTATUS = 'SUS') OR          
233.00 160608      C                             (DOPT = '4' AND DSTATUS = 'ACT')             
234.00 160608      C                   SETON                                        41        
235.00 160920 D6250C                   EVAL      SMSG = TMSG2                                 
236.00 160608      C                   ELSE                                                   
237.00 160608      C                                                                          
238.00 160831      C                   IF        DOPT = '5'                                   
239.00 160831      C                   MOVE      '05'          TOPT                           
240.00 160831      C                   CALL      'CHKAUT'                                     
241.00 160831      C                   PARM                    WUSER                          
242.00 160831      C                   PARM      'RTGAPP'      PMOPT             6            
243.00 160831      C                   PARM      '1'           PLEVEL            1            
244.00 160831      C                   PARM                    TOPT              2            
245.00 160831      C                   PARM                    PBRN              3            
246.00 160831      C                   PARM                    PIBRN             3            
247.00 160831      C                   PARM                    PBNAME           30            
248.00 160831      C                   PARM                    PAUT              1            
249.00 160831      C                                                                          
250.00 160831      C                   IF        PAUT = 'Y'                                   
251.00 160831      C                   EVAL      SYESNO = ''                                  
252.00 160831      C                   DOW       SYESNO <> 'Y' AND SYESNO <> 'N'              
253.00 160831      C                   EXFMT     ST001PM                                      
254.00 160831      C                   ENDDO                                                  
255.00 160831      C                   IF        SYESNO = 'Y'                                 
256.00 160831      C     *START        SETLL     RTGGRPLST                                    
257.00 160831      C                   READ      RTGGRPLST                                    
258.00 160831      C                   DOW       NOT %EOF(RTGGRPLST)                          
259.00 160831      C                                                                          
260.00 160831       *    Chain and update master file and write log file                      
261.00 160831      C                   EVAL      KRTGBANK = DRTGBBANK                         
262.00 160831      C                   EVAL      KRTGBCODE = DRTGBCODE                        
263.00 160831      C                   EVAL      KRTGROUP = RTGGROUP                          
264.00 160831      C                   EVAL      KRTGCHN = DRTGCHN                            
265.00 160831      C     KRTGVARPF     CHAIN     RTGVARPF                                     
266.00 160831      C                   IF        %FOUND(RTGVARPF)                             
267.00 160831      C                   EVAL      RTGSTAT = '0'                                
268.00 160831      C                   MOVE      WKDATE        JDATE             8 0          
269.00 160831      C                   CALL      'DFYYTOJJ'                                   
270.00 160831      C                   PARM                    JDATE                          
271.00 160831      C                   PARM                    RTGBEFDT                       
272.00 160831      C                   TIME                    RTGBEFTM                       
273.00 160831      C                   EVAL      RTGBTERM = WUSER                             
274.00 160831      C                   UPDATE    RRTGVARPF                                    
275.00 160831      C                   EXSR      WRTLOG                                       
276.00 160831      C                   ENDIF                                                  
277.00 160831      C                                                                          
278.00 160831      C                   READ      RTGGRPLST                                    
279.00 160831      C                   ENDDO                                                  
280.00 160831      C                                                                          
281.00 160831      C                   ENDIF                                                  
282.00 160831      C                                                                          
283.00 160920 D6250C                   ELSE                                                   
284.00 160920 D6250C                   EVAL      SMSG= TMSG                                   
285.00 160920      C                                                                          
286.00 160831      C                   ENDIF                                                  
287.00 160920      C                                                                          
288.00 160920      C                   ELSEIF    DOPT = '6'                                   
289.00 160920      C                   MOVE      '06'          TOPT                           
290.00 160920      C                   CALL      'CHKAUT'                                     
291.00 160920      C                   PARM                    WUSER                          
292.00 160920      C                   PARM      'RTGAPP'      PMOPT             6            
293.00 160920      C                   PARM      '1'           PLEVEL            1            
294.00 160920      C                   PARM                    TOPT              2            
295.00 160920      C                   PARM                    PBRN              3            
296.00 160920      C                   PARM                    PIBRN             3            
297.00 160920      C                   PARM                    PBNAME           30            
298.00 160920      C                   PARM                    PAUT              1            
299.00 160920      C                                                                          
300.00 160920      C                   IF        PAUT = 'Y'                                   
301.00 160920      C                   EVAL      SYESNO = ''                                  
302.00 160920      C                   DOW       SYESNO <> 'Y' AND SYESNO <> 'N'              
303.00 160920      C                   EXFMT     ST001PM                                      
304.00 160920      C                   ENDDO                                                  
305.00 160920      C                   IF        SYESNO = 'Y'                                 
306.00 160920      C     *START        SETLL     RTGGRPLST                                    
307.00 160920      C                   READ      RTGGRPLST                                    
308.00 160920      C                   DOW       NOT %EOF(RTGGRPLST)                          
309.00 160920      C                                                                          
310.00 160920       *    Chain and update master file and write log file                      
311.00 160920      C                   EVAL      KRTGBANK = DRTGBBANK                         
312.00 160920      C                   EVAL      KRTGBCODE = DRTGBCODE                        
313.00 160920      C                   EVAL      KRTGROUP = RTGGROUP                          
314.00 160920      C                   EVAL      KRTGCHN = DRTGCHN                            
315.00 160920      C     KRTGVARPF     CHAIN     RTGVARPF                                     
316.00 160920      C                   IF        %FOUND(RTGVARPF)                             
317.00 160920      C                   EVAL      RTGSTAT = '1'                                
318.00 160920      C                   MOVE      WKDATE        JDATE             8 0          
319.00 160920      C                   CALL      'DFYYTOJJ'                                   
320.00 160920      C                   PARM                    JDATE                          
321.00 160920      C                   PARM                    RTGBEFDT                       
322.00 160920      C                   TIME                    RTGBEFTM                       
323.00 160920      C                   EVAL      RTGBTERM = WUSER                             
324.00 160920      C                   UPDATE    RRTGVARPF                                    
325.00 160920      C                   EXSR      WRTLOG                                       
326.00 160920      C                   ENDIF                                                  
327.00 160920      C                                                                          
328.00 160920      C                   READ      RTGGRPLST                                    
329.00 160920      C                   ENDDO                                                  
330.00 160920      C                                                                          
331.00 160920      C                   ENDIF                                                  
332.00 160920      C                                                                          
333.00 160920 D6250C                   ELSE                                                   
334.00 160920 D6250C                   EVAL      SMSG= TMSG                                   
335.00 160920      C                                                                          
336.00 160920      C                   ENDIF                                                  
337.00 160920      C                   ELSE                                                   
338.00 160831      C                                                                          
339.00 160608      C                   MOVE      '00'          TOPT                           
340.00 160831      C                   SELECT                                                 
341.00 160831      C                   WHEN      DOPT='1'                                     
342.00 160831      C                   EVAL      TOPT='01'                                    
343.00 160831      C                   WHEN      DOPT='2'                                     
344.00 160831      C                   EVAL      TOPT='02'                                    
345.00 160831      C                   WHEN      DOPT='3'                                     
346.00 160831      C                   EVAL      TOPT='03'                                    
347.00 160831      C                   WHEN      DOPT='4'                                     
348.00 160831      C                   EVAL      TOPT='04'                                    
349.00 160831      C                   WHEN      DOPT='C'                                     
350.00 160831      C                   EVAL      TOPT='F6'                                    
351.00 160831      C                   ENDSL                                                  
352.00 160831      C                                                                          
353.00 160608      C                   CALL      'CHKAUT'                                     
354.00 160608      C                   PARM                    WUSER                          
355.00 160608      C                   PARM      'RTGAPP'      PMOPT             6            
356.00 160831      C                   PARM      '1'           PLEVEL            1            
357.00 160608      C                   PARM                    TOPT              2            
358.00 160608      C                   PARM                    PBRN              3            
359.00 160608      C                   PARM                    PIBRN             3            
360.00 160608      C                   PARM                    PBNAME           30            
361.00 160608      C                   PARM                    PAUT              1            
362.00 160608      C                                                                          
363.00 160608      C                   IF        PAUT = 'Y'                                   
364.00 160819      C                                                                          
365.00 160608      C                   EVAL      SMSG = *BLANK                                
366.00 160608      C                   CALL      'RTGAPPMNT'                                  
367.00 160608      C                   PARM                    DOPT                           
368.00 160608      C                   PARM                    DRTGBBANK                      
369.00 160608      C                   PARM                    DRTGBCODE                      
370.00 160608      C                   PARM                    DRTGROUP                       
371.00 160608      C                   PARM                    DRTGCHN                        
372.00 160608      C                   ELSE                                                   
373.00 160608      C                   EVAL      SMSG = TMSG                                  
374.00 160608      C                   ENDIF                                                  
375.00 160608      C                                                                          
376.00 160920      C                   ENDIF                                                  
377.00 160819      C                                                                          
378.00 160608      C                   ENDIF                                                  
379.00 160601      C                                                                          
380.00 160525      C                   ENDSR                                                  
381.00 160831      C*****************************************************************         
382.00 160831      C*       SUB-ROUTINE: WRTLOG - WRITE NEW RECORD TO LOG PF        *         
383.00 160831      C*****************************************************************         
384.00 160831      C     WRTLOG        BEGSR                                                  
385.00 160831      C                   EVAL      LRTGDTE   = WKDATE                           
386.00 160831      C                   TIME                    LRTGTIME                       
387.00 160831      C                   EVAL      LRTGUSER  = WUSER                            
388.00 160831      C                   EVAL      LRTGBBANK = RTGBBANK                         
389.00 160831      C                   EVAL      LRTGSTAT  = RTGSTAT                          
390.00 160831      C                   EVAL      LRTGCHN   = RTGCHN                           
391.00 160831      C                   EVAL      LRTGROUP  = RTGROUP                          
392.00 160831      C                   EVAL      LRTGTXTYP = RTGTXTYP                         
393.00 160831      C                   EVAL      LRTGAMT1  = RTGAMT1                          
394.00 160831      C                   EVAL      LRTGAMT2  = RTGAMT2                          
395.00 160831      C                   EVAL      LRTGCIF   = RTGCIF                           
396.00 160831      C                   EVAL      LRTGBCODE = RTGBCODE                         
397.00 160831      C                   EVAL      LRTGBBKXR = RTGBBKXR                         
398.00 160831      C                   EVAL      LRTGBVAR  = RTGBVAR                          
399.00 160831      C                   EVAL      LRTGBTNBS = RTGBTNBS                         
400.00 160831      C                   EVAL      LRTGBTNSS = RTGBTNSS                         
401.00 160831      C                   EVAL      LRTGBNOBS = RTGBNOBS                         
402.00 160831      C                   EVAL      LRTGBNOSS = RTGBNOSS                         
403.00 160831      C                   EVAL      LRTGBCKBS = RTGBCKBS                         
404.00 160831      C                   EVAL      LRTGBCKSS = RTGBCKSS                         
405.00 160831      C                   EVAL      LRTGBREVR = RTGBREVR                         
406.00 160831      C                   EVAL      LRTGBLRXR = RTGBLRXR                         
407.00 160831      C                   EVAL      LRTGBUPDT = RTGBUPDT                         
408.00 160831      C                   EVAL      LRTGBUPTM = RTGBUPTM                         
409.00 160831      C                   EVAL      LRTGBTERM = RTGBTERM                         
410.00 160831      C                   EVAL      LRTGBOK1  = RTGBOK1                          
411.00 160831      C                   EVAL      LRTGBOK2  = RTGBOK2                          
412.00 160831      C                   EVAL      LRTGBOBLT = RTGBOBLT                         
413.00 160831      C                   EVAL      LRTGBOSLT = RTGBOSLT                         
414.00 160831      C                   EVAL      LRTGBLTDT = RTGBLTDT                         
415.00 160831      C*   effective date and effective time                                     
416.00 160831      C                   EVAL      LRTGBEFDT = RTGBEFDT                         
417.00 160831      C                   EVAL      LRTGBEFTM = RTGBEFTM                         
418.00 160831      C                   EVAL      LRTGBCPFC = RTGBCPFC                         
419.00 160831      C                   EVAL      LRTGBCPLC = RTGBCPLC                         
420.00 160831      C                   EVAL      LRTGBATBS = RTGBATBS                         
421.00 160831      C                   EVAL      LRTGBATSS = RTGBATSS                         
422.00 160831      C                   EVAL      LRTGBFCBS = RTGBFCBS                         
423.00 160831      C                   EVAL      LRTGBFCSS = RTGBFCSS                         
424.00 160831      C                   EVAL      LRTGBFTBS = RTGBFTBS                         
425.00 160831      C                   EVAL      LRTGBFTSS = RTGBFTSS                         
426.00 160831      C                   EVAL      LRTGBCULM = RTGBCULM                         
427.00 160831      C                   WRITE     RRTGVARLOG                                   
428.00 160831      C                   ENDSR                                                  
429.00 160831      C*                                                                         
