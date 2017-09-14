1.00 20307      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                      
2.00 20319       **************************************************************************                    
3.00 170328       * REFERENCE NO. : CHG-0100-17 (D7100)                                                         
4.00 170328       * PROGRAM ID.   : ECSDAPPMNT                                                                  
5.00 170328       * DESC          : ECSD App Maintenance RPG                                                    
6.00 160607       * AUTHOR        : Myles Ieong                                                                 
7.00 160607       * USER ID.      : BI77PGM                                                                     
8.00 170328       * DATE WRITTEN  : 28 Mar 2017                                                                 
9.00 150727       **************************************************************************                    
10.00 170505       *   Reference     : CHG-100-17 (D7100)                               *                        
11.00 170505       *   Changed by    : Myles Ieong                                      *                        
12.00 170505       *   User ID       : BI77PGM                                          *                        
13.00 170505       *   Date changed  : 05 May 2017                                      *                        
14.00 170505       *   Description   : Cancel Write Log Part                            *                        
15.00 170505       **********************************************************************                        
16.00 160607      F**********************************************************************                        
17.00 160607      F*                         File Specification                         *                        
18.00 160607      F**********************************************************************                        
19.00 161025      FECSDAPPMNDCF   E             WORKSTN                                                          
20.00 150527      F                                     INFDS(WSDTAS)                                            
21.00 160817      FECSDCONF  IF   E           K DISK                                                             
22.00 170505 D7100F*ECSDLOG   UF A E           K DISK    USROPN                                                  
23.00 170505 D7100FECSDLOG   IF   E           K DISK    USROPN                                                   
24.00 161028       * ICBS Standard file                                                                          
25.00 161028      FCUP003    IF A E           K DISK                                                             
26.00 161028      FTAP002    IF A E           K DISK                                                             
27.00 161028      F**********************************************************************                        
28.00 160607      F*                         Function Description                       *                        
29.00 160607      F**********************************************************************                        
30.00 160902      F*      --- Option level -----              --- Function level ---                             
31.00 160902      F*      *IN61: Opt-in mode                  *IN96: F6 create mode                              
32.00 160902      F*      *IN62: Opt-out mode                 *IN98: (N/A)                                       
33.00 160902      F*      *IN63: Enquiry mode                                                                    
34.00 160902      F*      *IN64: (N/A)                                                                           
35.00 160902      F*                                                                                             
36.00 160902      F*      --- Error level ------              --- File op level ----                             
37.00 160902      F*      *IN70: General err (*ON:fail)       *IN80: (N/A)                                       
38.00 160902      F*      *IN71: User not confirm err                                                            
39.00 161028      F*      *IN72: Record not found in ecsdpf                                                      
40.00 161028      F*      *IN73: Record duplicated in ecsdpf                                                     
41.00 160902      F*      *IN74: Input parm err                                                                  
42.00 161028      F*      *IN75: invalid account/customer in icbs                                                
43.00 161028      F*      *IN76: Invalid statement type                                                          
44.00 160902      F*                                                                                             
45.00 160607      D**********************************************************************                        
46.00 160607      D*                   Variables / constant defination                  *                        
47.00 160607      D**********************************************************************                        
48.00 160830       *    Screen user variables                                                                    
49.00 20305      D DSPGID         SDS                                                                           
50.00 30113      D  WKDATE               191    198  0                                                          
51.00 20425      D  WKSTN                244    253                                                             
52.00 70118      D  WUSER                254    263                                                             
53.00 150527      DWSDTAS           DS                                                                           
54.00 150527      DCSRLOC                 370    371B 0                                                          
55.00 161028       *    Error message                                                                            
56.00 170614      DMSG071           S             70    INZ('')                                                  
57.00 161028      DMSG072           S             70    INZ('Record not found')                                  
58.00 161028      DMSG073           S             70    INZ('Record deuplicated')                                
59.00 170614      DMSG074           S             70    INZ('Invalid options')                                   
60.00 161028      DMSG075           S             70    INZ('Invalid account/customer')                          
61.00 161028      DMSG076           S             70    INZ('Invalid statement class/type')                      
62.00 170328      DMSGCCR           S             70    INZ('Concurrent error: record might -                    
63.00 170328      D                                     be changed.')                                            
64.00 61106       *                                                                                             
65.00 160607      C**********************************************************************                        
66.00 160607      C*                         Key List define                            *                        
67.00 160615      C**********************************************************************                        
68.00 160818      C     KECSDCONF     KLIST                                                                      
69.00 160818      C                   KFLD                    KECCLASS         10                                
70.00 160818      C                   KFLD                    KECTYPE          10                                
71.00 160818      C                   KFLD                    KECSUTYPE         2                                
72.00 161124      C                                                                                              
73.00 170117      C     KECSDLOG      KLIST                                                                      
74.00 170117      C                   KFLD                    KELAPPCODE        2                                
75.00 170117      C                   KFLD                    KELKEY           20                                
76.00 170117      C                   KFLD                    KELACTDATE        8 0                              
77.00 170117      C                   KFLD                    KELACTTIME        6 0                              
78.00 170117      C                                                                                              
79.00 161028      C     KCUP003       KLIST                                                                      
80.00 161028      C                   KFLD                    KCUBK             3 0                              
81.00 161028      C                   KFLD                    KCUNBR           10                                
82.00 161028      C                                                                                              
83.00 161028      C     KTAP002       KLIST                                                                      
84.00 161028      C                   KFLD                    KDMBK             3 0                              
85.00 161028      C                   KFLD                    KDMTYP            1 0                              
86.00 161028      C                   KFLD                    KDMACCT          10 0                              
87.00 161028      C*                                                                                             
88.00 160607      C**********************************************************************                        
89.00 160922      C*                          MAIN PROGRAM(CHK INPUT/ DIST. TRAFFIC)    *                        
90.00 160607      C**********************************************************************                        
91.00 160902      C     *ENTRY        PLIST                                                                      
92.00 161028      C                   PARM                    POPT              2            *in parm            
93.00 161025      C                   PARM                    PEMAPPCODE        2                                
94.00 161025      C                   PARM                    PEMKEY           20                                
95.00 161028      C                   PARM                    PEMCLASS         10                                
96.00 161028      C                   PARM                    PEMTYPE          10                                
97.00 161028      C                   PARM                    PEMSUTYPE         2                                
98.00 161124      C                   PARM                    POUT              1            *out parm(0:success)
99.00 161028      C                                                                                              
100.00 160902       *    Check part                                                                               
101.00 170328      C                   EVAL      POUT = '1'                                                       
102.00 160902      C                   SETOFF                                       70                            
103.00 160902      C                   SETOFF                                       7274                          
104.00 160902      C                                                                                              
105.00 160902       *    Check popt within scope                                                                  
106.00 160902      C                   IF        POPT <> '01' AND POPT <> '02'                                    
107.00 160902      C                             AND POPT <> '03' AND POPT <> 'F6'                                
108.00 160902      C                   SETON                                        74                            
109.00 160902      C                   ENDIF                                                                      
110.00 160902      C                                                                                              
111.00 160902      C                   IF        (POPT='01' OR POPT='02' OR POPT='03')                            
112.00 160902      C                             AND (PEMAPPCODE='' OR PEMKEY='')                                 
113.00 160902      C                   SETON                                        74                            
114.00 160902      C                   ENDIF                                                                      
115.00 160902      C                                                                                              
116.00 160902      C                   IF        POPT='F6'                                                        
117.00 160902      C                             AND (PEMAPPCODE<>'' OR PEMKEY<>'')                               
118.00 160902      C                   SETON                                        74                            
119.00 160902      C                   ENDIF                                                                      
120.00 160902      C                                                                                              
121.00 161020      C                   IF        *IN72=*ON OR *IN74=*ON                                           
122.00 161124      C                   EVAL      POUT = '1'                                                       
123.00 160902      C                   SETON                                        70                            
124.00 160902      C                   ENDIF                                                                      
125.00 160902      C                                                                                              
126.00 160902      C                   IF        *IN70 = *OFF                                                     
127.00 160902       *    Do part- Set indicator for screen control                                                
128.00 160902      C                   SELECT                                                                     
129.00 160902      C                   WHEN      POPT = '01'                                                      
130.00 160902      C                   SETON                                        63                            
131.00 160902      C                   SETOFF                                       6162                          
132.00 161117      C                   SETOFF                                       96                            
133.00 161117      C                   WHEN      POPT = '02'                                                      
134.00 161117      C                   SETON                                        61                            
135.00 161117      C                   SETOFF                                       6263                          
136.00 161117      C                   SETOFF                                       96                            
137.00 161117      C                   WHEN      POPT = '03'                                                      
138.00 161117      C                   SETON                                        62                            
139.00 161117      C                   SETOFF                                       6163                          
140.00 161117      C                   SETOFF                                       96                            
141.00 160902      C                   WHEN      POPT = 'F6'                                                      
142.00 160902      C                   SETON                                        96                            
143.00 160902      C                   SETOFF                                       616263                        
144.00 160902      C                   ENDSL                                                                      
145.00 160902      C                                                                                              
146.00 160902       *    Do part- display screen                                                                  
147.00 161025      C                   DOW       *IN03 = *OFF                                                     
148.00 161223      C                                                                                              
149.00 170117       **   Display existed record for inquriy/modify (not create)                                   
150.00 170328      C                   IF        POPT <> 'F6'                                                     
151.00 170328      C                   CALL      'ECSDACTCL'                                                      
152.00 170328      C                   PARM                    P@CHANNEL         3                                
153.00 170328      C                   PARM      'INQ '        P@ACTCODE         4                                
154.00 170328      C                   PARM                    P@ACTTYPE         4                                
155.00 170328      C                   PARM      PEMAPPCODE    P@EMAPPCOD        2                                
156.00 170328      C                   PARM      PEMKEY        P@EMKEY          20                                
157.00 170328      C                   PARM                    P@EMCLASS        10                                
158.00 170328      C                   PARM                    P@EMTYPE         10                                
159.00 170328      C                   PARM                    P@EMSUTYPE        2                                
160.00 170328      C                   PARM                    P@EMOP1           1                                
161.00 170328      C                   PARM                    P@EMOP2           1                                
162.00 170328      C                   PARM                    P@EMOP3           2                                
163.00 170328      C                   PARM                    P@EMDATE          8 0                              
164.00 170328      C                   PARM                    P@EMTIME          6 0                              
165.00 170328      C                   PARM                    P@EMSRUPD        10                                
166.00 170328      C                   PARM                    P@EMREL          10                                
167.00 170328      C                   PARM                    P@ICBSSTS         1                                
168.00 170328      C                   PARM                    P@STS            10                                
169.00 170328      C                   PARM                    P@MOMENT         26                                
170.00 170328      C                                                                                              
171.00 170328      C                   IF        P@ICBSSTS = '0'                                                  
172.00 170328       **   Display inquiry result from module if success                                            
173.00 170328      C                   EVAL      SEMAPPCODE = P@EMAPPCOD                                          
174.00 170328      C                   EVAL      SEMKEY = P@EMKEY                                                 
175.00 170328      C                   EVAL      SEMCLASS = P@EMCLASS                                             
176.00 170328      C                   EVAL      SEMTYPE = P@EMTYPE                                               
177.00 170328      C                   EVAL      SEMSUTYPE = P@EMSUTYPE                                           
178.00 170328      C                   EVAL      SEMOP1 = P@EMOP1                                                 
179.00 170328      C                                                                                              
180.00 170328       **   Display ecsdconf info                                                                    
181.00 170328      C                   EVAL      KECCLASS = P@EMCLASS                                             
182.00 170328      C                   EVAL      KECTYPE = P@EMTYPE                                               
183.00 170328      C                   EVAL      KECSUTYPE = P@EMSUTYPE                                           
184.00 170328      C     KECSDCONF     CHAIN     ECSDCONF                                                         
185.00 170328      C                   IF        %FOUND(ECSDCONF)                                                 
186.00 170328      C                   EVAL      SECDESC = ECDESC                                                 
187.00 170328      C                   ENDIF                                                                      
188.00 170328      C                                                                                              
189.00 170327       **   Display time field from ecsdlog                                                          
190.00 170327      C                   EVAL      KELAPPCODE = PEMAPPCODE                                          
191.00 170327      C                   EVAL      KELKEY = PEMKEY                                                  
192.00 170327      C                   EVAL      KELACTDATE = 0                                                   
193.00 170327      C                   EVAL      KELACTTIME = 0                                                   
194.00 170327      C                   OPEN      ECSDLOG                                                          
195.00 170327      C     KECSDLOG      SETLL     ECSDLOG                                                          
196.00 170327      C                   READ      ECSDLOG                                                          
197.00 170327      C                   IF        NOT %EOF(ECSDLOG)                                                
198.00 170327      C                             AND ELAPPCODE = KELAPPCODE                                       
199.00 170327      C                             AND ELKEY = KELKEY                                               
200.00 170327      C                   EVAL      SELDATEC = ELACTDATE                                             
201.00 170327      C                   EVAL      SELTIMEC = ELACTTIME                                             
202.00 170327      C                   EVAL      SELUSERC = ELUSER                                                
203.00 170327      C                   ENDIF                                                                      
204.00 170327      C                                                                                              
205.00 170327      C                   EVAL      KELACTDATE = 99999999                                            
206.00 170327      C                   EVAL      KELACTTIME = 999999                                              
207.00 170327      C     KECSDLOG      SETLL     ECSDLOG                                                          
208.00 170327      C                   READP     ECSDLOG                                                          
209.00 170328      C                   DOW       NOT %EOF(ECSDLOG)                                                
210.00 170328      C                             AND ELAPPCODE = KELAPPCODE                                       
211.00 170328      C                             AND ELKEY = KELKEY                                               
212.00 170328      C                             AND (%SUBST(ELACTION:1:3)='INQ'              *skip inq/01 action 
213.00 170328      C                               OR %SUBST(ELACTION:1:3)='01 '                                  
214.00 170328      C                               OR ELSTATUS = '1' )                                            
215.00 170328      C                   READP     ECSDLOG                                                          
216.00 170328      C                   ENDDO                                                                      
217.00 170328      C                   IF        NOT %EOF(ECSDLOG)                                                
218.00 170328      C                             AND ELAPPCODE = KELAPPCODE                                       
219.00 170328      C                             AND ELKEY = KELKEY                                               
220.00 170328      C                   EVAL      SELDATEM = ELACTDATE                                             
221.00 170328      C                   EVAL      SELTIMEM = ELACTTIME                                             
222.00 170328      C                   EVAL      SELUSERM = ELUSER                                                
223.00 170328      C                   ENDIF                                                                      
224.00 170328      C                   CLOSE     ECSDLOG                                                          
225.00 170328      C                                                                                              
226.00 170117      C                   WRITE     ECSD10                                                           
227.00 170117      C                   EVAL      SDMSG = ''                                                       
228.00 170328      C                   ELSE                                                                       
229.00 170328      C                   EVAL      POUT = '1'                                                       
230.00 170328      C                   EVAL      SDMSG = MSG074                                                   
231.00 170328      C                   ENDIF                                                                      
232.00 170328      C                                                                                              
233.00 170328      C                   ENDIF                                                                      
234.00 170328      C                                                                                              
235.00 170117      C                   EXFMT     ECSD10                                                           
236.00 160902      C                                                                                              
237.00 161117       **   Do part- user logic                                                                      
238.00 160902      C                   IF        POPT='02'                                                        
239.00 160902      C                   EXSR      OPT02                                                            
240.00 160902      C                   ENDIF                                                                      
241.00 160902      C                                                                                              
242.00 160902      C                   IF        POPT='03'                                                        
243.00 160902      C                   EXSR      OPT03                                                            
244.00 160902      C                   ENDIF                                                                      
245.00 160902      C                                                                                              
246.00 160902      C                   IF        POPT='F6'                                                        
247.00 160902      C                   EXSR      OPTF6                                                            
248.00 160902      C                   ENDIF                                                                      
249.00 160902      C                                                                                              
250.00 160902      C                   ENDDO                                                                      
251.00 160902      C                                                                                              
252.00 160902      C                   ENDIF                                                                      
253.00 161124      C                                                                                              
254.00 170505 D7100 *    End part - write log                                                                     
255.00 170505 D7100C*                  OPEN      ECSDLOG                                                          
256.00 170505 D7100C*                  EVAL      ELUSER = WUSER                                                   
257.00 170505 D7100C*                  EVAL      ELACTDATE = WKDATE                                               
258.00 170505 D7100C*                  TIME                    ELACTTIME                                          
259.00 170505 D7100C*                  IF        POUT = '0'                                                       
260.00 170505 D7100C*                  EVAL      ELACTION = POPT + ' Perform'                                     
261.00 170505 D7100C*                  EVAL      ELSTATUS = '0'                                                   
262.00 170505 D7100C*                  ELSE                                                                       
263.00 170505 D7100C*                  EVAL      ELACTION = POPT + ' Failure'                                     
264.00 170505 D7100C*                  EVAL      ELSTATUS = '1'                                                   
265.00 170505 D7100C*                  ENDIF                                                                      
266.00 170505 D7100C*                  EVAL      ELAPPCODE = P@EMAPPCOD                                           
267.00 170505 D7100C*                  EVAL      ELKEY = P@EMKEY                                                  
268.00 170505 D7100C*                  EVAL      ELCLASS = P@EMCLASS                                              
269.00 170505 D7100C*                  EVAL      ELTYPE = P@EMTYPE                                                
270.00 170505 D7100C*                  EVAL      ELSUTYPE = P@EMSUTYPE                                            
271.00 170505 D7100C*                  EVAL      ELOP1 = P@EMOP1                                                  
272.00 170505 D7100C*                  EVAL      ELOP2 = P@EMOP2                                                  
273.00 170505 D7100C*                  EVAL      ELOP3 = P@EMOP3                                                  
274.00 170505 D7100C*                  EVAL      ELDATE = P@EMDATE                                                
275.00 170505 D7100C*                  EVAL      ELTIME = P@EMTIME                                                
276.00 170505 D7100C*                  EVAL      ELSRUPD = P@EMSRUPD                                              
277.00 170505 D7100C*                  EVAL      ELREL = P@EMREL                                                  
278.00 170505 D7100C*                                                                                             
279.00 170505 D7100C*                  WRITE     RECSDLOG                                                         
280.00 170505 D7100C*                  CLOSE     ECSDLOG                                                          
281.00 160902      C                                                                                              
282.00 61106      C                   SETON                                        LR                            
283.00 160830      C**********************************************************************                        
284.00 161117      C*                 SR: OPT02 - 02 opt- in option (ESTATMENT ONLY)     *                        
285.00 160614      C**********************************************************************                        
286.00 160902      C     OPT02         BEGSR                                                                      
287.00 160902      C                                                                                              
288.00 161117       *    Check part- check if user confirm                                                        
289.00 161117      C                   SETOFF                                       70                            
290.00 161117      C                   SETOFF                                       71                            
291.00 161117      C                                                                                              
292.00 161117      C                   IF        *IN10= *ON                                                       
293.00 161117      C                   DOW       SYESNO <> 'Y' AND SYESNO <> 'N'                                  
294.00 161117      C                   EXFMT     ECSD10CFM                                                        
295.00 161117      C                   ENDDO                                                                      
296.00 161117      C                   IF        SYESNO = 'N'                                                     
297.00 161117      C                   EVAL      SYESNO = ''                                                      
298.00 161117      C                   SETOFF                                       10                            
299.00 161117      C                   SETON                                        71        *no pass confirm    
300.00 161117      C                   ENDIF                                                                      
301.00 161117      C                   ENDIF                                                                      
302.00 161117      C                                                                                              
303.00 161117      C                   IF        *IN10= *OFF                                                      
304.00 161117      C                   SETON                                        71                            
305.00 161117      C                   ENDIF                                                                      
306.00 161117      C                                                                                              
307.00 161117      C                   IF        *IN71 = *ON                                                      
308.00 161117      C                   SETON                                        70                            
309.00 161117      C                   ENDIF                                                                      
310.00 161117      C                                                                                              
311.00 161117       *    Do part- chain the record, update the opt1 field                                         
312.00 161117      C                   IF        *IN70 = *OFF                                                     
313.00 170328      C                   CALL      'ECSDACTCL'                                                      
314.00 170328      C                   PARM                    P@CHANNEL         3                                
315.00 170328      C                   PARM      'UPD '        P@ACTCODE         4                                
316.00 170328      C                   PARM                    P@ACTTYPE         4                                
317.00 170328      C                   PARM      SEMAPPCODE    P@EMAPPCOD        2                                
318.00 170328      C                   PARM      SEMKEY        P@EMKEY          20                                
319.00 170328      C                   PARM      SEMCLASS      P@EMCLASS        10                                
320.00 170328      C                   PARM      SEMTYPE       P@EMTYPE         10                                
321.00 170328      C                   PARM      SEMSUTYPE     P@EMSUTYPE        2                                
322.00 170328      C                   PARM      'Y'           P@EMOP1           1                                
323.00 170328      C                   PARM                    P@EMOP2           1                                
324.00 170328      C                   PARM                    P@EMOP3           2                                
325.00 170328      C                   PARM                    P@EMDATE          8 0                              
326.00 170328      C                   PARM                    P@EMTIME          6 0                              
327.00 170328      C                   PARM                    P@EMSRUPD        10                                
328.00 170328      C                   PARM                    P@EMREL          10                                
329.00 170328      C                   PARM                    P@ICBSSTS         1                                
330.00 170328      C                   PARM                    P@STS            10                                
331.00 170328      C                   PARM                    P@MOMENT         26                                
332.00 170328      C                                                                                              
333.00 170328      C                   IF        P@ICBSSTS = '0'                                                  
334.00 170328      C                   EVAL      POUT = '0'                                                       
335.00 170328      C                   ENDIF                                                                      
336.00 170328      C                                                                                              
337.00 170328      C                   SETON                                        03                            
338.00 170328      C                                                                                              
339.00 170117      C                   ENDIF                                                                      
340.00 161117      C                                                                                              
341.00 160902      C                   ENDSR                                                                      
342.00 160902      C**********************************************************************                        
343.00 161117      C*                 SR: OPT03 -03 opt-out option (ESTAT & PHTYSICAL)   *                        
344.00 160902      C**********************************************************************                        
345.00 160902      C     OPT03         BEGSR                                                                      
346.00 161117      C                                                                                              
347.00 161117       *    Check part- check if user confirm                                                        
348.00 161117      C                   SETOFF                                       70                            
349.00 161117      C                   SETOFF                                       71                            
350.00 161117      C                                                                                              
351.00 161117      C                   IF        *IN10= *ON                                                       
352.00 161117      C                   DOW       SYESNO <> 'Y' AND SYESNO <> 'N'                                  
353.00 161117      C                   EXFMT     ECSD10CFM                                                        
354.00 161117      C                   ENDDO                                                                      
355.00 161117      C                   IF        SYESNO = 'N'                                                     
356.00 161117      C                   EVAL      SYESNO = ''                                                      
357.00 161117      C                   SETOFF                                       10                            
358.00 161117      C                   SETON                                        71        *no pass confirm    
359.00 161117      C                   ENDIF                                                                      
360.00 161117      C                   ENDIF                                                                      
361.00 161117      C                                                                                              
362.00 161117      C                   IF        *IN10= *OFF                                                      
363.00 161117      C                   SETON                                        71                            
364.00 161117      C                   ENDIF                                                                      
365.00 161117      C                                                                                              
366.00 161117      C                   IF        *IN71 = *ON                                                      
367.00 161117      C                   SETON                                        70                            
368.00 161117      C                   ENDIF                                                                      
369.00 161117      C                                                                                              
370.00 161117       *    Do part- chain the record, update the opt1 field                                         
371.00 161117      C                   IF        *IN70 = *OFF                                                     
372.00 170328      C                   CALL      'ECSDACTCL'                                                      
373.00 170328      C                   PARM                    P@CHANNEL         3                                
374.00 170328      C                   PARM      'UPD '        P@ACTCODE         4                                
375.00 170328      C                   PARM                    P@ACTTYPE         4                                
376.00 170328      C                   PARM      SEMAPPCODE    P@EMAPPCOD        2                                
377.00 170328      C                   PARM      SEMKEY        P@EMKEY          20                                
378.00 170328      C                   PARM      SEMCLASS      P@EMCLASS        10                                
379.00 170328      C                   PARM      SEMTYPE       P@EMTYPE         10                                
380.00 170328      C                   PARM      SEMSUTYPE     P@EMSUTYPE        2                                
381.00 170328      C                   PARM      'B'           P@EMOP1           1                                
382.00 170328      C                   PARM                    P@EMOP2           1                                
383.00 170328      C                   PARM                    P@EMOP3           2                                
384.00 170328      C                   PARM                    P@EMDATE          8 0                              
385.00 170328      C                   PARM                    P@EMTIME          6 0                              
386.00 170328      C                   PARM                    P@EMSRUPD        10                                
387.00 170328      C                   PARM                    P@EMREL          10                                
388.00 170328      C                   PARM                    P@ICBSSTS         1                                
389.00 170328      C                   PARM                    P@STS            10                                
390.00 170328      C                   PARM                    P@MOMENT         26                                
391.00 170328      C                                                                                              
392.00 170328      C                   IF        P@ICBSSTS = '0'                                                  
393.00 170328      C                   EVAL      POUT = '0'                                                       
394.00 170328      C                   ENDIF                                                                      
395.00 170328      C                                                                                              
396.00 170328      C                   SETON                                        03                            
397.00 170328      C                                                                                              
398.00 170123      C                   ENDIF                                                                      
399.00 160902      C                                                                                              
400.00 160902      C                   ENDSR                                                                      
401.00 160902      C**********************************************************************                        
402.00 160902      C*                 SR: OPTF6 - F6 create function                     *                        
403.00 161028      C**********************************************************************                        
404.00 161028      C     OPTF6         BEGSR                                                                      
405.00 161028      C                                                                                              
406.00 161028       *    Check part- check if user confirm                                                        
407.00 161028      C                   SETOFF                                       70                            
408.00 161028      C                   SETOFF                                       717273                        
409.00 161028      C                   SETOFF                                       747576                        
410.00 161028      C                                                                                              
411.00 160902       *    Chk if user confirm                                                                      
412.00 161028      C                   IF        *IN10= *ON                                                       
413.00 161028      C                   DOW       SYESNO <> 'Y' AND SYESNO <> 'N'                                  
414.00 161028      C                   EXFMT     ECSD10CFM                                                        
415.00 161028      C                   ENDDO                                                                      
416.00 161028      C                   IF        SYESNO = 'N'                                                     
417.00 161028      C                   EVAL      SYESNO = ''                                                      
418.00 161028      C                   SETOFF                                       10                            
419.00 161028      C                   SETON                                        71        *no pass confirm    
420.00 161028      C                   ENDIF                                                                      
421.00 161028      C                   ENDIF                                                                      
422.00 161028      C                                                                                              
423.00 161028      C                   IF        *IN10= *OFF                                                      
424.00 161028      C                   SETON                                        71                            
425.00 161028      C                   EVAL      SDMSG = MSG071                                                   
426.00 161028      C                   ENDIF                                                                      
427.00 161028      C                                                                                              
428.00 161028       *    Check if app code is 20 or 26 or 90                                                      
429.00 161028      C                   IF        SEMAPPCODE <> '20' AND SEMAPPCODE <> '26'                        
430.00 161028      C                             AND SEMAPPCODE <> '90'                                           
431.00 161028      C                   SETON                                        74                            
432.00 161028      C                   EVAL      SDMSG = MSG074                                                   
433.00 161028      C                   ENDIF                                                                      
434.00 161028      C                                                                                              
435.00 161117       *    Check if emop1 is Y or B                                                                 
436.00 161124      C                   IF        SEMOP1 <> 'Y' AND SEMOP1 <> 'B'                                  
437.00 161028      C                   SETON                                        74                            
438.00 161028      C                   EVAL      SDMSG = MSG074                                                   
439.00 161028      C                   ENDIF                                                                      
440.00 161028      C                                                                                              
441.00 161028       *    Check if the statement type is exist and if yes, fetch to scrn                           
442.00 161028      C                   EVAL      KECCLASS = SEMCLASS                                              
443.00 161028      C                   EVAL      KECTYPE = SEMTYPE                                                
444.00 161028      C                   EVAL      KECSUTYPE = SEMSUTYPE                                            
445.00 161028      C     KECSDCONF     CHAIN     ECSDCONF                                                         
446.00 161028      C                   IF        NOT %FOUND(ECSDCONF)                                             
447.00 161028      C                   SETON                                        76                            
448.00 161028      C                   EVAL      SDMSG = MSG076                                                   
449.00 161028      C                   ELSE                                                                       
450.00 161028      C                   EVAL      SECDESC = ECDESC                                                 
451.00 161028      C                   ENDIF                                                                      
452.00 161028      C                                                                                              
453.00 161028       *    Check if the cif exist in icbs if appcode is 90                                          
454.00 161028      C                   IF        SEMAPPCODE = '90'                                                
455.00 161028      C                   EVAL      KCUBK = 1                                                        
456.00 161028      C                   EVAL      KCUNBR = %SUBST(SEMKEY:1:10)                                     
457.00 161028      C     KCUP003       CHAIN     CUP003                                                           
458.00 161028      C                   IF        NOT %FOUND(CUP003)                                               
459.00 161028      C                   SETON                                        75                            
460.00 161028      C                   EVAL      SDMSG = MSG075                                                   
461.00 161028      C                   ENDIF                                                                      
462.00 161028      C                   ENDIF                                                                      
463.00 161028      C                                                                                              
464.00 161028       *    Check if the acc exist in icbs if appcode is 20/26                                       
465.00 161028      C                   IF        SEMAPPCODE = '20' OR SEMAPPCODE = '26'                           
466.00 161028      C                   EVAL      KDMBK = 1                                                        
467.00 161031      C                   MOVEL     SEMKEY        KDMACCT                                            
468.00 161028      C                   IF        SEMAPPCODE = '20'                                                
469.00 161124      C                   EVAL      KDMTYP = 6                                                       
470.00 161124      C                   ENDIF                                                                      
471.00 161124      C                   IF        SEMAPPCODE = '26'                                                
472.00 161124      C                   EVAL      KDMTYP = 1                                                       
473.00 161028      C                   ENDIF                                                                      
474.00 161028      C     KTAP002       CHAIN     TAP002                                                           
475.00 161028      C                   IF        NOT %FOUND(TAP002)                                               
476.00 161028      C                   SETON                                        75                            
477.00 161028      C                   EVAL      SDMSG = MSG075                                                   
478.00 161028      C                   ENDIF                                                                      
479.00 161028      C                   ENDIF                                                                      
480.00 161028      C                                                                                              
481.00 161020       *    Summarize checking result                                                                
482.00 161028      C                   IF        *IN71=*ON OR *IN72=*ON OR *IN73=*ON                              
483.00 161028      C                             OR *IN74=*ON OR *IN75=*ON OR *IN76=*ON                           
484.00 161028      C                   SETON                                        70                            
485.00 161028      C                   ENDIF                                                                      
486.00 161028      C                                                                                              
487.00 161020       *    Do part- chain the record, update the opt1 field                                         
488.00 170328      C                   IF        *IN70 = *OFF                                                     
489.00 170328      C                   CALL      'ECSDACTCL'                                                      
490.00 170328      C                   PARM                    P@CHANNEL         3                                
491.00 170328      C                   PARM      'CRT '        P@ACTCODE         4                                
492.00 170328      C                   PARM                    P@ACTTYPE         4                                
493.00 170328      C                   PARM      SEMAPPCODE    P@EMAPPCOD        2                                
494.00 170328      C                   PARM      SEMKEY        P@EMKEY          20                                
495.00 170328      C                   PARM      SEMCLASS      P@EMCLASS        10                                
496.00 170328      C                   PARM      SEMTYPE       P@EMTYPE         10                                
497.00 170328      C                   PARM      SEMSUTYPE     P@EMSUTYPE        2                                
498.00 170328      C                   PARM      SEMOP1        P@EMOP1           1                                
499.00 170328      C                   PARM                    P@EMOP2           1                                
500.00 170328      C                   PARM                    P@EMOP3           2                                
501.00 170328      C                   PARM                    P@EMDATE          8 0                              
502.00 170328      C                   PARM                    P@EMTIME          6 0                              
503.00 170328      C                   PARM                    P@EMSRUPD        10                                
504.00 170328      C                   PARM                    P@EMREL          10                                
505.00 170328      C                   PARM                    P@ICBSSTS         1                                
506.00 170328      C                   PARM                    P@STS            10                                
507.00 170328      C                   PARM                    P@MOMENT         26                                
508.00 170328      C                                                                                              
509.00 170328      C                   IF        P@ICBSSTS = '0'                                                  
510.00 170328      C                   EVAL      POUT = '0'                                                       
511.00 170328      C                   ENDIF                                                                      
512.00 170328      C                                                                                              
513.00 170328      C                   SETON                                        03                            
514.00 170328      C                                                                                              
515.00 170328      C                   ENDIF                                                                      
516.00 170328      C                                                                                              
517.00 161020      C                   ENDSR                                                                      
518.00 170328       **                                                                                            
