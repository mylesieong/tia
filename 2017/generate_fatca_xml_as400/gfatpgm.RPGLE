1.00 20307      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                      
2.00 161013       **************************************************************************                    
3.00 161103       * REFERENCE NO. : CHG-xxx-16 (D6xxx)                                     *                    
4.00 161103       * PROGRAM ID.   : GFATPGM                                                *                    
5.00 161103       * DESC          :                                                        *                    
6.00 161103       * AUTHOR        : Myles Ieong                                            *                    
7.00 161103       * USER ID.      : BI77PGM                                                *                    
8.00 161104       * DATE WRITTEN  : 04/11/16                                               *                    
9.00 161013       **************************************************************************                    
10.00 160607      F**********************************************************************                        
11.00 160607      F*                         File Specification                         *                        
12.00 160607      F**********************************************************************                        
13.00 161115       *    static input files                                                                       
14.00 161115      FGFATPARM  IF   E           K DISK                                                             
15.00 161115       *    dynamic input files                                                                      
16.00 161115      FGFATACCT  IF   E           K DISK                                                             
17.00 161115      FGFATCUST  IF   E           K DISK                                                             
18.00 161115      FGFATREL   IF   E           K DISK                                                             
19.00 161115      FGFATPOOL  IF   E           K DISK                                                             
20.00 161115      FGFATBK    IF   E           K DISK                                                             
21.00 170104      FGFATPAY   IF   E           K DISK                                                             
22.00 161115       *    output file                                                                              
23.00 161013      FGFATXML   UF A E           K DISK                                                             
24.00 170104      F**                                                                                            
25.00 170104      D**********************************************************************                        
26.00 170104      D*                   Variables / constant defination                  *                        
27.00 170104      D**********************************************************************                        
28.00 170104       *    Constant value                                                                           
29.00 170217 mylesDCS@ACCOWNL       S              3    DIM(10) CTDATA                                           
30.00 170104      DCS@PARMKEY       S             10    INZ('FATCA     ')                                        
31.00 170217      DCS@XMLCAT        S             10    INZ('FATCA     ')                                        
32.00 170217       *    Temp Variable                                                                            
33.00 170217 mylesDV@3S0            S              3S 0 INZ(0)                                                   
34.00 170217 mylesDV@1A             S              1    INZ(' ')                                                 
35.00 170104      D**                                                                                            
36.00 160607      C**********************************************************************                        
37.00 160607      C*                         Key List define                            *                        
38.00 160615      C**********************************************************************                        
39.00 161013      C     KGFATPARM     KLIST                                                                      
40.00 161104      C                   KFLD                    KGMCAT           10                                
41.00 161116      C                   KFLD                    KGMBKSEQ          3 0                              
42.00 161116      C                   KFLD                    KGMLNSEQ          3 0                              
43.00 161116      C     KGFATREL      KLIST                                                                      
44.00 161116      C                   KFLD                    KGRCUX1AC        12 0                              
45.00 170106      C                   KFLD                    KGRCUXREL         3                                
46.00 160607      C**********************************************************************                        
47.00 160607      C*                          MAIN PROGRAM                              *                        
48.00 160607      C**********************************************************************                        
49.00 170104       *    initiate parameter                                                                       
50.00 170104      C                   EVAL      GXCAT = CS@XMLCAT                                                
51.00 170104      C                   EVAL      GXSEQ = 0                                                        
52.00 170104      C                                                                                              
53.00 161116       *    write the BLOCK 1 of structure                                                           
54.00 170104      C                   EVAL      KGMCAT = CS@PARMKEY                                              
55.00 161116      C                   EVAL      KGMBKSEQ = 1                                                     
56.00 161116      C                   EVAL      KGMLNSEQ = 1                                                     
57.00 161116      C     KGFATPARM     SETLL     GFATPARM                                     find the entry pnt  
58.00 161116      C                   READ      GFATPARM                                                         
59.00 161116      C                                                                                              
60.00 161116      C                   DOW       NOT %EOF(GFATPARM)                                               
61.00 161116      C                             AND GMCAT = KGMCAT                                               
62.00 161116      C                             AND GMBKSEQ = KGMBKSEQ                                           
63.00 161116      C                                                                                              
64.00 161118      C                   EXSR      GENDATA                                                          
65.00 170104      C                   EVAL      GXSEQ = GXSEQ + 1                                                
66.00 161118      C                   WRITE     RGFATXML                                                         
67.00 161118      C                   READ      GFATPARM                                                         
68.00 170104      C                                                                                              
69.00 161116      C                   ENDDO                                                                      
70.00 161116      C                                                                                              
71.00 161116       *    write the BLOCK 2 of structure                                                           
72.00 161116      C                   READ      GFATBK                                                           
73.00 161116      C                   DOW       NOT %EOF(GFATBK)                                                 
74.00 161116      C                                                                                              
75.00 170104      C                   EVAL      KGMCAT = CS@PARMKEY                                              
76.00 161116      C                   EVAL      KGMBKSEQ = 2                                                     
77.00 161116      C                   EVAL      KGMLNSEQ = 1                                                     
78.00 161116      C     KGFATPARM     SETLL     GFATPARM                                     find the entry pnt  
79.00 161116      C                   READ      GFATPARM                                                         
80.00 161116      C                                                                                              
81.00 161116      C                   DOW       NOT %EOF(GFATPARM)                                               
82.00 161116      C                             AND GMCAT = KGMCAT                                               
83.00 161116      C                             AND GMBKSEQ = KGMBKSEQ                                           
84.00 161118      C                                                                                              
85.00 161118      C                   EXSR      GENDATA                                                          
86.00 170104      C                   EVAL      GXSEQ = GXSEQ + 1                                                
87.00 161118      C                   WRITE     RGFATXML                                                         
88.00 161118      C                   READ      GFATPARM                                                         
89.00 170104      C                                                                                              
90.00 161116      C                   ENDDO                                                                      
91.00 161116      C                                                                                              
92.00 161116      C                   READ      GFATBK                                                           
93.00 161116      C                   ENDDO                                                                      
94.00 161116      C                                                                                              
95.00 170104       *    write the BLOCK 3/4/5/6/7/8 of structure                                                 
96.00 161116      C                   READ      GFATACCT                                                         
97.00 170109      C                   DOW       NOT %EOF(GFATACCT)                                               
98.00 161101      C                                                                                              
99.00 170104       **   write the BLOCK 3 of structure                                                           
100.00 170104      C                   EVAL      KGMCAT = CS@PARMKEY                                              
101.00 161116      C                   EVAL      KGMBKSEQ = 3                                                     
102.00 161116      C                   EVAL      KGMLNSEQ = 1                                                     
103.00 161103      C     KGFATPARM     SETLL     GFATPARM                                     find the entry pnt  
104.00 161104      C                   READ      GFATPARM                                                         
105.00 161116      C                                                                                              
106.00 161115      C                   DOW       NOT %EOF(GFATPARM)                                               
107.00 161115      C                             AND GMCAT = KGMCAT                                               
108.00 161116      C                             AND GMBKSEQ = KGMBKSEQ                                           
109.00 161118      C                                                                                              
110.00 161118      C                   EXSR      GENDATA                                                          
111.00 170104      C                   EVAL      GXSEQ = GXSEQ + 1                                                
112.00 161118      C                   WRITE     RGFATXML                                                         
113.00 161118      C                   READ      GFATPARM                                                         
114.00 161118      C                                                                                              
115.00 161115      C                   ENDDO                                                                      
116.00 161116      C                                                                                              
117.00 170217       **   write the block 4 of structure (first owner)                                             
118.00 170217       **   find the first owner of the account if there is one                                      
119.00 170217 mylesC                   FOR       V@3S0 = 1 to 10                                                  
120.00 170217 mylesC                   IF        %TRIM(CS@ACCOWNL(V@3S0)) <> ''                                   
121.00 170217 mylesC                   EVAL      KGRCUX1AC = GADMACCT                                             
122.00 170217 mylesC                   EVAL      KGRCUXREL = CS@ACCOWNL(V@3S0)                                    
123.00 170217 mylesC     KGFATREL      SETLL     GFATREL                                                          
124.00 170217 mylesC                   READ      GFATREL                                                          
125.00 170217 mylesC                   IF        NOT %EOF(GFATREL)                                                
126.00 170217 mylesC                             AND GRCUX1AC = KGRCUX1AC                                         
127.00 170217 mylesC                             AND GRCUXREL = KGRCUXREL                                         
128.00 170217 mylesC                   LEAVE                                                                      
129.00 170217 mylesC                   ENDIF                                                                      
130.00 170217 mylesC                   ENDIF                                                                      
131.00 170217 mylesC                   ENDFOR                                                                     
132.00 170217      C                                                                                              
133.00 170217       **   if cannot find account's first owner in gfatrel,                                         
134.00 170217       **   then fetch the first other owner and inject to account holder tag                        
135.00 170217       **   and turn on FNFOWN (no first owner flag) for block 5 information                         
136.00 170217 mylesC                   MOVE      '0'           FNFOWN            1                                
137.00 170217 mylesC                   IF        %EOF(GFATREL)                                                    
138.00 170217 mylesC                             OR GRCUX1AC <> KGRCUX1AC                                         
139.00 170217 mylesC                             OR GRCUXREL <> KGRCUXREL                                         
140.00 170217 mylesC                   EVAL      KGRCUX1AC = GADMACCT                                             
141.00 170217 mylesC                   EVAL      KGRCUXREL = ''                                                   
142.00 170217 mylesC     KGFATREL      SETLL     GFATREL                                                          
143.00 170217 mylesC                   READ      GFATREL                                                          
144.00 170217 mylesC                   MOVE      '1'           FNFOWN                                             
145.00 170217 mylesC                   ENDIF                                                                      
146.00 170217      C                                                                                              
147.00 170217      C     GRCUX1CS      CHAIN     GFATCUST                                                         
148.00 170217      C                   IF        %FOUND(GFATCUST)                                                 
149.00 170217      C                   EVAL      KGMCAT = CS@PARMKEY                                              
150.00 170217      C                   EVAL      KGMBKSEQ = 4                                                     
151.00 170217      C                   EVAL      KGMLNSEQ = 1                                                     
152.00 170217      C     KGFATPARM     SETLL     GFATPARM                                                         
153.00 170217      C                   READ      GFATPARM                                                         
154.00 170217      C                                                                                              
155.00 170217      C                   DOW       NOT %EOF(GFATPARM)                                               
156.00 170217      C                             AND GMCAT = KGMCAT                                               
157.00 170217      C                             AND GMBKSEQ = KGMBKSEQ                                           
158.00 170217      C                                                                                              
159.00 170217      C                   EXSR      GENDATA                                                          
160.00 170217      C                   EVAL      GXSEQ = GXSEQ + 1                                                
161.00 170217      C                   WRITE     RGFATXML                                                         
162.00 170217      C                   READ      GFATPARM                                                         
163.00 170217      C                                                                                              
164.00 170217      C                   ENDDO                                                                      
165.00 170217      C                   ENDIF                                                                      
166.00 170217      C                                                                                              
167.00 170217       **   write the block 5 of structure (other joint owner)                                       
168.00 170217      C                   EVAL      KGRCUX1AC = GADMACCT                                             
169.00 170217      C                   EVAL      KGRCUXREL = ''                                                   
170.00 170217      C     KGFATREL      SETLL     GFATREL                                                          
171.00 170217      C                   READ      GFATREL                                                          
172.00 170217       **   if previous this account does has its first owner in the list,                           
173.00 170217       **   this pgm will use its first other owner in block4: Account Holder                        
174.00 170217       **   then in this block 5:Substantial Holder, we will then start from                         
175.00 170217       **   the second other owner                                                                   
176.00 170217 mylesC                   IF        FNFOWN = '1'                                                     
177.00 170217 mylesC                   READ      GFATREL                                                          
178.00 170217 mylesC                   ENDIF                                                                      
179.00 170217      C                   DOW       NOT %EOF(GFATREL) AND GRCUX1AC = KGRCUX1AC                       
180.00 170217      C                                                                                              
181.00 170217 mylesC                   EVAL      V@1A = '0'                                                       
182.00 170217 mylesC                   FOR       V@3S0 = 1 to 10                                                  
183.00 170217 mylesC                   IF        %TRIM(CS@ACCOWNL(V@3S0)) = GRCUXREL                              
184.00 170217 mylesC                   EVAL      V@1A = '1'                                                       
185.00 170217 mylesC                   ENDIF                                                                      
186.00 170217 mylesC                   ENDFOR                                                                     
187.00 170217 myles **   do operation when relationship is not an owner                                           
188.00 170217 mylesC                   IF        V@1A = '0'                                                       
189.00 170217      C                                                                                              
190.00 170217      C     GRCUX1CS      CHAIN     GFATCUST                                                         
191.00 170217      C                   IF        %FOUND(GFATCUST)                                                 
192.00 170217      C                                                                                              
193.00 170217      C                   EVAL      KGMCAT = CS@PARMKEY                                              
194.00 170217      C                   EVAL      KGMBKSEQ = 5                                                     
195.00 170217      C                   EVAL      KGMLNSEQ = 1                                                     
196.00 170217      C     KGFATPARM     SETLL     GFATPARM                                                         
197.00 170217      C                   READ      GFATPARM                                                         
198.00 170217      C                   DOW       NOT %EOF(GFATPARM)                                               
199.00 170217      C                             AND GMCAT = KGMCAT                                               
200.00 170217      C                             AND GMBKSEQ = KGMBKSEQ                                           
201.00 170217      C                                                                                              
202.00 170217      C                   EXSR      GENDATA                                                          
203.00 170217      C                   EVAL      GXSEQ = GXSEQ + 1                                                
204.00 170217      C                   WRITE     RGFATXML                                                         
205.00 170217      C                   READ      GFATPARM                                                         
206.00 170217      C                                                                                              
207.00 170217      C                   ENDDO                                                                      
208.00 170217      C                                                                                              
209.00 170217      C                   ENDIF                                                                      
210.00 170217      C                                                                                              
211.00 170217      C                   ENDIF                                                                      
212.00 170217      C                   READ      GFATREL                                                          
213.00 170217      C                                                                                              
214.00 170217      C                   ENDDO                                                                      
215.00 170217      C                                                                                              
216.00 170106       **   write the BLOCK 6 of structure                                                           
217.00 170104      C                   EVAL      KGMCAT = CS@PARMKEY                                              
218.00 161118      C                   EVAL      KGMBKSEQ = 6                                                     
219.00 161116      C                   EVAL      KGMLNSEQ = 1                                                     
220.00 161116      C     KGFATPARM     SETLL     GFATPARM                                     find the entry pnt  
221.00 161116      C                   READ      GFATPARM                                                         
222.00 161116      C                                                                                              
223.00 161116      C                   DOW       NOT %EOF(GFATPARM)                                               
224.00 161116      C                             AND GMCAT = KGMCAT                                               
225.00 161116      C                             AND GMBKSEQ = KGMBKSEQ                                           
226.00 161116      C                                                                                              
227.00 161118      C                   EXSR      GENDATA                                                          
228.00 170104      C                   EVAL      GXSEQ = GXSEQ + 1                                                
229.00 161118      C                   WRITE     RGFATXML                                                         
230.00 161118      C                   READ      GFATPARM                                                         
231.00 161118      C                                                                                              
232.00 161116      C                   ENDDO                                                                      
233.00 170104      C                                                                                              
234.00 170105       **   write the BLOCK 7 of structure                                                           
235.00 170105      C     GADMACCT      CHAIN     GFATPAY                                                          
236.00 170105      C                   IF        %FOUND(GFATPAY)                                                  
237.00 170105      C                   EVAL      KGMCAT = CS@PARMKEY                                              
238.00 170105      C                   EVAL      KGMBKSEQ = 7                                                     
239.00 170105      C                   EVAL      KGMLNSEQ = 1                                                     
240.00 170105      C     KGFATPARM     SETLL     GFATPARM                                                         
241.00 170105      C                   READ      GFATPARM                                                         
242.00 170105      C                                                                                              
243.00 170105      C                   DOW       NOT %EOF(GFATPARM)                                               
244.00 170105      C                             AND GMCAT = KGMCAT                                               
245.00 170105      C                             AND GMBKSEQ = KGMBKSEQ                                           
246.00 170105      C                                                                                              
247.00 170105      C                   EXSR      GENDATA                                                          
248.00 170105      C                   EVAL      GXSEQ = GXSEQ + 1                                                
249.00 170105      C                   WRITE     RGFATXML                                                         
250.00 170105      C                   READ      GFATPARM                                                         
251.00 170105      C                                                                                              
252.00 170105      C                   ENDDO                                                                      
253.00 170105      C                   ENDIF                                                                      
254.00 170105      C                                                                                              
255.00 170105       **   write the BLOCK 8 of structure                                                           
256.00 170105      C                   EVAL      KGMCAT = CS@PARMKEY                                              
257.00 170105      C                   EVAL      KGMBKSEQ = 8                                                     
258.00 170105      C                   EVAL      KGMLNSEQ = 1                                                     
259.00 170105      C     KGFATPARM     SETLL     GFATPARM                                     find the entry pnt  
260.00 170105      C                   READ      GFATPARM                                                         
261.00 170105      C                                                                                              
262.00 170105      C                   DOW       NOT %EOF(GFATPARM)                                               
263.00 170105      C                             AND GMCAT = KGMCAT                                               
264.00 170105      C                             AND GMBKSEQ = KGMBKSEQ                                           
265.00 170105      C                                                                                              
266.00 170105      C                   EXSR      GENDATA                                                          
267.00 170105      C                   EVAL      GXSEQ = GXSEQ + 1                                                
268.00 170105      C                   WRITE     RGFATXML                                                         
269.00 170105      C                   READ      GFATPARM                                                         
270.00 170105      C                                                                                              
271.00 170105      C                   ENDDO                                                                      
272.00 161103      C                                                                                              
273.00 161116      C                   READ      GFATACCT                                                         
274.00 161116      C                   ENDDO                                                                      
275.00 161103      C                                                                                              
276.00 170104       *    write the BLOCK 9 of structure                                                           
277.00 161116      C                   READ      GFATPOOL                                                         
278.00 161116      C                   DOW       NOT %EOF(GFATPOOL)                                               
279.00 161116      C                                                                                              
280.00 170104      C                   EVAL      KGMCAT = CS@PARMKEY                                              
281.00 170104      C                   EVAL      KGMBKSEQ = 9                                                     
282.00 161116      C                   EVAL      KGMLNSEQ = 1                                                     
283.00 161116      C     KGFATPARM     SETLL     GFATPARM                                     find the entry pnt  
284.00 161116      C                   READ      GFATPARM                                                         
285.00 161116      C                                                                                              
286.00 161116      C                   DOW       NOT %EOF(GFATPARM)                                               
287.00 161116      C                             AND GMCAT = KGMCAT                                               
288.00 161116      C                             AND GMBKSEQ = KGMBKSEQ                                           
289.00 161116      C                                                                                              
290.00 161118      C                   EXSR      GENDATA                                                          
291.00 170104      C                   EVAL      GXSEQ = GXSEQ + 1                                                
292.00 161118      C                   WRITE     RGFATXML                                                         
293.00 161118      C                   READ      GFATPARM                                                         
294.00 161118      C                                                                                              
295.00 161116      C                   ENDDO                                                                      
296.00 161116      C                                                                                              
297.00 161116      C                   READ      GFATPOOL                                                         
298.00 161116      C                   ENDDO                                                                      
299.00 161116      C                                                                                              
300.00 170104       *    write the BLOCK 10 of structure                                                          
301.00 170104      C                   EVAL      KGMCAT = CS@PARMKEY                                              
302.00 170104      C                   EVAL      KGMBKSEQ = 10                                                    
303.00 161116      C                   EVAL      KGMLNSEQ = 1                                                     
304.00 161116      C     KGFATPARM     SETLL     GFATPARM                                     find the entry pnt  
305.00 161116      C                   READ      GFATPARM                                                         
306.00 161116      C                                                                                              
307.00 161116      C                   DOW       NOT %EOF(GFATPARM)                                               
308.00 161116      C                             AND GMCAT = KGMCAT                                               
309.00 161116      C                             AND GMBKSEQ = KGMBKSEQ                                           
310.00 161116      C                                                                                              
311.00 161118      C                   EXSR      GENDATA                                                          
312.00 170104      C                   EVAL      GXSEQ = GXSEQ + 1                                                
313.00 161118      C                   WRITE     RGFATXML                                                         
314.00 161118      C                   READ      GFATPARM                                                         
315.00 161118      C                                                                                              
316.00 161116      C                   ENDDO                                                                      
317.00 161116      C                                                                                              
318.00 161013      C                   SETON                                        LR                            
319.00 161101      C**                                                                                            
320.00 161118      C**********************************************************************                        
321.00 161118      C*            SR: GENDATA - Generate Data for GXDATA                  *                        
322.00 170104      C* (This subroutine will generate GXDATA field record, it first looks *                        
323.00 170104      C* into GMFLD from GFATPARM, if there is parameter symbol %, then     *                        
324.00 170104      C* map the value from the context with GETFLDV and feed it to GXDATA. *                        
325.00 170104      C* Maximumly 2 parameters or none)                                    *                        
326.00 161118      C**********************************************************************                        
327.00 161118      C     GENDATA       BEGSR                                                                      
328.00 161118      C                                                                                              
329.00 161118      C                   Z-ADD     0             VPOS              3 0                              
330.00 161118      C                   MOVE      ''            VFLDNM           50                                
331.00 161118      C                   MOVE      ''            VFLDV            50                                
332.00 161118      C                   EVAL      GXDATA = GMFLD                                                   
333.00 161118      C                                                                                              
334.00 161118       *    start 1st scan                                                                           
335.00 161118      C                   EVAL      VPOS = %SCAN('%':GXDATA)                                         
336.00 161118      C                   IF        VPOS <> 0                                                        
337.00 161118      C                   EVAL      VFLDNM = ''                                                      
338.00 161118      C                   EVAL      VFLDV = ''                                                       
339.00 161118      C                   EVAL      VFLDNM = GMFLDV1                                                 
340.00 161118      C                   EXSR      GETFLDV                                                          
341.00 161118      C                   IF        VFLDV <> ''                                                      
342.00 161118      C                   EVAL      GXDATA = %SUBST(GXDATA:1:VPOS-1)                                 
343.00 161118      C                                      + %TRIM(VFLDV)                                          
344.00 161118      C                                      + %SUBST(GXDATA:VPOS+1)                                 
345.00 161118      C                   ELSE                                                                       
346.00 161118      C                   EVAL      GXDATA = %TRIM(GMFLDE)                                           
347.00 161118      C                   ENDIF                                                                      
348.00 161118      C                   ENDIF                                                                      
349.00 161118      C                                                                                              
350.00 161118       *    start 2nd scan                                                                           
351.00 161118      C                   EVAL      VPOS = %SCAN('%':GXDATA)                                         
352.00 161118      C                   IF        VPOS <> 0                                                        
353.00 161118      C                   EVAL      VFLDNM = ''                                                      
354.00 161118      C                   EVAL      VFLDV = ''                                                       
355.00 161118      C                   EVAL      VFLDNM = GMFLDV2                                                 
356.00 161118      C                   EXSR      GETFLDV                                                          
357.00 161118      C                   IF        VFLDV <> ''                                                      
358.00 161118      C                   EVAL      GXDATA = %SUBST(GXDATA:1:VPOS-1)                                 
359.00 161118      C                                      + %TRIM(VFLDV)                                          
360.00 161118      C                                      + %SUBST(GXDATA:VPOS+1)                                 
361.00 161118      C                   ELSE                                                                       
362.00 161118      C                   EVAL      GXDATA = %TRIM(GMFLDE)                                           
363.00 161118      C                   ENDIF                                                                      
364.00 161118      C                   ENDIF                                                                      
365.00 161118      C                                                                                              
366.00 161118       *    start 3nd scan                                                                           
367.00 161118      C                   EVAL      VPOS = %SCAN('%':GXDATA)                                         
368.00 161118      C                   IF        VPOS <> 0                                                        
369.00 161118      C                   EVAL      VFLDNM = ''                                                      
370.00 161118      C                   EVAL      VFLDV = ''                                                       
371.00 161118      C                   EVAL      VFLDNM = GMFLDV3                                                 
372.00 161118      C                   EXSR      GETFLDV                                                          
373.00 161118      C                   IF        VFLDV <> ''                                                      
374.00 161118      C                   EVAL      GXDATA = %SUBST(GXDATA:1:VPOS-1)                                 
375.00 161118      C                                      + %TRIM(VFLDV)                                          
376.00 161118      C                                      + %SUBST(GXDATA:VPOS+1)                                 
377.00 161118      C                   ELSE                                                                       
378.00 161118      C                   EVAL      GXDATA = %TRIM(GMFLDE)                                           
379.00 161118      C                   ENDIF                                                                      
380.00 161118      C                   ENDIF                                                                      
381.00 161118      C                                                                                              
382.00 161118       *    add indent                                                                               
383.00 161118      C                   IF        GMIND > 0                                                        
384.00 161118      C                   Z-ADD     0             VINDEX            2 0                              
385.00 161118      C                   FOR       VINDEX = 1 TO GMIND                                              
386.00 161118      C                   EVAL      GXDATA = ' ' + GXDATA                                            
387.00 161118      C                   ENDFOR                                                                     
388.00 161118      C                   ENDIF                                                                      
389.00 161118      C                                                                                              
390.00 161118      C                   ENDSR                                                                      
391.00 161104      C**********************************************************************                        
392.00 161115      C*            SR: GETFLDV - Get Field Value from GFATACCT             *                        
393.00 170104      C* (Only called by GENDATA to map the target value from the context.) *                        
394.00 161104      C**********************************************************************                        
395.00 161104      C     GETFLDV       BEGSR                                                                      
396.00 161116      C                                                                                              
397.00 161116      C                   EVAL      VFLDV = ''                                                       
398.00 161118      C                                                                                              
399.00 161118      C                   IF        VFLDNM = 'GBCMPIN'                                               
400.00 161118      C                   EVAL      VFLDV = GBCMPIN                                                  
401.00 161118      C                   ENDIF                                                                      
402.00 161118      C                   IF        VFLDNM = 'GBTSMCNTY'                                             
403.00 161118      C                   EVAL      VFLDV = GBTSMCNTY                                                
404.00 161118      C                   ENDIF                                                                      
405.00 161118      C                   IF        VFLDNM = 'GBRCVCNTY'                                             
406.00 161118      C                   EVAL      VFLDV = GBRCVCNTY                                                
407.00 161118      C                   ENDIF                                                                      
408.00 161118      C                   IF        VFLDNM = 'GBMSGTYP'                                              
409.00 161118      C                   EVAL      VFLDV = GBMSGTYP                                                 
410.00 161118      C                   ENDIF                                                                      
411.00 161118      C                   IF        VFLDNM = 'GBWNG'                                                 
412.00 161118      C                   EVAL      VFLDV = GBWNG                                                    
413.00 161118      C                   ENDIF                                                                      
414.00 161118      C                   IF        VFLDNM = 'GBCTT'                                                 
415.00 161118      C                   EVAL      VFLDV = GBCTT                                                    
416.00 161118      C                   ENDIF                                                                      
417.00 161118      C                   IF        VFLDNM = 'GBMSGREF'                                              
418.00 161118      C                   EVAL      VFLDV = GBMSGREF                                                 
419.00 161118      C                   ENDIF                                                                      
420.00 161118      C                   IF        VFLDNM = 'GBRPGPRD'                                              
421.00 161118      C                   EVAL      VFLDV = GBRPGPRD                                                 
422.00 161118      C                   ENDIF                                                                      
423.00 161118      C                   IF        VFLDNM = 'GBTMSTP'                                               
424.00 161118      C                   EVAL      VFLDV = GBTMSTP                                                  
425.00 161118      C                   ENDIF                                                                      
426.00 161118      C                   IF        VFLDNM = 'GBRESCDE'                                              
427.00 161118      C                   EVAL      VFLDV = GBRESCDE                                                 
428.00 161118      C                   ENDIF                                                                      
429.00 161118      C                   IF        VFLDNM = 'GBISUBY'                                               
430.00 161118      C                   EVAL      VFLDV = GBISUBY                                                  
431.00 161118      C                   ENDIF                                                                      
432.00 161118      C                   IF        VFLDNM = 'GBNAM'                                                 
433.00 161118      C                   EVAL      VFLDV = GBNAM                                                    
434.00 161118      C                   ENDIF                                                                      
435.00 161118      C                   IF        VFLDNM = 'GBCNTYCDE'                                             
436.00 161118      C                   EVAL      VFLDV = GBCNTYCDE                                                
437.00 161118      C                   ENDIF                                                                      
438.00 161118      C                   IF        VFLDNM = 'GBSTRT'                                                
439.00 161118      C                   EVAL      VFLDV = GBSTRT                                                   
440.00 161118      C                   ENDIF                                                                      
441.00 161118      C                   IF        VFLDNM = 'GBBLDIDT'                                              
442.00 161118      C                   EVAL      VFLDV = GBBLDIDT                                                 
443.00 161118      C                   ENDIF                                                                      
444.00 161118      C                   IF        VFLDNM = 'GBSUTIDT'                                              
445.00 161118      C                   EVAL      VFLDV = GBSUTIDT                                                 
446.00 161118      C                   ENDIF                                                                      
447.00 161118      C                   IF        VFLDNM = 'GBFLRIDT'                                              
448.00 161118      C                   EVAL      VFLDV = GBFLRIDT                                                 
449.00 161118      C                   ENDIF                                                                      
450.00 161118      C                   IF        VFLDNM = 'GBDSTNAM'                                              
451.00 161118      C                   EVAL      VFLDV = GBDSTNAM                                                 
452.00 161118      C                   ENDIF                                                                      
453.00 161118      C                   IF        VFLDNM = 'GBPOB'                                                 
454.00 161118      C                   EVAL      VFLDV = GBPOB                                                    
455.00 161118      C                   ENDIF                                                                      
456.00 161118      C                   IF        VFLDNM = 'GBPSTCDE'                                              
457.00 161118      C                   EVAL      VFLDV = GBPSTCDE                                                 
458.00 161118      C                   ENDIF                                                                      
459.00 161118      C                   IF        VFLDNM = 'GBCTY'                                                 
460.00 161118      C                   EVAL      VFLDV = GBCTY                                                    
461.00 161118      C                   ENDIF                                                                      
462.00 161118      C                   IF        VFLDNM = 'GBCNTYSUBE'                                            
463.00 161118      C                   EVAL      VFLDV = GBCNTYSUBE                                               
464.00 161118      C                   ENDIF                                                                      
465.00 161118      C                   IF        VFLDNM = 'GBADDFREE'                                             
466.00 161118      C                   EVAL      VFLDV = GBADDFREE                                                
467.00 161118      C                   ENDIF                                                                      
468.00 161118      C                   IF        VFLDNM = 'GBDOCTYP'                                              
469.00 161118      C                   EVAL      VFLDV = GBDOCTYP                                                 
470.00 161118      C                   ENDIF                                                                      
471.00 161118      C                   IF        VFLDNM = 'GBDOCREF'                                              
472.00 161118      C                   EVAL      VFLDV = GBDOCREF                                                 
473.00 161118      C                   ENDIF                                                                      
474.00 161118      C                   IF        VFLDNM = 'GBCORMSG'                                              
475.00 161118      C                   EVAL      VFLDV = GBCORMSG                                                 
476.00 161118      C                   ENDIF                                                                      
477.00 161118      C                   IF        VFLDNM = 'GBCORREF'                                              
478.00 161118      C                   EVAL      VFLDV = GBCORREF                                                 
479.00 161118      C                   ENDIF                                                                      
480.00 161118      C                   IF        VFLDNM = 'GADOCTYP'                                              
481.00 161118      C                   EVAL      VFLDV = GADOCTYP                                                 
482.00 161118      C                   ENDIF                                                                      
483.00 161118      C                   IF        VFLDNM = 'GADOCREF'                                              
484.00 161118      C                   EVAL      VFLDV = GADOCREF                                                 
485.00 161118      C                   ENDIF                                                                      
486.00 161118      C                   IF        VFLDNM = 'GACORMSG'                                              
487.00 161118      C                   EVAL      VFLDV = GACORMSG                                                 
488.00 161118      C                   ENDIF                                                                      
489.00 161118      C                   IF        VFLDNM = 'GACORREF'                                              
490.00 161118      C                   EVAL      VFLDV = GACORREF                                                 
491.00 161118      C                   ENDIF                                                                      
492.00 161118      C                   IF        VFLDNM = 'GAACTNBR'                                              
493.00 161118      C                   EVAL      VFLDV = GAACTNBR                                                 
494.00 161118      C                   ENDIF                                                                      
495.00 161118      C                   IF        VFLDNM = 'GCRESCDE'                                              
496.00 161118      C                   EVAL      VFLDV = GCRESCDE                                                 
497.00 161118      C                   ENDIF                                                                      
498.00 161118      C                   IF        VFLDNM = 'GCISUBY'                                               
499.00 161118      C                   EVAL      VFLDV = GCISUBY                                                  
500.00 161118      C                   ENDIF                                                                      
501.00 161118      C                   IF        VFLDNM = 'GCPRETTL'                                              
502.00 161118      C                   EVAL      VFLDV = GCPRETTL                                                 
503.00 161118      C                   ENDIF                                                                      
504.00 161118      C                   IF        VFLDNM = 'GCTTL'                                                 
505.00 161118      C                   EVAL      VFLDV = GCTTL                                                    
506.00 161118      C                   ENDIF                                                                      
507.00 161118      C                   IF        VFLDNM = 'GCFTNAM'                                               
508.00 161118      C                   EVAL      VFLDV = GCFTNAM                                                  
509.00 161118      C                   ENDIF                                                                      
510.00 161118      C                   IF        VFLDNM = 'GCMDNAM'                                               
511.00 161118      C                   EVAL      VFLDV = GCMDNAM                                                  
512.00 161118      C                   ENDIF                                                                      
513.00 161118      C                   IF        VFLDNM = 'GCNAMPRE'                                              
514.00 161118      C                   EVAL      VFLDV = GCNAMPRE                                                 
515.00 161118      C                   ENDIF                                                                      
516.00 161118      C                   IF        VFLDNM = 'GCLTNAM'                                               
517.00 161118      C                   EVAL      VFLDV = GCLTNAM                                                  
518.00 161118      C                   ENDIF                                                                      
519.00 161118      C                   IF        VFLDNM = 'GCGENIDT'                                              
520.00 161118      C                   EVAL      VFLDV = GCGENIDT                                                 
521.00 161118      C                   ENDIF                                                                      
522.00 161118      C                   IF        VFLDNM = 'GCSUF'                                                 
523.00 161118      C                   EVAL      VFLDV = GCSUF                                                    
524.00 161118      C                   ENDIF                                                                      
525.00 161118      C                   IF        VFLDNM = 'GCGENSUF'                                              
526.00 161118      C                   EVAL      VFLDV = GCGENSUF                                                 
527.00 161118      C                   ENDIF                                                                      
528.00 161118      C                   IF        VFLDNM = 'GCCNTYCDE'                                             
529.00 161118      C                   EVAL      VFLDV = GCCNTYCDE                                                
530.00 161118      C                   ENDIF                                                                      
531.00 161118      C                   IF        VFLDNM = 'GCSTRT'                                                
532.00 161118      C                   EVAL      VFLDV = GCSTRT                                                   
533.00 161118      C                   ENDIF                                                                      
534.00 161118      C                   IF        VFLDNM = 'GCBLDIDT'                                              
535.00 161118      C                   EVAL      VFLDV = GCBLDIDT                                                 
536.00 161118      C                   ENDIF                                                                      
537.00 161118      C                   IF        VFLDNM = 'GCSUTIDT'                                              
538.00 161118      C                   EVAL      VFLDV = GCSUTIDT                                                 
539.00 161118      C                   ENDIF                                                                      
540.00 161118      C                   IF        VFLDNM = 'GCFLRIDT'                                              
541.00 161118      C                   EVAL      VFLDV = GCFLRIDT                                                 
542.00 161118      C                   ENDIF                                                                      
543.00 161118      C                   IF        VFLDNM = 'GCDSTNAM'                                              
544.00 161118      C                   EVAL      VFLDV = GCDSTNAM                                                 
545.00 161118      C                   ENDIF                                                                      
546.00 161118      C                   IF        VFLDNM = 'GCPOB'                                                 
547.00 161118      C                   EVAL      VFLDV = GCPOB                                                    
548.00 161118      C                   ENDIF                                                                      
549.00 161118      C                   IF        VFLDNM = 'GCPSTCDE'                                              
550.00 161118      C                   EVAL      VFLDV = GCPSTCDE                                                 
551.00 161118      C                   ENDIF                                                                      
552.00 161118      C                   IF        VFLDNM = 'GCADDCTY'                                              
553.00 161118      C                   EVAL      VFLDV = GCADDCTY                                                 
554.00 161118      C                   ENDIF                                                                      
555.00 161118      C                   IF        VFLDNM = 'GCCNTYSUBE'                                            
556.00 161118      C                   EVAL      VFLDV = GCCNTYSUBE                                               
557.00 161118      C                   ENDIF                                                                      
558.00 161118      C                   IF        VFLDNM = 'GCADDFREE'                                             
559.00 161118      C                   EVAL      VFLDV = GCADDFREE                                                
560.00 161118      C                   ENDIF                                                                      
561.00 161118      C                   IF        VFLDNM = 'GCBTHDTE'                                              
562.00 161118      C                   EVAL      VFLDV = GCBTHDTE                                                 
563.00 161118      C                   ENDIF                                                                      
564.00 161118      C                   IF        VFLDNM = 'GCBTHCTY'                                              
565.00 161118      C                   EVAL      VFLDV = GCBTHCTY                                                 
566.00 161118      C                   ENDIF                                                                      
567.00 161118      C                   IF        VFLDNM = 'GCCTYCUBE'                                             
568.00 161118      C                   EVAL      VFLDV = GCCTYCUBE                                                
569.00 161118      C                   ENDIF                                                                      
570.00 161118      C                   IF        VFLDNM = 'GACURCDE'                                              
571.00 161118      C                   EVAL      VFLDV = GACURCDE                                                 
572.00 161118      C                   ENDIF                                                                      
573.00 161118      C                   IF        VFLDNM = 'GPDOCTYP'                                              
574.00 161118      C                   EVAL      VFLDV = GPDOCTYP                                                 
575.00 161118      C                   ENDIF                                                                      
576.00 161118      C                   IF        VFLDNM = 'GPDOCREF'                                              
577.00 161118      C                   EVAL      VFLDV = GPDOCREF                                                 
578.00 161118      C                   ENDIF                                                                      
579.00 161118      C                   IF        VFLDNM = 'GPCORMSG'                                              
580.00 161118      C                   EVAL      VFLDV = GPCORMSG                                                 
581.00 161118      C                   ENDIF                                                                      
582.00 161118      C                   IF        VFLDNM = 'GPCORREF'                                              
583.00 161118      C                   EVAL      VFLDV = GPCORREF                                                 
584.00 161118      C                   ENDIF                                                                      
585.00 161118      C                   IF        VFLDNM = 'GPACTCNT'                                              
586.00 161118      C                   EVAL      VFLDV = %CHAR(GPACTCNT)                                          
587.00 161118      C                   ENDIF                                                                      
588.00 161118      C                   IF        VFLDNM = 'GPACTPRPT'                                             
589.00 161118      C                   EVAL      VFLDV = GPACTPRPT                                                
590.00 161118      C                   ENDIF                                                                      
591.00 161118      C                   IF        VFLDNM = 'GPCURCDE'                                              
592.00 161118      C                   EVAL      VFLDV = GPCURCDE                                                 
593.00 161118      C                   ENDIF                                                                      
594.00 161118      C                   IF        VFLDNM = 'GBTIN'                                                 
595.00 170106      C                   EVAL      VFLDV = GBTIN                                                    
596.00 161118      C                   ENDIF                                                                      
597.00 161118      C                   IF        VFLDNM = 'GCTIN'                                                 
598.00 170106      C                   EVAL      VFLDV = GCTIN                                                    
599.00 161118      C                   ENDIF                                                                      
600.00 161118      C                   IF        VFLDNM = 'GAACTBAL'                                              
601.00 161118      C                   EVAL      VFLDV = %CHAR(GAACTBAL)                                          
602.00 161118      C                   ENDIF                                                                      
603.00 161118      C                   IF        VFLDNM = 'GPPBAL'                                                
604.00 161118      C                   EVAL      VFLDV = %CHAR(GPPBAL)                                            
605.00 161118      C                   ENDIF                                                                      
606.00 170105      C                   IF        VFLDNM = 'GYTYP'                                                 
607.00 170105      C                   EVAL      VFLDV = GYTYP                                                    
608.00 170105      C                   ENDIF                                                                      
609.00 170105      C                   IF        VFLDNM = 'GYPAYAMT'                                              
610.00 170223 mylesC*                  EVAL      VFLDV = %CHAR(GYPAYAMT)                      fail:  .03          
611.00 170223 mylesC*                  MOVE      GYPAYAMT      VFLDV                          fail: 0003          
612.00 170223 mylesC*                  EVAL      VFLDV = %EDITC(GYPAYAMT:'X')                 fail: 0003          
613.00 170223 mylesC                   EVAL      VFLDV = %EDITW(GYPAYAMT:'            0 .  ')                     
614.00 170105      C                   ENDIF                                                                      
615.00 170105      C                   IF        VFLDNM = 'GYCURCDE'                                              
616.00 170105      C                   EVAL      VFLDV = GYCURCDE                                                 
617.00 170105      C                   ENDIF                                                                      
618.00 161118      C                                                                                              
619.00 161116      C                   ENDSR                                                                      
620.00 161104      C**                                                                                            
621.00 170217 **                                                                                                  
622.00 170217 SOW                                                                                                 
623.00 170217 OWN                                                                                                 
624.00 170217 JAF                                                                                                 
625.00 170217 JOF                                                                                                 
