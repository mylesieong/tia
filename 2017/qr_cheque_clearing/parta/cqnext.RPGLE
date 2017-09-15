1.00 20307      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                      
2.00 20319       **************************************************************************                    
3.00 170814       * REFERENCE NO. : CHG-0266-17 (D7266)                                                         
4.00 170609       * PROGRAM ID.   : CQNACCM                                                                     
5.00 170728       * DESC          : Cheque Book Order Extraction Program                                        
6.00 160607       * AUTHOR        : Myles Ieong                                                                 
7.00 160607       * USER ID.      : BI77PGM                                                                     
8.00 170616       * DATE WRITTEN  : 16 Jun 2017                                                                 
9.00 161020       **************************************************************************                    
10.00 161020      F**********************************************************************                        
11.00 160607      F*                         File Specification                         *                        
12.00 160607      F**********************************************************************                        
13.00 170616      FCQNOUT    UF A E           K DISK                                                             
14.00 170616      FTAP033L2  IF   E           K DISK                                                             
15.00 170818      FTAP001    IF   E           K DISK                                                             
16.00 170616      FTAP002    IF   E           K DISK                                                             
17.00 170616      FCFP102    IF   E           K DISK                                                             
18.00 170616      FCFP280    IF   E           K DISK                                                             
19.00 170616      FCUP009LB  IF   E           K DISK                                                             
20.00 170619      FCUP003    IF   E           K DISK                                                             
21.00 170807      FCUP051L6  IF   E           K DISK                                                             
22.00 170807      F*                                                                                             
23.00 170616      D**********************************************************************                        
24.00 170616      D*                   Variables / constant defination                  *                        
25.00 170616      D**********************************************************************                        
26.00 170616       *    Account Name Format                                                                      
27.00 170616      D                 DS                                                                           
28.00 170807      DVNAM                     1     90                                                             
29.00 170807      D VNAMROW1                1     45                                                             
30.00 170807      D VNAMROW2               46     90                                                             
31.00 160607      C**********************************************************************                        
32.00 160607      C*                         Key List define                            *                        
33.00 160615      C**********************************************************************                        
34.00 170818      C     KTAP001       KLIST                                                                      
35.00 170616      C                   KFLD                    KDSBK             3 0                              
36.00 170616      C                                                                                              
37.00 170616      C     KTAP033L2     KLIST                                                                      
38.00 170616      C                   KFLD                    KDRBK             3 0                              
39.00 170616      C                   KFLD                    KDRSTAT           1 0                              
40.00 170616      C                   KFLD                    KDRDORD           7 0                              
41.00 170616      C                                                                                              
42.00 170616      C     KTAP002       KLIST                                                                      
43.00 170616      C                   KFLD                    KDMBK             3 0                              
44.00 170616      C                   KFLD                    KDMTYP            1 0                              
45.00 170616      C                   KFLD                    KDMACCT          10 0                              
46.00 170616      C                                                                                              
47.00 170616      C     KCFP102       KLIST                                                                      
48.00 170616      C                   KFLD                    KCFBANK           3 0                              
49.00 170616      C                   KFLD                    KCFBRCH           3 0                              
50.00 170616      C                                                                                              
51.00 170616      C     KCFP280       KLIST                                                                      
52.00 170616      C                   KFLD                    KCFBK             3 0                              
53.00 170616      C                   KFLD                    KCFCBST          10                                
54.00 170616      C                                                                                              
55.00 170616      C     KCUP009LB     KLIST                                                                      
56.00 170616      C                   KFLD                    KCUXBK            3 0                              
57.00 170616      C                   KFLD                    KCUX1AP           2 0                              
58.00 170619      C                   KFLD                    KCUX1AC          12 0                              
59.00 170619      C                                                                                              
60.00 170619      C     KCUP003       KLIST                                                                      
61.00 170619      C                   KFLD                    KCUBK             3 0                              
62.00 170619      C                   KFLD                    KCUNBR           10                                
63.00 170801      C                                                                                              
64.00 170807      C     KCUP051L6     KLIST                                                                      
65.00 170807      C                   KFLD                    KCABK             3 0                              
66.00 170807      C                   KFLD                    KCAAPP            2 0                              
67.00 170807      C                   KFLD                    KCAACCT          12                                
68.00 170807      C                   KFLD                    KCACLS           10                                
69.00 170807      C                   KFLD                    KCAITID          10                                
70.00 170123      C*                                                                                             
71.00 170123      C**********************************************************************                        
72.00 170123      C*                          MAIN PROGRAM                              *                        
73.00 170123      C**********************************************************************                        
74.00 170616      C                   Z-ADD     1             KDSBK                                              
75.00 170818      C     KTAP001       CHAIN     TAP001                                                           
76.00 170616      C                                                                                              
77.00 170616      C                   Z-ADD     1             KDRBK                                              
78.00 170616      C                   Z-ADD     0             KDRSTAT                                            
79.00 170616      C                   MOVE      DSDT          KDRDORD                                            
80.00 170616      C     KTAP033L2     CHAIN     TAP033L2                                                         
81.00 170616      C                                                                                              
82.00 170802       *    Extract Cheque Book Orders of previous day from TAP033                                   
83.00 170616      C                   IF        %FOUND(TAP033L2)                                                 
84.00 170616      C                                                                                              
85.00 170616      C                   DOW       NOT %EOF(TAP033L2)                                               
86.00 170616      C                                                                                              
87.00 170619      C                   EXSR      CLRFLD                                                           
88.00 170619      C                                                                                              
89.00 170616      C                   Z-ADD     1             KDMBK                                              
90.00 170616      C                   EVAL      KDMTYP = DRTYP                                                   
91.00 170616      C                   EVAL      KDMACCT = DRACCT                                                 
92.00 170616      C     KTAP002       CHAIN     TAP002                                       Assume found        
93.00 170616      C                                                                                              
94.00 170807      C                   Z-ADD     113           CQNOBK                         CQNOBK              
95.00 170616      C                   EVAL      CQNOTYP = 'CHQ'                              CQNOTYP             
96.00 170616      C                   EXSR      GETCQNOCCY                                   CQNOCCY             
97.00 170616      C                   EVAL      CQNOACCT = DRACCT                            CQNOACCT            
98.00 170616      C                   EVAL      CQNOCQN = DRFRNG                             CQNOCQN             
99.00 170802      C                   EXSR      GETCQNONAM                                   CQNONAM             
100.00 170616      C                   EXSR      GETCQNOBRH                                   CQNOBRH             
101.00 170616      C                   EXSR      GETCQNOBRHC                                  CQNOBRHC            
102.00 170616      C                   EXSR      GETCQNOPER                                   CQNOPER             
103.00 170616      C                   EVAL      CQNOQTY = (DRTRNG - DRFRNG + 1)/CQNOPER      CQNOQTY             
104.00 170616      C                   MOVE      DRBTAX        CQNOLG                         CQNOLG              
105.00 170616      C                   EVAL      CQNODORD = DRDORD                            CQNODORD            
106.00 170616      C                   WRITE     RCQNOUT                                                          
107.00 170616      C                                                                                              
108.00 170616      C                   READE     TAP033L2                                                         
109.00 170616      C                   ENDDO                                                                      
110.00 170616      C                                                                                              
111.00 170616      C                   ENDIF                                                                      
112.00 170616      C                                                                                              
113.00 170123      C                   SETON                                        LR                            
114.00 170328       **                                                                                            
115.00 170619      C**********************************************************************                        
116.00 170619      C*              SR: Clear All Fields in CQNOUT                        *                        
117.00 170619      C**********************************************************************                        
118.00 170619      C     CLRFLD        BEGSR                                                                      
119.00 170619      C                                                                                              
120.00 170619      C                   EVAL      CQNOBK = *ZERO                                                   
121.00 170619      C                   EVAL      CQNOTYP = *BLANK                                                 
122.00 170619      C                   EVAL      CQNOCCY = *BLANK                                                 
123.00 170619      C                   EVAL      CQNOACCT = *ZERO                                                 
124.00 170619      C                   EVAL      CQNOCQN = *ZERO                                                  
125.00 170619      C                   EVAL      CQNONAM = *BLANK                                                 
126.00 170619      C                   EVAL      CQNOBRH = *BLANK                                                 
127.00 170619      C                   EVAL      CQNOBRHC = *BLANK                                                
128.00 170619      C                   EVAL      CQNOQTY = *ZERO                                                  
129.00 170619      C                   EVAL      CQNOPER = *ZERO                                                  
130.00 170619      C                   EVAL      CQNOLG = *BLANK                                                  
131.00 170619      C                   EVAL      CQNODORD = *ZERO                                                 
132.00 170619      C                                                                                              
133.00 170619      C                   ENDSR                                                                      
134.00 170619       **                                                                                            
135.00 170616      C**********************************************************************                        
136.00 170616      C*              SR: GETCQNOCCY- Get CQNOCCY field value               *                        
137.00 170616      C**********************************************************************                        
138.00 170616      C     GETCQNOCCY    BEGSR                                                                      
139.00 170616      C                   CALL      'CCCYCHK1'                                                       
140.00 170616      C                   PARM                    DMCMCN                                             
141.00 170616      C                   PARM                    CQNOCCY                                            
142.00 170616      C                   PARM                    ERRIND            1                                
143.00 170616      C                   ENDSR                                                                      
144.00 170616       **                                                                                            
145.00 170616      C**********************************************************************                        
146.00 170801      C*              SR: GETCQNOBRH from DMBRCH                            *                        
147.00 170616      C**********************************************************************                        
148.00 170616      C     GETCQNOBRH    BEGSR                                                                      
149.00 170616      C                   Z-ADD     1             KCFBANK                                            
150.00 170616      C                   MOVE      DMBRCH        KCFBRCH                                            
151.00 170818      C                   IF        KCFBRCH= 38                                                      
152.00 170818      C                   EVAL      KCFBRCH= 1                                                       
153.00 170818      C                   ENDIF                                                                      
154.00 170616      C     KCFP102       CHAIN     CFP102                                                           
155.00 170616      C                   IF        %FOUND(CFP102)                                                   
156.00 170616      C                   EVAL      CQNOBRH = CFBRNM                                                 
157.00 170728      C                   EVAL      CQNOBRHNO = %EDITC(KCFBRCH:'X')                                  
158.00 170616      C                   ENDIF                                                                      
159.00 170616      C                   ENDSR                                                                      
160.00 170616       **                                                                                            
161.00 170616      C**********************************************************************                        
162.00 170801      C*              SR: GETCQNOBRHC from DRBFEE                           *                        
163.00 170616      C**********************************************************************                        
164.00 170616      C     GETCQNOBRHC   BEGSR                                                                      
165.00 170616      C                   Z-ADD     1             KCFBANK                                            
166.00 170728      C                   EVAL      KCFBRCH = DRBFEE                                                 
167.00 170818      C                   IF        KCFBRCH = 38                                                     
168.00 170818      C                   EVAL      KCFBRCH = 1                                                      
169.00 170818      C                   ENDIF                                                                      
170.00 170616      C     KCFP102       CHAIN     CFP102                                                           
171.00 170616      C                   IF        %FOUND(CFP102)                                                   
172.00 170616      C                   EVAL      CQNOBRHC = CFBRNM                                                
173.00 170728      C                   EVAL      CQNOBRHCNO = %EDITC(KCFBRCH:'X')                                 
174.00 170616      C                   ENDIF                                                                      
175.00 170616      C                   ENDSR                                                                      
176.00 170616       **                                                                                            
177.00 170616      C**********************************************************************                        
178.00 170801      C*              SR: GETCQNOPER                                        *                        
179.00 170616      C**********************************************************************                        
180.00 170616      C     GETCQNOPER    BEGSR                                                                      
181.00 170616      C                   Z-ADD     1             KCFBK                                              
182.00 170616      C                   EVAL      KCFCBST = DRCBST                                                 
183.00 170616      C     KCFP280       CHAIN     CFP280                                                           
184.00 170616      C                   IF        %FOUND(CFP280)                                                   
185.00 170616      C                   EVAL      CQNOPER = CFCKBK                                                 
186.00 170616      C                   ENDIF                                                                      
187.00 170616      C                   ENDSR                                                                      
188.00 170616       **                                                                                            
189.00 170616      C**********************************************************************                        
190.00 170801      C*              SR: GETCQNONAM                                        *                        
191.00 170801      C* Fetch Account Memo if any, or get the na1&na2 from acc owner       *                        
192.00 170616      C**********************************************************************                        
193.00 170616      C     GETCQNONAM    BEGSR                                                                      
194.00 170807      C                                                                                              
195.00 170807      C                   Z-ADD     1             KCABK                                              
196.00 170807      C                   MOVE      20            KCAAPP                                             
197.00 170807      C                   IF        DRTYP = 1                                                        
198.00 170807      C                   EVAL      KCAACCT = '010000000000'                                         
199.00 170807      C                   MOVE      DRACCT        KCAACCT                                            
200.00 170807      C                   ELSEIF    DRTYP = 6                                                        
201.00 170807      C                   EVAL      KCAACCT = '060000000000'                                         
202.00 170807      C                   MOVE      DRACCT        KCAACCT                                            
203.00 170807      C                   ENDIF                                                                      
204.00 170828      C                   EVAL      KCACLS = 'TA-CHEQUE '                                            
205.00 170807      C                   EVAL      KCAITID = 'NAME      '                                           
206.00 170807      C                                                                                              
207.00 170807      C     KCUP051L6     CHAIN     CUP051L6                                                         
208.00 170807      C                   IF        %FOUND(CUP051L6)                                                 
209.00 170807      C                                                                                              
210.00 170807       *    Read account's memo as Cheque Book Name                                                  
211.00 170807      C                   EVAL      VNAMROW1 = %SUBST(CATEXT:1:45)                                   
212.00 170814      C                   IF        %LEN(%TRIM(%SUBST(CATEXT:51:45))) > 1                            
213.00 170807      C                   EVAL      VNAMROW2 = %SUBST(CATEXT:51:45)                                  
214.00 170814      C                   ELSE                                                                       
215.00 170814      C                   EVAL      VNAMROW2 = ''                                                    
216.00 170814      C                   ENDIF                                                                      
217.00 170807      C                   MOVE      VNAM          CQNONAM                                            
218.00 170807      C                                                                                              
219.00 170807      C                   ELSE                                                                       
220.00 170807      C                                                                                              
221.00 170807       *    Use name of account's first owners if no memo found                                      
222.00 170807      C                   MOVE      KCAACCT       PACCT                                              
223.00 170807      C                   CALL      'GACFOWN'                                                        
224.00 170807      C                   PARM      20            PAPP              2 0                              
225.00 170807      C                   PARM                    PACCT            12 0                              
226.00 170807      C                   PARM                    PCIF             10                                
227.00 170807      C                   PARM                    PREL              3                                
228.00 170807      C                   PARM                    POUT              1                                
229.00 170807      C                   IF        POUT = '0'                                                       
230.00 170807      C                   MOVE      1             KCUBK                                              
231.00 170807      C                   EVAL      KCUNBR = PCIF                                                    
232.00 170807      C     KCUP003       CHAIN     CUP003                                       Assume found        
233.00 170807      C                   MOVEL     CUNA1         VNAMROW1                                           
234.00 170814      C                   IF        %LEN(%TRIM(CUNA2)) > 1                                           
235.00 170807      C                   MOVEL     CUNA2         VNAMROW2                                           
236.00 170814      C                   ELSE                                                                       
237.00 170814      C                   EVAL      VNAMROW2 = ''                                                    
238.00 170814      C                   ENDIF                                                                      
239.00 170807      C                   MOVE      VNAM          CQNONAM                                            
240.00 170807      C                   ENDIF                                                                      
241.00 170807      C                                                                                              
242.00 170807      C                   ENDIF                                                                      
243.00 170801      C                                                                                              
244.00 170801      C                   ENDSR                                                                      
245.00 170616       **                                                                                            
