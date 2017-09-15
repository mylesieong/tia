1.00 990823      H DATEDIT(*DMY)                                                            
2.00 990823      H**********************************************************************    
3.00 80821      H*   Reference No. : C8224                                       *         
4.00 80716      H*   Program ID.   : FCIUMEMO                                              
5.00 80702      H*   Program Name  : Check if the memo need to review                      
6.00 80707      H*                   PERRIND - ERROR INDICATOR                             
7.00 80627      H*                            '0' : OK                                     
8.00 80627      H*                            '1' : CANNOT FIND CIF                        
9.00 80627      H*                            '2' : PROGRAM HAS ERROR                      
10.00 80626      H*   Author        : Kylie Leong (B729PGM)                                 
11.00 80702      H*   Date written  : 02 Jun 2008                                           
12.00 990823      H*   Date changed  :                                                       
13.00 990823      H**********************************************************************    
14.00 111018       *   Reference No. : CHG-303-11                                  *         
15.00 111018       *   User ID       : B323                                        *         
16.00 111018       *   User Name     : edward cheung                               *         
17.00 111018       *   Changed Date  : 15-oct-2011                                 *         
18.00 111018       *   Change        : Allow checking of incomplete information    *         
19.00 111018       *                   at account level                            *         
20.00 111018       *---------------------------------------------------------------*         
21.00 170320       *   Reference No. : CHG-096-17                                  *         
22.00 161209       *   User ID       : BI77                                        *         
23.00 161209       *   User Name     : Myles Ieong                                 *         
24.00 161209       *   Changed Date  : 09-Dec-2016                                 *         
25.00 161209       *   Change        : Create hold function checking for CDD code  *         
26.00 161209       *---------------------------------------------------------------*         
27.00 990823      F*                                                                         
28.00 80702      FCUP051    IF   E           K DISK    USROPN PREFIX(C)                     
29.00 80702       *   Tickler Master File                                                   
30.00 80702       *                                                                         
31.00 80702       ************************************************************************  
32.00 80702       * VARIABLE                                                                
33.00 80702       ************************************************************************  
34.00 80702      D*  PROGRAM EXCEPTION/ERROR SUBROUTINE                                     
35.00 80702      D               ESDS                  EXTNAME(DSPGMSTS)                    
36.00 80702      D PACCTNO         S             12  0 INZ(*ZERO)                           
37.00 80702      D PAPP            S              2  0 INZ(*ZERO)                           
38.00 80702      D CHKIND          S              1    INZ(*BLANK)                          
39.00 80714      D ITEMCLS         S              4    INZ('PDN-')                          
40.00 170320 D7096D ITEMCLSAML      S              4    INZ('*CDD')                          
41.00 110705      D ITEMID          S             10    INZ('UPDATE')                        
42.00 170320 D7096D ITEMIDAML       S             10    INZ('REVIEWED')                      
43.00 80627      C**********************************************************************    
44.00 80702      C* Declare Key list                                                        
45.00 80702      C************************************************************************  
46.00 80702      C*    COMPOSITE KEY DEFINITION FOR S/O TARGET  FILE (SOP004L               
47.00 80702      C     C@KEY1        KLIST                                                  
48.00 80702      C                   KFLD                    DMBK              3 0          
49.00 80702      C                   KFLD                    X@APP             2 0          
50.00 80702      C                   KFLD                    X@ACCT           12            
51.00 80702      C**********************************************************************    
52.00 80702      C************************************************************************  
53.00 80702      C* Initialize output parameter                                             
54.00 80702      C************************************************************************  
55.00 80702      C                   Z-ADD     1             DMBK                           
56.00 80702      C************************************************************************  
57.00 80702      C* Main routine                                                            
58.00 80702      C************************************************************************  
59.00 80702      C*                                                                         
60.00 80702      C* MAIN PROCESS LOOP                                                       
61.00 80702      C*                                                                         
62.00 80702      C     *ENTRY        PLIST                                                  
63.00 80702      C                   PARM                    PPGMNAM           6            
64.00 80702      C                   PARM                    PTLTSWT           2            
65.00 80702      C                   PARM                    PTLTNBR           4 0          
66.00 170320      C                   PARM                    PTLTBRN           5 0          
67.00 80702      C                   PARM                    PTLTRCR           1            
68.00 80716      C                   PARM                    PFRAPP            2            
69.00 80716      C                   PARM                    PTOAPP            2            
70.00 80716      C                   PARM                    PTLTCOR           1            
71.00 80702      C                   PARM                    PDMAMFG           1 0          
72.00 80702      C                   PARM                    PTYP              1 0          
73.00 80702      C                   PARM                    PACCT            12 0          
74.00 80702      C                   PARM                    PREJCOD           3            
75.00 80702      C                   PARM                    PINQREJ           1 0          
76.00 80702      C                   PARM                    PERRIND           1            
77.00 990824      C*                                                                         
78.00 80702      C                                                                          
79.00 80707      C                   EVAL      PREJCOD = ' '                                
80.00 80702      C                   EVAL      PERRIND = '0'                                
81.00 80702      C                   EVAL      PINQREJ = 0                                  
82.00 80714      C                   EVAL      CHKIND = ' '                                 
83.00 80702      C                                                                          
84.00 80702      C                   IF        PTLTSWT = 'WT' AND PTLTNBR < 7001            
85.00 170320      C*                            AND PTLTNBR <> 800 AND PTLTCOR=' '           
86.00 170320      C                             AND PTLTBRN <> 800 AND PTLTCOR=' '           
87.00 80716  edw C                   IF        PFRAPP <> ' '                                
88.00 80716      C                             OR (PFRAPP = '40' AND                        
89.00 80716      C                             ( PTOAPP = '20'  OR PTOAPP = '26'            
90.00 80716      C                              OR PTOAPP = '30' OR PTOAPP = '50'))         
91.00 80702      C*  CHECK FOR ANY ACCT LEVEL MEMOS - REQUIRED VIEW ITEM                    
92.00 80709      C*    PDMAMFG       IFEQ      2                                            
93.00 80709      C*    PDMAMFG       OREQ      3                                            
94.00 80709      C*                  EVAL      PREJCOD = '429'                              
95.00 80709      C*                  MOVE      '1'           CHKIND                         
96.00 80709      C*                  ELSE                                                   
97.00 80709      C*                  MOVE      *BLANK        CHKIND                         
98.00 80709      C*                  ENDIF                                                  
99.00 80702      C                                                                          
100.00 80703      C*  IF NO ACCT LVL, CHECK FOR ANY CUST LEVEL MEMOS                         
101.00 80703      C     CHKIND        IFEQ      *BLANK                                       
102.00 80703      C                                                                          
103.00 170320 D1303C                   EXSR      FMTKEY                                       
104.00 111018 D1303C                   Z-ADD     PAPP          X@APP                          
105.00 111018 D1303C                   MOVEL(P)  PACCTNO       X@ACCT                         
106.00 111018 D1303C                   MOVE      ' '           CHKIND                         
107.00 111018 D1303C                   EXSR      GETMEMO                                      
108.00 111018 D1303C                   MOVE      CHKIND        ACCIND            1            
109.00 110128                                                                                 
110.00 110128                                                                                 
111.00 80703      C                   EXSR      GCIF                                         
112.00 80703      C                                                                          
113.00 80703      C                   Z-ADD     90            X@APP                          
114.00 80703      C                   MOVEL(P)  PCIF          X@ACCT                         
115.00 111018 D1303C                   MOVE      ' '           CHKIND                         
116.00 111018 D1303C                   EXSR      GETMEMO                                      
117.00 111018 D1303C                   MOVE      CHKIND        CIFIND            1            
118.00 80703      C                                                                          
119.00 111018 D1303C*                  OPEN      CUP051                                       
120.00 111018 D1303C*    C@KEY1        SETLL     CUP051                                 70    
121.00 111018 D1303C*    *IN70         IFEQ      *ON                                          
122.00 111018 D1303C* CHECK IF CUSTOMER MEMO IS REQUIRED VIEW ITEM                            
123.00 111018 D1303C*    C@KEY1        READE     CUP051                                 70    
124.00 111018 D1303C*    *IN70         DOWEQ     *OFF                                         
125.00 111018 D1303C*                  IF        ITEMCLS = %SUBST(CCACLS:1:4)                 
126.00 111018 D1303C*                  EXSR      CHKRQV                                       
127.00 111018 D1303C*                                                                         
128.00 111018 D1303C*                  IF        CHKIND = '1'                                 
129.00 111018 D1303C*                  LEAVE                                                  
130.00 111018 D1303C*                  ENDIF                                                  
131.00 111018 D1303C*                                                                         
132.00 111018 D1303C*                  ENDIF                                                  
133.00 111018 D1303C*    C@KEY1        READE     CUP051                                 70    
134.00 111018 D1303C*                  ENDDO                                                  
135.00 111018 D1303C*                  CLOSE     CUP051                                       
136.00 80703      C                                                                          
137.00 111018 D1303C*                  ENDIF                                                  
138.00 80703      C                   ENDIF                                                  
139.00 80703      C                                                                          
140.00 80702      C                                                                          
141.00 80702      C                   ELSE                                                   
142.00 80709      C*                  IF        PDMAMFG = 2 OR PDMAMFG = 3                   
143.00 80709      C*                  EVAL      PREJCOD = '229'                              
144.00 80709      C*                  EVAL      PINQREJ = 2                                  
145.00 80709      C*                  ENDIF                                                  
146.00 80702      C                                                                          
147.00 80702      C                   ENDIF                                                  
148.00 80716 edw  C                   ENDIF                                                  
149.00 80702      C*                                                                         
150.00 170320 D7096C                   IF        CHKRQVTYP <> 'AML  '                         
151.00 111018 D1303C                   IF        CIFIND='1'                                   
152.00 111018 D1303C                   EVAL      PREJCOD = '429'                              
153.00 111018 D1303C                   IF        ACCIND='1'                                   
154.00 111018 D1303C                   EVAL      PREJCOD = '431'                              
155.00 111018 D1303C                   ENDIF                                                  
156.00 111018 D1303C                   ELSE                                                   
157.00 111018 D1303C                   IF        ACCIND = '1'                                 
158.00 111018 D1303C                   EVAL      PREJCOD = '430'                              
159.00 111018 D1303C                   ENDIF                                                  
160.00 111018 D1303C                   ENDIF                                                  
161.00 111018 D1303C                                                                          
162.00 170320 D7096C                   ELSE                                                   
163.00 170320 D7096C                   IF        CIFIND='1'                                   
164.00 170320 D7096C                   EVAL      PREJCOD = '433'                              
165.00 170320 D7096C                   IF        ACCIND='1'                                   
166.00 170320 D7096C                   EVAL      PREJCOD = '434'                              
167.00 170320 D7096C                   ENDIF                                                  
168.00 170320 D7096C                   ELSE                                                   
169.00 170320 D7096C                   IF        ACCIND = '1'                                 
170.00 170320 D7096C                   EVAL      PREJCOD = '432'                              
171.00 170320 D7096C                   ENDIF                                                  
172.00 170320 D7096C                   ENDIF                                                  
173.00 170320 D7096C                   ENDIF                                                  
174.00 80702      C     ENDPGM        TAG                                                    
175.00 80627      C                   SETON                                        LR        
176.00 80702      C**************************************************************************
177.00 80703      C*    GCIF - get CIF                                                       
178.00 80702      C**************************************************************************
179.00 80703      C     GCIF          BEGSR                                                  
180.00 110131      C                                                                          
181.00 111018 D1303C                   EXSR      FMTKEY                                       
182.00 80702      C                                                                          
183.00 111018 D1303C*                  IF        PPGMNAM = 'PS1002'                           
184.00 111018 D1303C*                            OR PPGMNAM = 'PS1008'                        
185.00 111018 D1303C*                            OR PPGMNAM = 'PS1010'                        
186.00 111018 D1303C*                            OR PPGMNAM = 'PS2002'                        
187.00 111018 D1303C*                  EVAL      PACCTNO = PTYP * 10000000000 + PACCT         
188.00 111018 D1303C*                  EVAL      PAPP = 20                                    
189.00 111018 D1303C*                  ENDIF                                                  
190.00 111018 D1303C*                                                                         
191.00 111018 D1303C*                  IF        PPGMNAM = 'PS3008'                           
192.00 111018 D1303C*                  EVAL      PACCTNO = PACCT                              
193.00 111018 D1303C*                  EVAL      PAPP = 30                                    
194.00 111018 D1303C*                  ENDIF                                                  
195.00 111018 D1303C*                                                                         
196.00 111018 D1303C*                  IF        PPGMNAM = 'PS5008'                           
197.00 111018 D1303C*                  EVAL      PACCTNO = PACCT                              
198.00 111018 D1303C*                  EVAL      PAPP = 50                                    
199.00 111018 D1303C*                  ENDIF                                                  
200.00 80703      C                                                                          
201.00 80702      C                   CALL      'GACCTCIF'                                   
202.00 80702      C                   PARM                    PACCTNO                        
203.00 80702      C                   PARM                    PAPP                           
204.00 80702      C                   PARM                    PCIF             10            
205.00 80702      C                   PARM                    PERRIND           1            
206.00 80703      C                                                                          
207.00 80703      C                   ENDSR                                                  
208.00 80703      C**************************************************************************
209.00 80703      C*    CHKRQV - Check Require View if it need to view memo                  
210.00 80703      C**************************************************************************
211.00 80703      C     CHKRQV        BEGSR                                                  
212.00 80703      C                                                                          
213.00 111018 D1303C                   IF        X@APP<>90                                    
214.00 170320 D7096C                                                                          
215.00 170320 D7096C                   IF        CHKRQVTYP = '     '                          
216.00 170110 D1303C                   IF        CCAITID <>ITEMID                             
217.00 111018 D1303C                   MOVE      '1'           CHKIND                         
218.00 111018 D1303C                   ENDIF                                                  
219.00 170320 D7096C                   ENDIF                                                  
220.00 170320 D7096C                                                                          
221.00 170320 D7096C                   IF        CHKRQVTYP = 'AML  '                          
222.00 170320 D7096C                   IF        %TRIM(%SUBST(CCATEXT:1:50))<>ITEMIDAML       
223.00 170320 D7096C                   MOVE      '1'           CHKIND                         
224.00 170320 D7096C                   ENDIF                                                  
225.00 170320 D7096C                   ENDIF                                                  
226.00 170320 D7096C                                                                          
227.00 111018 D1303C                   ELSE                                                   
228.00 170320 D7096C                                                                          
229.00 170320 D7096C                   IF        CHKRQVTYP = '     '                          
230.00 80703      C                   IF        PPGMNAM = 'PS1002'                           
231.00 80703      C                             OR PPGMNAM = 'PS1010'                        
232.00 80703      C                             OR PPGMNAM = 'PS2002'                        
233.00 80703      C                                                                          
234.00 80702      C* CHECK IS Deposit transaction                                            
235.00 80703      C                   IF        PTLTRCR = 'C'                                
236.00 80702      C                   IF        CCARQV = 3 OR CCARQV = 4                     
237.00 80702      C                             AND CCASTAT <> 5                             
238.00 111018 D1303C*                  EVAL      PREJCOD = '429'                              
239.00 80702      C                   MOVE      '1'           CHKIND                         
240.00 80702      C                   ENDIF                                                  
241.00 80702      C                   ELSE                                                   
242.00 80702      C* CHECK IS Withdrawal transaction                                         
243.00 80702      C                   IF        CCARQV = 1 OR CCARQV = 2                     
244.00 80702      C                             OR CCARQV = 3 OR CCARQV = 4                  
245.00 80702      C                             AND CCASTAT <> 5                             
246.00 111018 D1303C*                  EVAL      PREJCOD = '429'                              
247.00 170321      C                   MOVE      '1'           CHKIND                         
248.00 80702      C                   ENDIF                                                  
249.00 80702      C                   ENDIF                                                  
250.00 80703      C                                                                          
251.00 80703      C                   ENDIF                                                  
252.00 80702      C                                                                          
253.00 80703      C                                                                          
254.00 80703      C                   IF        PPGMNAM = 'PS1008'                           
255.00 80703      C                             OR PPGMNAM = 'PS3008'                        
256.00 80703      C                             OR PPGMNAM = 'PS5008'                        
257.00 80703      C     CCARQV        IFEQ      1                                            
258.00 80703      C     CCARQV        OREQ      3                                            
259.00 80703      C     CCASTAT       ANDNE     5                                            
260.00 80703      C                   EVAL      PINQREJ = 2                                  
261.00 170321      C                   MOVE      '1'           CHKIND                         
262.00 80703      C                   ENDIF                                                  
263.00 80703      C                   ENDIF                                                  
264.00 170214      C                                                                          
265.00 170320 D7096C                   ENDIF                                                  
266.00 80703      C                                                                          
267.00 170320 D7096C                   IF        CHKRQVTYP = 'AML  '                          
268.00 170320 D7096C                             AND %TRIM(%SUBST(CCATEXT:1:50))<>ITEMIDAML   
269.00 170320 D7096C                                                                          
270.00 170320 D7096C                   IF        PPGMNAM = 'PS1002'                           
271.00 170320 D7096C                             OR PPGMNAM = 'PS1010'                        
272.00 170320 D7096C                             OR PPGMNAM = 'PS2002'                        
273.00 170320 D7096C                                                                          
274.00 170320 D7096C* CHECK IS Deposit transaction                                            
275.00 170320 D7096C                   IF        PTLTRCR = 'C'                                
276.00 170320 D7096C                   IF        CCASTAT <> 5                                 
277.00 170320 D7096C                   MOVE      '1'           CHKIND                         
278.00 170320 D7096C                   ENDIF                                                  
279.00 170320 D7096C                   ELSE                                                   
280.00 170320 D7096C* CHECK IS Withdrawal transaction                                         
281.00 170320 D7096C                   IF        CCASTAT <> 5                                 
282.00 170320 D7096C                   MOVE      '1'           CHKIND                         
283.00 170320 D7096C                   ENDIF                                                  
284.00 170320 D7096C                   ENDIF                                                  
285.00 170320 D7096C                                                                          
286.00 170320 D7096C                   ENDIF                                                  
287.00 170320 D7096C                                                                          
288.00 170320 D7096C                   IF        PPGMNAM = 'PS1008'                           
289.00 170320 D7096C                             OR PPGMNAM = 'PS3008'                        
290.00 170320 D7096C                             OR PPGMNAM = 'PS5008'                        
291.00 170320 D7096C                                                                          
292.00 170320 D7096C                   IF        CCASTAT <> 5                                 
293.00 170320 D7096C                   EVAL      PINQREJ = 2                                  
294.00 170320 D7096C                   MOVE      '1'           CHKIND                         
295.00 170320 D7096C                   ENDIF                                                  
296.00 170320 D7096C                   ENDIF                                                  
297.00 170320 D7096C                                                                          
298.00 170320 D7096C                   ENDIF                                                  
299.00 111018 D1303C                   ENDIF                                                  
300.00 80703      C                   ENDSR                                                  
301.00 111018 D1303C**************************************************************************
302.00 111018 D1303C*    GETMEMO - Get Memo for that key                                      
303.00 111018 D1303C**************************************************************************
304.00 111018 D1303C     GETMEMO       BEGSR                                                  
305.00 111018 D1303C                   OPEN      CUP051                                       
306.00 111018 D1303C     C@KEY1        SETLL     CUP051                                 70    
307.00 111018 D1303C     *IN70         IFEQ      *ON                                          
308.00 111018 D1303C* CHECK IF CUSTOMER MEMO IS REQUIRED VIEW ITEM                            
309.00 111018 D1303C     C@KEY1        READE     CUP051                                 70    
310.00 111018 D1303C     *IN70         DOWEQ     *OFF                                         
311.00 170320 D7096C                   MOVE      ''            CHKRQVTYP         5            
312.00 111018 D1303C                   IF        ITEMCLS = %SUBST(CCACLS:1:4)                 
313.00 111018 D1303C                   EXSR      CHKRQV                                       
314.00 111018 D1303C                                                                          
315.00 111018 D1303C                   IF        CHKIND = '1'                                 
316.00 111018 D1303C                   LEAVE                                                  
317.00 111018 D1303C                   ENDIF                                                  
318.00 111018 D1303C                                                                          
319.00 111018 D1303C                   ENDIF                                                  
320.00 170320 D7096C                   IF        ITEMCLSAML = %SUBST(CCACLS:1:4)              
321.00 170320 D7096C                   EVAL      CHKRQVTYP = 'AML  '                          
322.00 170320 D7096C                   EXSR      CHKRQV                                       
323.00 170320 D7096C                                                                          
324.00 170320 D7096C                   IF        CHKIND = '1'                                 
325.00 170320 D7096C                   LEAVE                                                  
326.00 170320 D7096C                   ENDIF                                                  
327.00 170320 D7096C                                                                          
328.00 170320 D7096C                   ENDIF                                                  
329.00 111018 D1303C     C@KEY1        READE     CUP051                                 70    
330.00 111018 D1303C                   ENDDO                                                  
331.00 111018 D1303C                   ENDIF                                                  
332.00 111018 D1303C                   CLOSE     CUP051                                       
333.00 111018 D1303C                   ENDSR                                                  
334.00 111018 D1303C**************************************************************************
335.00 111018 D1303C*    FMTKEY  - Format Application and CIF Code                            
336.00 111018 D1303C**************************************************************************
337.00 111018 D1303C     FMTKEY        BEGSR                                                  
338.00 111018 D1303C                   IF        PPGMNAM = 'PS1002'                           
339.00 111018 D1303C                             OR PPGMNAM = 'PS1008'                        
340.00 111018 D1303C                             OR PPGMNAM = 'PS1010'                        
341.00 111018 D1303C                             OR PPGMNAM = 'PS2002'                        
342.00 111018 D1303C                   EVAL      PACCTNO = PTYP * 10000000000 + PACCT         
343.00 111018 D1303C                   EVAL      PAPP = 20                                    
344.00 111018 D1303C                   ENDIF                                                  
345.00 111018 D1303C                                                                          
346.00 111018 D1303C                   IF        PPGMNAM = 'PS3008'                           
347.00 111018 D1303C                   EVAL      PACCTNO = PACCT                              
348.00 111018 D1303C                   EVAL      PAPP = 30                                    
349.00 111018 D1303C                   ENDIF                                                  
350.00 111018 D1303C                                                                          
351.00 111018 D1303C                   IF        PPGMNAM = 'PS5008'                           
352.00 111018 D1303C                   EVAL      PACCTNO = PACCT                              
353.00 111018 D1303C                   EVAL      PAPP = 50                                    
354.00 111018 D1303C                   ENDIF                                                  
355.00 111018 D1303C                   ENDSR                                                  
356.00 80703      C**************************************************************************
357.00 80703      C*    *PSSR - Program Error Routine                                        
358.00 80703      C**************************************************************************
359.00 80702      C     *PSSR         BEGSR                                                  
360.00 80702      C                   EVAL      PERRIND = '2'                                
361.00 80702      C                   GOTO      ENDPGM                                       
362.00 80702      C                   ENDSR                                                  
