1.00 20307      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                      
2.00 20319       **************************************************************************                    
3.00 170328       * REFERENCE NO. : CHG-0100-17 (D7100)                                                         
4.00 160817       * PROGRAM ID.   : ECSDAPP                                                                     
5.00 170120       * DESC          : Main Screen of ECSD Application                                             
6.00 161026       * AUTHOR        : Myles Ieong                                                                 
7.00 160607       * USER ID.      : BI77PGM                                                                     
8.00 170328       * DATE WRITTEN  : 28 Mar 2017                                                                 
9.00 150727       **************************************************************************                    
10.00 170818       * REFERENCE        : CHG-0278-17                                       *                      
11.00 170731       * AUTHOR           : Myles Ieong (BI77PGM)                             *                      
12.00 170731       * DATE             : 31 Jul 2017                                       *                      
13.00 170818       * PROGRAM DESC     : 1. Add F9 Function Estatement All                 *                      
14.00 170818       *                    2. Update DECHSTSCL module output parsing         *                      
15.00 170731       ************************************************************************                      
16.00 160607      F**********************************************************************                        
17.00 160607      F*                         File Specification                         *                        
18.00 160607      F**********************************************************************                        
19.00 160817      FECSDAPPD  CF   E             WORKSTN                                                          
20.00 160830      F                                     SFILE(ECSD00SFL:SRRN)                                    
21.00 150527      F                                     INFDS(WSDTAS)                                            
22.00 160901      FECSDPF    IF   E           K DISK                                                             
23.00 160817      FECSDCONF  IF   E           K DISK                                                             
24.00 170328      FECSDREL   IF   E           K DISK                                                             
25.00 161026       *    ICBS Standard Files                                                                      
26.00 161026      FCUP009L7  IF A E           K DISK                                                             
27.00 161028      FCUP003    IF A E           K DISK                                                             
28.00 161028      FTAP002    IF A E           K DISK                                                             
29.00 170116       *    Credit card files                                                                        
30.00 170308      FZPDCRCDCL1IF A E           K DISK    RENAME(RZPDCRCDC:RZPDCRCDC1)                             
31.00 170308      FZPDCRCDCL2IF A E           K DISK    RENAME(RZPDCRCDC:RZPDCRCDC2)                             
32.00 170308      FZPDCRCUCS1IF A E           K DISK                                                             
33.00 170308      F                                                                                              
34.00 170308      F**********************************************************************                        
35.00 170308      F*                         Function Description                       *                        
36.00 160607      F**********************************************************************                        
37.00 160829      F*              *IN70: General error indicator  (*ON: failed)                                  
38.00 161027      F*              *IN71: Invalid Customer/Account                                                
39.00 161027      F*              *IN72: Not Authorized                                                          
40.00 170731      F*              *IN73: Invalid Option(already performed/not applicable)                        
41.00 161027      F*              *IN74: Record Not Found                                                        
42.00 170731      F*              *IN75: Invalid Application Code                                                
43.00 160901      F**                                                                                            
44.00 160607      D**********************************************************************                        
45.00 160607      D*                   Variables / constant defination                  *                        
46.00 160607      D**********************************************************************                        
47.00 160830       *    Global variables (flowable)                                                              
48.00 170123      DMSG000           S             70    INZ('Invalid parameters')                                
49.00 170123      DMSG071           S             70    INZ('Customer/account not found')                        
50.00 161020      DMSG072           S             70    INZ('You are not authorized for the -                    
51.00 161020      D                                     operation')                                              
52.00 170119      DMSG073           S             70    INZ('Invalid option')                                    
53.00 161124      DMSG074A          S             70    INZ('VIP record not found')                              
54.00 161124      DMSG074B          S             70    INZ('Account record not found')                          
55.00 161027      DMSG075           S             70    INZ('Invalid application code')                          
56.00 170117      DMSGCRD           S             70    INZ('Credit card operation not allow-                    
57.00 170117      D                                     ed.')                                                    
58.00 170308      DMSGSUC           S             70    INZ('Action performed')                                  
59.00 160830       *    Screen user variables                                                                    
60.00 20305      D DSPGID         SDS                                                                           
61.00 30113      D  WKDATE               191    198  0                                                          
62.00 20425      D  WKSTN                244    253                                                             
63.00 70118      D  WUSER                254    263                                                             
64.00 150527      DWSDTAS           DS                                                                           
65.00 150527      DCSRLOC                 370    371B 0                                                          
66.00 161027       *    Data Structure of 12-digit account number in tap002                                      
67.00 161027      D                 DS                                                                           
68.00 161027      DVACC                     1     12                                                             
69.00 161027      D VACCPRE                 1      2                                                             
70.00 161027      D VACCNBR                 3     12                                                             
71.00 170117       *    Valid/Invalid Code of Credit card                                                        
72.00 170308      DVCRVALSTS        C                   CONST('012')                                             
73.00 170308      DVCRINVBLK        C                   CONST('LUENSAQYXO')                                      
74.00 170308      DVCRAPPCODE       C                   CONST('70')                                              
75.00 170308      DVCRCLASS         C                   CONST('CRDT')                                            
76.00 170308      DVCRTYPE          C                   CONST('STMT')                                            
77.00 170308      DVCRSUTYPE        C                   CONST('')                                                
78.00 170308      DVCRDESC          C                   CONST('CREDIT CARD STATEMENT')                           
79.00 170818 D7278 *    Black list (not going to be update) of F9 Estate All Function                            
80.00 170818 D7278DVBLKLST          S              3    DIM(7) CTDATA                                            
81.00 160607      C**********************************************************************                        
82.00 160607      C*                         Key List define                            *                        
83.00 160615      C**********************************************************************                        
84.00 160818      C     KECSDPF       KLIST                                                                      
85.00 160818      C                   KFLD                    KEMAPPCODE        2                                
86.00 160818      C                   KFLD                    KEMKEY           20                                
87.00 160818      C                                                                                              
88.00 160818      C     KECSDCONF     KLIST                                                                      
89.00 170308      C                   KFLD                    KECCLASS         10                                
90.00 160818      C                   KFLD                    KECTYPE          10                                
91.00 160818      C                   KFLD                    KECSUTYPE         2                                
92.00 161026      C                                                                                              
93.00 161027      C     KCUP009L7     KLIST                                                                      
94.00 161027      C                   KFLD                    KCUXBK            3 0                              
95.00 161027      C                   KFLD                    KCUXREC           1                                
96.00 161027      C                   KFLD                    KCUX1CS          10                                
97.00 161027      C                   KFLD                    KCUX1AC          12 0                              
98.00 161027      C                                                                                              
99.00 161028      C     KCUP003       KLIST                                                                      
100.00 161028      C                   KFLD                    KCUBK             3 0                              
101.00 161028      C                   KFLD                    KCUNBR           10                                
102.00 161028      C                                                                                              
103.00 161028      C     KTAP002       KLIST                                                                      
104.00 161028      C                   KFLD                    KDMBK             3 0                              
105.00 161028      C                   KFLD                    KDMTYP            1 0                              
106.00 161028      C                   KFLD                    KDMACCT          10 0                              
107.00 170116      C                                                                                              
108.00 170308      C     KZPDCRCDCL1   KLIST                                                                      
109.00 170308      C                   KFLD                    KCHLACHACCT      16 0                              
110.00 170308      C                                                                                              
111.00 170308      C     KZPDCRCDCL2   KLIST                                                                      
112.00 170308      C                   KFLD                    KCHLCARDNO       16 0                              
113.00 170308      C                                                                                              
114.00 170308      C     KZPDCRCUCS1   KLIST                                                                      
115.00 170308      C                   KFLD                    KCORGCDE          3 0                              
116.00 170308      C                   KFLD                    KCACNO           16 0                              
117.00 170328       *                                                                                             
118.00 161027      C**********************************************************************                        
119.00 161025      C*                         Parameter List                             *                        
120.00 161025      C**********************************************************************                        
121.00 161026      C     *ENTRY        PLIST                                                                      
122.00 161026      C                   PARM                    PEMAPPCODE        2                                
123.00 161026      C                   PARM                    PEMKEY           20                                
124.00 161025      C*                                                                                             
125.00 160607      C**********************************************************************                        
126.00 160607      C*                          MAIN PROGRAM                              *                        
127.00 160607      C**********************************************************************                        
128.00 160829       *    Initialize screen                                                                        
129.00 161027      C                   IF        PEMAPPCODE <> '' AND PEMKEY <> ''                                
130.00 161027      C                   EVAL      SAPP = PEMAPPCODE                                                
131.00 161027      C                   EVAL      SKEY = PEMKEY                                                    
132.00 161027      C                   ENDIF                                                                      
133.00 170818      C                                                                                              
134.00 170818 D7278 *    Set hidden-screen-field that controls F9- Estate All function                            
135.00 170818 D7278C                   EVAL      SFILTER = 'Y'                                                    
136.00 161027      C                                                                                              
137.00 161124       *    Format the input and first fetch of data to present a screen                             
138.00 161124      C                   IF        SAPP = '20' OR SAPP = '26' OR SAPP = '90'    *add lead-0 to key  
139.00 161124      C                   Z-ADD     0             VINDEX            3 0                              
140.00 161124      C                   Z-ADD     0             VLENGTH           3 0                              
141.00 161124      C                   EVAL      VLENGTH = %LEN(%TRIM(SKEY))                                      
142.00 161124      C                   IF        VLENGTH < 10                                                     
143.00 161124      C                   FOR       VINDEX = 1 TO 10 - VLENGTH                                       
144.00 161124      C                   EVAL      SKEY = '0' + %TRIM(SKEY)                                         
145.00 161124      C                   ENDFOR                                                                     
146.00 161124      C                   ENDIF                                                                      
147.00 161124      C                   ENDIF                                                                      
148.00 170119      C                                                                                              
149.00 170119       *    Format the input to left aling for credit card                                           
150.00 170308      C                   IF        SAPP = '70'                                                      
151.00 170308      C                   EVAL      SKEY = %TRIM(SKEY)                                               
152.00 170308      C                   ENDIF                                                                      
153.00 170308      C                                                                                              
154.00 170308      C                   EXSR      INZ00SFL                                                         
155.00 170308      C                   EXSR      INZ00SCN                                                         
156.00 170308      C                   EXSR      WRT00SFLA                                    *WRT DIRECT RECORD  
157.00 170308      C                                                                                              
158.00 170308      C                   IF        SACCLVL = 'Y' AND SAPP = '90'                                    
159.00 170308      C                   EXSR      WRT00SFLB                                    *WRT ACC LVL RECORD 
160.00 170308      C                   EXSR      WRT00SFLC                                    *WRT CRD CARD RECs  
161.00 170308      C                   ENDIF                                                                      
162.00 161223      C                                                                                              
163.00 161124      C                   EXSR      CLS00SFL                                                         
164.00 161124      C                   WRITE     ECSD00FK                                                         
165.00 161124      C                   EXFMT     ECSD00                                                           
166.00 161124      C                   EVAL      SMSG = ''                                                        
167.00 161124      C                   EVAL      SNAME = ''                                                       
168.00 161123      C                                                                                              
169.00 160525      C                   DOW       *IN03 = *OFF                                                     
170.00 160829      C                                                                                              
171.00 160829       **   Catch option input from user                                                             
172.00 160901      C                   IF        SRRN > 0                                                         
173.00 160901      C                   READC     ECSD00SFL                              88                        
174.00 160901      C                   DOW       *IN88 = *OFF                                                     
175.00 160830       ***  Option 1: enquiry                                                                        
176.00 160901      C                   IF        DOPT = '1'                                                       
177.00 160901      C                   EXSR      OPT01                                                            
178.00 160830      C                   ENDIF                                                                      
179.00 160830      C                                                                                              
180.00 170328       ***  Option 2: E-Statement Only                                                               
181.00 160901      C                   IF        DOPT = '2'                                                       
182.00 160901      C                   EXSR      OPT02                                                            
183.00 160830      C                   ENDIF                                                                      
184.00 160830      C                                                                                              
185.00 170328       ***  Option 3: E-Statement and Physical                                                       
186.00 160901      C                   IF        DOPT = '3'                                                       
187.00 160901      C                   EXSR      OPT03                                                            
188.00 160830      C                   ENDIF                                                                      
189.00 160830      C                                                                                              
190.00 160901      C                   READC     ECSD00SFL                              88                        
191.00 160830      C                                                                                              
192.00 160829      C                   ENDDO                                                                      
193.00 160829      C                   ENDIF                                                                      
194.00 160829      C                                                                                              
195.00 160829       **   Catch f6 press event                                                                     
196.00 160829      C                   IF        *IN06 = *ON                                                      
197.00 170328      C                   EXSR      OPTF6                                        *Launch the ACT     
198.00 160829      C                   ENDIF                                                                      
199.00 160613      C                                                                                              
200.00 170818 D7278 **   Catch f9 press event                                                                     
201.00 170818 D7278C                   IF        *IN09 = *ON                                                      
202.00 170818 D7278C                   EXSR      OPTF9                                        *Launch the ACT     
203.00 170818 D7278C                   ENDIF                                                                      
204.00 170818 D7278C                                                                                              
205.00 170119       **   Refresh: Format the input and first fetch of data to present a screen                    
206.00 161118      C                   IF        SAPP = '20' OR SAPP = '26' OR SAPP = '90'    *add lead-0 to key  
207.00 161118      C                   Z-ADD     0             VINDEX            3 0                              
208.00 161118      C                   Z-ADD     0             VLENGTH           3 0                              
209.00 161118      C                   EVAL      VLENGTH = %LEN(%TRIM(SKEY))                                      
210.00 161118      C                   IF        VLENGTH < 10                                                     
211.00 161118      C                   FOR       VINDEX = 1 TO 10 - VLENGTH                                       
212.00 161118      C                   EVAL      SKEY = '0' + %TRIM(SKEY)                                         
213.00 161118      C                   ENDFOR                                                                     
214.00 161118      C                   ENDIF                                                                      
215.00 161118      C                   ENDIF                                                                      
216.00 170119      C                                                                                              
217.00 170308       **   Refresh: Format the input to left aling for credit card                                  
218.00 170308      C                   IF        SAPP = '70'                                                      
219.00 170308      C                   EVAL      SKEY = %TRIM(SKEY)                                               
220.00 170308      C                   ENDIF                                                                      
221.00 170308      C                                                                                              
222.00 170308      C                   EXSR      INZ00SFL                                                         
223.00 170308      C                   EXSR      INZ00SCN                                                         
224.00 170308      C                   EXSR      WRT00SFLA                                    *WRT DIRECT RECORD  
225.00 170308      C                   IF        SACCLVL = 'Y' AND SAPP = '90'                                    
226.00 170308      C                   EXSR      WRT00SFLB                                    *WRT ACC LVL RECORD 
227.00 170308      C                   EXSR      WRT00SFLC                                    *WRT CRD CARD RECs  
228.00 170308      C                   ENDIF                                                                      
229.00 170308      C                   EXSR      CLS00SFL                                                         
230.00 170308      C                   WRITE     ECSD00FK                                                         
231.00 170308      C                   EXFMT     ECSD00                                                           
232.00 170308      C                   EVAL      SMSG = ''                                                        
233.00 170308      C                   EVAL      SNAME = ''                                                       
234.00 170308      C                                                                                              
235.00 170308      C                   ENDDO                                                                      
236.00 160829      C                                                                                              
237.00 61106      C                   SETON                                        LR                            
238.00 160607      C**********************************************************************                        
239.00 160829      C*                  Subroutine: INZ00SFL                                                       
240.00 160607      C**********************************************************************                        
241.00 160829      C     INZ00SFL      BEGSR                                                                      
242.00 160623      C                   Z-ADD     0             SRRN                                               
243.00 160623      C                   SETON                                        53                            
244.00 160623      C                   SETOFF                                       51                            
245.00 160830      C                   WRITE     ECSD00                                                           
246.00 160623      C                   SETOFF                                       53                            
247.00 160623      C                   SETON                                        51                            
248.00 161118      C                   ENDSR                                                                      
249.00 161118      C**********************************************************************                        
250.00 161118      C*                  Subroutine: INZ00SCN                                                       
251.00 161118      C**********************************************************************                        
252.00 161118      C     INZ00SCN      BEGSR                                                                      
253.00 161031       *    init to default value                                                                    
254.00 161027      C                   IF        SACCLVL = ''                                                     
255.00 161027      C                   EVAL      SACCLVL = 'Y'                                                    
256.00 161027      C                   ENDIF                                                                      
257.00 161031      C                                                                                              
258.00 161031       *    fetch cif name if app - 90 and cif found                                                 
259.00 161115      C                   IF        SAPP = '90'                                                      
260.00 161115      C                   EVAL      KCUBK = 1                                                        
261.00 161115      C                   EVAL      KCUNBR = SKEY                                                    
262.00 161115      C     KCUP003       CHAIN     CUP003                                                           
263.00 161115      C                   IF        %FOUND(CUP003)                                                   
264.00 161115      C                   EVAL      SNAME = CUNA1                                                    
265.00 161115      C                   ENDIF                                                                      
266.00 161115      C                   ENDIF                                                                      
267.00 161115      C                                                                                              
268.00 161031       *    fetch acc name if app - 20 and acc found                                                 
269.00 161115      C                   IF        SAPP = '20'                                                      
270.00 161115      C                   EVAL      KDMBK = 1                                                        
271.00 161115      C                   EVAL      KDMTYP = 6                                                       
272.00 161115      C                   MOVEL     SKEY          KDMACCT                                            
273.00 161115      C     KTAP002       CHAIN     TAP002                                                           
274.00 161115      C                   IF        %FOUND(TAP002)                                                   
275.00 161115      C                   EVAL      SNAME = DMSHRT                                                   
276.00 161115      C                   ENDIF                                                                      
277.00 161115      C                   ENDIF                                                                      
278.00 161031      C                                                                                              
279.00 161031       *    fetch acc name if app - 26 and acc found                                                 
280.00 161115      C                   IF        SAPP = '26'                                                      
281.00 161115      C                   EVAL      KDMBK = 1                                                        
282.00 161115      C                   EVAL      KDMTYP = 1                                                       
283.00 161115      C                   MOVEL     SKEY          KDMACCT                                            
284.00 161115      C     KTAP002       CHAIN     TAP002                                                           
285.00 161115      C                   IF        %FOUND(TAP002)                                                   
286.00 161115      C                   EVAL      SNAME = DMSHRT                                                   
287.00 161115      C                   ENDIF                                                                      
288.00 161115      C                   ENDIF                                                                      
289.00 161031      C                                                                                              
290.00 170119       *    fetch the ebank status                                                                   
291.00 170308      C                   IF        SAPP = '90' AND SKEY<>''                                         
292.00 170308      C                   CALL      'DECHSTSCL'                                                      
293.00 170308      C                   PARM                    SKEY                                               
294.00 170308      C                   PARM                    PCIFSTS           1                                
295.00 170308      C                   PARM                    PECHSTS          10                                
296.00 170308      C                   PARM                    PRTNCD            1                                
297.00 170308      C                                                                                              
298.00 170821 D7278C*                  IF        PRTNCD = '0' AND %SUBST(PECHSTS:1:1) = '1'                       
299.00 170821 D7278C                   IF        PRTNCD = '0' AND %SUBST(PECHSTS:1:1) <='5'                       
300.00 170821      C                   EVAL      SEBANK = 'Y'                                                     
301.00 170821 D7278C*                  ENDIF                                                                      
302.00 170821 D7278C*                  IF        PRTNCD = '0' AND %SUBST(PECHSTS:1:1) <> '1'                      
303.00 170821 D7278C                   ELSE                                                                       
304.00 170821      C                   EVAL      SEBANK = 'N'                                                     
305.00 170821      C                   ENDIF                                                                      
306.00 170821 D7278C                                                                                              
307.00 170821      C                   IF        PRTNCD <> '0'                                                    
308.00 170821      C                   EVAL      SEBANK = 'N'                                                     
309.00 170821      C                   ENDIF                                                                      
310.00 170308      C                                                                                              
311.00 170308      C                   ENDIF                                                                      
312.00 170123      C                                                                                              
313.00 170308       *    fetch the ebank status                                                                   
314.00 170308      C                   IF        (SAPP = '90' AND SKEY = '')                                      
315.00 170308      C                             OR SAPP <> '90'                                                  
316.00 170308      C                   EVAL      SEBANK = ' '                                                     
317.00 170308      C                   ENDIF                                                                      
318.00 170308      C                                                                                              
319.00 170308      C                   ENDSR                                                                      
320.00 170308      C**********************************************************************                        
321.00 170308      C*                  Subroutine: WRT00SFLA                             *                        
322.00 170308      C*          WRITE SPL FOR DIRECT SEARCH BY SAPP AND SKEY              *                        
323.00 170308      C**********************************************************************                        
324.00 170308      C     WRT00SFLA     BEGSR                                                                      
325.00 170308      C                                                                                              
326.00 170308      C                   SETOFF                                       70        *general err indi   
327.00 170308      C                   SETOFF                                       717273                        
328.00 170308      C                   SETOFF                                       7475                          
329.00 170308      C                                                                                              
330.00 170308       *    Check application code is limited to 20/26/90 or *empty                                  
331.00 170308      C                   IF        SAPP<>'20' AND SAPP<>'26' AND SAPP<>'90'                         
332.00 170308      C                             AND SAPP<>'70' AND SAPP<>'  '                                    
333.00 170308      C                   SETON                                        75                            
334.00 161028      C                   EVAL      SMSG=MSG075                                                      
335.00 161028      C                   ENDIF                                                                      
336.00 161028      C                                                                                              
337.00 161031       *    Check stmt record of sapp:skey exist in ecsd master pf                                   
338.00 170308      C                   IF        SAPP<>'70'                                                       
339.00 161031      C                   EVAL      KEMAPPCODE = SAPP                                                
340.00 161031      C                   EVAL      KEMKEY = SKEY                                                    
341.00 161031      C     KECSDPF       CHAIN     ECSDPF                                                           
342.00 161031      C                   IF        NOT %FOUND(ECSDPF)                                               
343.00 161031      C                   SETON                                        74                            
344.00 161031      C                   ENDIF                                                                      
345.00 170308      C                   ENDIF                                                                      
346.00 161031      C                                                                                              
347.00 161028       *    Check account/customer exist in icbs database                                            
348.00 161031      C                   IF        SAPP = '90'                                                      
349.00 161028      C                   EVAL      KCUBK = 1                                                        
350.00 161028      C                   EVAL      KCUNBR = SKEY                                                    
351.00 161028      C     KCUP003       CHAIN     CUP003                                                           
352.00 161028      C                   IF        NOT %FOUND(CUP003)                                               
353.00 161028      C                   SETON                                        71                            
354.00 161028      C                   EVAL      SMSG=MSG071                                                      
355.00 161028      C                   ENDIF                                                                      
356.00 161028      C                   ENDIF                                                                      
357.00 161028      C                                                                                              
358.00 161028      C                   IF        SAPP = '20'                                                      
359.00 161028      C                   EVAL      KDMBK = 1                                                        
360.00 161115      C                   EVAL      KDMTYP = 6                                                       
361.00 161115      C                   MOVEL     SKEY          KDMACCT                                            
362.00 161115      C     KTAP002       CHAIN     TAP002                                                           
363.00 161028      C                   IF        NOT %FOUND(TAP002)                                               
364.00 161028      C                   SETON                                        71                            
365.00 161028      C                   EVAL      SMSG=MSG071                                                      
366.00 161028      C                   ENDIF                                                                      
367.00 161028      C                   ENDIF                                                                      
368.00 161028      C                                                                                              
369.00 161028      C                   IF        SAPP = '26'                                                      
370.00 161028      C                   EVAL      KDMBK = 1                                                        
371.00 161115      C                   EVAL      KDMTYP = 1                                                       
372.00 161115      C                   MOVEL     SKEY          KDMACCT                                            
373.00 161028      C     KTAP002       CHAIN     TAP002                                                           
374.00 161028      C                   IF        NOT %FOUND(TAP002)                                               
375.00 161028      C                   SETON                                        71                            
376.00 161028      C                   EVAL      SMSG=MSG071                                                      
377.00 161028      C                   ENDIF                                                                      
378.00 161028      C                   ENDIF                                                                      
379.00 170119      C                                                                                              
380.00 170308      C                   IF        SAPP = '70'                                                      
381.00 170308      C                   Z-ADD     0             KCHLCARDNO                                         
382.00 170308      C                   EVAL      KCHLCARDNO = %INT(%TRIM(SKEY))                                   
383.00 170308      C     KZPDCRCDCL2   CHAIN     ZPDCRCDCL2                                                       
384.00 170308      C                   IF        NOT %FOUND(ZPDCRCDCL2)                                           
385.00 170308      C                   SETON                                        71                            
386.00 170308      C                   EVAL      SMSG=MSG071                                                      
387.00 170308      C                   ENDIF                                                                      
388.00 170308      C                   ENDIF                                                                      
389.00 170308      C                                                                                              
390.00 161028      C                   IF        *IN71=*ON OR *IN72=*ON OR *IN73=*ON                              
391.00 161028      C                             OR *IN74=*ON OR *IN75=*ON                                        
392.00 160829      C                   SETON                                        70                            
393.00 160829      C                   ENDIF                                                                      
394.00 160829      C                                                                                              
395.00 160901       *    DO start                                                                                 
396.00 160829      C                   IF        *IN70 = *OFF                                                     
397.00 170119      C                                                                                              
398.00 170308      C                   IF        SAPP='20' OR SAPP='26' OR SAPP='90'                              
399.00 170308      C                                                                                              
400.00 170308      C                   EVAL      KEMAPPCODE = SAPP                                                
401.00 170308      C                   EVAL      KEMKEY = SKEY                                                    
402.00 170308      C     KECSDPF       CHAIN     ECSDPF                             52                            
403.00 170308      C                   IF        %FOUND(ECSDPF)                                                   
404.00 170308      C                   EVAL      KECCLASS = EMCLASS                                               
405.00 170308      C                   EVAL      KECTYPE = EMTYPE                                                 
406.00 170308      C                   EVAL      KECSUTYPE= EMSUTYPE                                              
407.00 170308      C                   EVAL      DDESC = ''                                                       
408.00 170308      C     KECSDCONF     CHAIN     ECSDCONF                                                         
409.00 170308      C                   EVAL      DOPT      = ' '                                                  
410.00 170308      C                   EVAL      DEMAPPCODE = EMAPPCODE                                           
411.00 170308      C                   EVAL      DEMKEY = EMKEY                                                   
412.00 170308      C                   MOVEL     EMCLASS       DEMCLASS                                           
413.00 170308      C                   MOVEL     EMTYPE        DEMTYPE                                            
414.00 170308      C                   EVAL      DEMSUTYPE = EMSUTYPE                                             
415.00 170308      C                   IF        %FOUND(ECSDCONF)                                                 
416.00 170308      C                   EVAL      DDESC = %SUBST(ECDESC:1:20)                                      
417.00 170308      C                   ENDIF                                                                      
418.00 170308      C                   EVAL      DEMOP1 = EMOP1                                                   
419.00 170308      C                   EVAL      DCUXREL = ''                                                     
420.00 170308      C                   EVAL      SRRN = SRRN + 1                                                  
421.00 170308      C                   WRITE     ECSD00SFL                                                        
422.00 170308      C                   ENDIF                                                                      
423.00 170308      C                                                                                              
424.00 170308      C                   ENDIF                                                                      
425.00 170308      C                                                                                              
426.00 170308      C                   IF        SAPP = '70'                                                      
427.00 170308      C                                                                                              
428.00 170308      C                   Z-ADD     0             KCHLCARDNO                                         
429.00 170308      C                   EVAL      KCHLCARDNO = %INT(%TRIM(SKEY))                                   
430.00 170308      C     KZPDCRCDCL2   CHAIN     ZPDCRCDCL2                                                       
431.00 170308      C                   IF        %FOUND(ZPDCRCDCL2)                                               
432.00 170308      C                   IF        %SCAN(CHLCRDSTS:VCRVALSTS) <> 0                                  
433.00 170308      C                             AND %SCAN(CHLBLKCDE:VCRINVBLK)=0                                 
434.00 170308      C                   EVAL      DEMAPPCODE = VCRAPPCODE                                          
435.00 170308      C                   EVAL      DEMKEY = ''                                                      
436.00 170308      C                   MOVEL     CHLCARDNO     DEMKEY                                             
437.00 170308      C                   EVAL      DEMCLASS = VCRCLASS                                              
438.00 170308      C                   EVAL      DEMTYPE = VCRTYPE                                                
439.00 170308      C                   EVAL      DEMSUTYPE = VCRSUTYPE                                            
440.00 170308      C                   EVAL      DDESC = VCRDESC                                                  
441.00 170308      C                   EVAL      DEMOP1 = ''                                                      
442.00 170308      C                   MOVE      CHLCRORGNO    KCORGCDE                                           
443.00 170308      C                   MOVE      CHLCRACCNO    KCACNO                                             
444.00 170308      C     KZPDCRCUCS1   CHAIN     ZPDCRCUCS1                                                       
445.00 170308      C                   IF        %FOUND(ZPDCRCUCS1)                                               
446.00 170308      C                   IF        CSUPPHSTM = 'Y'                                                  
447.00 170308      C                   EVAL      DEMOP1 = 'Y'                                                     
448.00 170308      C                   ENDIF                                                                      
449.00 170308      C                   IF        CSUPPHSTM = 'N'                                                  
450.00 170308      C                   EVAL      DEMOP1 = 'B'                                                     
451.00 170308      C                   ENDIF                                                                      
452.00 170308      C                   ENDIF                                                                      
453.00 170308      C                   EVAL      DCUXREL = ''                                                     
454.00 170308      C                   EVAL      SRRN = SRRN + 1                                                  
455.00 170308      C                   WRITE     ECSD00SFL                                                        
456.00 170308      C                   ENDIF                                                                      
457.00 170308      C                   ENDIF                                                                      
458.00 170308      C                                                                                              
459.00 170308      C                   ENDIF                                                                      
460.00 170308      C                                                                                              
461.00 170308      C                   ENDIF                                                                      
462.00 170308      C                                                                                              
463.00 170308      C                   ENDSR                                                                      
464.00 161027      C**********************************************************************                        
465.00 161027      C*                  Subroutine: WRT00SFLB                             *                        
466.00 161027      C*          Write SPL For Account Level Search when SKEY is CIF       *                        
467.00 161027      C**********************************************************************                        
468.00 161027      C     WRT00SFLB     BEGSR                                                                      
469.00 161027      C                                                                                              
470.00 161027      C                   SETOFF                                       70        *general err indi   
471.00 161028      C                   SETOFF                                       717273                        
472.00 161028      C                   SETOFF                                       7475                          
473.00 161027      C                                                                                              
474.00 161027       *    CHK- check search parameter eligibility                                                  
475.00 161027      C                   IF        SAPP='' OR SKEY =''                                              
476.00 161027      C                             OR (SACCLVL<>'Y' AND SACCLVL<>'N')                               
477.00 161027      C                   SETON                                        71                            
478.00 161028      C                   EVAL      SMSG=MSG071                                                      
479.00 161027      C                   ENDIF                                                                      
480.00 161027      C                                                                                              
481.00 161027      C                   IF        SACCLVL <> 'Y' OR SAPP <> '90'                                   
482.00 161027      C                   SETON                                        71                            
483.00 161028      C                   EVAL      SMSG=MSG071                                                      
484.00 161027      C                   ENDIF                                                                      
485.00 161027      C                                                                                              
486.00 170308       *    CHK- check CIF's existence                                                               
487.00 161124      C                   EVAL      KCUXBK = 1                                                       
488.00 161124      C                   EVAL      KCUXREC = '1'                                                    
489.00 161124      C                   MOVEL     SKEY          KCUX1CS                                            
490.00 161124      C                   MOVE      *BLANK        KCUX1AC                                            
491.00 161124      C     KCUP009L7     SETLL     CUP009L7                                                         
492.00 161124      C                   READ      CUP009L7                                                         
493.00 161124      C                   IF        %EOF(CUP009L7)                                                   
494.00 161124      C                   SETON                                        74                            
495.00 161124      C                   EVAL      SMSG = MSG074B                                                   
496.00 161124      C                   ENDIF                                                                      
497.00 170308      C                                                                                              
498.00 170308      C                   IF        *IN71=*ON OR *IN74=*ON                                           
499.00 161124      C                   SETON                                        70                            
500.00 161027      C                   ENDIF                                                                      
501.00 161027      C                                                                                              
502.00 161027      C                   IF        *IN70 = *OFF                                                     
503.00 170308       *    DO - Add account level search result to subfile                                          
504.00 161027      C                   EVAL      KCUXBK = 1                                                       
505.00 161027      C                   EVAL      KCUXREC = '1'                                                    
506.00 161027      C                   MOVEL     SKEY          KCUX1CS                                            
507.00 161027      C                   MOVE      *BLANK        KCUX1AC                                            
508.00 161027      C     KCUP009L7     SETLL     CUP009L7                                                         
509.00 161027      C                   READ      CUP009L7                                                         
510.00 161027      C                                                                                              
511.00 161027      C                   DOW       NOT %EOF(CUP009L7)                                               
512.00 161027      C                             AND CUX1CS=%SUBST(SKEY:1:10)                                     
513.00 161027      C                                                                                              
514.00 161027       **   Parse CUX1AP and CUX1AC to fit key format of ECSDPF                                      
515.00 161027       **   (only applicable for current and saving accounts)                                        
516.00 161027      C                   MOVE      CUX1AC        VACC                                               
517.00 161027      C                   EXSR      ZKECSDPF                                                         
518.00 161027      C                   IF        CUX1AP = 20 and VACCPRE = '01'                                   
519.00 161115      C                   EVAL      KEMAPPCODE = '26'                                                
520.00 161027      C                   EVAL      KEMKEY = VACCNBR                                                 
521.00 161027      C                   ENDIF                                                                      
522.00 161027      C                   IF        CUX1AP = 20 and VACCPRE = '06'                                   
523.00 161115      C                   EVAL      KEMAPPCODE = '20'                                                
524.00 161027      C                   EVAL      KEMKEY = VACCNBR                                                 
525.00 161027      C                   ENDIF                                                                      
526.00 161027       **   DO- insert extended searching result to sfl                                              
527.00 161027      C     KECSDPF       CHAIN     ECSDPF                             52                            
528.00 170328      C     CUXREL        CHAIN     ECSDREL                                                          
529.00 170328      C                   IF        %FOUND(ECSDPF)                                                   
530.00 170328      C                             AND %FOUND(ECSDREL) AND ERFLGP = 'Y'         *chk align relation 
531.00 161027      C                   EVAL      DOPT = ' '                                                       
532.00 161027      C                   EVAL      DEMAPPCODE = EMAPPCODE                                           
533.00 161027      C                   MOVE      EMKEY         DEMKEY                                             
534.00 161123      C                   MOVEL     EMCLASS       DEMCLASS                                           
535.00 161123      C                   MOVEL     EMTYPE        DEMTYPE                                            
536.00 161123      C                   EVAL      DEMSUTYPE = EMSUTYPE                                             
537.00 161123      C                   EVAL      KECCLASS = EMCLASS                                               
538.00 161123      C                   EVAL      KECTYPE = EMTYPE                                                 
539.00 161123      C                   EVAL      KECSUTYPE= EMSUTYPE                                              
540.00 161123      C                   EVAL      DDESC = ''                                                       
541.00 161123      C     KECSDCONF     CHAIN     ECSDCONF                                                         
542.00 161123      C                   IF        %FOUND(ECSDCONF)                                                 
543.00 161123      C                   EVAL      DDESC = %SUBST(ECDESC:1:20)                                      
544.00 161123      C                   ENDIF                                                                      
545.00 161123      C                   EVAL      DEMOP1 = EMOP1                                                   
546.00 161123      C                   EVAL      DCUXREL = CUXREL                                                 
547.00 161123      C                                                                                              
548.00 161123      C                   EVAL      SRRN = SRRN + 1                                                  
549.00 161027      C                   WRITE     ECSD00SFL                                                        
550.00 161123      C                                                                                              
551.00 161027      C                   ENDIF                                                                      
552.00 161027      C                                                                                              
553.00 161027      C                   READ      CUP009L7                                                         
554.00 161027      C                                                                                              
555.00 161027      C                   ENDDO                                                                      
556.00 161027      C                                                                                              
557.00 161027      C                   ENDIF                                                                      
558.00 161027      C                                                                                              
559.00 161027      C                   ENDSR                                                                      
560.00 170308      C**********************************************************************                        
561.00 170308      C*                  Subroutine: WRT00SFLC                             *                        
562.00 170308      C*          WRITE SPL FOR CREDIT CARD SEARCH BY CIF                   *                        
563.00 170308      C**********************************************************************                        
564.00 170308      C     WRT00SFLC     BEGSR                                                                      
565.00 170308      C                                                                                              
566.00 170308      C                   SETOFF                                       70        *general err indi   
567.00 170308      C                   SETOFF                                       717273                        
568.00 170308      C                   SETOFF                                       7475                          
569.00 170308      C                                                                                              
570.00 170308       *    Seton indicator that hidden and protect the option under sfl                             
571.00 170308      C                   SETON                                        67                            
572.00 170308      C                                                                                              
573.00 170308       *    CHK- check search parameter eligibility                                                  
574.00 170308      C                   IF        SAPP='' OR SKEY =''                                              
575.00 170308      C                             OR (SACCLVL<>'Y' AND SACCLVL<>'N')                               
576.00 170308      C                   SETON                                        71                            
577.00 170308      C                   EVAL      SMSG=MSG071                                                      
578.00 170308      C                   ENDIF                                                                      
579.00 170308      C                                                                                              
580.00 170308      C                   IF        SACCLVL <> 'Y' OR SAPP <> '90'                                   
581.00 170308      C                   SETON                                        71                            
582.00 170308      C                   EVAL      SMSG=MSG071                                                      
583.00 170308      C                   ENDIF                                                                      
584.00 170308      C                                                                                              
585.00 170308      C                   IF        *IN71=*ON                                                        
586.00 170308      C                   SETON                                        70                            
587.00 170308      C                   ENDIF                                                                      
588.00 170308      C                                                                                              
589.00 170308      C                   IF        *IN70 = *OFF                                                     
590.00 170308      C                                                                                              
591.00 170308      C                   Z-ADD     0             KCHLACHACCT                                        
592.00 170308      C                   MOVE      ''            VTMP10A          10                                
593.00 170308      C                   EVAL      VTMP10A = %SUBST(SKEY:1:10)                                      
594.00 170308      C                   MOVE      VTMP10A       KCHLACHACCT                                        
595.00 170308      C     KZPDCRCDCL1   SETLL     ZPDCRCDCL1                                                       
596.00 170308      C                   READ      ZPDCRCDCL1                                                       
597.00 170308      C                   DOW       NOT %EOF(ZPDCRCDCL1)                                             
598.00 170308      C                             AND KCHLACHACCT = CHLACHACCT                                     
599.00 170308      C                                                                                              
600.00 170308      C                   IF        %SCAN(CHLCRDSTS:VCRVALSTS) <> 0                                  
601.00 170308      C                             AND %SCAN(CHLBLKCDE:VCRINVBLK)=0                                 
602.00 170308      C                   EVAL      DEMAPPCODE = VCRAPPCODE                                          
603.00 170308      C                   EVAL      DEMKEY = ''                                                      
604.00 170308      C                   MOVEL     CHLCARDNO     DEMKEY                                             
605.00 170308      C                   EVAL      DEMCLASS = VCRCLASS                                              
606.00 170308      C                   EVAL      DEMTYPE = VCRTYPE                                                
607.00 170308      C                   EVAL      DEMSUTYPE = VCRSUTYPE                                            
608.00 170308      C                   EVAL      DDESC = VCRDESC                                                  
609.00 170308      C                   EVAL      DEMOP1 = ''                                                      
610.00 170308      C                   MOVE      CHLCRORGNO    KCORGCDE                                           
611.00 170308      C                   MOVE      CHLCRACCNO    KCACNO                                             
612.00 170308      C     KZPDCRCUCS1   CHAIN     ZPDCRCUCS1                                                       
613.00 170308      C                   IF        %FOUND(ZPDCRCUCS1)                                               
614.00 170308      C                   IF        CSUPPHSTM = 'Y'                                                  
615.00 170308      C                   EVAL      DEMOP1 = 'Y'                                                     
616.00 170308      C                   ENDIF                                                                      
617.00 170308      C                   IF        CSUPPHSTM = 'N'                                                  
618.00 170308      C                   EVAL      DEMOP1 = 'B'                                                     
619.00 170308      C                   ENDIF                                                                      
620.00 170308      C                   ENDIF                                                                      
621.00 170308      C                   EVAL      DCUXREL = ''                                                     
622.00 170308      C                   EVAL      SRRN = SRRN + 1                                                  
623.00 170308      C                   WRITE     ECSD00SFL                                                        
624.00 170308      C                   ENDIF                                                                      
625.00 170308      C                                                                                              
626.00 170308      C                   READ      ZPDCRCDCL1                                                       
627.00 170308      C                   ENDDO                                                                      
628.00 170308      C                                                                                              
629.00 170308      C                   ENDIF                                                                      
630.00 170308      C                                                                                              
631.00 170308       *    Setoff indictor that hidden and protect the option under sfl                             
632.00 170308      C                   SETOFF                                       67                            
633.00 170308      C                                                                                              
634.00 170308      C                   ENDSR                                                                      
635.00 161027      C**********************************************************************                        
636.00 161027      C*                  Subroutine: CLS00SFL                              *                        
637.00 161027      C*          Close writing Spool file and set on display indicator     *                        
638.00 161027      C**********************************************************************                        
639.00 161027      C     CLS00SFL      BEGSR                                                                      
640.00 161027      C                   IF        SRRN > 0                                                         
641.00 161129      C                   EVAL      SRRN=1                                                           
642.00 161027      C                   SETON                                        50                            
643.00 161027      C                   ELSE                                                                       
644.00 161027      C                   SETOFF                                       50                            
645.00 161027      C                   ENDIF                                                                      
646.00 161027      C                   ENDSR                                                                      
647.00 160830      C**********************************************************************                        
648.00 160901      C*                 SR: OPT01 - 01 application option                                           
649.00 160614      C**********************************************************************                        
650.00 160901      C     OPT01         BEGSR                                                                      
651.00 160901      C                                                                                              
652.00 160901       *    CHK part                                                                                 
653.00 160901      C                   SETOFF                                       70                            
654.00 160901      C                   SETOFF                                       7172                          
655.00 161118      C                   EVAL      POUT = '0'                                                       
656.00 160901      C                                                                                              
657.00 160901      C                   IF        DEMAPPCODE='' OR DEMKEY=''                                       
658.00 160901      C                   SETON                                        71                            
659.00 161020      C                   EVAL      SMSG=MSG071                                                      
660.00 160901      C                   ENDIF                                                                      
661.00 160901      C                                                                                              
662.00 160901      C                   CALL      'CHKAUT'                                                         
663.00 160901      C                   PARM                    WUSER                                              
664.00 160901      C                   PARM      'ECSDAP'      PMOPT             6                                
665.00 160901      C                   PARM      '1'           PLEVEL            1                                
666.00 160901      C                   PARM      '01'          POPT              2                                
667.00 160901      C                   PARM                    PBRN              3                                
668.00 160901      C                   PARM                    PIBRN             3                                
669.00 160901      C                   PARM                    PBNAME           30                                
670.00 160901      C                   PARM                    PAUT              1                                
671.00 160901      C                   IF        PAUT='N'                                                         
672.00 160901      C                   SETON                                        72                            
673.00 161020      C                   EVAL      SMSG=MSG072                                                      
674.00 160901      C                   ENDIF                                                                      
675.00 160901      C                                                                                              
676.00 170308      C                   IF        DEMAPPCODE = VCRAPPCODE                                          
677.00 170308      C                   SETON                                        71                            
678.00 170308      C                   EVAL      SMSG=MSGCRD                                                      
679.00 170308      C                   ENDIF                                                                      
680.00 170117      C                                                                                              
681.00 160901      C                   IF        *IN71 = *ON OR *IN72 = *ON                                       
682.00 160901      C                   SETON                                        70                            
683.00 160901      C                   ENDIF                                                                      
684.00 160901      C                                                                                              
685.00 160901       *    DO part                                                                                  
686.00 160901      C                   IF        *IN70 = *OFF                                                     
687.00 160901      C                                                                                              
688.00 161026      C                   CALL      'ECSDAPPMNT'                                                     
689.00 161026      C                   PARM      '01'          POPT                                               
690.00 161026      C                   PARM      DEMAPPCODE    PEMAPPCODE        2                                
691.00 161026      C                   PARM      DEMKEY        PEMKEY           20                                
692.00 161026      C                   PARM      DEMCLASS      PEMCLASS         10                                
693.00 161026      C                   PARM      DEMTYPE       PEMTYPE          10                                
694.00 161026      C                   PARM      DEMSUTYPE     PEMSUTYPE         2                                
695.00 161026      C                   PARM                    POUT              1                                
696.00 160901      C                                                                                              
697.00 160901      C                   ENDIF                                                                      
698.00 160901      C                                                                                              
699.00 161223       *    End part - write result to screen                                                        
700.00 170123      C                   IF        POUT <> '0'                                                      
701.00 161223      C                   EVAL      SMSG = MSG000                                                    
702.00 161223      C                   ENDIF                                                                      
703.00 161124      C                                                                                              
704.00 161124      C                   ENDSR                                                                      
705.00 161124      C**********************************************************************                        
706.00 161124      C*                 SR: OPT02 - 02 (Estatement Only)                                            
707.00 160901      C**********************************************************************                        
708.00 160901      C     OPT02         BEGSR                                                                      
709.00 161117      C                                                                                              
710.00 161117       *    CHK part                                                                                 
711.00 161117      C                   SETOFF                                       70                            
712.00 170731      C                   SETOFF                                       717273                        
713.00 161118      C                   EVAL      POUT = '0'                                                       
714.00 161117      C                                                                                              
715.00 161117      C                   IF        DEMAPPCODE='' OR DEMKEY=''                                       
716.00 161117      C                   SETON                                        71                            
717.00 161117      C                   EVAL      SMSG=MSG071                                                      
718.00 161117      C                   ENDIF                                                                      
719.00 161117      C                                                                                              
720.00 161117      C                   CALL      'CHKAUT'                                                         
721.00 161117      C                   PARM                    WUSER                                              
722.00 161117      C                   PARM      'ECSDAP'      PMOPT             6                                
723.00 161117      C                   PARM      '1'           PLEVEL            1                                
724.00 161117      C                   PARM      '02'          POPT              2                                
725.00 161117      C                   PARM                    PBRN              3                                
726.00 161117      C                   PARM                    PIBRN             3                                
727.00 161117      C                   PARM                    PBNAME           30                                
728.00 161117      C                   PARM                    PAUT              1                                
729.00 161117      C                   IF        PAUT='N'                                                         
730.00 161117      C                   SETON                                        72                            
731.00 161117      C                   EVAL      SMSG=MSG072                                                      
732.00 161117      C                   ENDIF                                                                      
733.00 161117      C                                                                                              
734.00 161117      C                   IF        DEMOP1 = 'Y'                                                     
735.00 161117      C                   SETON                                        73                            
736.00 161117      C                   EVAL      SMSG = MSG073                                                    
737.00 161117      C                   ENDIF                                                                      
738.00 170117      C                                                                                              
739.00 170731      C                   IF        SEBANK = 'N'                                                     
740.00 170731      C                   SETON                                        73                            
741.00 170731      C                   EVAL      SMSG = MSG073                                                    
742.00 170731      C                   ENDIF                                                                      
743.00 170627      C                                                                                              
744.00 170308      C                   IF        DEMAPPCODE = VCRAPPCODE                                          
745.00 170308      C                   SETON                                        71                            
746.00 170308      C                   EVAL      SMSG=MSGCRD                                                      
747.00 170308      C                   ENDIF                                                                      
748.00 161117      C                                                                                              
749.00 161117      C                   IF        *IN71=*ON OR *IN72=*ON OR *IN73=*ON                              
750.00 161117      C                   SETON                                        70                            
751.00 161117      C                   ENDIF                                                                      
752.00 161117      C                                                                                              
753.00 161117       *    DO part                                                                                  
754.00 161117      C                   IF        *IN70 = *OFF                                                     
755.00 161117      C                                                                                              
756.00 161117      C                   CALL      'ECSDAPPMNT'                                                     
757.00 161117      C                   PARM      '02'          POPT                                               
758.00 161117      C                   PARM      DEMAPPCODE    PEMAPPCODE        2                                
759.00 161117      C                   PARM      DEMKEY        PEMKEY           20                                
760.00 161117      C                   PARM      DEMCLASS      PEMCLASS         10                                
761.00 161117      C                   PARM      DEMTYPE       PEMTYPE          10                                
762.00 161117      C                   PARM      DEMSUTYPE     PEMSUTYPE         2                                
763.00 170328      C                   PARM                    POUT              1                                
764.00 161117      C                                                                                              
765.00 161117      C                   ENDIF                                                                      
766.00 161117      C                                                                                              
767.00 161223       *    End part - write result to screen                                                        
768.00 170123      C                   IF        POUT <> '0'                                                      
769.00 161223      C                   EVAL      SMSG = MSG000                                                    
770.00 161223      C                   ENDIF                                                                      
771.00 161124      C                                                                                              
772.00 160901      C                   ENDSR                                                                      
773.00 160901      C**********************************************************************                        
774.00 161117      C*                 SR: OPT03 - 03 option (EStatment and Physical)                              
775.00 160901      C**********************************************************************                        
776.00 160901      C     OPT03         BEGSR                                                                      
777.00 161117      C                                                                                              
778.00 161117       *    CHK part                                                                                 
779.00 161117      C                   SETOFF                                       70                            
780.00 161117      C                   SETOFF                                       7172                          
781.00 161118      C                   EVAL      POUT = '0'                                                       
782.00 161117      C                                                                                              
783.00 161117      C                   IF        DEMAPPCODE='' OR DEMKEY=''                                       
784.00 161117      C                   SETON                                        71                            
785.00 161117      C                   EVAL      SMSG=MSG071                                                      
786.00 161117      C                   ENDIF                                                                      
787.00 161117      C                                                                                              
788.00 161117      C                   CALL      'CHKAUT'                                                         
789.00 161117      C                   PARM                    WUSER                                              
790.00 161117      C                   PARM      'ECSDAP'      PMOPT             6                                
791.00 161117      C                   PARM      '1'           PLEVEL            1                                
792.00 161117      C                   PARM      '03'          POPT              2                                
793.00 161117      C                   PARM                    PBRN              3                                
794.00 161117      C                   PARM                    PIBRN             3                                
795.00 161117      C                   PARM                    PBNAME           30                                
796.00 161117      C                   PARM                    PAUT              1                                
797.00 161117      C                   IF        PAUT='N'                                                         
798.00 161117      C                   SETON                                        72                            
799.00 161117      C                   EVAL      SMSG=MSG072                                                      
800.00 161117      C                   ENDIF                                                                      
801.00 161117      C                                                                                              
802.00 161118      C                   IF        DEMOP1 = 'B'                                                     
803.00 161117      C                   SETON                                        73                            
804.00 161117      C                   EVAL      SMSG = MSG073                                                    
805.00 161117      C                   ENDIF                                                                      
806.00 161117      C                                                                                              
807.00 170308      C                   IF        DEMAPPCODE = VCRAPPCODE                                          
808.00 170308      C                   SETON                                        71                            
809.00 170308      C                   EVAL      SMSG=MSGCRD                                                      
810.00 170308      C                   ENDIF                                                                      
811.00 170117      C                                                                                              
812.00 161117      C                   IF        *IN71=*ON OR *IN72=*ON OR *IN73=*ON                              
813.00 161117      C                   SETON                                        70                            
814.00 161117      C                   ENDIF                                                                      
815.00 161117      C                                                                                              
816.00 161117       *    DO part                                                                                  
817.00 161117      C                   IF        *IN70 = *OFF                                                     
818.00 161117      C                                                                                              
819.00 161117      C                   CALL      'ECSDAPPMNT'                                                     
820.00 161117      C                   PARM      '03'          POPT                                               
821.00 161117      C                   PARM      DEMAPPCODE    PEMAPPCODE        2                                
822.00 161117      C                   PARM      DEMKEY        PEMKEY           20                                
823.00 161117      C                   PARM      DEMCLASS      PEMCLASS         10                                
824.00 161117      C                   PARM      DEMTYPE       PEMTYPE          10                                
825.00 161117      C                   PARM      DEMSUTYPE     PEMSUTYPE         2                                
826.00 161117      C                   PARM                    POUT              1                                
827.00 161117      C                                                                                              
828.00 161117      C                   ENDIF                                                                      
829.00 161117      C                                                                                              
830.00 161223       *    End part - write result to screen                                                        
831.00 170123      C                   IF        POUT <> '0'                                                      
832.00 161223      C                   EVAL      SMSG = MSG000                                                    
833.00 161223      C                   ENDIF                                                                      
834.00 160901      C                                                                                              
835.00 160901      C                   ENDSR                                                                      
836.00 160901      C**********************************************************************                        
837.00 160901      C*                 SR: OPTF6 - F6 application option                                           
838.00 160901      C**********************************************************************                        
839.00 160901      C     OPTF6         BEGSR                                                                      
840.00 160901      C                                                                                              
841.00 160901       *    CHK part                                                                                 
842.00 160901      C                   SETOFF                                       70                            
843.00 160901      C                   SETOFF                                       72                            
844.00 170308      C                   EVAL      POUT = '0'                                                       
845.00 160901      C                                                                                              
846.00 160901      C                   CALL      'CHKAUT'                                                         
847.00 160901      C                   PARM                    WUSER                                              
848.00 160901      C                   PARM      'ECSDAP'      PMOPT             6                                
849.00 160901      C                   PARM      '1'           PLEVEL            1                                
850.00 160901      C                   PARM      'F6'          POPT              2                                
851.00 160901      C                   PARM                    PBRN              3                                
852.00 160901      C                   PARM                    PIBRN             3                                
853.00 160901      C                   PARM                    PBNAME           30                                
854.00 160901      C                   PARM                    PAUT              1                                
855.00 160901      C                   IF        PAUT='N'                                                         
856.00 160901      C                   SETON                                        72                            
857.00 161020      C                   EVAL      SMSG=MSG072                                                      
858.00 160901      C                   ENDIF                                                                      
859.00 160901      C                                                                                              
860.00 160901      C                   IF        *IN72 = *ON                                                      
861.00 160901      C                   SETON                                        70                            
862.00 160901      C                   ENDIF                                                                      
863.00 160901      C                                                                                              
864.00 160901       *    DO part                                                                                  
865.00 160901      C                   IF        *IN70 = *OFF                                                     
866.00 161028      C                                                                                              
867.00 161028      C                   EVAL      PEMAPPCODE = ''                                                  
868.00 161028      C                   EVAL      PEMKEY = ''                                                      
869.00 161028      C                                                                                              
870.00 161026      C                   CALL      'ECSDAPPMNT'                                                     
871.00 161026      C                   PARM      'F6'          POPT                                               
872.00 161026      C                   PARM                    PEMAPPCODE        2                                
873.00 161026      C                   PARM                    PEMKEY           20                                
874.00 161026      C                   PARM      DEMCLASS      PEMCLASS         10                                
875.00 161026      C                   PARM      DEMTYPE       PEMTYPE          10                                
876.00 161026      C                   PARM      DEMSUTYPE     PEMSUTYPE         2                                
877.00 170328      C                   PARM                    POUT              1                                
878.00 170328      C                                                                                              
879.00 160901      C                   ENDIF                                                                      
880.00 160901      C                                                                                              
881.00 161223       *    End part - write result to screen                                                        
882.00 170123      C                   IF        POUT <> '0'                                                      
883.00 161223      C                   EVAL      SMSG = MSG000                                                    
884.00 170308      C                   ELSE                                                                       
885.00 170308      C                   EVAL      SMSG = MSGSUC                                                    
886.00 170308      C                   ENDIF                                                                      
887.00 170308      C                                                                                              
888.00 160901      C                   ENDSR                                                                      
889.00 170818 D7278C**********************************************************************                        
890.00 170818 D7278C*                 SR: OPTF9 - F9 EStatement All Function                                      
891.00 170818 D7278C**********************************************************************                        
892.00 170818 D7278C     OPTF9         BEGSR                                                                      
893.00 170818 D7278C                                                                                              
894.00 170818 D7278 *    CHK Setup Checkers                                                                       
895.00 170818 D7278C                   SETOFF                                       70                            
896.00 170818 D7278C                   SETOFF                                       7273                          
897.00 170818 D7278C                   EVAL      POUT = '0'                                                       
898.00 170818 D7278C                                                                                              
899.00 170818 D7278 *    CHK Authority                                                                            
900.00 170818 D7278C                   CALL      'CHKAUT'                                                         
901.00 170818 D7278C                   PARM                    WUSER                                              
902.00 170818 D7278C                   PARM      'ECSDAP'      PMOPT             6                                
903.00 170818 D7278C                   PARM      '1'           PLEVEL            1                                
904.00 170818 D7278C                   PARM      'F9'          POPT              2                                
905.00 170818 D7278C                   PARM                    PBRN              3                                
906.00 170818 D7278C                   PARM                    PIBRN             3                                
907.00 170818 D7278C                   PARM                    PBNAME           30                                
908.00 170818 D7278C                   PARM                    PAUT              1                                
909.00 170818 D7278C                   IF        PAUT='N'                                                         
910.00 170818 D7278C                   SETON                                        72                            
911.00 170818 D7278C                   EVAL      SMSG=MSG072                                                      
912.00 170818 D7278C                   ENDIF                                                                      
913.00 170818 D7278C                                                                                              
914.00 170818 D7278 *    CHK EBanking Activated                                                                   
915.00 170818 D7278C                   IF        SEBANK = 'N'                                                     
916.00 170818 D7278C                   SETON                                        73                            
917.00 170818 D7278C                   EVAL      SMSG = MSG073                                                    
918.00 170818 D7278C                   ENDIF                                                                      
919.00 170818 D7278C                                                                                              
920.00 170818 D7278 *    CHK Consolidate validation                                                               
921.00 170818 D7278C                   IF        *IN72=*ON OR *IN73=*ON                                           
922.00 170818 D7278C                   SETON                                        70                            
923.00 170818 D7278C                   ENDIF                                                                      
924.00 170818 D7278C                                                                                              
925.00 170818 D7278 *    DO part - Perfrom update to Y module to each record in subfile                           
926.00 170818 D7278C                   IF        *IN70 = *OFF                                                     
927.00 170818 D7278C                                                                                              
928.00 170818 D7278 **   DO Part - Get User's confirmation                                                        
929.00 170818 D7278C                   DOW       SYESNO = ' '                                                     
930.00 170818 D7278C                   EXFMT     ECSD00CFM                                                        
931.00 170818 D7278C                   ENDDO                                                                      
932.00 170818 D7278C                                                                                              
933.00 170818 D7278 **   DO part - iterate subf, if SFilter is Y, then filter w/ Black list                       
934.00 170818 D7278C                   IF        SYESNO = 'Y'                                                     
935.00 170818 D7278C                   Z-ADD     1             VIND              4 0                              
936.00 170818 D7278C     VIND          CHAIN     ECSD00SFL                                                        
937.00 170818 D7278C                   DOW       %FOUND                                                           
938.00 170818 D7278C                                                                                              
939.00 170818 D7278C                   IF        %LOOKUP(DCUXREL:VBLKLST) = *ZERO                                 
940.00 170818 D7278C                             OR SFILTER = 'N'                                                 
941.00 170818 D7278C                                                                                              
942.00 170818 D7278C                   CALL      'ECSDACTCL'                                                      
943.00 170818 D7278C                   PARM                    PCHANNEL          3                                
944.00 170818 D7278C                   PARM      'UPD '        PACTCODE          4                                
945.00 170818 D7278C                   PARM                    PACTTYPE          4                                
946.00 170818 D7278C                   PARM      DEMAPPCODE    PEMAPPCOD         2                                
947.00 170818 D7278C                   PARM      DEMKEY        PEMKEY           20                                
948.00 170818 D7278C                   PARM      DEMCLASS      PEMCLASS         10                                
949.00 170818 D7278C                   PARM      DEMTYPE       PEMTYPE          10                                
950.00 170818 D7278C                   PARM      DEMSUTYPE     PEMSUTYPE         2                                
951.00 170818 D7278C                   PARM      'Y'           PEMOP1            1                                
952.00 170818 D7278C                   PARM                    PEMOP2            1                                
953.00 170818 D7278C                   PARM                    PEMOP3            2                                
954.00 170818 D7278C                   PARM                    PEMDATE           8 0                              
955.00 170818 D7278C                   PARM                    PEMTIME           6 0                              
956.00 170818 D7278C                   PARM                    PEMSRUPD         10                                
957.00 170818 D7278C                   PARM                    PEMREL           10                                
958.00 170818 D7278C                   PARM                    POUT              1                                
959.00 170818 D7278C                   PARM                    PSTS             10                                
960.00 170818 D7278C                   PARM                    PMOMENT          26                                
961.00 170818 D7278C                                                                                              
962.00 170818 D7278C                   ENDIF                                                                      
963.00 170818 D7278C                                                                                              
964.00 170818 D7278C                   EVAL      VIND = VIND + 1                                                  
965.00 170818 D7278C     VIND          CHAIN     ECSD00SFL                                                        
966.00 170818 D7278C                   ENDDO                                                                      
967.00 170818 D7278C                                                                                              
968.00 170818 D7278C                   EVAL      SMSG = MSGSUC                                                    
969.00 170818 D7278C                   ENDIF                                                                      
970.00 170818 D7278C                                                                                              
971.00 170818 D7278C                   ENDIF                                                                      
972.00 170818 D7278C                                                                                              
973.00 170818 D7278 *    End part - write result and reset fields                                                 
974.00 170818 D7278C                   EVAL      SYESNO = ' '                                                     
975.00 170818 D7278C                                                                                              
976.00 170818 D7278C                   ENDSR                                                                      
977.00 161027      C**********************************************************************                        
978.00 161027      C*                 SR: ZKECSDPF - Set Zero(reset) Key KECSDPF                                  
979.00 161027      C**********************************************************************                        
980.00 161027      C     ZKECSDPF      BEGSR                                                                      
981.00 161027      C                   EVAL      KEMAPPCODE = ''                                                  
982.00 161027      C                   EVAL      KEMKEY = ''                                                      
983.00 161027      C                   ENDSR                                                                      
984.00 161027      C**********************************************************************                        
985.00 161027      C*                 SR: ZKECSDCONF - Set Zero(reset) Key KECSDCONF                              
986.00 161027      C**********************************************************************                        
987.00 161027      C     ZKECSDCONF    BEGSR                                                                      
988.00 161027      C                   EVAL      KECCLASS = ''                                                    
989.00 161027      C                   EVAL      KECTYPE = ''                                                     
990.00 161027      C                   EVAL      KECSUTYPE = ''                                                   
991.00 161027      C                   ENDSR                                                                      
992.00 161027      C**********************************************************************                        
993.00 161027      C*                 SR: ZKCUP009L7 - Set Zero(reset) Key KCUP009L7                              
994.00 161027      C**********************************************************************                        
995.00 161027      C     ZKCUP009L7    BEGSR                                                                      
996.00 161027      C                   EVAL      KCUXBK = 0                                                       
997.00 161027      C                   EVAL      KCUXREC = ''                                                     
998.00 161027      C                   EVAL      KCUX1CS = ''                                                     
999.00 161027      C                   EVAL      KCUX1AC = 0                                                      
1000.00 161027      C                   ENDSR                                                                      
1001.00 170328       **                                                                                            
1002.00 170801 **                                                                                                  
1003.00 170801 JAF                                                                                                 
1004.00 170801 JAO                                                                                                 
1005.00 170801 JA1                                                                                                 
1006.00 170801 JA2                                                                                                 
1007.00 170801 JA3                                                                                                 
1008.00 170801 JA4                                                                                                 
1009.00 170801 JA5                                                                                                 
