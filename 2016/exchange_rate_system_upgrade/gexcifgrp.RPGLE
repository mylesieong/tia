1.00 50614      H*DATEDIT(*DMY)                                                            
2.00 101216       ************************************************************************* 
3.00 160608       *  Program ID.    : GEXCIFGRP                                           * 
4.00 160608       *  Written by     : Myles Ieong (BI77)                                  * 
5.00 160608       *  Date           : 08-Jun-2016                                         * 
6.00 160608       *  Parameters     : In  - CIF                10A                        * 
7.00 160608       *                         Channel             6A                        * 
8.00 160729       *                   Out - Group               6A  'NET/CORP/VIP'        * 
9.00 110517       *                         Return Status       1A                        * 
10.00 110210       *                           '0' - successful                            * 
11.00 110517       *                           '1' - input parameter error                 * 
12.00 110517       *                                                                       * 
13.00 160729       *  Description    : Get group from cif for exchange rate.               * 
14.00 160729       *                   Note that this module only valid under the group    * 
15.00 160729       *                   rate project senario. It does not refers to customer* 
16.00 160729       *                   segment or nature at all.                           * 
17.00 110210       **************************************************************************
18.00 160608      F************************************************************************  
19.00 160608      F*                          FILE DEFINITION                             *  
20.00 160608      F************************************************************************  
21.00 160608      FCUP003    IF   E           K DISK                                         
22.00 160901       * VIP customer file                                                       
23.00 160715      FVIPMAST   IF   E           K DISK                                         
24.00 160901       * Corpnet customer file                                                   
25.00 160901      FMUP030L1  IF   E           K DISK                                         
26.00 160901       * eCorp customer file                                                     
27.00 160901 mylesFSPCIFPF   IF   E           K DISK                                         
28.00 160608      F*                                                                         
29.00 160608      D************************************************************************  
30.00 160608      D*                        VARIABLES DEFINITION                          *  
31.00 160608      D************************************************************************  
32.00 160608      DFRET             S              1  0                                      
33.00 160608      DFCORP            S              1  0                                      
34.00 160608      DFVIP             S              1  0                                      
35.00 160608      D*                                                                         
36.00 160608      C************************************************************************  
37.00 160608      C*                        KEY LIST DEFINITION                           *  
38.00 160608      C************************************************************************  
39.00 160608      C     KVIPMAST      KLIST                                                  
40.00 160608      C                   KFLD                    KCIF             10            
41.00 160608       *                                                                         
42.00 160608      C     KCUP003       KLIST                                                  
43.00 160608      C                   KFLD                    KBK               3 0          
44.00 160608      C                   KFLD                    KCIF                           
45.00 160608      C************************************************************************  
46.00 160608      C*                        PARAMETER LIST                                *  
47.00 160608      C************************************************************************  
48.00 160608      C* Note: The channel parameter is added for future use. It is not yet      
49.00 160608      C*       involved in current logic.                                        
50.00 160608      C                                                                          
51.00 160608      C     *ENTRY        PLIST                                                  
52.00 160608      C                   PARM                    PCIF             10            
53.00 160608      C                   PARM                    PCHANNEL          6            
54.00 160608      C                   PARM                    PGROUP            6            
55.00 160608      C                   PARM                    PSTATUS           1            
56.00 110520       *                                                                         
57.00 160608      C************************************************************************  
58.00 160608      C*                           MAIN ROUTINE                               *  
59.00 160608      C************************************************************************  
60.00 160608      C*    Initialize output parameter and vars                                 
61.00 160608      C                   Z-ADD     0             FRET                           
62.00 160608      C                   Z-ADD     0             FCORP                          
63.00 160608      C                   Z-ADD     0             FVIP                           
64.00 160608      C                   EVAL      PGROUP = ''                                  
65.00 160608      C                   EVAL      PSTATUS = '0'                                
66.00 160901      C                                                                          
67.00 160901       *    Validate CIF existence                                               
68.00 160608      C                   Z-ADD     1             KBK                            
69.00 160608      C                   MOVE      PCIF          KCIF                           
70.00 160608      C     KCUP003       CHAIN     CUP003                                       
71.00 160715      C                   IF        NOT %FOUND(CUP003)                           
72.00 160608      C                   EVAL      PSTATUS='1'                                  
73.00 160901      C                   ELSE                                                   
74.00 160901      C                   MOVE      1             FRET                           
75.00 160715      C                   ENDIF                                                  
76.00 160901      C                                                                          
77.00 160901       *    Update flag of corp in MUP030                                        
78.00 160901      C     PCIF          CHAIN     MUP030L1                                     
79.00 160901      C                   IF        %FOUND(MUP030L1)                             
80.00 160901      C                   IF        M30STS='ACTIVE    '                          
81.00 160901      C                   MOVE      1             FCORP                          
82.00 160901      C                   ENDIF                                                  
83.00 160901      C                   ENDIF                                                  
84.00 160901      C                                                                          
85.00 160901 myles *    Update flag of corp in SPCIFPF                                       
86.00 160901 mylesC     PCIF          CHAIN     SPCIFPF                                      
87.00 160901 mylesC                   IF        %FOUND(SPCIFPF)                              
88.00 160901 mylesC                   IF        SPACFLG='Y'                                  
89.00 160901 mylesC                   MOVE      1             FCORP                          
90.00 160901 mylesC                   ENDIF                                                  
91.00 160901 mylesC                   ENDIF                                                  
92.00 160901 mylesC                                                                          
93.00 160901       *    Update Flag of VIP                                                   
94.00 160608      C     KVIPMAST      CHAIN     VIPMAST                                      
95.00 160608      C                   IF        %FOUND(VIPMAST) AND MCLDTE = 0               
96.00 160608      C                   MOVE      1             FVIP                           
97.00 160608      C                   ENDIF                                                  
98.00 160901      C                                                                          
99.00 160901       *    Output parameter writing                                             
100.00 160901      C                   IF        PSTATUS='1'                                  
101.00 160901      C                                                                          
102.00 160901      C                   EVAL      PGROUP=''                                    
103.00 160901      C                                                                          
104.00 160901      C                   ELSE                                                   
105.00 160901      C                                                                          
106.00 160901      C                   IF        FCORP=1                                      
107.00 160901      C                   EVAL      PGROUP = 'CORP  '                            
108.00 160901      C                   ELSE                                                   
109.00 160901      C                   IF        FVIP=1                                       
110.00 160901      C                   EVAL      PGROUP = 'VIP   '                            
111.00 160901      C                   ELSE                                                   
112.00 160901      C                   EVAL      PGROUP = 'NET   '                            
113.00 160901      C                   ENDIF                                                  
114.00 160901      C                   ENDIF                                                  
115.00 160901      C                                                                          
116.00 160901      C                   ENDIF                                                  
117.00 160608      C                                                                          
118.00 160608      C                   SETON                                        LR        
