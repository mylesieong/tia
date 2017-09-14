1.00 160608      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 160715      C                   CALL      'GGRPRATECL'                                 
3.00 160610       *******************Test case 1a*******************************************
4.00 160608       *   A corp cif ask for rate from mop to usd in e-channel in cash W telling
5.00 160608       *   the group it should be. The rate result should be:                    
6.00 160608       *                  00001248003                                            
7.00 160906 pass C*                  PARM      '0000125695'  PCIF             10            
8.00 160906      C*                  PARM      000           PCCYNUM           3 0          
9.00 160906      C*                  PARM      0             PFRAMT           13 2          
10.00 160906      C*                  PARM      840           PTOCCY            3 0          
11.00 160906      C*                  PARM      0             PTOAMT           13 2          
12.00 160906      C*                  PARM      'C'           PEXCHGTYP         1            
13.00 160906      C*                  PARM      ''            PFUNC             4            
14.00 160906      C*                  PARM      'CORP  '      PGROUP            6            
15.00 160906      C*                  PARM      'ECHAN '      PCHANNEL          6            
16.00 160906      C*                  PARM      0             DEFFECTDATE       8 0          
17.00 160906      C*                  PARM      0             DEFFECTTIME       6 0          
18.00 160906       *******************Test case 1b*******************************************
19.00 160608       *   A corp cif ask for rate from mop to usd in OLD module in cahs & tells 
20.00 160608       *   the group it should be. The rate result should be:                    
21.00 160608       *                  00001248393                                            
22.00 160906 pass C                   PARM      '0000125695'  PCIF             10            
23.00 160906      C                   PARM      000           PCCYNUM           3 0          
24.00 160906      C                   PARM      0             PFRAMT           13 2          
25.00 160906      C                   PARM      840           PTOCCY            3 0          
26.00 160906      C                   PARM      0             PTOAMT           13 2          
27.00 160906      C                   PARM      'C'           PEXCHGTYP         1            
28.00 160906      C                   PARM      ''            PFUNC             4            
29.00 160906      C                   PARM      'CORP  '      PGROUP            6            
30.00 160906      C                   PARM      ''            PCHANNEL          6            
31.00 160906      C                   PARM      0             DEFFECTDATE       8 0          
32.00 160906      C                   PARM      0             DEFFECTTIME       6 0          
33.00 160610       *******************Test case 1c*******************************************
34.00 160610       *   a cif 0000125695 do T transaction from HKD to GBP through ECHAN, rst  
35.00 160610       *   .08938059                                                             
36.00 160809 pass C*                  PARM      '0000125695'  PCIF             10            
37.00 160809      C*                  PARM      344           PCCYNUM           3 0          
38.00 160809      C*                  PARM      0             PFRAMT           13 2          
39.00 160809      C*                  PARM      826           PTOCCY            3 0          
40.00 160809      C*                  PARM      0             PTOAMT           13 2          
41.00 160809      C*                  PARM      'T'           PEXCHGTYP         1            
42.00 160809      C*                  PARM      ''            PFUNC             4            
43.00 160809      C*                  PARM      'CORP  '      PGROUP            6            
44.00 160809      C*                  PARM      'ECHAN '      PCHANNEL          6            
45.00 160809      C*                  PARM      0             DEFFECTDATE       8 0          
46.00 160809      C*                  PARM      0             DEFFECTTIME       6 0          
47.00 160613       *******************Test case 1d*******************************************
48.00 160613       *   a cif 0000125695 do T transaction from HKD to GBP through ECHAN, rst  
49.00 160613       *   .0894397                                                              
50.00 160809 pass C*                  PARM      '0000125695'  PCIF             10            
51.00 160809      C*                  PARM      344           PCCYNUM           3 0          
52.00 160809      C*                  PARM      0             PFRAMT           13 2          
53.00 160809      C*                  PARM      826           PTOCCY            3 0          
54.00 160809      C*                  PARM      0             PTOAMT           13 2          
55.00 160809      C*                  PARM      'T'           PEXCHGTYP         1            
56.00 160809      C*                  PARM      ''            PFUNC             4            
57.00 160809      C*                  PARM      'CORP  '      PGROUP            6            
58.00 160809      C*                  PARM      ''            PCHANNEL          6            
59.00 160809      C*                  PARM      0             DEFFECTDATE       8 0          
60.00 160809      C*                  PARM      0             DEFFECTTIME       6 0          
61.00 160613       *******************Test case 1e*******************************************
62.00 160610       *   a cif 0000125695 do T transaction from USD to HKD through ECHAN, rslt 
63.00 160610       *      7.73730695                                                         
64.00 160809 pass C*                  PARM      '0000125695'  PCIF             10            
65.00 160809      C*                  PARM      840           PCCYNUM           3 0          
66.00 160809      C*                  PARM      0             PFRAMT           13 2          
67.00 160809      C*                  PARM      344           PTOCCY            3 0          
68.00 160809      C*                  PARM      0             PTOAMT           13 2          
69.00 160809      C*                  PARM      'T'           PEXCHGTYP         1            
70.00 160809      C*                  PARM      ''            PFUNC             4            
71.00 160809      C*                  PARM      'CORP  '      PGROUP            6            
72.00 160809      C*                  PARM      'ECHAN '      PCHANNEL          6            
73.00 160809      C*                  PARM      0             DEFFECTDATE       8 0          
74.00 160809      C*                  PARM      0             DEFFECTTIME       6 0          
75.00 160610       *******************Test case 1f*******************************************
76.00 160610       *   a cif 0000125695 do T transaction from USD to HKD through normal chn  
77.00 160610       *   and result shd be: 7.7464077                                          
78.00 160809 pass C*                  PARM      '0000125695'  PCIF             10            
79.00 160809      C*                  PARM      840           PCCYNUM           3 0          
80.00 160809      C*                  PARM      0             PFRAMT           13 2          
81.00 160809      C*                  PARM      344           PTOCCY            3 0          
82.00 160809      C*                  PARM      0             PTOAMT           13 2          
83.00 160809      C*                  PARM      'T'           PEXCHGTYP         1            
84.00 160809      C*                  PARM      ''            PFUNC             4            
85.00 160809      C*                  PARM      'CORP  '      PGROUP            6            
86.00 160809      C*                  PARM      ''            PCHANNEL          6            
87.00 160809      C*                  PARM      0             DEFFECTDATE       8 0          
88.00 160809      C*                  PARM      0             DEFFECTTIME       6 0          
89.00 160610       *******************Test case 1g*******************************************
90.00 160610       *   no cif, group CORP and ECHAN, doing C from MOP to USD, result shd be: 
91.00 160809       *         00001248003                                                     
92.00 160906      C*                  PARM      ''            PCIF             10            
93.00 160906      C*                  PARM      000           PCCYNUM           3 0          
94.00 160906      C*                  PARM      0             PFRAMT           13 2          
95.00 160906      C*                  PARM      840           PTOCCY            3 0          
96.00 160906      C*                  PARM      0             PTOAMT           13 2          
97.00 160906      C*                  PARM      'C'           PEXCHGTYP         1            
98.00 160906      C*                  PARM      ''            PFUNC             4            
99.00 160906      C*                  PARM      'CORP  '      PGROUP            6            
100.00 160906      C*                  PARM      'ECHAN '      PCHANNEL          6            
101.00 160906      C*                  PARM      0             DEFFECTDATE       8 0          
102.00 160906      C*                  PARM      0             DEFFECTTIME       6 0          
103.00 160613       *******************Test case 1h*******************************************
104.00 160610       *   no cif, group CORP and No Channel, doing C from MOP to USD, result shd
105.00 160610       *            be: 00001248393                                              
106.00 160809      C*                  PARM      ''            PCIF             10            
107.00 160809      C*                  PARM      000           PCCYNUM           3 0          
108.00 160809      C*                  PARM      0             PFRAMT           13 2          
109.00 160809      C*                  PARM      840           PTOCCY            3 0          
110.00 160809      C*                  PARM      0             PTOAMT           13 2          
111.00 160809      C*                  PARM      'C'           PEXCHGTYP         1            
112.00 160809      C*                  PARM      ''            PFUNC             4            
113.00 160809      C*                  PARM      'CORP  '      PGROUP            6            
114.00 160809      C*                  PARM      ''            PCHANNEL          6            
115.00 160809      C*                  PARM      0             DEFFECTDATE       8 0          
116.00 160809      C*                  PARM      0             DEFFECTTIME       6 0          
117.00 160613       *******************Test case 1i*******************************************
118.00 160613       *  no cif, no group and ECHAN, doing C from MOP to USD, result should be: 
119.00 160809       *          0000124839269                                                  
120.00 160809 pass C*                  PARM      ''            PCIF             10            
121.00 160809      C*                  PARM      000           PCCYNUM           3 0          
122.00 160809      C*                  PARM      0             PFRAMT           13 2          
123.00 160809      C*                  PARM      840           PTOCCY            3 0          
124.00 160809      C*                  PARM      0             PTOAMT           13 2          
125.00 160809      C*                  PARM      'C'           PEXCHGTYP         1            
126.00 160809      C*                  PARM      ''            PFUNC             4            
127.00 160809      C*                  PARM      ''            PGROUP            6            
128.00 160809      C*                  PARM      'ECHAN '      PCHANNEL          6            
129.00 160809      C*                  PARM      0             DEFFECTDATE       8 0          
130.00 160809      C*                  PARM      0             DEFFECTTIME       6 0          
131.00 160613       *******************Test case 1j*******************************************
132.00 160613       *  no cif, no group and no channel, doing C from MOP to USD, result shd be
133.00 160613       *             00001248393                                                 
134.00 160809 pass C*                  PARM      ''            PCIF             10            
135.00 160809      C*                  PARM      000           PCCYNUM           3 0          
136.00 160809      C*                  PARM      0             PFRAMT           13 2          
137.00 160809      C*                  PARM      840           PTOCCY            3 0          
138.00 160809      C*                  PARM      0             PTOAMT           13 2          
139.00 160809      C*                  PARM      'C'           PEXCHGTYP         1            
140.00 160809      C*                  PARM      ''            PFUNC             4            
141.00 160809      C*                  PARM      ''            PGROUP            6            
142.00 160809      C*                  PARM      ''            PCHANNEL          6            
143.00 160809      C*                  PARM      0             DEFFECTDATE       8 0          
144.00 160809      C*                  PARM      0             DEFFECTTIME       6 0          
145.00 160613       *******************Test case 1k*******************************************
146.00 160809       *  a cif 0000125695, group RET and ECHAN doing C from MOP to USD, result  
147.00 160613       *  should be:   00001248003                                               
148.00 160809 pass C*                  PARM      '0000125695'  PCIF             10            
149.00 160809      C*                  PARM      000           PCCYNUM           3 0          
150.00 160809      C*                  PARM      0             PFRAMT           13 2          
151.00 160809      C*                  PARM      840           PTOCCY            3 0          
152.00 160809      C*                  PARM      0             PTOAMT           13 2          
153.00 160809      C*                  PARM      'C'           PEXCHGTYP         1            
154.00 160809      C*                  PARM      ''            PFUNC             4            
155.00 160809      C*                  PARM      'RET   '      PGROUP            6            
156.00 160809      C*                  PARM      'ECHAN '      PCHANNEL          6            
157.00 160809      C*                  PARM      0             DEFFECTDATE       8 0          
158.00 160809      C*                  PARM      0             DEFFECTTIME       6 0          
159.00 160809       *******************Test case 1L*******************************************
160.00 160809       *  no cif, group CORP and No Channel, doing C from MOP to USD, result shd 
161.00 160809       *           be: 00001248393                                               
162.00 160809 pass C*                  PARM      ''            PCIF             10            
163.00 160809      C*                  PARM      840           PCCYNUM           3 0          
164.00 160809      C*                  PARM      0             PFRAMT           13 2          
165.00 160809      C*                  PARM      000           PTOCCY            3 0          
166.00 160809      C*                  PARM      0             PTOAMT           13 2          
167.00 160809      C*                  PARM      'C'           PEXCHGTYP         1            
168.00 160809      C*                  PARM      ''            PFUNC             4            
169.00 160809      C*                  PARM      'CORP  '      PGROUP            6            
170.00 160809      C*                  PARM      'ECHAN '      PCHANNEL          6            
171.00 160809      C*                  PARM      0             DEFFECTDATE       8 0          
172.00 160809      C*                  PARM      0             DEFFECTTIME       6 0          
173.00 160906       *******************Test case 1M*******************************************
174.00 160906 bug   *  no cif, group CORP and No Channel, doing C from HKD to HKD, result shd 
175.00 160906       *           be: 00010000000                                               
176.00 160906      C*                  PARM      ''            PCIF             10            
177.00 160906      C*                  PARM      344           PCCYNUM           3 0          
178.00 160906      C*                  PARM      0             PFRAMT           13 2          
179.00 160906      C*                  PARM      344           PTOCCY            3 0          
180.00 160906      C*                  PARM      0             PTOAMT           13 2          
181.00 160906      C*                  PARM      'C'           PEXCHGTYP         1            
182.00 160906      C*                  PARM      ''            PFUNC             4            
183.00 160906      C*                  PARM      'CORP  '      PGROUP            6            
184.00 160906      C*                  PARM      'ECHAN '      PCHANNEL          6            
185.00 160906      C*                  PARM      0             DEFFECTDATE       8 0          
186.00 160906      C*                  PARM      0             DEFFECTTIME       6 0          
187.00 160906       *******************Test case 1N*******************************************
188.00 160906 bug   *  no cif, group CORP and No Channel, doing C from CAD to CAD, result shd 
189.00 160906       *           be: 00010000000                                               
190.00 160906      C*                  PARM      ''            PCIF             10            
191.00 160906      C*                  PARM      124           PCCYNUM           3 0          
192.00 160906      C*                  PARM      0             PFRAMT           13 2          
193.00 160906      C*                  PARM      124           PTOCCY            3 0          
194.00 160906      C*                  PARM      0             PTOAMT           13 2          
195.00 160906      C*                  PARM      'C'           PEXCHGTYP         1            
196.00 160906      C*                  PARM      ''            PFUNC             4            
197.00 160906      C*                  PARM      'CORP  '      PGROUP            6            
198.00 160906      C*                  PARM      'ECHAN '      PCHANNEL          6            
199.00 160906      C*                  PARM      0             DEFFECTDATE       8 0          
200.00 160906      C*                  PARM      0             DEFFECTTIME       6 0          
201.00 160608       *******************Output parameter***************************************
202.00 160608      C                   PARM                    PRATE            11 7          
203.00 160608      C                   PARM                    PFRCCYRATE       11 7          
204.00 160608      C                   PARM                    PFRDATE           8 0          
205.00 160608      C                   PARM                    PFRTIME           6 0          
206.00 160608      C                   PARM                    PTOCCYRATE       11 7          
207.00 160608      C                   PARM                    PTODATE           8 0          
208.00 160608      C                   PARM                    PTOTIME           6 0          
209.00 160608      C                   PARM                    PDSPCCYRATE      11 7          
210.00 160613      C                   PARM                    PIND1             1            
211.00 160613      C                   PARM                    PIND2             1            
212.00 160613      C                   PARM                    PIND3             1            
213.00 160608      C                   PARM                    PSTATUS           1            
214.00 160608      C     PRATE         DSPLY                                                  
215.00 160608      C     PFRCCYRATE    DSPLY                                                  
216.00 160608      C     PFRDATE       DSPLY                                                  
217.00 160608      C     PFRTIME       DSPLY                                                  
218.00 160608      C     PTOCCYRATE    DSPLY                                                  
219.00 160608      C     PTODATE       DSPLY                                                  
220.00 160608      C     PTOTIME       DSPLY                                                  
221.00 160608      C     PDSPCCYRATE   DSPLY                                                  
222.00 160613      C     PIND1         DSPLY                                                  
223.00 160613      C     PIND2         DSPLY                                                  
224.00 160613      C     PIND3         DSPLY                                                  
225.00 160608      C     PSTATUS       DSPLY                                                  
226.00 160606      C                   SETON                                        LR        
