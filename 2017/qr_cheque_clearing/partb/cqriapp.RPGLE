1.00 20307      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                      
2.00 20319       **************************************************************************                    
3.00 170906       * REFERENCE NO. : CHG-0266-17 (D7266)                                                         
4.00 170308       * PROGRAM ID.   : CQRIAPP                                                                     
5.00 170308       * DESC          : Incoming Cheque Application                                                 
6.00 161026       * AUTHOR        : Myles Ieong                                                                 
7.00 160607       * USER ID.      : BI77PGM                                                                     
8.00 170308       * DATE WRITTEN  : 08/03/17                                                                    
9.00 150727       **************************************************************************                    
10.00 160607      F**********************************************************************                        
11.00 160607      F*                         File Specification                         *                        
12.00 160607      F**********************************************************************                        
13.00 170308      FCQRIAPPD  CF   E             WORKSTN                                                          
14.00 170308      F                                     SFILE(CQRI00SFL:SRRN)                                    
15.00 170308      F                                     INFDS(WSDTAS)                                            
16.00 170705      FCQRXPF    UF A E           K DISK    USROPN                                                   
17.00 170801      FCQRXENV   UF A E           K DISK                                                             
18.00 170309      FCQRXBRN   IF   E           K DISK                                                             
19.00 170801      FTBANK     IF   E           K DISK                                                             
20.00 170801       * ICBS Files                                                                                  
21.00 170906      FPST001L8  UF   E           K DISK    USROPN                                                   
22.00 170906      FTAP005L8  IF   E           K DISK                                                             
23.00 170906      FTAP020    UF   E           K DISK    USROPN                                                   
24.00 170308      F*                                                                                             
25.00 160607      F**********************************************************************                        
26.00 160607      F*                         Function Description                       *                        
27.00 160607      F**********************************************************************                        
28.00 160829      F*              *IN70: General error indicator  (*ON: failed)                                  
29.00 170309      F*              *IN71: Invalid branch                                                          
30.00 170309      F*              *IN72: Invalid bank (other) code                                               
31.00 170309      F*              *IN73: Invalid currency code                                                   
32.00 170705      F*              *IN74: User cancel operations                                                  
33.00 170705      F*              *IN75: Record not exists                                                       
34.00 170719      F*              *IN76: No Authority                                                            
35.00 170719      F*              *IN77: Refresh lock                                                            
36.00 170719      F*              *IN78: Duplicated Envelope Number                                              
37.00 170906      F*              *IN79: Not Valid User Input                                                    
38.00 160901      F**                                                                                            
39.00 160607      D**********************************************************************                        
40.00 160607      D*                   Variables / constant defination                  *                        
41.00 160607      D**********************************************************************                        
42.00 160830       *    Global variables (flowable)                                                              
43.00 170123      DMSG000           S             70    INZ('Invalid parameters')                                
44.00 170309      DMSG071           S             70    INZ('Invalid Branch')                                    
45.00 170309      DMSG072           S             70    INZ('Invalid Bank Code')                                 
46.00 170309      DMSG073           S             70    INZ('Invalid Currency')                                  
47.00 170719      DMSG074           S             70    INZ('User Cancel')                                       
48.00 170719      DMSG075           S             70    INZ('Record not exists')                                 
49.00 170719      DMSG076           S             70    INZ('No Authority')                                      
50.00 170719      DMSG077           S             70    INZ('File locked. Please try again l-                    
51.00 170719      D                                     ater')                                                   
52.00 170719      DMSG078           S             70    INZ('Duplicated Envelope Number')                        
53.00 170906      DMSG079           S             70    INZ('User Input Not Valid')                              
54.00 170906      DMSGSUCC          S             70    INZ('Action Performed')                                  
55.00 160830       *    Screen user variables                                                                    
56.00 20305      D DSPGID         SDS                                                                           
57.00 30113      D  WKDATE               191    198  0                                                          
58.00 20425      D  WKSTN                244    253                                                             
59.00 70118      D  WUSER                254    263                                                             
60.00 150527      DWSDTAS           DS                                                                           
61.00 150527      DCSRLOC                 370    371B 0                                                          
62.00 170309       *    Variable TIME STAMP                                                                      
63.00 170308      DVTIME            S               T                                                            
64.00 170308      DVTSTMP           S               Z                                                            
65.00 170719       *    Lock in data area                                                                        
66.00 170719      D                 DS                                                                           
67.00 170719      DVLOCK                    1      1                                                             
68.00 170906       *    Batch Sequence Number Structure                                                          
69.00 170906      D                 DS                                                                           
70.00 170906      DVBTSQ                    1     13                                                             
71.00 170906      D VBRN                    1      5                                                             
72.00 170906      D VNBR                    6      9                                                             
73.00 170906      D VBSQ                   10     13                                                             
74.00 170906       *    Date format in YYYYMMDD                                                                  
75.00 170906      D                 DS                                                                           
76.00 170906      DVYYYYMMDD                1      8                                                             
77.00 170906      D VYYYY                   1      4                                                             
78.00 170906      D VMM                     5      6                                                             
79.00 170906      D VDD                     7      8                                                             
80.00 170308      C**********************************************************************                        
81.00 160607      C*                         Key List define                            *                        
82.00 160615      C**********************************************************************                        
83.00 170310      C     KTBANK        KLIST                                                                      
84.00 170310      C                   KFLD                    KBNKCOD           3 0                              
85.00 170310      C                                                                                              
86.00 170310      C     KCQRXBRN      KLIST                                                                      
87.00 170705      C                   KFLD                    KCXBBRN           5 0                              
88.00 170705      C                                                                                              
89.00 170705      C     KCQRXPF       KLIST                                                                      
90.00 170705      C                   KFLD                    KCXOBNK           3 0                              
91.00 170705      C                   KFLD                    KCXTYP            3                                
92.00 170705      C                   KFLD                    KCXCPET           3                                
93.00 170705      C                   KFLD                    KCXCHQ           20                                
94.00 170801      C                                                                                              
95.00 170906      C     KPST001L8     KLIST                                                                      
96.00 170906      C                   KFLD                    KTLTBNK           3 0                              
97.00 170906      C                   KFLD                    KTLTBRN           5 0                              
98.00 170906      C                   KFLD                    KTLTNBR           4 0                              
99.00 170906      C                   KFLD                    KTLTTIL           4 0                              
100.00 170906      C                   KFLD                    KTLTCUR           3 0                              
101.00 170906      C                   KFLD                    KTLTCD            6                                
102.00 170906      C                   KFLD                    KTLTBSQ           5 0                              
103.00 170906      C                                                                                              
104.00 170906      C     KTAP005L8     KLIST                                                                      
105.00 170906      C                   KFLD                    KDHBANK           3 0                              
106.00 170906      C                   KFLD                    KDHTYP            1 0                              
107.00 170906      C                   KFLD                    KDHACCT          10 0                              
108.00 170906      C                   KFLD                    KDHDATE           7 0                              
109.00 170906      C                   KFLD                    KDHBTSQ          21 0                              
110.00 170906      C                                                                                              
111.00 170906      C     KTAP020       KLIST                                                                      
112.00 170906      C                   KFLD                    KDHBANK                                            
113.00 170906      C                   KFLD                    KDHTYP                                             
114.00 170906      C                   KFLD                    KDHACCT                                            
115.00 170906      C                   KFLD                    KDHDATE                                            
116.00 170906      C                   KFLD                    KDHNBR            5 0                              
117.00 170705      C*                                                                                             
118.00 170704      C**********************************************************************                        
119.00 170704      C*                          MAIN PROGRAM                              *                        
120.00 170704      C**********************************************************************                        
121.00 170719       *    Variable init                                                                            
122.00 170719      C     *DTAARA       DEFINE    CQRXLCK       VLOCK                                              
123.00 170719      C                                                                                              
124.00 170704       *    Init screen- dont load subfile at first hand                                             
125.00 170704      C                   EXSR      INZ00SCN                                                         
126.00 170315      C                   EXSR      INZ00SFL                                                         
127.00 170315      C                   WRITE     CQRI00FK                                                         
128.00 170315      C                   EXFMT     CQRI00                                                           
129.00 170315      C                                                                                              
130.00 170704       *    Start screen loops                                                                       
131.00 170315      C                   DOW       *IN03 = *OFF                                                     
132.00 170315      C                                                                                              
133.00 170315      C                   SETOFF                                       70        *general err indi   
134.00 170315      C                   SETOFF                                       717273                        
135.00 170719      C                   SETOFF                                       76                            
136.00 170315      C                                                                                              
137.00 170705       **   Check: Branch validity                                                                   
138.00 170315      C                   MOVE      SBRN          KCXBBRN                                            
139.00 170315      C     KCQRXBRN      CHAIN     CQRXBRN                                                          
140.00 170315      C                   IF        NOT %FOUND(CQRXBRN) AND SBRN <> 0                                
141.00 170707      C                             AND SBRN <> 0                                                    
142.00 170707      C                             AND SBRN <> 999                                                  
143.00 170706      C                   EVAL      SMSG = MSG071                                                    
144.00 170315      C                   SETON                                        71                            
145.00 170315      C                   ENDIF                                                                      
146.00 170315      C                                                                                              
147.00 170705       **   Check: Other Bank Code Validity                                                          
148.00 170315      C                   MOVE      SBANK         KBNKCOD                                            
149.00 170315      C     KTBANK        CHAIN     TBANK                                                            
150.00 170315      C                   IF        NOT %FOUND(TBANK) AND SBANK <> 0                                 
151.00 170706      C                   EVAL      SMSG = MSG072                                                    
152.00 170315      C                   SETON                                        72                            
153.00 170315      C                   ENDIF                                                                      
154.00 170315      C                                                                                              
155.00 170705       **   Check: Currency Accuracy                                                                 
156.00 170706      C                   Z-ADD     0             VCCY              3 0                              
157.00 170706      C                   MOVE      SCCY          VCCY                                               
158.00 170315      C                   CALL      'CCCYCHK1'                                                       
159.00 170706      C                   PARM                    VCCY                                               
160.00 170315      C                   PARM                    POUTCCY           3                                
161.00 170315      C                   PARM                    PERRIND           1                                
162.00 170706      C                   IF        PERRIND <> '0'                                                   
163.00 170706      C                   EVAL      SMSG = MSG073                                                    
164.00 170315      C                   SETON                                        73                            
165.00 170315      C                   ENDIF                                                                      
166.00 170719      C                                                                                              
167.00 170719       **   Check: Entrance Authority                                                                
168.00 170719      C                   CALL      'CHKAUT'                                                         
169.00 170719      C                   PARM                    WUSER                                              
170.00 170719      C                   PARM      'INCHQR'      PMOPT             6                                
171.00 170719      C                   PARM      '0'           PLEVEL            1                                
172.00 170719      C                   PARM      '  '          POPT              2                                
173.00 170719      C                   PARM                    PBRN              3                                
174.00 170719      C                   PARM                    PIBRN             3                                
175.00 170719      C                   PARM                    PBNAME           30                                
176.00 170719      C                   PARM                    PAUT              1                                
177.00 170719      C                   IF        PAUT='N'                                                         
178.00 170719      C                   EVAL      SMSG=MSG076                                                      
179.00 170719      C                   SETON                                        76                            
180.00 170719      C                   ENDIF                                                                      
181.00 170719      C                                                                                              
182.00 170630       **   Check: Consolidate error indicators                                                      
183.00 170315      C                   IF        *IN71=*ON OR *IN72=*ON OR *IN73=*ON                              
184.00 170719      C                             OR *IN76 = *ON                                                   
185.00 170315      C                   SETON                                        70                            
186.00 170310      C                   ENDIF                                                                      
187.00 170705      C                                                                                              
188.00 170705       **   Perform: Show/Refresh screen                                                             
189.00 170310      C                   IF        *IN70 = *OFF                                                     
190.00 170309      C                                                                                              
191.00 170310      C                   EXSR      INZ00SFL                                                         
192.00 170310      C                   EXSR      WRT00SFL                                                         
193.00 170310      C                   EXSR      CLS00SFL                                                         
194.00 170310      C                   WRITE     CQRI00FK                                                         
195.00 170310      C                   EXFMT     CQRI00                                                           
196.00 170719      C                   EVAL      SMSG = ''                                                        
197.00 170315      C                                                                                              
198.00 170315      C                   ELSE                                                                       
199.00 170906      C                                                                                              
200.00 170906      C                   WRITE     CQRI00FK                                                         
201.00 170315      C                   EXFMT     CQRI00                                                           
202.00 170719      C                   EVAL      SMSG = ''                                                        
203.00 170310      C                                                                                              
204.00 170310      C                   ENDIF                                                                      
205.00 170310      C                                                                                              
206.00 170705       **   Perform: Catch option input from user                                                    
207.00 170310      C                   IF        SRRN > 0                                                         
208.00 170310      C                   READC     CQRI00SFL                              88                        
209.00 170310      C                   DOW       *IN88 = *OFF                                                     
210.00 170906       ***  Options: Press X                                                                         
211.00 170630      C                   IF        DOPT = 'X'                                                       
212.00 170719      C                   EXSR      OPT0X                                    7                       
213.00 170706      C                   EVAL      DOPT = *BLANK                                                    
214.00 170310      C                   ENDIF                                                                      
215.00 170705      C                                                                                              
216.00 170310      C                   READC     CQRI00SFL                              88                        
217.00 170310      C                                                                                              
218.00 170310      C                   ENDDO                                                                      
219.00 170310      C                   ENDIF                                                                      
220.00 170315      C                                                                                              
221.00 170705       **   Perform: Catch f5 press event                                                            
222.00 170317      C                   IF        *IN05 = *ON                                                      
223.00 170317      C                   EXSR      OPTF05                                                           
224.00 170317      C                   ENDIF                                                                      
225.00 170317      C                                                                                              
226.00 170705       **   Perform: Catch f7 press event                                                            
227.00 170630      C                   IF        *IN07 = *ON                                                      
228.00 170630      C                   EXSR      OPTF07                                                           
229.00 170630      C                   ENDIF                                                                      
230.00 170317      C                                                                                              
231.00 170705       **   Perform: Catch f10 press event                                                           
232.00 170317      C                   IF        *IN10 = *ON                                                      
233.00 170317      C                   EXSR      OPTF10                                                           
234.00 170317      C                   ENDIF                                                                      
235.00 170315      C                                                                                              
236.00 170308      C                   ENDDO                                                                      
237.00 170309      C                                                                                              
238.00 61106      C                   SETON                                        LR                            
239.00 170310      C**********************************************************************                        
240.00 170310      C*                 SR: INZ00SCN: Init 00 screen                                                
241.00 170310      C**********************************************************************                        
242.00 170315      C     INZ00SCN      BEGSR                                                                      
243.00 170315      C                                                                                              
244.00 170315      C                   EVAL      SOPT = 'M'                                                       
245.00 170315      C                                                                                              
246.00 170315      C                   ENDSR                                                                      
247.00 160607      C**********************************************************************                        
248.00 160829      C*                  Subroutine: INZ00SFL                                                       
249.00 160607      C**********************************************************************                        
250.00 160829      C     INZ00SFL      BEGSR                                                                      
251.00 160623      C                   Z-ADD     0             SRRN                                               
252.00 160623      C                   SETON                                        53                            
253.00 160623      C                   SETOFF                                       51                            
254.00 170308      C                   WRITE     CQRI00                                                           
255.00 160623      C                   SETOFF                                       53                            
256.00 160623      C                   SETON                                        51                            
257.00 161118      C                   ENDSR                                                                      
258.00 170308      C**********************************************************************                        
259.00 170308      C*                  Subroutine: WRT00SFL                              *                        
260.00 170308      C**********************************************************************                        
261.00 170308      C     WRT00SFL      BEGSR                                                                      
262.00 170310      C                                                                                              
263.00 170315      C                   Z-ADD     0             STQTY                                              
264.00 170315      C                   Z-ADD     0             STAMT                                              
265.00 170308      C                                                                                              
266.00 170317      C                   OPEN      CQRXPF                                                           
267.00 170317      C     *START        SETLL     CQRXPF                                                           
268.00 170712      C                   READ      CQRXPF                                 52                        
269.00 170317      C                   DOW       NOT %EOF(CQRXPF)                                                 
270.00 170317      C                                                                                              
271.00 170705       *    Check: Set up checkers                                                                   
272.00 170317      C                   MOVE      0             IsWRITE           1 0          General write cmd   
273.00 170315      C                   MOVE      0             IsBRN             1 0                              
274.00 170315      C                   MOVE      0             IsTYP             1 0                              
275.00 170315      C                   MOVE      0             IsBANK            1 0                              
276.00 170315      C                   MOVE      0             IsCCY             1 0                              
277.00 170315      C                   MOVE      0             IsOPT             1 0                              
278.00 170317      C                   MOVE      0             IsTIL             1 0                              
279.00 170315      C                                                                                              
280.00 170705       *    Check: wether the branch is selected                                                     
281.00 170707      C                   IF        SBRN <> 999 AND CXTLTBRN <> SBRN                                 
282.00 170315      C                   EVAL      IsBRN = 1                                                        
283.00 170315      C                   ENDIF                                                                      
284.00 170315      C                                                                                              
285.00 170705       *    Check: wether the other bank is selected                                                 
286.00 170315      C                   IF        SBANK <> 0 AND CXOBNK <> SBANK                                   
287.00 170315      C                   EVAL      IsBANK = 1                                                       
288.00 170315      C                   ENDIF                                                                      
289.00 170315      C                                                                                              
290.00 170705       *    Check: wether the ccyk is selected                                                       
291.00 170706      C                   MOVE      SCCY          VCCY                                               
292.00 170706      C                   IF        CXTLTCUR <> VCCY OR SCCY = *BLANK                                
293.00 170315      C                   EVAL      IsCCY = 1                                                        
294.00 170315      C                   ENDIF                                                                      
295.00 170315      C                                                                                              
296.00 170705       *    Check: wether the type of cheque is selected                                             
297.00 170710      C                   IF        (STYP = 'QR' AND CXTYP <> 'CHQ')                                 
298.00 170706      C                             OR (STYP = 'NQ' AND CXTYP <> '   ')                              
299.00 170315      C                   EVAL      IsTYP = 1                                                        
300.00 170315      C                   ENDIF                                                                      
301.00 170315      C                                                                                              
302.00 170705       *    Check: wether the status of cheque is selected                                           
303.00 170801      C                   IF        (SOPT='M' AND CXSTS='U')                                         
304.00 170801      C                             OR (SOPT='U' AND CXSTS='M')                                      
305.00 170315      C                   EVAL      IsOPT = 1                                                        
306.00 170315      C                   ENDIF                                                                      
307.00 170317      C                                                                                              
308.00 170705       *    Check: wether the till is selected                                                       
309.00 170705      C                   IF        STIL <> 0 AND CXTLTTIL <> STIL                                   
310.00 170317      C                   EVAL      IsTIL = 1                                                        
311.00 170317      C                   ENDIF                                                                      
312.00 170317      C                                                                                              
313.00 170705       *    Check: consolidate checkers to IsWrite flag                                              
314.00 170317      C                   EVAL      IsWRITE = IsWRITE + IsBRN                                        
315.00 170317      C                   EVAL      IsWRITE = IsWRITE + IsTYP                                        
316.00 170317      C                   EVAL      IsWRITE = IsWRITE + IsBANK                                       
317.00 170317      C                   EVAL      IsWRITE = IsWRITE + IsCCY                                        
318.00 170317      C                   EVAL      IsWRITE = IsWRITE + IsOPT                                        
319.00 170317      C                   EVAL      IsWRITE = IsWRITE + IsTIL                                        
320.00 170317      C                                                                                              
321.00 170705       *    Perform: write record to subfile                                                         
322.00 170317      C                   IF        IsWRITE = 0                                                      
323.00 170310      C                                                                                              
324.00 170705       **   Perform: write ROW1 of subfile                                                           
325.00 170705      C                   MOVE      CXTLTBRN      DBRN                           DBRN Branch         
326.00 170705      C                   EVAL      DTIL = CXTLTTIL                              DTIL Till           
327.00 170705      C                   EVAL      DUSR = %SUBST(CXTLTUSR:1:6)                  DUSR Teller         
328.00 170705      C                   IF        CXTLTTIM <> ''                                                   
329.00 170705      C                   MOVE      CXTLTTIM      VTSTMP                                             
330.00 170310      C                   MOVE      VTSTMP        VTIME                                              
331.00 170310      C                   MOVE      VTIME         DTME                           DTME Time           
332.00 170310      C                   ELSE                                                                       
333.00 170310      C                   MOVE      0             DTME                                               
334.00 170310      C                   ENDIF                                                                      
335.00 170706      C                   IF        CXTYP = 'CHQ'                                DTYP Type           
336.00 170309      C                   EVAL      DTYP = 'QR'                                                      
337.00 170309      C                   ELSE                                                                       
338.00 170309      C                   EVAL      DTYP = 'NQ'                                                      
339.00 170309      C                   ENDIF                                                                      
340.00 170309      C                   MOVE      CXOBNK        DOBK                           DOBK Bank           
341.00 170705      C                   EVAL      DAPP = CXTLTAPP                              DAPP App            
342.00 170705      C                   MOVE      CXTLTACT      DACC                           DACC Account        
343.00 170705      C                   MOVE      CXTLTCUR      DCCY                           DCCY CMCN           
344.00 170705      C                   MOVE      CXTLTTC       DAMT                           DAMT Amount         
345.00 170801      C                   EVAL      DMTH = CXSTS                                 DMTH Match          
346.00 170705       **   Perform: write ROW2 subfile records                                                      
347.00 170309      C                   MOVEL     CXCHQ         DCHQ                           DCHQ                
348.00 170705      C                   MOVEL     CXOACT        DCHQAC                         DCHQAC              
349.00 170705       **   Perform: write ROW3 subfile records                                                      
350.00 170705      C                   MOVEL     CXTLTAL1      DAL1                           DAL1 Description    
351.00 170705       **   Perform: write Hidden copy of CQRXPF                                                     
352.00 170705      C                   EVAL      D0OBNK = CXOBNK                                                  
353.00 170705      C                   EVAL      D0TYP = CXTYP                                                    
354.00 170705      C                   EVAL      D0CPET = CXCPET                                                  
355.00 170705      C                   EVAL      D0CHQ = CXCHQ                                                    
356.00 170705      C                   EVAL      D0AMT = CXAMT                                                    
357.00 170705      C                   EVAL      D0ONAM = CXONAM                                                  
358.00 170705      C                   EVAL      D0OACT = CXOACT                                                  
359.00 170705      C                   EVAL      D0ENV = CXENV                                                    
360.00 170705      C                   EVAL      D0STS = CXSTS                                                    
361.00 170705      C                   EVAL      D0TLTTIM = CXTLTTIM                                              
362.00 170705      C                   EVAL      D0TLTBRN = CXTLTBRN                                              
363.00 170705      C                   EVAL      D0TLTCUR = CXTLTCUR                                              
364.00 170705      C                   EVAL      D0TLTTC = CXTLTTC                                                
365.00 170705      C                   EVAL      D0TLTAL1 = CXTLTAL1                                              
366.00 170705      C                   EVAL      D0TLTUSR = CXTLTUSR                                              
367.00 170705      C                   EVAL      D0TLTWS = CXTLTWS                                                
368.00 170705      C                   EVAL      D0TLTAPP = CXTLTAPP                                              
369.00 170705      C                   EVAL      D0TLTACT = CXTLTACT                                              
370.00 170705      C                   EVAL      D0TLTTIL = CXTLTTIL                                              
371.00 170705      C                   EVAL      D0TLTSSN = CXTLTSSN                                              
372.00 170705      C                   EVAL      D0TLTNBR = CXTLTNBR                                              
373.00 170705      C                   EVAL      D0TLTBSQ = CXTLTBSQ                                              
374.00 170705      C                   EVAL      D0TLTCOR = CXTLTCOR                                              
375.00 170705      C                   EVAL      D0TLTCSQ = CXTLTCSQ                                              
376.00 170906      C                   EVAL      D0TLTCD = CXTLTCD                                                
377.00 170705      C                                                                                              
378.00 170315      C                   EVAL      STQTY = STQTY + 1                                                
379.00 170705      C                   EVAL      STAMT = STAMT + CXTLTTC                                          
380.00 170705      C                   EVAL      SRRN = SRRN + 1                                                  
381.00 170315      C                   WRITE     CQRI00SFL                                                        
382.00 170315      C                                                                                              
383.00 170315      C                   ENDIF                                                                      
384.00 170317      C                                                                                              
385.00 170712      C                   READ      CQRXPF                                 52                        
386.00 170309      C                   ENDDO                                                                      
387.00 170317      C                   CLOSE     CQRXPF                                                           
388.00 170309      C                                                                                              
389.00 170308      C                   ENDSR                                                                      
390.00 170308      C**********************************************************************                        
391.00 170308      C*                  Subroutine: CLS00SFL                              *                        
392.00 161027      C*          Close writing Spool file and set on display indicator     *                        
393.00 161027      C**********************************************************************                        
394.00 161027      C     CLS00SFL      BEGSR                                                                      
395.00 161027      C                   IF        SRRN > 0                                                         
396.00 161129      C                   EVAL      SRRN=1                                                           
397.00 161027      C                   SETON                                        50                            
398.00 161027      C                   ELSE                                                                       
399.00 161027      C                   SETOFF                                       50                            
400.00 161027      C                   ENDIF                                                                      
401.00 161027      C                   ENDSR                                                                      
402.00 170704      C**********************************************************************                        
403.00 170704      C*            SR: OPT0X - Action when Option X selected                                        
404.00 170704      C**********************************************************************                        
405.00 170705      C     OPT0X         BEGSR                                                                      
406.00 170705      C                                                                                              
407.00 170705      C                   SETOFF                                       70                            
408.00 170719      C                   SETOFF                                       747576                        
409.00 170906      C                   SETOFF                                       7879                          
410.00 170705      C                                                                                              
411.00 170705       *    Check: check if user cancel                                                              
412.00 170712      C                   EVAL      SMACC = DACC                                                     
413.00 170712      C                   EVAL      SMCCY = DCCY                                                     
414.00 170712      C                   EVAL      SMAL1 = DAL1                                                     
415.00 170801      C                   EVAL      SMENV = D0ENV                                                    
416.00 170712      C                   EVAL      SMOBK = DOBK                                                     
417.00 170712      C                   EVAL      SMCHQAC = DCHQAC                                                 
418.00 170712      C                   EVAL      SMCHQ = DCHQ                                                     
419.00 170706      C                   DOW       *IN12 = *OFF                                                     
420.00 170706      C                   EXFMT     CQRI00MNT                                                        
421.00 170706      C                   IF        *IN10 = *ON                                                      
422.00 170706      C                   SETOFF                                       10                            
423.00 170706      C                   LEAVE                                                                      
424.00 170706      C                   ENDIF                                                                      
425.00 170706      C                   ENDDO                                                                      
426.00 170706      C                   IF        *IN12 = *ON                                                      
427.00 170706      C                   SETON                                        74                            
428.00 170706      C                   SETOFF                                       12                            
429.00 170706      C                   ENDIF                                                                      
430.00 170706      C                                                                                              
431.00 170705       *    Check: Check record existence                                                            
432.00 170706      C                   OPEN      CQRXPF                                                           
433.00 170706      C                   EVAL      KCXOBNK = D0OBNK                                                 
434.00 170706      C                   EVAL      KCXTYP = D0TYP                                                   
435.00 170706      C                   EVAL      KCXCPET = D0CPET                                                 
436.00 170706      C                   EVAL      KCXCHQ = D0CHQ                                                   
437.00 170706      C     KCQRXPF       CHAIN     CQRXPF                                                           
438.00 170706      C                   IF        NOT %FOUND(CQRXPF)                                               
439.00 170706      C                   SETON                                        75                            
440.00 170706      C                   ENDIF                                                                      
441.00 170706      C                   CLOSE     CQRXPF                                                           
442.00 170719      C                                                                                              
443.00 170719       *    Check: Entrance Authority                                                                
444.00 170719      C                   CALL      'CHKAUT'                                                         
445.00 170719      C                   PARM                    WUSER                                              
446.00 170719      C                   PARM      'INCHQR'      PMOPT             6                                
447.00 170719      C                   PARM      '1'           PLEVEL            1                                
448.00 170719      C                   PARM      '0X'          POPT              2                                
449.00 170719      C                   PARM                    PBRN              3                                
450.00 170719      C                   PARM                    PIBRN             3                                
451.00 170719      C                   PARM                    PBNAME           30                                
452.00 170719      C                   PARM                    PAUT              1                                
453.00 170719      C                   IF        PAUT='N'                                                         
454.00 170719      C                   EVAL      SMSG=MSG076                                                      
455.00 170719      C                   SETON                                        76                            
456.00 170719      C                   ENDIF                                                                      
457.00 170706      C                                                                                              
458.00 170719       *    Check: Whether envelope number duplicated                                                
459.00 170719      C     SMENV         CHAIN     CQRXENV                                                          
460.00 170719      C                   IF        %FOUND(CQRXENV)                                                  
461.00 170719      C                   EVAL      SMSG=MSG078                                                      
462.00 170719      C                   SETON                                        78                            
463.00 170719      C                   ENDIF                                                                      
464.00 170803      C                                                                                              
465.00 170906       *    Check: Whether User Change SMAL1 or SMENV                                                
466.00 170906      C                   IF        SMAL1 = DAL1 AND SMENV = D0ENV                                   
467.00 170906      C                   EVAL      SMSG=MSG079                                                      
468.00 170906      C                   SETON                                        79                            
469.00 170906      C                   ENDIF                                                                      
470.00 170906      C                                                                                              
471.00 170906       *    Check: Whether rcd existence in PST001L8                                                 
472.00 170906      C                   OPEN      PST001L8                                                         
473.00 170906      C                   EVAL      KTLTBNK = 1                                                      
474.00 170906      C                   EVAL      KTLTBRN = D0TLTBRN                                               
475.00 170906      C                   EVAL      KTLTNBR = D0TLTNBR                                               
476.00 170906      C                   EVAL      KTLTTIL = D0TLTTIL                                               
477.00 170906      C                   EVAL      KTLTCUR = D0TLTCUR                                               
478.00 170906      C                   EVAL      KTLTCD = D0TLTCD                                                 
479.00 170906      C                   EVAL      KTLTBSQ = D0TLTBSQ                                               
480.00 170906      C     KPST001L8     CHAIN     PST001L8                                                         
481.00 170906      C                   IF        NOT %FOUND(PST001L8)                                             
482.00 170906      C                   EVAL      SMSG=MSG075                                                      
483.00 170906      C                   SETON                                        75                            
484.00 170906      C                   ENDIF                                                                      
485.00 170906      C                   CLOSE     PST001L8                                                         
486.00 170906      C                                                                                              
487.00 170906       *    Check: Whether rcd existence in TAP005L8 & TAP020                                        
488.00 170912 D7266C                   IF        D0TLTAPP <> '40'                                                 
489.00 170906      C                   OPEN      TAP020                                                           
490.00 170906      C                   EVAL      KDHBANK = 1                                                      
491.00 170906      C                   IF        D0TLTAPP = '20'                                                  
492.00 170906      C                   EVAL      KDHTYP = 6                                                       
493.00 170906      C                   ELSEIF    D0TLTAPP = '26'                                                  
494.00 170906      C                   EVAL      KDHTYP = 1                                                       
495.00 170906      C                   ENDIF                                                                      
496.00 170906      C                   EVAL      KDHACCT = D0TLTACT                                               
497.00 170906      C                   EVAL      VYYYY = %SUBST(%CHAR(TLPRDT):1:4)                                
498.00 170906      C                   EVAL      VMM = %SUBST(%CHAR(TLPRDT):6:2)                                  
499.00 170906      C                   EVAL      VDD = %SUBST(%CHAR(TLPRDT):9:2)                                  
500.00 170906      C                   MOVE      VYYYYMMDD     V8                                                 
501.00 170906      C                   CALL      'DFYYTOJJ'                                                       
502.00 170906      C                   PARM                    V8                8 0                              
503.00 170906      C                   PARM                    KDHDATE                                            
504.00 170906      C                   MOVE      D0TLTBRN      VBRN                                               
505.00 170906      C                   MOVE      D0TLTNBR      VNBR                                               
506.00 170906      C                   MOVE      D0TLTBSQ      VBSQ                                               
507.00 170906      C                   MOVE      VBTSQ         KDHBTSQ                                            
508.00 170906      C     KTAP005L8     CHAIN     TAP005L8                                                         
509.00 170906      C                   IF        NOT %FOUND(TAP005L8)                                             
510.00 170906      C                   EVAL      SMSG=MSG075                                                      
511.00 170906      C                   SETON                                        75                            
512.00 170906      C                   ELSE                                                                       
513.00 170906      C                   EVAL      KDHNBR = DHNBR                               *DHNBR of TAP005L8  
514.00 170906      C     KTAP020       CHAIN     TAP020                                                           
515.00 170906      C                   IF        NOT %FOUND(TAP020)                                               
516.00 170906      C                   EVAL      SMSG=MSG075                                                      
517.00 170906      C                   SETON                                        75                            
518.00 170906      C                   ENDIF                                                                      
519.00 170906      C                   ENDIF                                                                      
520.00 170906      C                   CLOSE     TAP020                                                           
521.00 170912 D7266C                   ENDIF                                                                      
522.00 170803      C                                                                                              
523.00 170706       *    Check: consolidate checkings                                                             
524.00 170706      C                   IF        *IN74 = *ON OR *IN75 = *ON                                       
525.00 170719      C                             OR *IN76 = *ON OR *IN78 = *ON                                    
526.00 170906      C                             OR *IN79 = *ON                                                   
527.00 170706      C                   SETON                                        70                            
528.00 170706      C                   ENDIF                                                                      
529.00 170706      C                                                                                              
530.00 170706       *    Perform: update cheque envelope number                                                   
531.00 170706      C                   IF        *IN70 = *OFF                                                     
532.00 170706      C                                                                                              
533.00 170808       **   Perfrom: Update Envelope# & BT Description to Cheque Master CQRXPF                       
534.00 170706      C                   OPEN      CQRXPF                                                           
535.00 170706      C                   EVAL      KCXOBNK = D0OBNK                                                 
536.00 170706      C                   EVAL      KCXTYP = D0TYP                                                   
537.00 170706      C                   EVAL      KCXCPET = D0CPET                                                 
538.00 170706      C                   EVAL      KCXCHQ = D0CHQ                                                   
539.00 170706      C     KCQRXPF       CHAIN     CQRXPF                                       *rcd exist chked    
540.00 170706      C                   EVAL      CXENV = SMENV                                                    
541.00 170801      C                   EVAL      CXSTS = 'M'                                                      
542.00 170906      C                   EVAL      CXTLTAL1 = SMAL1                                                 
543.00 170706      C                   UPDATE    RCQRXPF                                                          
544.00 170706      C                   CLOSE     CQRXPF                                                           
545.00 170719      C                                                                                              
546.00 170807       **   Perform: Update Desciption to PST001L8                                                   
547.00 170906      C                   OPEN      PST001L8                                                         
548.00 170906      C                   EVAL      KTLTBNK = 1                                                      
549.00 170906      C                   EVAL      KTLTBRN = D0TLTBRN                                               
550.00 170906      C                   EVAL      KTLTNBR = D0TLTNBR                                               
551.00 170906      C                   EVAL      KTLTTIL = D0TLTTIL                                               
552.00 170906      C                   EVAL      KTLTCUR = D0TLTCUR                                               
553.00 170906      C                   EVAL      KTLTCD = D0TLTCD                                                 
554.00 170906      C                   EVAL      KTLTBSQ = D0TLTBSQ                                               
555.00 170906      C     KPST001L8     CHAIN     PST001L8                                     *rcd exist chked    
556.00 170906      C                   EVAL      TLTAL1 = SMAL1                                                   
557.00 170906      C                   UPDATE    PST0011                                                          
558.00 170906      C                   CLOSE     PST001L8                                                         
559.00 170906      C                                                                                              
560.00 170906       **   Perform: Update Desciption to TAP020 (Not for GL a/c)                                    
561.00 170906      C                   IF        D0TLTAPP <> '40'                                                 
562.00 170906      C                   OPEN      TAP020                                                           
563.00 170906      C                   EVAL      KDHBANK = 1                                                      
564.00 170906      C                   IF        D0TLTAPP = '20'                                                  
565.00 170906      C                   EVAL      KDHTYP = 6                                                       
566.00 170906      C                   ELSEIF    D0TLTAPP = '26'                                                  
567.00 170906      C                   EVAL      KDHTYP = 1                                                       
568.00 170906      C                   ENDIF                                                                      
569.00 170906      C                   EVAL      KDHACCT = D0TLTACT                                               
570.00 170906      C                   EVAL      VYYYY = %SUBST(%CHAR(TLPRDT):1:4)                                
571.00 170906      C                   EVAL      VMM = %SUBST(%CHAR(TLPRDT):6:2)                                  
572.00 170906      C                   EVAL      VDD = %SUBST(%CHAR(TLPRDT):9:2)                                  
573.00 170906      C                   MOVE      VYYYYMMDD     V8                                                 
574.00 170906      C                   CALL      'DFYYTOJJ'                                                       
575.00 170906      C                   PARM                    V8                8 0                              
576.00 170906      C                   PARM                    KDHDATE                                            
577.00 170906      C                   MOVE      D0TLTBRN      VBRN                                               
578.00 170906      C                   MOVE      D0TLTNBR      VNBR                                               
579.00 170906      C                   MOVE      D0TLTBSQ      VBSQ                                               
580.00 170906      C                   MOVE      VBTSQ         KDHBTSQ                                            
581.00 170906      C     KTAP005L8     CHAIN     TAP005L8                                                         
582.00 170906      C                   EVAL      KDHNBR = DHNBR                               *DHNBR of TAP005L8  
583.00 170906      C     KTAP020       CHAIN     TAP020                                       *rcd exist chked    
584.00 170906      C                   MOVEL     SMAL1         DHDSC1                                             
585.00 170906      C                   UPDATE    TAP0201                                                          
586.00 170906      C                   CLOSE     TAP020                                                           
587.00 170906      C                   ENDIF                                                                      
588.00 170906      C                                                                                              
589.00 170906      C                   EVAL      SMSG=MSGSUCC                                                     
590.00 170906      C                                                                                              
591.00 170705      C                   ENDIF                                                                      
592.00 170705      C                                                                                              
593.00 170705      C                   ENDSR                                                                      
594.00 170705      C**********************************************************************                        
595.00 170705      C*                 SR: OPTF05 - F5 Refresh option                                              
596.00 170705      C**********************************************************************                        
597.00 170705      C     OPTF05        BEGSR                                                                      
598.00 170705      C                                                                                              
599.00 170705      C                   SETOFF                                       70                            
600.00 170719      C                   SETOFF                                       717476                        
601.00 170719      C                   SETOFF                                       77                            
602.00 170705      C                                                                                              
603.00 170705       *    Check: let user select branch                                                            
604.00 170705      C                   DOW       *IN12 = *OFF                                                     
605.00 170707      C                                                                                              
606.00 170705      C                   EXFMT     CQRI00BRN                                                        
607.00 170707      C                   MOVE      SUBRN         KCXBBRN                                            
608.00 170707      C     KCXBBRN       CHAIN     CQRXBRN                                                          
609.00 170707      C                                                                                              
610.00 170707      C                   IF        NOT %FOUND(CQRXBRN)                                              
611.00 170707      C                   SETON                                        71                            
612.00 170707      C                   ELSE                                                                       
613.00 170707      C                   SETOFF                                       71                            
614.00 170707      C                   IF        *IN10 = *ON                                                      
615.00 170707      C                   SETOFF                                       10                            
616.00 170707      C                   LEAVE                                                                      
617.00 170707      C                   ENDIF                                                                      
618.00 170707      C                   ENDIF                                                                      
619.00 170707      C                                                                                              
620.00 170705      C                   ENDDO                                                                      
621.00 170705      C                                                                                              
622.00 170707       *    Check: check did user cancel                                                             
623.00 170705      C                   IF        *IN12 = *ON                                                      
624.00 170707      C                   SETOFF                                       12                            
625.00 170705      C                   SETON                                        74                            
626.00 170705      C                   ENDIF                                                                      
627.00 170719      C                                                                                              
628.00 170719       *    Check: Entrance Authority                                                                
629.00 170719      C                   CALL      'CHKAUT'                                                         
630.00 170719      C                   PARM                    WUSER                                              
631.00 170719      C                   PARM      'INCHQR'      PMOPT             6                                
632.00 170719      C                   PARM      '1'           PLEVEL            1                                
633.00 170719      C                   PARM      'F5'          POPT              2                                
634.00 170719      C                   PARM                    PBRN              3                                
635.00 170719      C                   PARM                    PIBRN             3                                
636.00 170719      C                   PARM                    PBNAME           30                                
637.00 170719      C                   PARM                    PAUT              1                                
638.00 170719      C                   IF        PAUT='N'                                                         
639.00 170719      C                   EVAL      SMSG=MSG076                                                      
640.00 170719      C                   SETON                                        76                            
641.00 170719      C                   ENDIF                                                                      
642.00 170719      C                                                                                              
643.00 170719       *    Check: Whether Locked in data area CQRXLCK                                               
644.00 170719      C     *LOCK         IN        VLOCK                                                            
645.00 170719      C                   IF        VLOCK <> ' '                                                     
646.00 170719      C                   EVAL      SMSG=MSG077                                                      
647.00 170719      C                   SETON                                        77                            
648.00 170719      C                   ENDIF                                                                      
649.00 170913 D7266C                   OUT       VLOCK                                                            
650.00 170719      C                                                                                              
651.00 170705       *    Check: consolidate checkings                                                             
652.00 170705      C                   IF        *IN71 = *ON OR *IN74 = *ON                                       
653.00 170719      C                             OR *IN76 = *ON OR *IN77 = *ON                                    
654.00 170705      C                   SETON                                        70                            
655.00 170705      C                   ENDIF                                                                      
656.00 170705      C                                                                                              
657.00 170705       *    Final: call extraction pgm                                                               
658.00 170705      C                   IF        *IN70 = *OFF                                                     
659.00 170719      C                                                                                              
660.00 170719       **   Do: Turn on lock in dtaara                                                               
661.00 170719      C     *LOCK         IN        VLOCK                                                            
662.00 170719      C                   EVAL      VLOCK = 'B'                                                      
663.00 170719      C                   OUT       VLOCK                                                            
664.00 170719      C                                                                                              
665.00 170719       **   Do: perform refresh                                                                      
666.00 170705      C                   CALL      'CQRXCL'                                                         
667.00 170719      C                   PARM                    SUBRN                                              
668.00 170719      C                                                                                              
669.00 170719       **   Do: Turn off lock in dtaara                                                              
670.00 170719      C     *LOCK         IN        VLOCK                                                            
671.00 170719      C                   EVAL      VLOCK = ' '                                                      
672.00 170719      C                   OUT       VLOCK                                                            
673.00 170719      C                                                                                              
674.00 170906      C                   EVAL      SMSG=MSGSUCC                                                     
675.00 170821      C                                                                                              
676.00 170705      C                   ENDIF                                                                      
677.00 170705      C                                                                                              
678.00 170705      C                   ENDSR                                                                      
679.00 170705      C**********************************************************************                        
680.00 170705      C*                 SR: OPTF07 - F7 Generate AMCM file                                          
681.00 170705      C**********************************************************************                        
682.00 170705      C     OPTF07        BEGSR                                                                      
683.00 170705      C                                                                                              
684.00 170719      C                   SETOFF                                       70                            
685.00 170719      C                   SETOFF                                       76                            
686.00 170719      C                                                                                              
687.00 170719       *    Check: Entrance Authority                                                                
688.00 170719      C                   CALL      'CHKAUT'                                                         
689.00 170719      C                   PARM                    WUSER                                              
690.00 170719      C                   PARM      'INCHQR'      PMOPT             6                                
691.00 170719      C                   PARM      '1'           PLEVEL            1                                
692.00 170719      C                   PARM      'F7'          POPT              2                                
693.00 170719      C                   PARM                    PBRN              3                                
694.00 170719      C                   PARM                    PIBRN             3                                
695.00 170719      C                   PARM                    PBNAME           30                                
696.00 170719      C                   PARM                    PAUT              1                                
697.00 170719      C                   IF        PAUT='N'                                                         
698.00 170719      C                   EVAL      SMSG=MSG076                                                      
699.00 170719      C                   SETON                                        76                            
700.00 170719      C                   ENDIF                                                                      
701.00 170719      C                                                                                              
702.00 170719       *    Check: consolidate checkings                                                             
703.00 170719      C                   IF        *IN76 = *ON                                                      
704.00 170719      C                   SETON                                        70                            
705.00 170719      C                   ENDIF                                                                      
706.00 170719      C                                                                                              
707.00 170719       *    Final: call extraction pgm                                                               
708.00 170719      C                   IF        *IN70 = *OFF                                                     
709.00 170719      C                   CALL      'CQRIGENCL'                                                      
710.00 170906      C                   EVAL      SMSG=MSGSUCC                                                     
711.00 170719      C                   ENDIF                                                                      
712.00 170705      C                                                                                              
713.00 170705      C                   ENDSR                                                                      
714.00 170704      C**********************************************************************                        
715.00 170705      C*                 SR: OPTF10 - F10 Report option                                              
716.00 170704      C**********************************************************************                        
717.00 170704      C     OPTF10        BEGSR                                                                      
718.00 170704      C                                                                                              
719.00 170704      C                   SETOFF                                       70                            
720.00 170719      C                   SETOFF                                       717476                        
721.00 170704      C                                                                                              
722.00 170705       *    Check: let user input branch                                                             
723.00 170707      C                   DOW       *IN12 = *OFF                                                     
724.00 170707      C                                                                                              
725.00 170707      C                   EXFMT     CQRI00BRN                                                        
726.00 170707      C                   MOVE      SUBRN         KCXBBRN                                            
727.00 170707      C     KCXBBRN       CHAIN     CQRXBRN                                                          
728.00 170707      C                                                                                              
729.00 170707      C                   IF        NOT %FOUND(CQRXBRN) AND SUBRN <> 999         *Allow 999          
730.00 170707      C                   SETON                                        71                            
731.00 170707      C                   ELSE                                                                       
732.00 170707      C                   SETOFF                                       71                            
733.00 170707      C                   IF        *IN10 = *ON                                                      
734.00 170707      C                   SETOFF                                       10                            
735.00 170707      C                   LEAVE                                                                      
736.00 170707      C                   ENDIF                                                                      
737.00 170707      C                   ENDIF                                                                      
738.00 170707      C                                                                                              
739.00 170707      C                   ENDDO                                                                      
740.00 170707      C                                                                                              
741.00 170707       *    Check: check did user cancel                                                             
742.00 170707      C                   IF        *IN12 = *ON                                                      
743.00 170707      C                   SETOFF                                       12                            
744.00 170707      C                   SETON                                        74                            
745.00 170707      C                   ENDIF                                                                      
746.00 170719      C                                                                                              
747.00 170719       *    Check: Entrance Authority                                                                
748.00 170719      C                   CALL      'CHKAUT'                                                         
749.00 170719      C                   PARM                    WUSER                                              
750.00 170719      C                   PARM      'INCHQR'      PMOPT             6                                
751.00 170719      C                   PARM      '1'           PLEVEL            1                                
752.00 170719      C                   PARM      'FA'          POPT              2                                
753.00 170719      C                   PARM                    PBRN              3                                
754.00 170719      C                   PARM                    PIBRN             3                                
755.00 170719      C                   PARM                    PBNAME           30                                
756.00 170719      C                   PARM                    PAUT              1                                
757.00 170719      C                   IF        PAUT='N'                                                         
758.00 170719      C                   EVAL      SMSG=MSG076                                                      
759.00 170719      C                   SETON                                        76                            
760.00 170719      C                   ENDIF                                                                      
761.00 170705      C                                                                                              
762.00 170705       *    Check: consolidate checkings                                                             
763.00 170705      C                   IF        *IN71 = *ON OR *IN74 = *ON                                       
764.00 170719      C                             OR *IN76 = *ON                                                   
765.00 170705      C                   SETON                                        70                            
766.00 170704      C                   ENDIF                                                                      
767.00 170704      C                                                                                              
768.00 170705       *    Final: call report printing pgm                                                          
769.00 170704      C                   IF        *IN70 = *OFF                                                     
770.00 170821      C                                                                                              
771.00 170707      C                   CALL      'CQRIRPTCL'                                                      
772.00 170707      C                   PARM                    SUBRN                                              
773.00 170821      C                                                                                              
774.00 170906      C                   EVAL      SMSG=MSGSUCC                                                     
775.00 170821      C                                                                                              
776.00 170704      C                   ENDIF                                                                      
777.00 170704      C                                                                                              
778.00 170317      C                   ENDSR                                                                      
779.00 170704      C**                                                                                            
