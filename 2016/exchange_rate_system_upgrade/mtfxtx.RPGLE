1.00 160621      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 160511       ************************************************************************  
3.00 160906       * REFERENCE NO. : CHG-0250-16 (D6250)                                  *  
4.00 160511       * AUTHOR        : Myles Ieong                                          *  
5.00 160511       * USER ID.      : BI77PGM                                              *  
6.00 160511       * DATE WRITTEN  : 11 May 2016                                          *  
7.00 160511       * DESCRPITION   : Extract Fx physical file                             *  
8.00 160511       *                                                                      *  
9.00 160511       ************************************************************************  
10.00 170802       * REFERENCE NO. : CHG-0255-17                                         *   
11.00 170731       * USER ID.      : BI77PGM Myles Ieong                                 *   
12.00 170731       * DATE WRITTEN  : 31/07/2017                                          *   
13.00 170731       * DESCRPITION   : Change Description Fetching from CFP753 to PST001   *   
14.00 170731       ***********************************************************************   
15.00 160621       * ICBS Standard files                                                     
16.00 160621      FCUP009LT  IF   E           K DISK                                         
17.00 170802 D7255F*CFP753    IF   E           K DISK                                        
18.00 160628       * Transaction raw resource                                                
19.00 160628      FPST001IM  IF   E           K DISK                                         
20.00 160621       * Project master file                                                     
21.00 160511      FMTFXTXPF  UF A E           K DISK                                         
22.00 160531      D*****************************************************************         
23.00 160531      D*               VARIABLES / CONSTANT DEFINITION                 *         
24.00 160531      D*****************************************************************         
25.00 160906       * Variable TIME STAMP                                                     
26.00 160906      DVDATE            S               D                                        
27.00 160906      DVTIME            S               T                                        
28.00 160906      DVTSTMP           S               Z                                        
29.00 160725       * Data structure of data area                                             
30.00 160727      DMTFXCP           S             26                                         
31.00 160621       * DATA STRUCTURE FOR ACCOUNT                                              
32.00 160621      D                 DS                                                       
33.00 160621      D  TSFX                   1      2  0                                      
34.00 160621      D  TAC                    3     12  0                                      
35.00 160621      D  TACNO                  1     12  0                                      
36.00 160621      D*                                                                         
37.00 160621      C*****************************************************************         
38.00 160621      C*                    KEY LIST DEFINTION                         *         
39.00 160621      C*****************************************************************         
40.00 160621      C     KCUP009LT     KLIST                                                  
41.00 160621      C                   KFLD                    KCUXBK            3 0          
42.00 160621      C                   KFLD                    KCUX1AP           2 0          
43.00 160621      C                   KFLD                    KCUX1AC          12 0          
44.00 160621      C*                                                                         
45.00 170802 D7255C*    KCFP753       KLIST                                                  
46.00 170802 D7255C*                  KFLD                    KCFBK             3 0          
47.00 170802 D7255C*                  KFLD                    KCFTCNO           4            
48.00 160906      C*                                                                         
49.00 160531      C*****************************************************************         
50.00 160531      C*                       MAIN ROUTINE                            *         
51.00 160531      C*****************************************************************         
52.00 160906       *    Read in last update time stamp                                       
53.00 160727      C     *DTAARA       DEFINE                  MTFXCP                         
54.00 160727      C     *LOCK         IN        *DTAARA                                      
55.00 160906      C                   MOVE      MTFXCP        VTSTMP                         
56.00 160906      C                                                                          
57.00 160906      C     VTSTMP        SETLL     PST001IM                                     
58.00 160727      C                   IF        %FOUND(PST001IM)                             
59.00 160727      C                   READ      PST001IM                                     
60.00 160906      C                                                                          
61.00 160906       **   Check if the record is scanned last time                             
62.00 160906      C                   IF        TLTTIM = VTSTMP                              
63.00 160727      C                   READ      PST001IM                                     
64.00 160727      C                   ENDIF                                                  
65.00 160727      C                                                                          
66.00 160727      C                   DOW       NOT %EOF(PST001IM)                           
67.00 160624      C                                                                          
68.00 160913      C                   SETOFF                                       70        
69.00 160913      C                   SETOFF                                       717273    
70.00 160906      C                                                                          
71.00 160624      C                   IF        TLTPST <> 'P'                                
72.00 160906      C                   SETON                                        71        
73.00 160906      C                   ENDIF                                                  
74.00 160906      C                                                                          
75.00 160906      C                   IF        TLTRTY <> '2'                                
76.00 160906      C                   SETON                                        72        
77.00 160906      C                   ENDIF                                                  
78.00 160906      C                                                                          
79.00 160906      C                   IF        TLTTIL < 7001 OR TLTTIL > 8001               
80.00 160906      C                   SETON                                        73        
81.00 160624      C                   ENDIF                                                  
82.00 160727      C                                                                          
83.00 160906      C                   IF        *IN71=*ON OR *IN72=*ON OR *IN73=*ON          
84.00 160906      C                   SETON                                        70        
85.00 160906      C                   ENDIF                                                  
86.00 160906      C                                                                          
87.00 160906       **   Add record to master pf base on indicator                            
88.00 160906      C                   IF        *IN70 = *OFF                                 
89.00 160624      C                                                                          
90.00 160906      C                   MOVE      TLTTIM        VTSTMP                         
91.00 160906      C                   MOVE      VTSTMP        VDATE                          
92.00 160906      C                   MOVE      VTSTMP        VTIME                          
93.00 160906      C                                                                          
94.00 160906      C                   MOVE      VDATE         MFTXDT                         
95.00 160906      C                   MOVE      VTIME         MFTXTM                         
96.00 160906      C                   MOVE      VTSTMP        MFTXTIM                        
97.00 160512      C                   EVAL      MFTXACT = TLTACT                             
98.00 160913      C                   EVAL      MFTXTACT = TLTTAC                            
99.00 160512      C                   EVAL      MFTXCUR = TLTCUR                             
100.00 160614      C                   CALL      'CCCYCHK1'                                   
101.00 160614      C                   PARM                    MFTXCUR                        
102.00 160614      C                   PARM                    MFTXPET                        
103.00 160614      C                   PARM                    ERRIND            1            
104.00 160621      C                   MOVE      TLTCNB        MFTXTCUR                       
105.00 160614      C                   CALL      'CCCYCHK1'                                   
106.00 160614      C                   PARM                    MFTXTCUR                       
107.00 160614      C                   PARM                    MFTXTPET                       
108.00 160614      C                   PARM                    ERRIND            1            
109.00 160512      C                   EVAL      MFTXTC = TLTTC                               
110.00 160512      C                   EVAL      MFTXTTC = TLTPRN                             
111.00 160512      C                   EVAL      MFTXLCE = TLTLCE                             
112.00 160512      C                   EVAL      MFTXTLCE = TLTINT                            
113.00 160913      C                   MOVE      TLTAPP        MFTXAPP                        
114.00 160913      C                   MOVE      TLTNTF        MFTXTAPP                       
115.00 160913      C                   EVAL      MFTXCIF=''                                   
116.00 160913      C                   EVAL      MFTXTCIF=''                                  
117.00 160624      C                   EXSR      GCIFFAC                                      
118.00 160912      C                   EXSR      GCIFTAC                                      
119.00 160906      C                   EVAL      MFTXCHN=%CHAR(TLTTIL)                        
120.00 160906      C                   EVAL      MFTXCD = TLTCD                               
121.00 170802 D7255C*                  Z-ADD     1             KCFBK                          
122.00 170802 D7255C*                  MOVEL     TLTCD         KCFTCNO                        
123.00 170802 D7255C*    KCFP753       CHAIN     CFP753                                       
124.00 170802 D7255C*                  IF        %FOUND(CFP753)                               
125.00 170802 D7255C*                  EVAL      MFTXTLDS = CFTLDS                            
126.00 170802 D7255C*                  ENDIF                                                  
127.00 170802 D7255C                   MOVEL     TLTAL1        MFTXTLDS                       
128.00 160909      C                   EVAL      MFTXFCCY = 'P'                               
129.00 160909      C                   EVAL      MFTXFMOV = 'P'                               
130.00 160909      C                   EVAL      MFTXFALT = 'P'                               
131.00 160906      C                                                                          
132.00 160511      C                   WRITE     RMTFXTXPF                                    
133.00 160621      C                                                                          
134.00 160511      C                   ENDIF                                                  
135.00 160621      C                                                                          
136.00 160628      C                   READ      PST001IM                                     
137.00 160621      C                                                                          
138.00 160511      C                   ENDDO                                                  
139.00 160906      C                                                                          
140.00 160906       *    Update the data area MTFXCP with the latest time stamp from PST001IM 
141.00 160727      C                   MOVE      TLTTIM        MTFXCP                         
142.00 160727      C                   OUT       MTFXCP                                       
143.00 160725      C                                                                          
144.00 160727      C                   ENDIF                                                  
145.00 160621      C                                                                          
146.00 160511      C                   SETON                                        LR        
147.00 160621      C*                                                                         
148.00 160621      C*****************************************************************         
149.00 160622      C*               SR: GCIFFAC(READ CIF BY FROM AC)                *         
150.00 160621      C*****************************************************************         
151.00 160622      C     GCIFFAC       BEGSR                                                  
152.00 160906      C                                                                          
153.00 160906       *    Try if the account is current account                                
154.00 160621      C                   Z-ADD     1             KCUXBK                         
155.00 160621      C                   Z-ADD     20            KCUX1AP                        
156.00 160621      C                   Z-ADD     06            TSFX                           
157.00 160621      C                   Z-ADD     TLTACT        TAC                            
158.00 160621      C                   MOVEL     TACNO         KCUX1AC                        
159.00 160621      C     KCUP009LT     CHAIN     CUP009LT                                     
160.00 160621      C                   IF        %FOUND(CUP009LT)                             
161.00 160621      C                   EVAL      MFTXCIF=CUX1CS                               
162.00 160621      C                   ENDIF                                                  
163.00 160906      C                                                                          
164.00 160906       *    Try if the account is saving account                                 
165.00 160621      C                   Z-ADD     1             KCUXBK                         
166.00 160622      C                   Z-ADD     20            KCUX1AP                        
167.00 160621      C                   Z-ADD     01            TSFX                           
168.00 160621      C                   Z-ADD     TLTACT        TAC                            
169.00 160621      C                   MOVEL     TACNO         KCUX1AC                        
170.00 160621      C     KCUP009LT     CHAIN     CUP009LT                                     
171.00 160621      C                   IF        %FOUND(CUP009LT)                             
172.00 160621      C                   EVAL      MFTXCIF=CUX1CS                               
173.00 160621      C                   ENDIF                                                  
174.00 160906      C                                                                          
175.00 160906       *    Try if the account is loan account                                   
176.00 160621      C                   Z-ADD     1             KCUXBK                         
177.00 160621      C                   Z-ADD     50            KCUX1AP                        
178.00 160621      C                   MOVE      TLTACT        KCUX1AC                        
179.00 160621      C     KCUP009LT     CHAIN     CUP009LT                                     
180.00 160621      C                   IF        %FOUND(CUP009LT)                             
181.00 160621      C                   EVAL      MFTXCIF=CUX1CS                               
182.00 160621      C                   ENDIF                                                  
183.00 160906      C                                                                          
184.00 160906       *    Try if the account is time deposit account                           
185.00 160621      C                   Z-ADD     1             KCUXBK                         
186.00 160621      C                   Z-ADD     30            KCUX1AP                        
187.00 160621      C                   MOVE      TLTACT        KCUX1AC                        
188.00 160621      C     KCUP009LT     CHAIN     CUP009LT                                     
189.00 160621      C                   IF        %FOUND(CUP009LT)                             
190.00 160621      C                   EVAL      MFTXCIF=CUX1CS                               
191.00 160621      C                   ENDIF                                                  
192.00 160912      C                                                                          
193.00 160912       *    If CIF NOT FOUND THEN SET AS 'INTERNAL'                              
194.00 160912      C                   IF        MFTXCIF = ''                                 
195.00 160912      C                   EVAL      MFTXCIF = 'INTERNAL'                         
196.00 160912      C                   ENDIF                                                  
197.00 160912      C                                                                          
198.00 160621      C                   ENDSR                                                  
199.00 160621      C*                                                                         
200.00 160622      C*****************************************************************         
201.00 160622      C*               SR: GCIFTAC(READ CIF BY TO AC)                  *         
202.00 160622      C*****************************************************************         
203.00 160622      C     GCIFTAC       BEGSR                                                  
204.00 160906      C                                                                          
205.00 160906       *    Try if the account is current account                                
206.00 160622      C                   Z-ADD     1             KCUXBK                         
207.00 160622      C                   Z-ADD     20            KCUX1AP                        
208.00 160622      C                   Z-ADD     06            TSFX                           
209.00 160622      C                   Z-ADD     TLTTAC        TAC                            
210.00 160622      C                   MOVEL     TACNO         KCUX1AC                        
211.00 160622      C     KCUP009LT     CHAIN     CUP009LT                                     
212.00 160622      C                   IF        %FOUND(CUP009LT)                             
213.00 160913      C                   EVAL      MFTXTCIF=CUX1CS                              
214.00 160622      C                   ENDIF                                                  
215.00 160906      C                                                                          
216.00 160906       *    Try if the account is saving account                                 
217.00 160622      C                   Z-ADD     1             KCUXBK                         
218.00 160622      C                   Z-ADD     20            KCUX1AP                        
219.00 160622      C                   Z-ADD     01            TSFX                           
220.00 160622      C                   Z-ADD     TLTTAC        TAC                            
221.00 160622      C                   MOVEL     TACNO         KCUX1AC                        
222.00 160622      C     KCUP009LT     CHAIN     CUP009LT                                     
223.00 160622      C                   IF        %FOUND(CUP009LT)                             
224.00 160913      C                   EVAL      MFTXTCIF=CUX1CS                              
225.00 160622      C                   ENDIF                                                  
226.00 160906      C                                                                          
227.00 160906       *    Try if the account is loan account                                   
228.00 160622      C                   Z-ADD     1             KCUXBK                         
229.00 160622      C                   Z-ADD     50            KCUX1AP                        
230.00 160622      C                   MOVE      TLTTAC        KCUX1AC                        
231.00 160622      C     KCUP009LT     CHAIN     CUP009LT                                     
232.00 160622      C                   IF        %FOUND(CUP009LT)                             
233.00 160913      C                   EVAL      MFTXTCIF=CUX1CS                              
234.00 160622      C                   ENDIF                                                  
235.00 160906      C                                                                          
236.00 160906       *    Try if the account is time deposit account                           
237.00 160622      C                   Z-ADD     1             KCUXBK                         
238.00 160622      C                   Z-ADD     30            KCUX1AP                        
239.00 160622      C                   MOVE      TLTTAC        KCUX1AC                        
240.00 160622      C     KCUP009LT     CHAIN     CUP009LT                                     
241.00 160622      C                   IF        %FOUND(CUP009LT)                             
242.00 160913      C                   EVAL      MFTXTCIF=CUX1CS                              
243.00 160622      C                   ENDIF                                                  
244.00 160912      C                                                                          
245.00 160912       *    If CIF NOT FOUND THEN SET AS 'INTERNAL'                              
246.00 160912      C                   IF        MFTXTCIF = ''                                
247.00 160912      C                   EVAL      MFTXTCIF = 'INTERNAL'                        
248.00 160912      C                   ENDIF                                                  
249.00 160912      C                                                                          
250.00 160622      C                   ENDSR                                                  
251.00 160622      C*                                                                         
