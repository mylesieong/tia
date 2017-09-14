1.00 160608      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                      
2.00 160715      C                   CALL      'GGRPRATECL'                                                     
3.00 160610       *******************Test case 1a*******************************************                    
4.00 160608       *   A corp cif ask for rate from mop to usd in e-channel in cash W telling                    
5.00 160608       *   the group it should be. The rate result should be:                                        
6.00 160608       *                  00001248003                                                                
7.00 160613 pass C*                  PARM      '0000125695'  PCIF             10            CIF                 
8.00 160613      C*                  PARM      000           PCCYNUM           3 0          From currency       
9.00 160613      C*                  PARM      0             PFRAMT           13 2                              
10.00 160613      C*                  PARM      840           PTOCCY            3 0          To currency         
11.00 160613      C*                  PARM      0             PTOAMT           13 2                              
12.00 160613      C*                  PARM      'C'           PEXCHGTYP         1            C-Cash, T-Transfer  
13.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
14.00 160613      C*                  PARM      'CORP  '      PGROUP            6            Group, leave        
15.00 160613      C*                  PARM      'ECHAN '      PCHANNEL          6            ECHAN*/             
16.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
17.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
18.00 160610       *******************Test case 1b*******************************************                    
19.00 160608       *   A corp cif ask for rate from mop to usd in OLD module in cahs & tells                     
20.00 160608       *   the group it should be. The rate result should be:                                        
21.00 160608       *                  00001248393                                                                
22.00 160613 pass C*                  PARM      '0000125695'  PCIF             10            CIF                 
23.00 160613      C*                  PARM      000           PCCYNUM           3 0          From currency       
24.00 160613      C*                  PARM      0             PFRAMT           13 2                              
25.00 160613      C*                  PARM      840           PTOCCY            3 0          To currency         
26.00 160613      C*                  PARM      0             PTOAMT           13 2                              
27.00 160613      C*                  PARM      'C'           PEXCHGTYP         1            C-Cash, T-Transfer  
28.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
29.00 160613      C*                  PARM      'CORP  '      PGROUP            6            Group, leave        
30.00 160613      C*                  PARM      ''            PCHANNEL          6            ECHAN*/             
31.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
32.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
33.00 160610       *******************Test case 1c*******************************************                    
34.00 160610       *   a cif 0000125695 do T transaction from HKD to GBP through ECHAN, rst                      
35.00 160610       *   .08938059                                                                                 
36.00 160613 pass C*                  PARM      '0000125695'  PCIF             10            CIF                 
37.00 160613      C*                  PARM      344           PCCYNUM           3 0          From currency       
38.00 160613      C*                  PARM      0             PFRAMT           13 2                              
39.00 160613      C*                  PARM      826           PTOCCY            3 0          To currency         
40.00 160613      C*                  PARM      0             PTOAMT           13 2                              
41.00 160613      C*                  PARM      'T'           PEXCHGTYP         1            C-Cash, T-Transfer  
42.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
43.00 160613      C*                  PARM      'CORP  '      PGROUP            6            Group, leave        
44.00 160613      C*                  PARM      'ECHAN '      PCHANNEL          6            ECHAN*/             
45.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
46.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
47.00 160613       *******************Test case 1d*******************************************                    
48.00 160613       *   a cif 0000125695 do T transaction from HKD to GBP through ECHAN, rst                      
49.00 160613       *   .0894397                                                                                  
50.00 160613 pass C*                  PARM      '0000125695'  PCIF             10            CIF                 
51.00 160613      C*                  PARM      344           PCCYNUM           3 0          From currency       
52.00 160613      C*                  PARM      0             PFRAMT           13 2                              
53.00 160613      C*                  PARM      826           PTOCCY            3 0          To currency         
54.00 160613      C*                  PARM      0             PTOAMT           13 2                              
55.00 160613      C*                  PARM      'T'           PEXCHGTYP         1            C-Cash, T-Transfer  
56.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
57.00 160613      C*                  PARM      'CORP  '      PGROUP            6            Group, leave        
58.00 160613      C*                  PARM      ''            PCHANNEL          6            ECHAN*/             
59.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
60.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
61.00 160613       *******************Test case 1e*******************************************                    
62.00 160610       *   a cif 0000125695 do T transaction from USD to HKD through ECHAN, rslt                     
63.00 160610       *      7.73730695                                                                             
64.00 160613 pass C*                  PARM      '0000125695'  PCIF             10            CIF                 
65.00 160613      C*                  PARM      840           PCCYNUM           3 0          From currency       
66.00 160613      C*                  PARM      0             PFRAMT           13 2                              
67.00 160613      C*                  PARM      344           PTOCCY            3 0          To currency         
68.00 160613      C*                  PARM      0             PTOAMT           13 2                              
69.00 160613      C*                  PARM      'T'           PEXCHGTYP         1            C-Cash, T-Transfer  
70.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
71.00 160613      C*                  PARM      'CORP  '      PGROUP            6            Group, leave        
72.00 160613      C*                  PARM      'ECHAN '      PCHANNEL          6            ECHAN*/             
73.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
74.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
75.00 160610       *******************Test case 1f*******************************************                    
76.00 160610       *   a cif 0000125695 do T transaction from USD to HKD through normal chn                      
77.00 160610       *   and result shd be: 7.7464077                                                              
78.00 160613 pass C*                  PARM      '0000125695'  PCIF             10            CIF                 
79.00 160613      C*                  PARM      840           PCCYNUM           3 0          From currency       
80.00 160613      C*                  PARM      0             PFRAMT           13 2                              
81.00 160613      C*                  PARM      344           PTOCCY            3 0          To currency         
82.00 160613      C*                  PARM      0             PTOAMT           13 2                              
83.00 160613      C*                  PARM      'T'           PEXCHGTYP         1            C-Cash, T-Transfer  
84.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
85.00 160613      C*                  PARM      'CORP  '      PGROUP            6            Group, leave        
86.00 160613      C*                  PARM      ''            PCHANNEL          6            ECHAN*/             
87.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
88.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
89.00 160610       *******************Test case 1g*******************************************                    
90.00 160610       *   no cif, group CORP and ECHAN, doing C from MOP to USD, result shd be:                     
91.00 160610       *         00001248003                                                                         
92.00 160613 pass C*                  PARM      ''            PCIF             10            CIF                 
93.00 160613      C*                  PARM      000           PCCYNUM           3 0          From currency       
94.00 160613      C*                  PARM      0             PFRAMT           13 2                              
95.00 160613      C*                  PARM      840           PTOCCY            3 0          To currency         
96.00 160613      C*                  PARM      0             PTOAMT           13 2                              
97.00 160613      C*                  PARM      'C'           PEXCHGTYP         1            C-Cash, T-Transfer  
98.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
99.00 160613      C*                  PARM      'CORP  '      PGROUP            6            Group, leave        
100.00 160613      C*                  PARM      'ECHAN '      PCHANNEL          6            ECHAN*/             
101.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
102.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
103.00 160613       *******************Test case 1h*******************************************                    
104.00 160610       *   no cif, group CORP and No Channel, doing C from MOP to USD, result shd                    
105.00 160610       *            be: 00001248393                                                                  
106.00 160613 pass C*                  PARM      ''            PCIF             10            CIF                 
107.00 160613      C*                  PARM      000           PCCYNUM           3 0          From currency       
108.00 160613      C*                  PARM      0             PFRAMT           13 2                              
109.00 160613      C*                  PARM      840           PTOCCY            3 0          To currency         
110.00 160613      C*                  PARM      0             PTOAMT           13 2                              
111.00 160613      C*                  PARM      'C'           PEXCHGTYP         1            C-Cash, T-Transfer  
112.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
113.00 160613      C*                  PARM      'CORP  '      PGROUP            6            Group, leave        
114.00 160613      C*                  PARM      ''            PCHANNEL          6            ECHAN*/             
115.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
116.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
117.00 160613       *******************Test case 1i*******************************************                    
118.00 160613       *  no cif, no group and ECHAN, doing C from MOP to USD, result should be:                     
119.00 160613       *          0000124839269                                                                      
120.00 160613 pass C*                  PARM      ''            PCIF             10            CIF                 
121.00 160613      C*                  PARM      000           PCCYNUM           3 0          From currency       
122.00 160613      C*                  PARM      0             PFRAMT           13 2                              
123.00 160613      C*                  PARM      840           PTOCCY            3 0          To currency         
124.00 160613      C*                  PARM      0             PTOAMT           13 2                              
125.00 160613      C*                  PARM      'C'           PEXCHGTYP         1            C-Cash, T-Transfer  
126.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
127.00 160613      C*                  PARM      ''            PGROUP            6            Group, leave        
128.00 160613      C*                  PARM      'ECHAN '      PCHANNEL          6            ECHAN*/             
129.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
130.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
131.00 160613       *******************Test case 1j*******************************************                    
132.00 160613       *  no cif, no group and no channel, doing C from MOP to USD, result shd be                    
133.00 160613       *             00001248393                                                                     
134.00 160613 pass C*                  PARM      ''            PCIF             10            CIF                 
135.00 160613      C*                  PARM      000           PCCYNUM           3 0          From currency       
136.00 160613      C*                  PARM      0             PFRAMT           13 2                              
137.00 160613      C*                  PARM      840           PTOCCY            3 0          To currency         
138.00 160613      C*                  PARM      0             PTOAMT           13 2                              
139.00 160613      C*                  PARM      'C'           PEXCHGTYP         1            C-Cash, T-Transfer  
140.00 160613      C*                  PARM      ''            PFUNC             4            Function, leave     
141.00 160613      C*                  PARM      ''            PGROUP            6            Group, leave        
142.00 160613      C*                  PARM      ''            PCHANNEL          6            ECHAN*/             
143.00 160613      C*                  PARM      0             DEFFECTDATE       8 0          When 0, find current
144.00 160613      C*                  PARM      0             DEFFECTTIME       6 0          When 0, find current
145.00 160613       *******************Test case 1k*******************************************                    
146.00 160613       *  a cif 0000125695, group RET and ECHAN doing C from MOP to USD, result                      
147.00 160613       *  should be:   00001248003                                                                   
148.00 160613 pass C                   PARM      '0000125695'  PCIF             10            CIF                 
149.00 160613      C                   PARM      000           PCCYNUM           3 0          From currency       
150.00 160613      C                   PARM      0             PFRAMT           13 2                              
151.00 160613      C                   PARM      840           PTOCCY            3 0          To currency         
152.00 160613      C                   PARM      0             PTOAMT           13 2                              
153.00 160613      C                   PARM      'C'           PEXCHGTYP         1            C-Cash, T-Transfer  
154.00 160613      C                   PARM      ''            PFUNC             4            Function, leave     
155.00 160613      C                   PARM      'RET   '      PGROUP            6            Group, leave        
156.00 160613      C                   PARM      'ECHAN '      PCHANNEL          6            ECHAN*/             
157.00 160613      C                   PARM      0             DEFFECTDATE       8 0          When 0, find current
158.00 160613      C                   PARM      0             DEFFECTTIME       6 0          When 0, find current
159.00 160608       *******************Output parameter***************************************                    
160.00 160608      C                   PARM                    PRATE            11 7                              
161.00 160608      C                   PARM                    PFRCCYRATE       11 7                              
162.00 160608      C                   PARM                    PFRDATE           8 0                              
163.00 160608      C                   PARM                    PFRTIME           6 0                              
164.00 160608      C                   PARM                    PTOCCYRATE       11 7                              
165.00 160608      C                   PARM                    PTODATE           8 0                              
166.00 160608      C                   PARM                    PTOTIME           6 0                              
167.00 160608      C                   PARM                    PDSPCCYRATE      11 7                              
168.00 160613      C                   PARM                    PIND1             1                                
169.00 160613      C                   PARM                    PIND2             1                                
170.00 160613      C                   PARM                    PIND3             1                                
171.00 160608      C                   PARM                    PSTATUS           1                                
172.00 160608      C     PRATE         DSPLY                                                                      
173.00 160608      C     PFRCCYRATE    DSPLY                                                                      
174.00 160608      C     PFRDATE       DSPLY                                                                      
175.00 160608      C     PFRTIME       DSPLY                                                                      
176.00 160608      C     PTOCCYRATE    DSPLY                                                                      
177.00 160608      C     PTODATE       DSPLY                                                                      
178.00 160608      C     PTOTIME       DSPLY                                                                      
179.00 160608      C     PDSPCCYRATE   DSPLY                                                                      
180.00 160613      C     PIND1         DSPLY                                                                      
181.00 160613      C     PIND2         DSPLY                                                                      
182.00 160613      C     PIND3         DSPLY                                                                      
183.00 160608      C     PSTATUS       DSPLY                                                                      
184.00 160606      C                   SETON                                        LR                            
