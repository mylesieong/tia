1.00 20305      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                            
2.00 20315       ********************************************************************                                
3.00 80418       * PROGRAM ID.   : CMIVIP                                           *                                
4.00 70329       * Description   :                                                  *                                
5.00 70329       * PARAMETERS    : IN  - PiOPT   Option                1A           *                                
6.00 70329       *                         'C' - Create; 'M' Maintenance            *                                
7.00 80423       *                         'I' - Inquiry; 'D' Delete                *                                
8.00 80418       *                 IN  - PiCIF    CIF                 10A           *                                
9.00 80418       *                 IN  - PiMODULE                      2A           *                                
10.00 80418       *                         '01' - MASTER FILE                       *                                
11.00 80418       *                         '02' - Fee Module                        *                                
12.00 80423       *                 I/N - PDATA  DATA                1024A           *                                
13.00 80423       *                       IN - FOR 'C' AND 'M'                       *                                
14.00 80423       *                       OUT - FOR 'I'                              *                                
15.00 80423       *                 I/N - PVIP - VIP FLAG               3A           *                                
16.00 80423       *                         CUTHR5 IN CUP027                         *                                
17.00 80423       *                       IN - FOR 'C'                               *                                
18.00 80423       *                       OUT - FOR 'M' AND 'I'                      *                                
19.00 70329       *                 OUT - FoERR   ERROR CODE            1A           *                                
20.00 70329       *                 '0' - SUCCESS                                    *                                
21.00 70329       *                 '1' - RECORD LOCKED BY ANOTHER USER              *                                
22.00 70329       *                 '2' - RECORD NOT FOUND                           *                                
23.00 80423       *                 '3' - INVALID OPTION                             *                                
24.00 80619       * REFERENCE NO. : CHG-173-08                                       *                                
25.00 70206       * AUTHOR        : Carmen Lei                                       *                                
26.00 70206       * USER ID.      : B552PGM                                          *                                
27.00 70329       * DATE WRITTEN  : 28 MAR 2007                                      *                                
28.00 70329       * INDICATOR     :  39 - SUCCESS                                    *                                
29.00 70329       *                 N39 - FAILED                                     *                                
30.00 80418       *                  50 - WRITE VIPMAST                              *                                
31.00 80418       *                 N50 - UPDATE VIPMAST                             *                                
32.00 80418       *                  51 - WRITE VCUSFEE                              *                                
33.00 80418       *                 N51 - UPDATE VCUSFEE                             *                                
34.00 80421       *                  52 - WRITE CUP027                               *                                
35.00 80421       *                 N52 - UPDATE CUP027                              *                                
36.00 80611       *                  53 - WRITE VCUSFEE                              *                                
37.00 80611       *                 N53 - UPDATE VCUSFEE                             *                                
38.00 20315       ********************************************************************                                
39.00 170328       * Reference     : CHG-0100-17 (D7100)                          *                                    
40.00 170328       * AUTHOR        : Myless Ieong                                 *                                    
41.00 170328       * USER ID.      : BI77PGM                                      *                                    
42.00 170328       * Date          : 28 Mar 2017                                  *                                    
43.00 170328       * Description   : Add ECSD Module Calling to Crt ECSD Entry    *                                    
44.00 170328       ****************************************************************                                    
45.00 80421      FCUP027    UF A E           K DISK    USROPN                                                         
46.00 80421      F*                                    PREFIX('C')                                                    
47.00 80418      FVIPMAST   UF A E           K DISK    USROPN                                                         
48.00 80418      FVCUSFEE   UF A E           K DISK    USROPN                                                         
49.00 80611      FVIPCARD   UF A E           K DISK    USROPN                                                         
50.00 80418      FDEFVFEE   IF   E           K DISK                                                                   
51.00 70329       ********************************************************************                                
52.00 70329       *Data Structure / Variable                                                                          
53.00 70329       ********************************************************************                                
54.00 80418      D DTAMAS        E DS                  EXTNAME(VIPMAST)                                               
55.00 80418      D DTACFEE       E DS                  EXTNAME(VCUSFEE)                                               
56.00 80611      D DTCARD        E DS                  EXTNAME(VIPCARD)                                               
57.00 80423       *                                                                                                   
58.00 80423      D DSPGID         SDS                                                                                 
59.00 80423      D  WKDATE               191    198  0                                                                
60.00 80423      D  WKSTN                244    253                                                                   
61.00 80423      D  USER                 254    263                                                                   
62.00 70206       ********************************************************************                                
63.00 70206       *Key Description                                                                                    
64.00 70206       ********************************************************************                                
65.00 80418       * KEY FOR CUP027                                                                                    
66.00 70329      C     KEYCIF        KLIST                                                                            
67.00 70329      C                   KFLD                    BKNO                                                     
68.00 80418      C                   KFLD                    PiCIF                                                    
69.00 80612      C                                                                                                    
70.00 80418       * KEY FOR VIPFILE                                                                                   
71.00 80418      C     KEYVIP        KLIST                                                                            
72.00 80418      C                   KFLD                    PiCIF                                                    
73.00 80612      C                                                                                                    
74.00 80612       * KEY FOR VIPCARD                                                                                   
75.00 80612      C     KVCARD        KLIST                                                                            
76.00 80612      C                   KFLD                    PiCIF                                                    
77.00 80612      C                                                                                                    
78.00 80423       * KEY FOR DEFVFEE                                                                                   
79.00 80423      C     KEYDEFFEE     KLIST                                                                            
80.00 80423      C                   KFLD                    KAFLAG            1                                      
81.00 70206       ********************************************************************                                
82.00 70206      C                   Z-ADD     1             BKNO              3 0                                    
83.00 80423      C                   EVAL      KAFLAG = 'Y'                                                           
84.00 70327       *                                                                                                   
85.00 20319       ********************************************************************                                
86.00 20305       *In/Out Parameter                                                                                   
87.00 20305       ********************************************************************                                
88.00 20305      C     *ENTRY        PLIST                                                                            
89.00 70329      C                   PARM                    PiOPT             1                                      
90.00 80418      C                   PARM                    PiCIF            10                                      
91.00 80418      C                   PARM                    PiMODULE          2                                      
92.00 80423      C                   PARM                    PDATA          1024                                      
93.00 80423      C                   PARM                    PVIP              3                                      
94.00 70329      C                   PARM                    PoERR             1                                      
95.00 70329       ********************************************************************                                
96.00 70329       *Initilize                                                                                          
97.00 70329       ********************************************************************                                
98.00 80423       *                                                                                                   
99.00 80423      C                   CALL      'DICBSYMD'                                                             
100.00 80423      C                   PARM                    TODAYYMD          8 0                                    
101.00 80423       *                                                                                                   
102.00 70329      C                   EVAL      PoERR = '0'                                                            
103.00 70329      C                   SETON                                        39                                  
104.00 80418      C                   SETOFF                                       505152                              
105.00 80611      C                   SETOFF                                       53                                  
106.00 70330       ********************************************************************                                
107.00 70330       *Pre-check                                                                                          
108.00 70330       ********************************************************************                                
109.00 20305       ********************************************************************                                
110.00 20305       *Main Program                                                                                       
111.00 20305       ********************************************************************                                
112.00 70329       * OPEN FILE                                                                                         
113.00 80418       *                                                                                                   
114.00 80421       * CUP027                                                                                            
115.00 80421      C                   EXSR      GCUP027                                                                
116.00 80421       *                                                                                                   
117.00 80418       * MASTER FILE                                                                                       
118.00 80418      C                   IF        PiMODULE = '01'                                                        
119.00 80421      C   39              EXSR      GVIPMAST                                                               
120.00 80418      C                   ENDIF                                                  *END PiMODULE=01          
121.00 80418       *                                                                                                   
122.00 80418       * FEE - WRITE DEFAULT FEE WHEN CREATE NEW MASTER                                                    
123.00 80418      C                   IF        PiMODULE = '02' OR PiOPT = 'C'                                         
124.00 80418      C   39              EXSR      GVCUSFEE                                                               
125.00 80418      C                   ENDIF                                                                            
126.00 80611      C                                                                                                    
127.00 80611       * CARD - WRITE CARD GENERATE RECORD WHEN CREATE NEW MASTER                                          
128.00 80611      C                   IF        PiMODULE = '03' OR PiOPT = 'C'                                         
129.00 80611      C   39              EXSR      GVIPCARD                                                               
130.00 80611      C                   ENDIF                                                                            
131.00 80423       *                                                                                                   
132.00 80423       * WRITE / UPDATE FILES                                                                              
133.00 80423      C                   IF        *IN39 = *ON                                                            
134.00 80423      C                   SELECT                                                                           
135.00 80423       *                                                                                                   
136.00 80423      C                   WHEN      PiOPT = 'I'                                                            
137.00 80423      C                   SELECT                                                                           
138.00 80423      C                   WHEN      PiMODULE = '01'                                                        
139.00 80423      C                   MOVEL(P)  DTAMAS        PDATA                                                    
140.00 80423      C                   WHEN      PiMODULE = '02'                                                        
141.00 80423      C                   MOVEL(P)  DTACFEE       PDATA                                                    
142.00 80611      C                   WHEN      PiMODULE = '03'                                                        
143.00 80611      C                   MOVEL(P)  DTCARD        PDATA                                                    
144.00 80423      C                   ENDSL                                                                            
145.00 80423       *                                                                                                   
146.00 80423      C                   WHEN      PiOPT = 'M'                                                            
147.00 80423      C                   SELECT                                                                           
148.00 80423      C                   WHEN      PiMODULE = '01'                                                        
149.00 80423      C                   MOVEL(P)  PDATA         DTAMAS                                                   
150.00 80424      C                   EVAL      MCIF = PiCIF                                                           
151.00 80423      C   50              WRITE     RVIPMAST                                                               
152.00 80423      C  N50              UPDATE    RVIPMAST                                                               
153.00 170328 D7100 * DELETE VIP RECORD IN ECSDPF IF CONSOLIDATION FLAG SET TO N                                        
154.00 170328 D7100C                   IF        %TRIM(MCHAR1) = 'N'                                                    
155.00 170328 D7100C                   MOVEL     PiCIF         EMKEY                                                    
156.00 170328 D7100C                   EVAL      EMAPPCODE = '90'                                                       
157.00 170328 D7100C                   CALL      'ECSDACTCL'                                                            
158.00 170328 D7100C                   PARM                    CHANNEL           3                                      
159.00 170328 D7100C                   PARM      'DLT '        ACTCODE           4                                      
160.00 170328 D7100C                   PARM                    ACTTYPE           4                                      
161.00 170328 D7100C                   PARM                    EMAPPCODE         2                                      
162.00 170328 D7100C                   PARM                    EMKEY            20                                      
163.00 170328 D7100C                   PARM      'VIP       '  EMCLASS          10                                      
164.00 170328 D7100C                   PARM      'STMT      '  EMTYPE           10                                      
165.00 170328 D7100C                   PARM                    EMSUTYPE          2                                      
166.00 170328 D7100C                   PARM                    EMOP1             1                                      
167.00 170328 D7100C                   PARM                    EMOP2             1                                      
168.00 170328 D7100C                   PARM                    EMOP3             2                                      
169.00 170328 D7100C                   PARM                    EMDATE            8 0                                    
170.00 170328 D7100C                   PARM                    EMTIME            6 0                                    
171.00 170328 D7100C                   PARM                    EMSRUPD          10                                      
172.00 170328 D7100C                   PARM                    EMREL            10                                      
173.00 170328 D7100C                   PARM                    ICBSSTS           1                                      
174.00 170328 D7100C                   PARM                    STS              10                                      
175.00 170328 D7100C                   PARM                    MOMENT           26                                      
176.00 170328 D7100C                   ENDIF                                                                            
177.00 170328 D7100 * CREATE VIP RECORD IN ECSDPF IF CONSOLIDATION FLAG SET TO Y                                        
178.00 170328 D7100C                   IF        %TRIM(MCHAR1) = 'Y'                                                    
179.00 170328 D7100C                   MOVEL     PiCIF         EMKEY                                                    
180.00 170328 D7100C                   EVAL      EMAPPCODE = '90'                                                       
181.00 170328 D7100C                   CALL      'ECSDACTCL'                                                            
182.00 170328 D7100C                   PARM                    CHANNEL           3                                      
183.00 170328 D7100C                   PARM      'CRT '        ACTCODE           4                                      
184.00 170328 D7100C                   PARM                    ACTTYPE           4                                      
185.00 170328 D7100C                   PARM                    EMAPPCODE         2                                      
186.00 170328 D7100C                   PARM                    EMKEY            20                                      
187.00 170328 D7100C                   PARM      'VIP       '  EMCLASS          10                                      
188.00 170328 D7100C                   PARM      'STMT      '  EMTYPE           10                                      
189.00 170328 D7100C                   PARM                    EMSUTYPE          2                                      
190.00 170328 D7100C                   PARM      'B'           EMOP1             1                                      
191.00 170328 D7100C                   PARM                    EMOP2             1                                      
192.00 170328 D7100C                   PARM                    EMOP3             2                                      
193.00 170328 D7100C                   PARM                    EMDATE            8 0                                    
194.00 170328 D7100C                   PARM                    EMTIME            6 0                                    
195.00 170328 D7100C                   PARM                    EMSRUPD          10                                      
196.00 170328 D7100C                   PARM                    EMREL            10                                      
197.00 170328 D7100C                   PARM                    ICBSSTS           1                                      
198.00 170328 D7100C                   PARM                    STS              10                                      
199.00 170328 D7100C                   PARM                    MOMENT           26                                      
200.00 170328 D7100C                   ENDIF                                                                            
201.00 80423      C                   WHEN      PiMODULE = '02'                                                        
202.00 80423      C                   MOVEL(P)  PDATA         DTACFEE                                                  
203.00 80423      C   51              WRITE     RVCUSFEE                                                               
204.00 80423      C  N51              UPDATE    RVCUSFEE                                                               
205.00 80611      C                   WHEN      PiMODULE = '03'                                                        
206.00 80611      C                   MOVEL(P)  PDATA         DTCARD                                                   
207.00 80611      C   53              WRITE     RVIPCARD                                                               
208.00 80611      C  N53              UPDATE    RVIPCARD                                                               
209.00 80423      C                   ENDSL                                                                            
210.00 80424       *                                                                                                   
211.00 80423      C                   WHEN      PiOPT = 'C'                                                            
212.00 80423      C                   SELECT                                                                           
213.00 80423      C                   WHEN      PiMODULE = '01'                                                        
214.00 80423       * UPDATE USER DEFINE FIELD IN CUP027                                                                
215.00 80423      C                   EXSR      UCUP027                                                                
216.00 80423       * UPDATE MASTER FILE                                                                                
217.00 80423      C                   MOVEL(P)  PDATA         DTAMAS                                                   
218.00 80424      C                   EVAL      MCIF = PiCIF                                                           
219.00 80423      C   50              WRITE     RVIPMAST                                                               
220.00 80423      C  N50              UPDATE    RVIPMAST                                                               
221.00 170328 D7100 * CALL ECSD MODULE TO CREATE RECORD ONLY WHEN CONSOLIDATION FLAG IS Y                               
222.00 170328 D7100C                   IF        %TRIM(MCHAR1) = 'Y'                                                    
223.00 170328 D7100C                   MOVEL     PiCIF         EMKEY                                                    
224.00 170328 D7100C                   EVAL      EMAPPCODE = '90'                                                       
225.00 170328 D7100C                   CALL      'ECSDACTCL'                                                            
226.00 170328 D7100C                   PARM                    CHANNEL           3                                      
227.00 170328 D7100C                   PARM      'CRT '        ACTCODE           4                                      
228.00 170328 D7100C                   PARM                    ACTTYPE           4                                      
229.00 170328 D7100C                   PARM                    EMAPPCODE         2                                      
230.00 170328 D7100C                   PARM                    EMKEY            20                                      
231.00 170328 D7100C                   PARM      'VIP       '  EMCLASS          10                                      
232.00 170328 D7100C                   PARM      'STMT      '  EMTYPE           10                                      
233.00 170328 D7100C                   PARM                    EMSUTYPE          2                                      
234.00 170328 D7100C                   PARM      'B'           EMOP1             1                                      
235.00 170328 D7100C                   PARM                    EMOP2             1                                      
236.00 170328 D7100C                   PARM                    EMOP3             2                                      
237.00 170328 D7100C                   PARM                    EMDATE            8 0                                    
238.00 170328 D7100C                   PARM                    EMTIME            6 0                                    
239.00 170328 D7100C                   PARM                    EMSRUPD          10                                      
240.00 170328 D7100C                   PARM                    EMREL            10                                      
241.00 170328 D7100C                   PARM                    ICBSSTS           1                                      
242.00 170328 D7100C                   PARM                    STS              10                                      
243.00 170328 D7100C                   PARM                    MOMENT           26                                      
244.00 170328 D7100C                   ENDIF                                                                            
245.00 170328 D7100 * CALL ECSD MODULE TO CREATE RECORD                                                                 
246.00 170328 D7100C                   CALL      'ECSDAPPCL'                                                            
247.00 170328 D7100C                   PARM                    EMAPPCODE                                                
248.00 170328 D7100C                   PARM                    EMKEY                                                    
249.00 80423       * UPDATE FEE FILE FROM DEFAULT                                                                      
250.00 80423      C                   EXSR      UVCUSFEE                                                               
251.00 80509       * WRITE DEFAULT OFFER                                                                               
252.00 80616      C                   CALL      'WRTDEFOFF'                                                            
253.00 80509      C                   PARM                    PiCIF                                                    
254.00 80509      C                   PARM                    PtERR             1                                      
255.00 80611       * UPDATE CARD STATUS                                                                                
256.00 80611      C                   EXSR      UVIPCARD                                                               
257.00 80424       *                                                                                                   
258.00 80612      C                   WHEN      PiMODULE = '02' OR PiMODULE = '03'                                     
259.00 80423       * CREATE FOR MASTER ONLY                                                                            
260.00 80423      C                   EVAL      PoERR = '3'                                                            
261.00 80423      C                   SETON                                        39                                  
262.00 80423      C                   ENDSL                                                                            
263.00 80423       *                                                                                                   
264.00 80423      C                   WHEN      PiOPT = 'D'                                                            
265.00 80423      C                   SELECT                                                                           
266.00 80423      C                   WHEN      PiMODULE = '01'                                                        
267.00 80423       * CLEAR THE FIELD IN CUP027                                                                         
268.00 80423      C                   EVAL      CUTHR5 = *BLANK                                                        
269.00 80423      C                   UPDATE    CUP0271                                                                
270.00 80423       * MASTER FILE                                                                                       
271.00 80423      C                   EVAL      MCLDTE = TODAYYMD                                                      
272.00 80423      C                   EVAL      CFUPDTE = TODAYYMD                                                     
273.00 80423      C                   EVAL      CFUPUSR = USER                                                         
274.00 80423      C                   UPDATE    RVIPMAST                                                               
275.00 170328 D7100 * DELETE RECORD IN ECSDPF SINCE CANCEL VIP                                                          
276.00 170328 D7100C                   MOVEL     PiCIF         EMKEY                                                    
277.00 170328 D7100C                   EVAL      EMAPPCODE = '90'                                                       
278.00 170328 D7100C                   CALL      'ECSDACTCL'                                                            
279.00 170328 D7100C                   PARM                    CHANNEL           3                                      
280.00 170328 D7100C                   PARM      'DLT '        ACTCODE           4                                      
281.00 170328 D7100C                   PARM                    ACTTYPE           4                                      
282.00 170328 D7100C                   PARM                    EMAPPCODE         2                                      
283.00 170328 D7100C                   PARM                    EMKEY            20                                      
284.00 170328 D7100C                   PARM      'VIP       '  EMCLASS          10                                      
285.00 170328 D7100C                   PARM      'STMT      '  EMTYPE           10                                      
286.00 170328 D7100C                   PARM                    EMSUTYPE          2                                      
287.00 170328 D7100C                   PARM                    EMOP1             1                                      
288.00 170328 D7100C                   PARM                    EMOP2             1                                      
289.00 170328 D7100C                   PARM                    EMOP3             2                                      
290.00 170328 D7100C                   PARM                    EMDATE            8 0                                    
291.00 170328 D7100C                   PARM                    EMTIME            6 0                                    
292.00 170328 D7100C                   PARM                    EMSRUPD          10                                      
293.00 170328 D7100C                   PARM                    EMREL            10                                      
294.00 170328 D7100C                   PARM                    ICBSSTS           1                                      
295.00 170328 D7100C                   PARM                    STS              10                                      
296.00 170328 D7100C                   PARM                    MOMENT           26                                      
297.00 80424       *                                                                                                   
298.00 80612      C                   WHEN      PiMODULE = '02' OR PiMODULE = '03'                                     
299.00 80423       * CREATE FOR MASTER ONLY                                                                            
300.00 80612      C                   EVAL      PoERR = '3'                                                            
301.00 80423      C                   SETON                                        39                                  
302.00 80423      C                   ENDSL                                                                            
303.00 80423       *                                                                                                   
304.00 80423      C                   ENDSL                                                                            
305.00 80423      C                   ENDIF                                                  *END IN39=ON              
306.00 80424       *                                                                                                   
307.00 80424      C                   IF        %OPEN(CUP027)                                                          
308.00 80424      C                   CLOSE     CUP027                                                                 
309.00 80424      C                   ENDIF                                                                            
310.00 80424       *                                                                                                   
311.00 80424      C                   IF        %OPEN(VIPMAST)                                                         
312.00 80424      C                   CLOSE     VIPMAST                                                                
313.00 80424      C                   ENDIF                                                                            
314.00 80424       *                                                                                                   
315.00 80424      C                   IF        %OPEN(VCUSFEE)                                                         
316.00 80424      C                   CLOSE     VCUSFEE                                                                
317.00 80424      C                   ENDIF                                                                            
318.00 80424       *                                                                                                   
319.00 80424       *  LOG                                                                                              
320.00 80424      C                   IF        PiOPT <> 'I' AND PoERR = '0'                                           
321.00 80424      C                   CALL      'VIPWRTLOG'                                                            
322.00 80424      C                   PARM                    PiCIF                                                    
323.00 80424      C                   PARM                    PiOPT                                                    
324.00 80424      C                   PARM                    PiMODULE                                                 
325.00 80424      C                   ENDIF                                                                            
326.00 80418       *                                                                                                   
327.00 80418      C                   SETON                                          LR                                
328.00 70329       ********************************************************************                                
329.00 80421       * Subroutine GVIPMAST - OPEN VIPMAST                                                                
330.00 70329       ********************************************************************                                
331.00 80418      C     GVIPMAST      BEGSR                                                                            
332.00 80418      C                   OPEN      VIPMAST                              40                                
333.00 70329      C                   IF        *IN40 = *ON                                                            
334.00 80418       * ERROR - FAILED TO OPEN VIPMAST                                                                    
335.00 70329      C                   EVAL      PoERR = '1'                                                            
336.00 70329      C                   SETOFF                                       39                                  
337.00 70329      C                   ELSE                                                   *ELSE IN40 =ON            
338.00 80418      C     KEYVIP        CHAIN     VIPMAST                              41                                
339.00 70329      C                   SELECT                                                                           
340.00 70404      C                   WHEN      *IN41 = *ON                                                            
341.00 70404      C                   EVAL      PoERR = '1'                                                            
342.00 70404      C                   SETOFF                                       39                                  
343.00 80418      C                   WHEN      NOT %FOUND(VIPMAST)                                                    
344.00 80418      C                   IF        PiOPT = 'M' OR PiOPT = 'I'                                             
345.00 70329      C                   EVAL      PoERR = '2'                                                            
346.00 70329      C                   SETOFF                                       39                                  
347.00 80418      C                   ENDIF                                                  *END PiOPT=M/I            
348.00 80418      C                   SETON                                        50                                  
349.00 80418      C                   ENDSL                                                                            
350.00 70329      C                   ENDIF                                                  *END IN40 = ON            
351.00 70329      C                                                                                                    
352.00 70329      C                   ENDSR                                                                            
353.00 80418       ********************************************************************                                
354.00 80418       * Subroutine GVCUSFEE - OPEN VCUSFEE                                                                
355.00 80418       ********************************************************************                                
356.00 80418      C     GVCUSFEE      BEGSR                                                                            
357.00 80418      C                   OPEN      VCUSFEE                              40                                
358.00 80418      C                   IF        *IN40 = *ON                                                            
359.00 80418       * ERROR - FAILED TO OPEN VCUSFEE                                                                    
360.00 80418      C                   EVAL      PoERR = '1'                                                            
361.00 80418      C                   SETOFF                                       39                                  
362.00 80418      C                   ELSE                                                   *ELSE IN40 =ON            
363.00 80418      C     KEYVIP        CHAIN     VCUSFEE                              41                                
364.00 80418      C                   SELECT                                                                           
365.00 80418      C                   WHEN      *IN41 = *ON                                                            
366.00 80418      C                   EVAL      PoERR = '1'                                                            
367.00 80418      C                   SETOFF                                       39                                  
368.00 80418      C                   WHEN      NOT %FOUND(VCUSFEE)                                                    
369.00 80418      C                   IF        PiOPT = 'M' OR PiOPT = 'I'                                             
370.00 80418      C                   EVAL      PoERR = '2'                                                            
371.00 80418      C                   SETOFF                                       39                                  
372.00 80418      C                   ENDIF                                                  *END PiOPT=M/I            
373.00 80418      C                   SETON                                        51                                  
374.00 80418      C                   ENDSL                                                                            
375.00 80418      C                   ENDIF                                                  *END IN40 = ON            
376.00 80418      C                                                                                                    
377.00 80418      C                   ENDSR                                                                            
378.00 80611       ********************************************************************                                
379.00 80611       * Subroutine GVIPCARD - OPEN VIPCARD                                                                
380.00 80611       ********************************************************************                                
381.00 80611      C     GVIPCARD      BEGSR                                                                            
382.00 80611      C                   OPEN      VIPCARD                              40                                
383.00 80611      C                   IF        *IN40 = *ON                                                            
384.00 80611       * ERROR - FAILED TO OPEN VIPCARD                                                                    
385.00 80611      C                   EVAL      PoERR = '1'                                                            
386.00 80611      C                   SETOFF                                       39                                  
387.00 80611      C                   ELSE                                                   *ELSE IN40 =ON            
388.00 80612      C     KVCARD        CHAIN     VIPCARD                              41                                
389.00 80611      C                   SELECT                                                                           
390.00 80611      C                   WHEN      *IN41 = *ON                                                            
391.00 80611      C                   EVAL      PoERR = '1'                                                            
392.00 80611      C                   SETOFF                                       39                                  
393.00 80611      C                   WHEN      NOT %FOUND(VIPCARD)                                                    
394.00 80611      C                   IF        PiOPT = 'M' OR PiOPT = 'I'                                             
395.00 80611      C                   EVAL      PoERR = '2'                                                            
396.00 80611      C                   SETOFF                                       39                                  
397.00 80611      C                   ENDIF                                                  *END PiOPT=M/I            
398.00 80611      C                   SETON                                        53                                  
399.00 80611      C                   ENDSL                                                                            
400.00 80611      C                   ENDIF                                                  *END IN40 = ON            
401.00 80611      C                                                                                                    
402.00 80611      C                   ENDSR                                                                            
403.00 80421       ********************************************************************                                
404.00 80421       * Subroutine GCUP027 - READ CUP027                                                                  
405.00 80421       ********************************************************************                                
406.00 80421      C     GCUP027       BEGSR                                                                            
407.00 80421      C                   OPEN      CUP027                               40                                
408.00 80421      C                   IF        *IN40 = *ON                                                            
409.00 80421       * ERROR - FAILED TO OPEN CUP027                                                                     
410.00 80421      C                   EVAL      PoERR = '1'                                                            
411.00 80421      C                   SETOFF                                       39                                  
412.00 80421      C                   ELSE                                                   *ELSE IN40 =ON            
413.00 80421      C     KEYCIF        CHAIN     CUP027                               41                                
414.00 80421      C                   SELECT                                                                           
415.00 80421      C                   WHEN      *IN41 = *ON                                                            
416.00 80421      C                   EVAL      PoERR = '1'                                                            
417.00 80421      C                   SETOFF                                       39                                  
418.00 80423      C                   WHEN      %FOUND(CUP027) AND                                                     
419.00 80423      C                             (PiOPT = 'M' OR PiOPT = 'I')                                           
420.00 80423      C                   EVAL      PVIP = CUTHR5                                                          
421.00 80423      C                   WHEN      NOT %FOUND(CUP027)                                                     
422.00 80423      C                   IF        PiOPT = 'M' OR PiOPT = 'I' OR                                          
423.00 80423      C                             PiOPT = 'D'                                                            
424.00 80421      C                   EVAL      PoERR = '2'                                                            
425.00 80421      C                   SETOFF                                       39                                  
426.00 80421      C                   ENDIF                                                  *END PiOPT=M/I            
427.00 80421      C                   SETON                                        52                                  
428.00 80421      C                   ENDSL                                                                            
429.00 80421      C                   ENDIF                                                  *END IN40 = ON            
430.00 80421      C                                                                                                    
431.00 80421      C                   ENDSR                                                                            
432.00 80423       ********************************************************************                                
433.00 80423       * Subroutine UCUP027 - UPDATE CUP027                                                                
434.00 80423       ********************************************************************                                
435.00 80423      C     UCUP027       BEGSR                                                                            
436.00 80423       *                                                                                                   
437.00 80423      C   52              EVAL      CUBK = BKNO                                                            
438.00 80423      C   52              EVAL      CUNBR = PiCIF                                                          
439.00 80423      C                   EVAL      CUTHR5 = PVIP                                                          
440.00 80423       *                                                                                                   
441.00 80423      C   52              WRITE     CUP0271                                                                
442.00 80423      C  N52              UPDATE    CUP0271                                                                
443.00 80423      C                                                                                                    
444.00 80423      C                   ENDSR                                                                            
445.00 80423       ********************************************************************                                
446.00 80423       * Subroutine UVCUSFEE - UPDATE UVCUSFEE                                                             
447.00 80423       ********************************************************************                                
448.00 80423      C     UVCUSFEE      BEGSR                                                                            
449.00 80423       *                                                                                                   
450.00 80424      C   51              CLEAR                   DTACFEE                                                  
451.00 80423      C   51              EVAL      CFCIF   = PiCIF                                                        
452.00 80423      C                   EVAL      CFUPDTE = TODAYYMD                                                     
453.00 80423      C                   EVAL      CFUPUSR = USER                                                         
454.00 80423       *                                                                                                   
455.00 80423      C     KEYDEFFEE     CHAIN     DEFVFEE                                                                
456.00 80423      C                   IF        %FOUND(DEFVFEE)                                                        
457.00 80423      C                   EVAL      CFAFFLG   =  FFAFFLG                                                   
458.00 80423      C                   EVAL      CFAFWSTDT =  FFAFWSTDT                                                 
459.00 80423      C                   EVAL      CFAFWEDDT =  FFAFWEDDT                                                 
460.00 80423      C                   EVAL      CFAFDISC  =  FFAFDISC                                                  
461.00 80423      C                   EVAL      CFAFDSTDT =  FFAFDSTDT                                                 
462.00 80423      C                   EVAL      CFAFDEDDT =  FFAFDEDDT                                                 
463.00 80423      C                   EVAL      CFMPFLG   =  FFMPFLG                                                   
464.00 80423      C                   EVAL      CFMPWSTDT =  FFMPWSTDT                                                 
465.00 80423      C                   EVAL      CFMPWEDDT =  FFMPWEDDT                                                 
466.00 80423      C                   EVAL      CFMPDISC  =  FFMPDISC                                                  
467.00 80423      C                   EVAL      CFMPDSTDT =  FFMPDSTDT                                                 
468.00 80423      C                   EVAL      CFMPDEDDT =  FFMPDEDDT                                                 
469.00 80423      C                   ENDIF                                                                            
470.00 80423       *                                                                                                   
471.00 80423      C   51              WRITE     RVCUSFEE                                                               
472.00 80423      C  N51              UPDATE    RVCUSFEE                                                               
473.00 80423       *                                                                                                   
474.00 80423      C                   ENDSR                                                                            
475.00 80611       ********************************************************************                                
476.00 80611       * Subroutine UVIPCARD - UPDATE UVCUSFEE                                                             
477.00 80611       ********************************************************************                                
478.00 80611      C     UVIPCARD      BEGSR                                                                            
479.00 80611       *                                                                                                   
480.00 80616      C   53              CLEAR                   DTCARD                                                   
481.00 80618      C   53              EVAL      CRGIND  = 'Y'                                                          
482.00 80612       *                                                                                                   
483.00 80612      C                   EVAL      CRCIF   = PiCIF                                                        
484.00 80611      C                   EVAL      CRLDTE  = TODAYYMD                                                     
485.00 80611      C                   EVAL      CRLUSR  = USER                                                         
486.00 80611       *                                                                                                   
487.00 80612      C   53              WRITE     RVIPCARD                                                               
488.00 80612      C  N53              UPDATE    RVIPCARD                                                               
489.00 80611       *                                                                                                   
490.00 80611      C                   ENDSR                                                                            
