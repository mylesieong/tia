1.00 20307      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                      
2.00 20319       **************************************************************************                    
3.00 170814       * REFERENCE NO. : CHG-0266-17 (D7xxx)                                                         
4.00 170609       * PROGRAM ID.   : CQNACCM                                                                     
5.00 170728       * DESC          : Cheque Number Maintenance Module                                            
6.00 160607       * AUTHOR        : Myles Ieong                                                                 
7.00 160607       * USER ID.      : BI77PGM                                                                     
8.00 170609       * DATE WRITTEN  : 09 Jun 2017                                                                 
9.00 170620       *                 PACT    : 'CHK '- Pre-check before create                                   
10.00 170614       *                           'CRT '- Create operation                                          
11.00 170609       *                           'DLT '- Delete operation                                          
12.00 170609       *                 PSTS    : '0' - success                                                     
13.00 161024       *                           '1' - failure                                                     
14.00 161020       **************************************************************************                    
15.00 161020      F**********************************************************************                        
16.00 160607      F*                         File Specification                         *                        
17.00 160607      F**********************************************************************                        
18.00 170621      FCQNACCL1  UF A E           K DISK                                                             
19.00 170612      FCFP280    IF   E           K DISK                                                             
20.00 170621      F*                                                                                             
21.00 170123      F**********************************************************************                        
22.00 170123      F*                         Function Description                       *                        
23.00 170123      F**********************************************************************                        
24.00 170123      F*              *IN70: General error indicator  (*ON: failed)                                  
25.00 170612      F*              *IN71: Input Action code integrity                                             
26.00 170612      F*              *IN72: Cheque book style not found                                             
27.00 170612      F*              *IN73: Contains duplicated cheque                                              
28.00 170620      F*              *IN74: Cheques missing                                                         
29.00 170621      F*                                                                                             
30.00 160607      C**********************************************************************                        
31.00 160607      C*                         Key List define                            *                        
32.00 160615      C**********************************************************************                        
33.00 170612      C     KCFP280       KLIST                                                                      
34.00 170612      C                   KFLD                    KCFBK             3 0                              
35.00 170612      C                   KFLD                    KCFCBST          10                                
36.00 170621      C*                                                                                             
37.00 170123      C**********************************************************************                        
38.00 170123      C*                         Parameter List                             *                        
39.00 170123      C**********************************************************************                        
40.00 161020      C     *ENTRY        PLIST                                                                      
41.00 170609      C                   PARM                    PACT              3                                
42.00 170609      C                   PARM                    PACCT            12 0          *Account            
43.00 170612      C                   PARM                    PCBST            10            *Cheque book style  
44.00 170609      C                   PARM                    PORDR             5 0          *Number of book     
45.00 170609      C                   PARM                    PSTAR             7 0          *Starting No.       
46.00 170609      C                   PARM                    PSTS              1 0                              
47.00 170123      C**********************************************************************                        
48.00 170123      C*                          MAIN PROGRAM                              *                        
49.00 170123      C**********************************************************************                        
50.00 170123       *    Check input parameter validity                                                           
51.00 170123      C                   SETOFF                                       70                            
52.00 170123      C                   SETOFF                                       717273                        
53.00 170728      C                   SETOFF                                       74                            
54.00 170609      C                   EVAL      PSTS = 0                                                         
55.00 161027      C                                                                                              
56.00 170612       *    Check Input Action Validity                                                              
57.00 170614      C                   IF        PACT <> 'CHK' AND                                                
58.00 170614      C                             PACT <> 'CRT' AND                                                
59.00 170612      C                             PACT <> 'DLT'                                                    
60.00 170612      C                   SETON                                        71                            
61.00 170612      C                   ENDIF                                                                      
62.00 170612      C                                                                                              
63.00 170612       *    Check Cheque book style                                                                  
64.00 170612      C                   MOVE      1             KCFBK                                              
65.00 170612      C                   EVAL      KCFCBST = PCBST                                                  
66.00 170612      C     KCFP280       CHAIN     CFP280                                                           
67.00 170612      C                   IF        NOT %FOUND(CFP280)                                               
68.00 170612      C                   SETON                                        72                            
69.00 170612      C                   ENDIF                                                                      
70.00 170612      C                                                                                              
71.00 170612       *    Check wether contains duplicated cheques                                                 
72.00 170728      C                   IF        PACT = 'CRT' OR PACT = 'CHK'                                     
73.00 170620      C                                                                                              
74.00 170621      C                   Z-ADD     PSTAR         VNBR             10 0          Var: chq number     
75.00 170612      C                   MOVE      1             KCFBK                                              
76.00 170612      C                   EVAL      KCFCBST = PCBST                                                  
77.00 170612      C     KCFP280       CHAIN     CFP280                                                           
78.00 170612      C                   Z-ADD     CFCKBK        UNQTY                          Unit Qty of a chq bk
79.00 170612      C                                                                                              
80.00 170612      C                   DOW       VNBR < PSTAR + UNQTY * PORDR                                     
81.00 170621      C     VNBR          CHAIN     CQNACCL1                                                         
82.00 170621      C                   IF        %FOUND(CQNACCL1)                                                 
83.00 170612      C                   SETON                                        73                            
84.00 170612      C                   ENDIF                                                                      
85.00 170612      C                   EVAL      VNBR = VNBR + 1                                                  
86.00 170612      C                   ENDDO                                                                      
87.00 170620      C                                                                                              
88.00 170728      C                   ENDIF                                                                      
89.00 170620      C                                                                                              
90.00 170620       *    Check if cheques exists before delete operation                                          
91.00 170728      C                   IF        PACT = 'DLT'                                                     
92.00 170728      C                                                                                              
93.00 170728      C                   Z-ADD     PSTAR         VNBR                           Var: chq number     
94.00 170728      C                   MOVE      1             KCFBK                                              
95.00 170728      C                   EVAL      KCFCBST = PCBST                                                  
96.00 170728      C     KCFP280       CHAIN     CFP280                                                           
97.00 170728      C                   Z-ADD     CFCKBK        UNQTY                          Unit Qty of a chq bk
98.00 170728      C                                                                                              
99.00 170728      C                   DOW       VNBR < PSTAR + UNQTY * PORDR                                     
100.00 170728      C     VNBR          CHAIN     CQNACCL1                                                         
101.00 170728      C                   IF        NOT %FOUND(CQNACCL1)                                             
102.00 170728      C                   SETON                                        74                            
103.00 170728      C                   ENDIF                                                                      
104.00 170728      C                   EVAL      VNBR = VNBR + 1                                                  
105.00 170728      C                   ENDDO                                                                      
106.00 170728      C                                                                                              
107.00 170728      C                   ENDIF                                                                      
108.00 170728      C                                                                                              
109.00 170609       *    Check Summary                                                                            
110.00 170123      C                   IF        *IN71=*ON OR *IN72=*ON OR *IN73=*ON                              
111.00 170728      C                             OR *IN74=*ON                                                     
112.00 170123      C                   SETON                                        70                            
113.00 170612      C                   EVAL      PSTS = 1                                                         
114.00 170123      C                   ENDIF                                                                      
115.00 170123      C                                                                                              
116.00 170123      C                   IF        *IN70 = *OFF                                                     
117.00 170612      C                                                                                              
118.00 170814       **   Operation: insert into cqnaccpf crt                                                      
119.00 170612      C                   IF        PACT = 'CRT'                                                     
120.00 170612      C                                                                                              
121.00 170621      C                   Z-ADD     PSTAR         VNBR                           Var: chq number     
122.00 170612      C                   MOVE      1             KCFBK                                              
123.00 170612      C                   EVAL      KCFCBST = PCBST                                                  
124.00 170612      C     KCFP280       CHAIN     CFP280                                                           
125.00 170612      C                   Z-ADD     CFCKBK        UNQTY             5 0          Unit Qty of a chq bk
126.00 170612      C                                                                                              
127.00 170612      C                   DOW       VNBR < PSTAR + UNQTY * PORDR                                     
128.00 170621      C                   EVAL      CQNACCT = PACCT                                                  
129.00 170621      C                   EVAL      CQNCQN = VNBR                                                    
130.00 170609      C                   WRITE     RCQNACCPF                                                        
131.00 170612      C                   EVAL      VNBR = VNBR + 1                                                  
132.00 170612      C                   ENDDO                                                                      
133.00 170612      C                                                                                              
134.00 170612      C                   ENDIF                                                                      
135.00 170609      C                                                                                              
136.00 170814       **   Operation: delete cqnaccpf record                                                        
137.00 170728      C                   IF        PACT = 'DLT'                                                     
138.00 170728      C                                                                                              
139.00 170728      C                   Z-ADD     PSTAR         VNBR                           Var: chq number     
140.00 170728      C                   MOVE      1             KCFBK                                              
141.00 170728      C                   EVAL      KCFCBST = PCBST                                                  
142.00 170728      C     KCFP280       CHAIN     CFP280                                                           
143.00 170728      C                   Z-ADD     CFCKBK        UNQTY             5 0          Unit Qty of a chq bk
144.00 170728      C                                                                                              
145.00 170728      C                   DOW       VNBR < PSTAR + UNQTY * PORDR                                     
146.00 170728      C     VNBR          CHAIN     CQNACCL1                                     existence chked     
147.00 170728      C                   DELETE    RCQNACCPF                                                        
148.00 170728      C                   EVAL      VNBR = VNBR + 1                                                  
149.00 170728      C                   ENDDO                                                                      
150.00 170728      C                                                                                              
151.00 170728      C                   ENDIF                                                                      
152.00 170728      C                                                                                              
153.00 170728      C                   ENDIF                                                                      
154.00 161027      C                                                                                              
155.00 170123      C                   SETON                                        LR                            
156.00 170328       **                                                                                            
