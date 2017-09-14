1.00 160525      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 160525       **************************************************************************
3.00 160728       * REFERENCE NO. : CHG-0250-16 (D6250)                                     
4.00 160525       * PROGRAM ID.   : RTGAPPMNT                                               
5.00 160525       * DESC          : Exchange Rate for Customer Group Maintenance Program    
6.00 160525       * AUTHOR        : Myles Ieong                                             
7.00 160525       * USER ID.      : BI77PGM                                                 
8.00 160525       * DATE WRITTEN  : 25 May 2016                                             
9.00 160525       **************************************************************************
10.00 160525      F*****************************************************************         
11.00 160531      F*                    FILE SPECIFICATION                         *         
12.00 160525      F*****************************************************************         
13.00 160601      F*       ICBSB SYSTEM FILE                                                 
14.00 160531      FGLC001    IF   E           K DISK                                         
15.00 160531      FGLC002    IF   E           K DISK                                         
16.00 160531      F*                                                                         
17.00 160531      F*       SCREEN FILE                                                       
18.00 160526      FRTGAPPMNTDCF   E             WORKSTN                                      
19.00 0      F                                     INFDS(WSDTAS)                        
20.00 160531      F*       G/L GROUP RATE FILE AND LOG                                       
21.00 160601      FRTGVARPF  UF A E           K DISK                                         
22.00 160526      FRTGVARLOG UF A E           K DISK                                         
23.00 160601      F*       Group and Channel List PF                                         
24.00 160601      FRTGGRPLST IF   E           K DISK                                         
25.00 160601      FRTGCHNLST IF   E           K DISK                                         
26.00 0      F*****************************************************************         
27.00 160526      F*                    FUNCTION OF INDICATORS                     *         
28.00 160526      F*****************************************************************         
29.00 160526      F*                                                                         
30.00 160601      F*    *IN61       : INQUIRY screen                                         
31.00 160601      F*    *IN62       : MODIFY screen                                          
32.00 160601      F*    *IN63       : SUSPEND screen                                         
33.00 160601      F*    *IN64       : REACTIVATE screen                                      
34.00 160601      F*    *IN65       : Create screen                                          
35.00 160530      F*    *IN60       : CHK MODIFICATION ERROR                                 
36.00 160601      F*    *IN80, *IN81: READ FILE ERROR                                        
37.00 160601      F*     FIELD ERROR         : SRTGBCODE  *IN77                              
38.00 160601      F*                           SRTGROUP   *IN78                              
39.00 160601      F*                           SRTGCHN    *IN79                              
40.00 160601      F*                           NOBS, NOSS *IN71                              
41.00 160531      F*                           CKBS, CKSS *IN72                              
42.00 160531      F*                           TNBS, TNSS *IN73                              
43.00 160531      F*                           FCBS, FCSS *IN74                              
44.00 160531      F*                           ATBS, ATSS *IN75                              
45.00 160531      F*                           FTBS, FTSS *IN76                              
46.00 160531      F*                                                                         
47.00 160525      D*****************************************************************         
48.00 160526      D*               VARIABLES / CONSTANT DEFINITION                 *         
49.00 160525      D*****************************************************************         
50.00 160526      D DSPGID         SDS                                                       
51.00 160729      D  WKDATE               191    198S 0                                      
52.00 160526      D  WKSTN                244    253                                         
53.00 160526      D  WUSER                254    263                                         
54.00 160526      DWSDTAS           DS                                                       
55.00 160526      DCSRLOC                 370    371B 0                                      
56.00 160526      D*                                                                         
57.00 160527      DMSGID            S             10A                                        
58.00 160920      DMSGVALUE         S             70A                                        
59.00 160527      D*                                                                         
60.00 0      C*****************************************************************         
61.00 160526      C*                   PARAMETERS DEFINITIONS                      *         
62.00 160526      C*****************************************************************         
63.00 160526      C     *ENTRY        PLIST                                                  
64.00 160526      C                   PARM                    POPT              1            
65.00 160526      C                   PARM                    PGBBANK           3 0          
66.00 160526      C                   PARM                    PGBCODE           3 0          
67.00 160526      C                   PARM                    PGROUP            6            
68.00 160526      C                   PARM                    PCHN              6            
69.00 160526      C*                                                                         
70.00 0      C*****************************************************************         
71.00 160526      C*                    KEY FIELD DEFINITIONS                      *         
72.00 0      C*****************************************************************         
73.00 160831       *    BANK CONTROL/PROFILE                                                 
74.00 160526      C     KTAP001       KLIST                                                  
75.00 160526      C                   KFLD                    KDBK              3 0          
76.00 160831      C                                                                          
77.00 160831       *    CURRENCY RATE FILE                                                   
78.00 160526      C     KRTGVARPF     KLIST                                                  
79.00 160526      C                   KFLD                    KRTGBBANK         3 0          
80.00 160526      C                   KFLD                    KRTGBCODE         3 0          
81.00 160526      C                   KFLD                    KRTGROUP          6            
82.00 160608      C                   KFLD                    KRTGCHN           6            
83.00 160831      C                                                                          
84.00 160831       *    GLC001 GLC002 KEY LIST                                               
85.00 160531      C     KGLC          KLIST                                                  
86.00 160531      C                   KFLD                    KGBBANK           3 0          
87.00 160531      C                   KFLD                    KGBCODE           3 0          
88.00 160531      C                   KFLD                    KGBEFDT           7 0          
89.00 160531      C                   KFLD                    KGBEFTM           6 0          
90.00 160531      C*                                                                         
91.00 0      C*****************************************************************         
92.00 160526      C*                   INITIALIZATION ROUTINE                      *         
93.00 0      C*****************************************************************         
94.00 0      C*                                                                         
95.00 160526      C                   CALL      'DICBSBYMD'                                  
96.00 160526      C                   PARM                    TODAY             8 0          
97.00 0      C*                                                                         
98.00 160527      C*    set inquiry/modify mode from popt                                    
99.00 160527      C*                                                                         
100.00 160527      C                   SELECT                                                 
101.00 160527      C                   WHEN      POPT = '1'                                   
102.00 160527      C                   SETON                                        61        
103.00 160530      C                   SETOFF                                       626364    
104.00 160601      C                   SETOFF                                       65        
105.00 160601      C                   WHEN      POPT = '2'                                   
106.00 160601      C                   SETON                                        62        
107.00 160601      C                   SETOFF                                       616364    
108.00 160601      C                   SETOFF                                       65        
109.00 160601      C                   WHEN      POPT = '3'                                   
110.00 160601      C                   SETON                                        63        
111.00 160601      C                   SETOFF                                       616264    
112.00 160601      C                   SETOFF                                       65        
113.00 160601      C                   WHEN      POPT = '4'                                   
114.00 160601      C                   SETON                                        64        
115.00 160601      C                   SETOFF                                       616263    
116.00 160601      C                   SETOFF                                       65        
117.00 160831      C                   WHEN      POPT = 'C'                                   
118.00 160601      C                   SETON                                        65        
119.00 160601      C                   SETOFF                                       616263    
120.00 160601      C                   SETOFF                                       64        
121.00 160728      C                   EVAL      PGBCODE=0                                    
122.00 160728      C                   EVAL      PGROUP=''                                    
123.00 160728      C                   EVAL      PCHN=''                                      
124.00 160728      C                   ENDSL                                                  
125.00 160530      C*                                                                         
126.00 160530      C*    initialize screen values                                             
127.00 160530      C*                                                                         
128.00 160530      C                   EXSR      GETRTGVAR                                    
129.00 160530      C                                                                          
130.00 160531      C                   IF        *IN80 = *ON                                  
131.00 160530      C                   EXSR      SHOWMSG                                      
132.00 160530      C                   EXFMT     RRTGMNT01                                    
133.00 160530      C                   ENDIF                                                  
134.00 160530      C*                                                                         
135.00 160525      C*****************************************************************         
136.00 160526      C*                         MAIN PROGRAM                          *         
137.00 160525      C*****************************************************************         
138.00 160530      C*                                                                         
139.00 160531      C                   DOW       (*IN03 = *OFF) AND (*IN12 = *OFF)            
140.00 160531      C                             AND (*IN80 = *OFF)                           
141.00 160531      C                                                                          
142.00 160920      C                   IF        *IN80 = *ON                                  
143.00 160920      C                   EXSR      SHOWMSG                                      
144.00 160920      C                   ENDIF                                                  
145.00 160819      C                                                                          
146.00 160526      C                   EXFMT     RRTGMNT01                                    
147.00 160920 D6250C                   EVAL      SMSG = ''                                    
148.00 160601      C*                                                                         
149.00 160526      C*    in modify mode and confirm changes                                   
150.00 160531      C*                                                                         
151.00 160601      C                   IF        POPT='2'                                     
152.00 160601      C                                                                          
153.00 160601      C                   EXSR      CHKINPUT                                     
154.00 160601      C                                                                          
155.00 160601      C                   IF        *IN60 = *ON                                  
156.00 160601      C                   EXSR      SHOWMSG                                      
157.00 160601      C                   ENDIF                                                  
158.00 160601      C                                                                          
159.00 160601      C                   IF        *IN60 = *OFF                                 
160.00 160601      C                                                                          
161.00 160601      C                   IF        *IN10=*ON                                    
162.00 160601      C                                                                          
163.00 160601      C                   DOW       SYESNO <> 'Y' AND SYESNO <> 'N'              
164.00 160601      C                   EXFMT     RRTGMNTWIN                                   
165.00 160601      C                   ENDDO                                                  
166.00 160601      C                                                                          
167.00 160601      C                   IF        SYESNO = 'N'                                 
168.00 160601      C                   SETOFF                                       10        
169.00 160601      C                   EVAL      SYESNO = ''                                  
170.00 160601      C                   ENDIF                                                  
171.00 160601      C                                                                          
172.00 160601      C                   IF        SYESNO = 'Y'                                 
173.00 160601      C                                                                          
174.00 160601      C                   EXSR      CHKINPUT                                     
175.00 160601      C                                                                          
176.00 160601      C                   IF        *IN60 = *ON                                  
177.00 160601      C                   EXSR      SHOWMSG                                      
178.00 160601      C                   ENDIF                                                  
179.00 160601      C                                                                          
180.00 160601      C                   IF        *IN60 = *OFF                                 
181.00 160601      C*                  ***modify master file***                               
182.00 160729      C                   MOVE      WKDATE        JDATE             8 0          
183.00 160729      C                   CALL      'DFYYTOJJ'                                   
184.00 160729      C                   PARM                    JDATE                          
185.00 160729      C                   PARM                    RTGBEFDT                       
186.00 160729      C                   TIME                    RTGBEFTM                       
187.00 160729      C                   EVAL      RTGBTERM = WUSER                             
188.00 160601      C                   MOVEL     SRTGBBKXR     RTGBBKXR                       
189.00 160601      C                   MOVEL     SRTGBVAR      RTGBVAR                        
190.00 160601      C                   MOVEL     SRTGBNOBS     RTGBNOBS                       
191.00 160601      C                   MOVEL     SRTGBNOSS     RTGBNOSS                       
192.00 160601      C                   MOVEL     SRTGBCKBS     RTGBCKBS                       
193.00 160601      C                   MOVEL     SRTGBCKSS     RTGBCKSS                       
194.00 160601      C                   MOVEL     SRTGBTNBS     RTGBTNBS                       
195.00 160601      C                   MOVEL     SRTGBTNSS     RTGBTNSS                       
196.00 160601      C                   MOVEL     SRTGBFCBS     RTGBFCBS                       
197.00 160601      C                   MOVEL     SRTGBFCSS     RTGBFCSS                       
198.00 160601      C                   MOVEL     SRTGBATBS     RTGBATBS                       
199.00 160601      C                   MOVEL     SRTGBATSS     RTGBATSS                       
200.00 160601      C                   MOVEL     SRTGBFTBS     RTGBFTBS                       
201.00 160601      C                   MOVEL     SRTGBFTSS     RTGBFTSS                       
202.00 160601      C                   UPDATE    RRTGVARPF                                    
203.00 160601      C                                                                          
204.00 160601      C*                  ***create new log entry***                             
205.00 160601      C                   EXSR      WRTLOG                                       
206.00 160601      C                   LEAVE                                                  
207.00 160601      C                   ENDIF                                                  
208.00 160601      C                                                                          
209.00 160601      C                   ENDIF                                                  
210.00 160601      C                                                                          
211.00 160601      C                   ENDIF                                                  
212.00 160601      C                   ENDIF                                                  
213.00 160601      C                                                                          
214.00 160601      C                   ENDIF                                                  
215.00 160601      C                                                                          
216.00 160601      C*                                                                         
217.00 160526      C*    in suspend mode and confirm changes                                  
218.00 160526      C*                                                                         
219.00 160601      C                   IF        POPT='3'                                     
220.00 160601      C                                                                          
221.00 160601      C                   IF        *IN10=*ON                                    
222.00 160819      C                                                                          
223.00 160920      C                   IF        SRTGSTAT = 'SUSPEND'                         
224.00 160920      C                   SETON                                        80        
225.00 160920      C                   EVAL      MSGVALUE = 'CURRENCY ALREADY SUSPENDED.'     
226.00 160920      C                   ELSE                                                   
227.00 160601      C                   DOW       SYESNO <> 'Y' AND SYESNO <> 'N'              
228.00 160601      C                   EXFMT     RRTGMNTWIN                                   
229.00 160601      C                   ENDDO                                                  
230.00 160601      C                                                                          
231.00 160601      C                   IF        SYESNO = 'N'                                 
232.00 160601      C                   SETOFF                                       10        
233.00 160601      C                   EVAL      SYESNO = ''                                  
234.00 160601      C                   ENDIF                                                  
235.00 160601      C                                                                          
236.00 160601      C                   IF        SYESNO = 'Y'                                 
237.00 160601      C*                  ***modify master file***                               
238.00 160601      C                   EVAL      RTGSTAT = '0'                                
239.00 160729      C                   MOVE      WKDATE        JDATE             8 0          
240.00 160729      C                   CALL      'DFYYTOJJ'                                   
241.00 160729      C                   PARM                    JDATE                          
242.00 160729      C                   PARM                    RTGBEFDT                       
243.00 160729      C                   TIME                    RTGBEFTM                       
244.00 160729      C                   EVAL      RTGBTERM = WUSER                             
245.00 160601      C                   UPDATE    RRTGVARPF                                    
246.00 160601      C*                  ***create new log entry***                             
247.00 160601      C                   EXSR      WRTLOG                                       
248.00 160601      C                   LEAVE                                                  
249.00 160601      C                   ENDIF                                                  
250.00 160601      C                                                                          
251.00 160920      C                   ENDIF                                                  
252.00 160819      C                                                                          
253.00 160601      C                   ENDIF                                                  
254.00 160601      C                                                                          
255.00 160601      C                   ENDIF                                                  
256.00 160530      C*                                                                         
257.00 160530      C*    reactivate mode and confirm changes                                  
258.00 160530      C*                                                                         
259.00 160601      C                   IF        POPT='4'                                     
260.00 160601      C                   IF        *IN10=*ON                                    
261.00 160920      C                   IF        SRTGSTAT = 'ACTIVE'                          
262.00 160920      C                   SETON                                        80        
263.00 160920      C                   EVAL      MSGVALUE = 'CURRENCY ALREADY ACTIVE.'        
264.00 160920      C                   ELSE                                                   
265.00 160920      C                   DOW       SYESNO <> 'Y' AND SYESNO <> 'N'              
266.00 160601      C                   EXFMT     RRTGMNTWIN                                   
267.00 160601      C                   ENDDO                                                  
268.00 160601      C                                                                          
269.00 160601      C                   IF        SYESNO = 'N'                                 
270.00 160601      C                   SETOFF                                       10        
271.00 160601      C                   EVAL      SYESNO = ''                                  
272.00 160601      C                   ENDIF                                                  
273.00 160601      C                                                                          
274.00 160601      C                   IF        SYESNO = 'Y'                                 
275.00 160601      C*                  ***modify master file***                               
276.00 160601      C                   EVAL      RTGSTAT = '1'                                
277.00 160729      C                   MOVE      WKDATE        JDATE             8 0          
278.00 160729      C                   CALL      'DFYYTOJJ'                                   
279.00 160729      C                   PARM                    JDATE                          
280.00 160729      C                   PARM                    RTGBEFDT                       
281.00 160729      C                   TIME                    RTGBEFTM                       
282.00 160729      C                   EVAL      RTGBTERM = WUSER                             
283.00 160601      C                   UPDATE    RRTGVARPF                                    
284.00 160601      C*                  ***create new log entry***                             
285.00 160601      C                   EXSR      WRTLOG                                       
286.00 160601      C                   LEAVE                                                  
287.00 160601      C                   ENDIF                                                  
288.00 160601      C                                                                          
289.00 160920      C                   ENDIF                                                  
290.00 160819      C                                                                          
291.00 160601      C                   ENDIF                                                  
292.00 160601      C                                                                          
293.00 160601      C                   ENDIF                                                  
294.00 160601      C*                                                                         
295.00 160601      C*    create mode and confirm changes                                      
296.00 160601      C*                                                                         
297.00 160831      C                   IF        POPT='C'                                     
298.00 160601      C                                                                          
299.00 160601      C                   EXSR      CHKINPUT                                     
300.00 160601      C                                                                          
301.00 160601      C                   IF        *IN60 = *ON                                  
302.00 160601      C                   EXSR      SHOWMSG                                      
303.00 160601      C                   ENDIF                                                  
304.00 160601      C                                                                          
305.00 160601      C                   IF        *IN60 = *OFF                                 
306.00 160601      C                                                                          
307.00 160601      C*                  ***get ccy alphabetic code                             
308.00 160601      C                   CALL      'CCCYCHK1'                                   
309.00 160601      C                   PARM                    SRTGBCODE                      
310.00 160601      C                   PARM                    OUTCCY            3            
311.00 160601      C                   PARM                    ERRIND            1            
312.00 160601      C                   IF        ERRIND = '0'                                 
313.00 160601      C                   EVAL      SGBPET = OUTCCY                              
314.00 160601      C                   ENDIF                                                  
315.00 160601      C                                                                          
316.00 160601      C*                  ***fetch bkrate and bkvrrate                           
317.00 160601      C                   MOVE      1             KGBBANK                        
318.00 160601      C                   MOVE      SRTGBCODE     KGBCODE                        
319.00 160601      C                   MOVE      9999999       KGBEFDT                        
320.00 160601      C                   MOVE      999999        KGBEFTM                        
321.00 160601      C                                                                          
322.00 160601      C     KGLC          SETGT     GLC002                                       
323.00 160601      C                   IF        %FOUND(GLC002)                               
324.00 160601      C                   READP     GLC002                                       
325.00 160601      C                   IF        KGBCODE = GBCODE                             
326.00 160601      C                   MOVEL     GBBKXR        SRTGBBKXR                      
327.00 160601      C                   MOVEL     GBVAR         SRTGBVAR                       
328.00 160601      C                   ELSE                                                   
329.00 160601      C                   SETON                                        80        
330.00 160920      C                   EVAL      MSGVALUE= 'CURRENCY NOT FOUND.'              
331.00 160601      C                   ENDIF                                                  
332.00 160601      C                   ENDIF                                                  
333.00 160601      C                                                                          
334.00 160601      C*                  ***check if there are record already exist             
335.00 160601      C     *START        SETLL     RTGVARPF                                     
336.00 160601      C                   READ      RTGVARPF                                     
337.00 160601      C                   DOW       NOT %EOF(RTGVARPF)                           
338.00 160601      C                   IF        (SRTGBCODE = RTGBCODE)                       
339.00 160601      C                             AND (SRTGROUP = RTGROUP)                     
340.00 160601      C                             AND (SRTGCHN = RTGCHN)                       
341.00 160601      C                   SETON                                        60        
342.00 160920      C                   EVAL      MSGVALUE = 'RECORD ALREADY EXISTED.'         
343.00 160601      C                   ENDIF                                                  
344.00 160601      C                   READ      RTGVARPF                                     
345.00 160601      C                   ENDDO                                                  
346.00 160601      C                                                                          
347.00 160601      C                   IF        *IN60 = *ON                                  
348.00 160601      C                   EXSR      SHOWMSG                                      
349.00 160601      C                   ENDIF                                                  
350.00 160601      C                                                                          
351.00 160601      C                   IF        *IN60 = *OFF                                 
352.00 160601      C                                                                          
353.00 160601      C                   IF        *IN10 = *ON                                  
354.00 160601      C                                                                          
355.00 160601      C                   DOW       SYESNO <> 'Y' AND SYESNO <> 'N'              
356.00 160601      C                   EXFMT     RRTGMNTWIN                                   
357.00 160601      C                   ENDDO                                                  
358.00 160601      C                                                                          
359.00 160601      C                   IF        SYESNO = 'N'                                 
360.00 160601      C                   SETOFF                                       10        
361.00 160601      C                   EVAL      SYESNO = ''                                  
362.00 160601      C                   ENDIF                                                  
363.00 160601      C                                                                          
364.00 160601      C                   IF        SYESNO = 'Y'                                 
365.00 160601      C*                  ***modify master file***                               
366.00 160608      C                   EVAL      RTGSTAT  = '1'                               
367.00 160608      C                   EVAL      RTGCHN   = SRTGCHN                           
368.00 160608      C                   EVAL      RTGROUP  = SRTGROUP                          
369.00 160608      C                   EVAL      RTGBCODE = SRTGBCODE                         
370.00 160608      C                   MOVEL     SRTGBBKXR     RTGBBKXR                       
371.00 160608      C                   MOVEL     SRTGBVAR      RTGBVAR                        
372.00 160608      C                   MOVEL     SRTGBTNBS     RTGBTNBS                       
373.00 160608      C                   MOVEL     SRTGBTNSS     RTGBTNSS                       
374.00 160608      C                   MOVEL     SRTGBNOBS     RTGBNOBS                       
375.00 160608      C                   MOVEL     SRTGBNOSS     RTGBNOSS                       
376.00 160608      C                   MOVEL     SRTGBCKBS     RTGBCKBS                       
377.00 160608      C                   MOVEL     SRTGBCKSS     RTGBCKSS                       
378.00 160608      C                   MOVEL     SRTGBATBS     RTGBATBS                       
379.00 160608      C                   MOVEL     SRTGBATSS     RTGBATSS                       
380.00 160608      C                   MOVEL     SRTGBFCBS     RTGBFCBS                       
381.00 160608      C                   MOVEL     SRTGBFCSS     RTGBFCSS                       
382.00 160608      C                   MOVEL     SRTGBFTBS     RTGBFTBS                       
383.00 160608      C                   MOVEL     SRTGBFTSS     RTGBFTSS                       
384.00 160729      C                   MOVE      WKDATE        JDATE             8 0          
385.00 160729      C                   CALL      'DFYYTOJJ'                                   
386.00 160729      C                   PARM                    JDATE                          
387.00 160729      C                   PARM                    RTGBEFDT                       
388.00 160729      C                   TIME                    RTGBEFTM                       
389.00 160729      C                   EVAL      RTGBTERM = WUSER                             
390.00 160601      C                   WRITE     RRTGVARPF                                    
391.00 160601      C*                  ***create new log entry                                
392.00 160601      C                   EXSR      WRTLOG                                       
393.00 160601      C                   LEAVE                                                  
394.00 160601      C                   ENDIF                                                  
395.00 160601      C                                                                          
396.00 160601      C                   ENDIF                                                  
397.00 160601      C                                                                          
398.00 160601      C                   ENDIF                                                  
399.00 160601      C                                                                          
400.00 160601      C                   ENDIF                                                  
401.00 160601      C                                                                          
402.00 160601      C                   ENDIF                                                  
403.00 160526      C*                                                                         
404.00 160526      C*    end of loop                                                          
405.00 160526      C*                                                                         
406.00 160526      C                   ENDDO                                                  
407.00 160526      C                                                                          
408.00 160526      C                   SETON                                        LR        
409.00 160526      C*                                                                         
410.00 160526      C*****************************************************************         
411.00 160526      C*                    SUB-ROUTINE: GETRTGVAR                     *         
412.00 160526      C*****************************************************************         
413.00 160526      C     GETRTGVAR     BEGSR                                                  
414.00 160531      C*                                                                         
415.00 160531      C*    READ BOOK RATE AND VAR FROM GLC002                                   
416.00 160728      C*    Note: Read Book Rate Directly from GLC002                            
417.00 160728      C*                                                                         
418.00 160531      C                   MOVE      PGBBANK       KGBBANK                        
419.00 160531      C                   MOVE      PGBCODE       KGBCODE                        
420.00 160729      C                   MOVE      9999999       KGBEFDT                        
421.00 160729      C                   MOVE      999999        KGBEFTM                        
422.00 160531      C                                                                          
423.00 160729      C     KGLC          SETGT     GLC002                                       
424.00 160729      C                   IF        %FOUND(GLC002)                               
425.00 160728      C                                                                          
426.00 160728       *    Normal ccy rate fetching                                             
427.00 160531      C                   READP     GLC002                                       
428.00 160531      C                   IF        KGBCODE = GBCODE                             
429.00 160531      C                   MOVEL     GBBKXR        SRTGBBKXR                      
430.00 160531      C                   MOVEL     GBVAR         SRTGBVAR                       
431.00 160531      C                   ELSE                                                   
432.00 160531      C                   SETON                                        80        
433.00 160920      C                   EVAL      MSGVALUE = 'CURRENCY NOT FOUND.'             
434.00 160531      C                   ENDIF                                                  
435.00 160729      C                   ELSE                                                   
436.00 160729      C                                                                          
437.00 160729       *    Exception handling                                                   
438.00 160729      C     *END          SETLL     GLC002                                       
439.00 160729      C                   READP     GLC002                                       
440.00 160729      C                   IF        KGBCODE = GBCODE                             
441.00 160729      C                   MOVEL     GBBKXR        SRTGBBKXR                      
442.00 160729      C                   MOVEL     GBVAR         SRTGBVAR                       
443.00 160729      C                   ELSE                                                   
444.00 160729      C                   SETON                                        80        
445.00 160920      C                   EVAL      MSGVALUE = 'CURRENCY NOT FOUND.'             
446.00 160729      C                   ENDIF                                                  
447.00 160531      C                   ENDIF                                                  
448.00 160531      C*                                                                         
449.00 160531      C*    GET DIFF RATE VAR FROM RTGVARPF                                      
450.00 160531      C*                                                                         
451.00 160526      C                   MOVE      PGBBANK       KRTGBBANK                      
452.00 160526      C                   MOVE      PGBCODE       KRTGBCODE                      
453.00 160526      C                   MOVE      PGROUP        KRTGROUP                       
454.00 160728      C                   MOVE      PCHN          KRTGCHN                        
455.00 160728      C                                                                          
456.00 160729      C     KRTGVARPF     CHAIN     RTGVARPF                                     
457.00 160530      C                   IF        %FOUND(RTGVARPF)                             
458.00 160531      C                                                                          
459.00 160601      C                   EVAL      SRTGBCODE = RTGBCODE                         
460.00 160601      C                   CALL      'CCCYCHK1'                                   
461.00 160601      C                   PARM                    RTGBCODE                       
462.00 160601      C                   PARM                    OUTCCY            3            
463.00 160601      C                   PARM                    ERRIND            1            
464.00 160601      C                   IF        ERRIND = '0'                                 
465.00 160601      C                   EVAL      SGBPET = OUTCCY                              
466.00 160601      C                   ENDIF                                                  
467.00 160526      C                   EVAL      SRTGROUP = RTGROUP                           
468.00 160526      C                   EVAL      SRTGCHN = RTGCHN                             
469.00 160527      C                   IF        RTGSTAT = '1'                                
470.00 160601      C                   EVAL      SRTGSTAT = 'ACTIVE'                          
471.00 160601      C                   ENDIF                                                  
472.00 160601      C                   IF        RTGSTAT = '0'                                
473.00 160601      C                   EVAL      SRTGSTAT = 'SUSPEND'                         
474.00 160527      C                   ENDIF                                                  
475.00 160819      C                   CALL      'DFJJTOYY'                                   
476.00 160819      C                   PARM                    RTGBEFDT                       
477.00 160819      C                   PARM                    SEFFDATE                       
478.00 160819      C                   EVAL      SEFFTIME = RTGBEFTM                          
479.00 160819      C                   EVAL      SRTGBTERM = RTGBTERM                         
480.00 160530      C                   MOVEL     RTGBNOBS      SRTGBNOBS                      
481.00 160530      C                   MOVEL     RTGBNOSS      SRTGBNOSS                      
482.00 160530      C                   MOVEL     RTGBCKBS      SRTGBCKBS                      
483.00 160530      C                   MOVEL     RTGBCKSS      SRTGBCKSS                      
484.00 160530      C                   MOVEL     RTGBTNBS      SRTGBTNBS                      
485.00 160530      C                   MOVEL     RTGBTNSS      SRTGBTNSS                      
486.00 160530      C                   MOVEL     RTGBFCBS      SRTGBFCBS                      
487.00 160530      C                   MOVEL     RTGBFCSS      SRTGBFCSS                      
488.00 160530      C                   MOVEL     RTGBATBS      SRTGBATBS                      
489.00 160530      C                   MOVEL     RTGBATSS      SRTGBATSS                      
490.00 160530      C                   MOVEL     RTGBFTBS      SRTGBFTBS                      
491.00 160530      C                   MOVEL     RTGBFTSS      SRTGBFTSS                      
492.00 160530      C                                                                          
493.00 160530      C                   ELSE                                                   
494.00 160530      C                                                                          
495.00 160531      C                   SETON                                        80        
496.00 160920      C                   EVAL      MSGVALUE = 'RECORD NOT FOUND.'               
497.00 160530      C                                                                          
498.00 160530      C                   ENDIF                                                  
499.00 160530      C                                                                          
500.00 160526      C                   ENDSR                                                  
501.00 160526      C*****************************************************************         
502.00 160526      C*                    SUB-ROUTINE: CHKINPUT                      *         
503.00 160526      C*****************************************************************         
504.00 160526      C     CHKINPUT      BEGSR                                                  
505.00 160526      C                                                                          
506.00 160531      C                   SETOFF                                       60        
507.00 160531      C                   SETOFF                                       717273    
508.00 160531      C                   SETOFF                                       747576    
509.00 160601      C                   SETOFF                                       777879    
510.00 160526      C*                                                                         
511.00 160530      C*    check BookRateVar < BookRate & BookRateVar > OtherVar                
512.00 160531      C*                                                                         
513.00 160531      C                   IF        (SRTGBVAR < SRTGBNOBS) OR                    
514.00 160531      C                             (SRTGBVAR < SRTGBNOSS)                       
515.00 160531      C                   SETON                                        7160      
516.00 160920      C                   EVAL      MSGVALUE = 'EXCEED RATE VAR LIMIT.'          
517.00 160531      C                   ENDIF                                                  
518.00 160531      C                                                                          
519.00 160531      C                   IF        (SRTGBVAR < SRTGBCKBS) OR                    
520.00 160531      C                             (SRTGBVAR < SRTGBCKSS)                       
521.00 160531      C                   SETON                                        7260      
522.00 160920      C                   EVAL      MSGVALUE = 'EXCEED RATE VAR LIMIT.'          
523.00 160531      C                   ENDIF                                                  
524.00 160531      C                                                                          
525.00 160531      C                   IF        (SRTGBVAR < SRTGBTNBS) OR                    
526.00 160531      C                             (SRTGBVAR < SRTGBTNSS)                       
527.00 160531      C                   SETON                                        7360      
528.00 160920      C                   EVAL      MSGVALUE = 'EXCEED RATE VAR LIMIT.'          
529.00 160531      C                   ENDIF                                                  
530.00 160531      C                                                                          
531.00 160531      C                   IF        (SRTGBVAR < SRTGBFCBS) OR                    
532.00 160531      C                             (SRTGBVAR < SRTGBFCSS)                       
533.00 160531      C                   SETON                                        7460      
534.00 160920      C                   EVAL      MSGVALUE = 'EXCEED RATE VAR LIMIT.'          
535.00 160531      C                   ENDIF                                                  
536.00 160531      C                                                                          
537.00 160531      C                   IF        (SRTGBVAR < SRTGBATBS) OR                    
538.00 160531      C                             (SRTGBVAR < SRTGBATSS)                       
539.00 160531      C                   SETON                                        7560      
540.00 160920      C                   EVAL      MSGVALUE = 'EXCEED RATE VAR LIMIT.'          
541.00 160531      C                   ENDIF                                                  
542.00 160531      C                                                                          
543.00 160531      C                   IF        (SRTGBVAR < SRTGBFTBS) OR                    
544.00 160531      C                             (SRTGBVAR < SRTGBFTSS)                       
545.00 160531      C                   SETON                                        7660      
546.00 160920      C                   EVAL      MSGVALUE = 'EXCEED RATE VAR LIMIT.'          
547.00 160531      C                   ENDIF                                                  
548.00 160601      C                                                                          
549.00 160601      C                   CALL      'CCCYCHK1'                                   
550.00 160601      C                   PARM                    SRTGBCODE                      
551.00 160601      C                   PARM                    OUTCCY            3            
552.00 160601      C                   PARM                    ERRIND            1            
553.00 160601      C                   IF        ERRIND = '1'                                 
554.00 160601      C                   SETON                                        7760      
555.00 160920      C                   EVAL      MSGVALUE = 'CURRENCY NOT FOUND.'             
556.00 160601      C                   ENDIF                                                  
557.00 160601      C                                                                          
558.00 160601      C     SRTGROUP      CHAIN     RTGGRPLST                                    
559.00 160601      C                   IF        NOT %FOUND(RTGGRPLST)                        
560.00 160601      C                   SETON                                        7860      
561.00 160920      C                   EVAL      MSGVALUE = 'GROUP NOT FOUND.'                
562.00 160601      C                   ENDIF                                                  
563.00 160601      C                                                                          
564.00 160601      C     SRTGCHN       CHAIN     RTGCHNLST                                    
565.00 160601      C                   IF        NOT %FOUND(RTGCHNLST)                        
566.00 160601      C                   SETON                                        7960      
567.00 160920      C                   EVAL      MSGVALUE = 'CHANNEL NOT FOUND.'              
568.00 160601      C                   ENDIF                                                  
569.00 160530      C                                                                          
570.00 160526      C                   ENDSR                                                  
571.00 160527      C*                                                                         
572.00 160527      C*****************************************************************         
573.00 160527      C*          SUB-ROUTINE: SHOWMSG - SHOW MESSAGE ON SMSG          *         
574.00 160527      C*****************************************************************         
575.00 160527      C                                                                          
576.00 160527      C     SHOWMSG       BEGSR                                                  
577.00 160527      C                   EVAL      SMSG = MSGVALUE                              
578.00 160527      C                   ENDSR                                                  
579.00 160527      C*                                                                         
580.00 160531      C*****************************************************************         
581.00 160531      C*       SUB-ROUTINE: WRTLOG - WRITE NEW RECORD TO LOG PF        *         
582.00 160531      C*****************************************************************         
583.00 160531      C*                                                                         
584.00 160531      C     WRTLOG        BEGSR                                                  
585.00 160531      C                   EVAL      LRTGDTE   = WKDATE                           
586.00 160531      C                   TIME                    LRTGTIME                       
587.00 160531      C                   EVAL      LRTGUSER  = WUSER                            
588.00 160729      C                   EVAL      LRTGBBANK = RTGBBANK                         
589.00 160531      C                   EVAL      LRTGSTAT  = RTGSTAT                          
590.00 160531      C                   EVAL      LRTGCHN   = RTGCHN                           
591.00 160531      C                   EVAL      LRTGROUP  = RTGROUP                          
592.00 160531      C                   EVAL      LRTGTXTYP = RTGTXTYP                         
593.00 160531      C                   EVAL      LRTGAMT1  = RTGAMT1                          
594.00 160531      C                   EVAL      LRTGAMT2  = RTGAMT2                          
595.00 160531      C                   EVAL      LRTGCIF   = RTGCIF                           
596.00 160531      C                   EVAL      LRTGBCODE = RTGBCODE                         
597.00 160531      C                   EVAL      LRTGBBKXR = RTGBBKXR                         
598.00 160531      C                   EVAL      LRTGBVAR  = RTGBVAR                          
599.00 160531      C                   EVAL      LRTGBTNBS = RTGBTNBS                         
600.00 160531      C                   EVAL      LRTGBTNSS = RTGBTNSS                         
601.00 160531      C                   EVAL      LRTGBNOBS = RTGBNOBS                         
602.00 160531      C                   EVAL      LRTGBNOSS = RTGBNOSS                         
603.00 160531      C                   EVAL      LRTGBCKBS = RTGBCKBS                         
604.00 160531      C                   EVAL      LRTGBCKSS = RTGBCKSS                         
605.00 160531      C                   EVAL      LRTGBREVR = RTGBREVR                         
606.00 160531      C                   EVAL      LRTGBLRXR = RTGBLRXR                         
607.00 160531      C                   EVAL      LRTGBUPDT = RTGBUPDT                         
608.00 160531      C                   EVAL      LRTGBUPTM = RTGBUPTM                         
609.00 160531      C                   EVAL      LRTGBTERM = RTGBTERM                         
610.00 160531      C                   EVAL      LRTGBOK1  = RTGBOK1                          
611.00 160531      C                   EVAL      LRTGBOK2  = RTGBOK2                          
612.00 160531      C                   EVAL      LRTGBOBLT = RTGBOBLT                         
613.00 160531      C                   EVAL      LRTGBOSLT = RTGBOSLT                         
614.00 160531      C                   EVAL      LRTGBLTDT = RTGBLTDT                         
615.00 160729      C*   effective date and effective time                                     
616.00 160531      C                   EVAL      LRTGBEFDT = RTGBEFDT                         
617.00 160531      C                   EVAL      LRTGBEFTM = RTGBEFTM                         
618.00 160531      C                   EVAL      LRTGBCPFC = RTGBCPFC                         
619.00 160531      C                   EVAL      LRTGBCPLC = RTGBCPLC                         
620.00 160531      C                   EVAL      LRTGBATBS = RTGBATBS                         
621.00 160531      C                   EVAL      LRTGBATSS = RTGBATSS                         
622.00 160531      C                   EVAL      LRTGBFCBS = RTGBFCBS                         
623.00 160531      C                   EVAL      LRTGBFCSS = RTGBFCSS                         
624.00 160531      C                   EVAL      LRTGBFTBS = RTGBFTBS                         
625.00 160531      C                   EVAL      LRTGBFTSS = RTGBFTSS                         
626.00 160531      C                   EVAL      LRTGBCULM = RTGBCULM                         
627.00 160531      C                   WRITE     RRTGVARLOG                                   
628.00 160531      C                   ENDSR                                                  
629.00 160531      C*                                                                         
