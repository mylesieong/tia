1.00 160610 /*-----------------------------------------------------------------*/           
2.00 160921 /*        Program ID.   : BBTGPRTE                                 */           
3.00 160921 /*        Program Name  : Test CL of module GGRPRATECL             */           
4.00 160610 /*        Author        : Myles Ieong                              */           
5.00 160921 /*        Date written  : 2016-09-21                               */           
6.00 160927 /*                                                                 */           
7.00 160927 /*TEST CASE 1.A: Corp Success Cash Transaction wCIFwGrp          */             
8.00 160927 /*TEST CASE 1.B: NET Success Cash Transaction wCIFwGrp           */             
9.00 160927 /*TEST CASE 1.C: VIP Success Cash Transaction wCIFwGrp           */             
10.00 160927 /*TEST CASE 2.A: Corp Success Tele Transaction wCIFwGrp          */             
11.00 160927 /*TEST CASE 2.B: NET Success Tele Transaction wCIFwGrp           */             
12.00 160927 /*TEST CASE 2.C: VIP Success Tele Transaction wCIFwGrp           */             
13.00 160927 /*                                                               */             
14.00 160927 /*TEST CASE 3.A: Corp Success Cash Transaction wGrp Only         */             
15.00 160927 /*TEST CASE 3.B: NET Success Cash Transaction wGrp Only          */             
16.00 160927 /*TEST CASE 3.C: VIP Success Cash Transaction wGrp Only          */             
17.00 160927 /*TEST CASE 4.A: Corp Success Tele Transaction wGrp Only         */             
18.00 160927 /*TEST CASE 4.B: NET Success Tele Transaction wGrp Only          */             
19.00 160927 /*TEST CASE 4.C: VIP Success Tele Transaction wGrp Only          */             
20.00 160927 /*                                                               */             
21.00 160927 /*TEST CASE 5.A: Corp Success Cash Transaction wCIF Only         */             
22.00 160927 /*TEST CASE 5.B: NET Success Cash Transaction wCIF Only          */             
23.00 160927 /*TEST CASE 5.C: VIP Success Cash Transaction wCIF Only          */             
24.00 160927 /*TEST CASE 6.A: Corp Success Tele Transaction wCIF Only         */             
25.00 160927 /*TEST CASE 6.B: NET Success Tele Transaction wCIF Only          */             
26.00 160927 /*TEST CASE 6.C: VIP Success Tele Transaction wCIF Only          */             
27.00 160610 /*-----------------------------------------------------------------*/           
28.00 160902              PGM                                                                
29.00 160921                                                                                 
30.00 160921              /* Module parms-input */                                           
31.00 160921              DCL        VAR(&PCIF) TYPE(*CHAR) LEN(10)                          
32.00 160921              DCL        VAR(&PFRCCY) TYPE(*DEC) LEN(3 0)                        
33.00 160921              DCL        VAR(&PFRAMT) TYPE(*DEC) LEN(13 2)                       
34.00 160921              DCL        VAR(&PTOCCY) TYPE(*DEC) LEN(3 0)                        
35.00 160921              DCL        VAR(&PTOAMT) TYPE(*DEC) LEN(13 2)                       
36.00 160921              DCL        VAR(&PEXCHGTYP) TYPE(*CHAR) LEN(1)                      
37.00 160921              DCL        VAR(&PFUNC) TYPE(*CHAR) LEN(4)                          
38.00 160921              DCL        VAR(&PGROUP) TYPE(*CHAR) LEN(6)                         
39.00 160921              DCL        VAR(&PCHANNEL) TYPE(*CHAR) LEN(6)                       
40.00 160921              DCL        VAR(&PEXCHGDT) TYPE(*DEC) LEN(8 0)                      
41.00 160921              DCL        VAR(&PEXCHGTM) TYPE(*DEC) LEN(6 0)                      
42.00 160921                                                                                 
43.00 160921              /* Module parms-output */                                          
44.00 160921              DCL        VAR(&PRATE) TYPE(*DEC) LEN(11 7)                        
45.00 160921              DCL        VAR(&PFRCCYRATE) TYPE(*DEC) LEN(11 7)                   
46.00 160921              DCL        VAR(&PFRDATE) TYPE(*DEC) LEN(8 0)                       
47.00 160921              DCL        VAR(&PFRTIME) TYPE(*DEC) LEN(6 0)                       
48.00 160921              DCL        VAR(&PTOCCYRATE) TYPE(*DEC) LEN(11 7)                   
49.00 160921              DCL        VAR(&PTODATE) TYPE(*DEC) LEN(8 0)                       
50.00 160921              DCL        VAR(&PTOTIME) TYPE(*DEC) LEN(6 0)                       
51.00 160921              DCL        VAR(&PDSPCCYRT) TYPE(*DEC) LEN(11 7)                    
52.00 160921              DCL        VAR(&PIND1) TYPE(*CHAR) LEN(1)                          
53.00 160921              DCL        VAR(&PIND2) TYPE(*CHAR) LEN(1)                          
54.00 160921              DCL        VAR(&PIND3) TYPE(*CHAR) LEN(1)                          
55.00 160921              DCL        VAR(&PSTATUS) TYPE(*CHAR) LEN(1)                        
56.00 160921                                                                                 
57.00 160921              DCL        VAR(&TC) TYPE(*CHAR) LEN(10)                            
58.00 160921                                                                                 
59.00 160926              /*TEST CASE 1.A: Corp Success Cash Transaction */                  
60.00 160926              /* 34630xCORP  +  MOP2USD  +  USDR:7.9888  +  USDTNSS:0.018  */    
61.00 160926              /* Rate= 1-MOPTNBS/ 7.9888+0.018 = 0.12489384  */                  
62.00 160926              CHGVAR     VAR(&PCIF)      VALUE('0000034630')                     
63.00 160926              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
64.00 160926              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
65.00 160926              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
66.00 160926              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
67.00 160926              CHGVAR     VAR(&PEXCHGTYP) VALUE('C')                              
68.00 160926              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
69.00 160926              CHGVAR     VAR(&PGROUP)    VALUE('CORP  ')                         
70.00 160926              CHGVAR     VAR(&PCHANNEL)  VALUE('ECHAN ')                         
71.00 160926              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
72.00 160926              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
73.00 160926              CHGVAR     VAR(&TC) VALUE('FAILED')                                
74.00 160926              CALL  PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT &PTOCCY &PTOAMT + 
75.00 160926                    &PEXCHGTYP &PFUNC &PGROUP  &PCHANNEL &PEXCHGDT &PEXCHGTM   + 
76.00 160926                    &PRATE &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE &PTODATE  + 
77.00 160926                    &PTOTIME &PDSPCCYRT &PIND1 &PIND2 &PIND3 &PSTATUS)           
78.00 160926              IF         COND((&PRATE *EQ 0.1248938) &          +                
79.00 160926                              (&PSTATUS *EQ '0'))                 +              
80.00 160926                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
81.00 160926              SNDUSRMSG  MSG('TEST CASE 1A: ' || &TC)                            
82.00 160926                                                                                 
83.00 160926              /*TEST CASE 1.B: NET Success Cash Transaction  */                  
84.00 160926              /* 62138xNET   +  MOP2USD  +  USDR:7.9888  +  USDTNSS:0.022  */    
85.00 160926              /* Rate= 1-MOPTNBS/ 7.9888+0.022 = 0.12483147  */                  
86.00 160926              CHGVAR     VAR(&PCIF)      VALUE('0000062138')                     
87.00 160926              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
88.00 160926              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
89.00 160926              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
90.00 160926              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
91.00 160926              CHGVAR     VAR(&PEXCHGTYP) VALUE('C')                              
92.00 160926              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
93.00 160926              CHGVAR     VAR(&PGROUP)    VALUE('NET   ')                         
94.00 160926              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
95.00 160926              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
96.00 160926              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
97.00 160926              CHGVAR     VAR(&TC) VALUE('FAILED')                                
98.00 160926              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
99.00 160926                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
100.00 160926                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
101.00 160926                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
102.00 160926                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
103.00 160926                           &PIND2 &PIND3 &PSTATUS)                               
104.00 160926              IF         COND((&PRATE *EQ 0.1248314) &          +                
105.00 160926                              (&PSTATUS *EQ '0'))                 +              
106.00 160926                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
107.00 160926              SNDUSRMSG  MSG('TEST CASE 1B: ' || &TC)                            
108.00 160926                                                                                 
109.00 160926              /*TEST CASE 1.C: VIP Success Cash Transaction */                   
110.00 160926              /*308633xVIP   +  MOP2USD  +  USDR:7.9888  +  USDTNSS:0.020  */    
111.00 160926              /* Rate= 1-MOPTNBS/ 7.9888+0.020 = 0.12486265  */                  
112.00 160926              CHGVAR     VAR(&PCIF)      VALUE('0000308633')                     
113.00 160926              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
114.00 160926              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
115.00 160926              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
116.00 160926              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
117.00 160926              CHGVAR     VAR(&PEXCHGTYP) VALUE('C')                              
118.00 160926              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
119.00 160926              CHGVAR     VAR(&PGROUP)    VALUE('VIP   ')                         
120.00 160926              CHGVAR     VAR(&PCHANNEL)  VALUE('ECHAN ')                         
121.00 160926              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
122.00 160926              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
123.00 160926              CHGVAR     VAR(&TC) VALUE('FAILED')                                
124.00 160926              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
125.00 160926                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
126.00 160926                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
127.00 160926                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
128.00 160926                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
129.00 160926                           &PIND2 &PIND3 &PSTATUS)                               
130.00 160926              IF         COND((&PRATE *EQ 0.1248626) &          +                
131.00 160926                              (&PSTATUS *EQ '0'))                 +              
132.00 160926                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
133.00 160926              SNDUSRMSG  MSG('TEST CASE 1C: ' || &TC)                            
134.00 160926                                                                                 
135.00 160926              /*TEST CASE 2.A: Corp Success Tele Transaction */                  
136.00 160926              /* 34630xCORP  +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.017  */    
137.00 160926              /* Rate= 1-MOPTNBS/ 7.9888+0.017 = 0.12490944  */                  
138.00 160926              CHGVAR     VAR(&PCIF)      VALUE('0000034630')                     
139.00 160926              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
140.00 160926              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
141.00 160926              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
142.00 160926              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
143.00 160926              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
144.00 160926              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
145.00 160926              CHGVAR     VAR(&PGROUP)    VALUE('CORP  ')                         
146.00 160926              CHGVAR     VAR(&PCHANNEL)  VALUE('ECHAN ')                         
147.00 160926              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
148.00 160926              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
149.00 160926              CHGVAR     VAR(&TC) VALUE('FAILED')                                
150.00 160926              CALL  PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT &PTOCCY &PTOAMT + 
151.00 160926                    &PEXCHGTYP &PFUNC &PGROUP  &PCHANNEL &PEXCHGDT &PEXCHGTM   + 
152.00 160926                    &PRATE &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE &PTODATE  + 
153.00 160926                    &PTOTIME &PDSPCCYRT &PIND1 &PIND2 &PIND3 &PSTATUS)           
154.00 160926              IF         COND((&PRATE *EQ 0.1249094) &          +                
155.00 160926                              (&PSTATUS *EQ '0'))                 +              
156.00 160926                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
157.00 160927              SNDUSRMSG  MSG('TEST CASE 2A: ' || &TC)                            
158.00 160926                                                                                 
159.00 160926              /*TEST CASE 2.B: NET Success Tele Transaction  */                  
160.00 160926              /* 62138xNET   +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.019  */    
161.00 160926              /* Rate= 1-MOPTNBS/ 7.9888+0.019 = 0.12487824  */                  
162.00 160926              CHGVAR     VAR(&PCIF)      VALUE('0000062138')                     
163.00 160926              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
164.00 160926              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
165.00 160926              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
166.00 160926              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
167.00 160926              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
168.00 160926              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
169.00 160926              CHGVAR     VAR(&PGROUP)    VALUE('NET   ')                         
170.00 160926              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
171.00 160926              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
172.00 160926              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
173.00 160926              CHGVAR     VAR(&TC) VALUE('FAILED')                                
174.00 160926              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
175.00 160926                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
176.00 160926                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
177.00 160926                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
178.00 160926                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
179.00 160926                           &PIND2 &PIND3 &PSTATUS)                               
180.00 160926              IF         COND((&PRATE *EQ 0.1248782) &          +                
181.00 160926                              (&PSTATUS *EQ '0'))                 +              
182.00 160926                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
183.00 160927              SNDUSRMSG  MSG('TEST CASE 2B: ' || &TC)                            
184.00 160926                                                                                 
185.00 160926              /*TEST CASE 2.C: VIP Success Tele Transaction */                   
186.00 160926              /*308633xVIP   +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.018  */    
187.00 160926              /* Rate= 1-MOPTNBS/ 7.9888+0.018 = 0.12489384  */                  
188.00 160926              CHGVAR     VAR(&PCIF)      VALUE('0000308633')                     
189.00 160926              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
190.00 160926              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
191.00 160926              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
192.00 160926              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
193.00 160926              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
194.00 160926              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
195.00 160926              CHGVAR     VAR(&PGROUP)    VALUE('VIP   ')                         
196.00 160926              CHGVAR     VAR(&PCHANNEL)  VALUE('ECHAN ')                         
197.00 160926              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
198.00 160926              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
199.00 160926              CHGVAR     VAR(&TC) VALUE('FAILED')                                
200.00 160926              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
201.00 160926                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
202.00 160926                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
203.00 160926                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
204.00 160926                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
205.00 160926                           &PIND2 &PIND3 &PSTATUS)                               
206.00 160926              IF         COND((&PRATE *EQ 0.1248938) &          +                
207.00 160926                              (&PSTATUS *EQ '0'))                 +              
208.00 160926                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
209.00 160927              SNDUSRMSG  MSG('TEST CASE 2C: ' || &TC)                            
210.00 160926                                                                                 
211.00 160927              /*TEST CASE 3.A: Corp Success Cash Transaction wGrp only */        
212.00 160927              /* 34630xCORP  +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.017  */    
213.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.017 = 0.12490944  */                  
214.00 160927              CHGVAR     VAR(&PCIF)      VALUE('          ')                     
215.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
216.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
217.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
218.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
219.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
220.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
221.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('CORP  ')                         
222.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('ECHAN ')                         
223.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
224.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
225.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
226.00 160927              CALL  PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT &PTOCCY &PTOAMT + 
227.00 160927                    &PEXCHGTYP &PFUNC &PGROUP  &PCHANNEL &PEXCHGDT &PEXCHGTM   + 
228.00 160927                    &PRATE &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE &PTODATE  + 
229.00 160927                    &PTOTIME &PDSPCCYRT &PIND1 &PIND2 &PIND3 &PSTATUS)           
230.00 160927              IF         COND((&PRATE *EQ 0.1249094) &          +                
231.00 160927                              (&PSTATUS *EQ '0'))                 +              
232.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
233.00 160927              SNDUSRMSG  MSG('TEST CASE 3A: ' || &TC)                            
234.00 160927                                                                                 
235.00 160927              /*TEST CASE 3.B: NET Success Tele Transaction wGrp only */         
236.00 160927              /* 62138xNET   +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.019  */    
237.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.019 = 0.12487824  */                  
238.00 160927              CHGVAR     VAR(&PCIF)      VALUE('          ')                     
239.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
240.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
241.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
242.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
243.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
244.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
245.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('NET   ')                         
246.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
247.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
248.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
249.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
250.00 160927              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
251.00 160927                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
252.00 160927                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
253.00 160927                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
254.00 160927                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
255.00 160927                           &PIND2 &PIND3 &PSTATUS)                               
256.00 160927              IF         COND((&PRATE *EQ 0.1248782) &          +                
257.00 160927                              (&PSTATUS *EQ '0'))                 +              
258.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
259.00 160927              SNDUSRMSG  MSG('TEST CASE 3B: ' || &TC)                            
260.00 160927                                                                                 
261.00 160927              /*TEST CASE 3.C: VIP Success Tele Transaction wGrp only */         
262.00 160927              /*308633xVIP   +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.018  */    
263.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.018 = 0.12489384  */                  
264.00 160927              CHGVAR     VAR(&PCIF)      VALUE('          ')                     
265.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
266.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
267.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
268.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
269.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
270.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
271.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('VIP   ')                         
272.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('ECHAN ')                         
273.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
274.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
275.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
276.00 160927              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
277.00 160927                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
278.00 160927                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
279.00 160927                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
280.00 160927                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
281.00 160927                           &PIND2 &PIND3 &PSTATUS)                               
282.00 160927              IF         COND((&PRATE *EQ 0.1248938) &          +                
283.00 160927                              (&PSTATUS *EQ '0'))                 +              
284.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
285.00 160927              SNDUSRMSG  MSG('TEST CASE 3C: ' || &TC)                            
286.00 160927                                                                                 
287.00 160927              /*TEST CASE 4.A: Corp Success Tele Transaction wGrp only */        
288.00 160927              /* 34630xCORP  +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.017  */    
289.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.017 = 0.12490944  */                  
290.00 160927              CHGVAR     VAR(&PCIF)      VALUE('          ')                     
291.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
292.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
293.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
294.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
295.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
296.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
297.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('CORP  ')                         
298.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('ECHAN ')                         
299.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
300.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
301.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
302.00 160927              CALL  PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT &PTOCCY &PTOAMT + 
303.00 160927                    &PEXCHGTYP &PFUNC &PGROUP  &PCHANNEL &PEXCHGDT &PEXCHGTM   + 
304.00 160927                    &PRATE &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE &PTODATE  + 
305.00 160927                    &PTOTIME &PDSPCCYRT &PIND1 &PIND2 &PIND3 &PSTATUS)           
306.00 160927              IF         COND((&PRATE *EQ 0.1249094) &          +                
307.00 160927                              (&PSTATUS *EQ '0'))                 +              
308.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
309.00 160927              SNDUSRMSG  MSG('TEST CASE 4A: ' || &TC)                            
310.00 160927                                                                                 
311.00 160927              /*TEST CASE 4.B: NET Success Tele Transaction w Grp only */        
312.00 160927              /* 62138xNET   +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.019  */    
313.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.019 = 0.12487824  */                  
314.00 160927              CHGVAR     VAR(&PCIF)      VALUE('          ')                     
315.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
316.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
317.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
318.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
319.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
320.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
321.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('NET   ')                         
322.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
323.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
324.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
325.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
326.00 160927              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
327.00 160927                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
328.00 160927                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
329.00 160927                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
330.00 160927                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
331.00 160927                           &PIND2 &PIND3 &PSTATUS)                               
332.00 160927              IF         COND((&PRATE *EQ 0.1248782) &          +                
333.00 160927                              (&PSTATUS *EQ '0'))                 +              
334.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
335.00 160927              SNDUSRMSG  MSG('TEST CASE 4B: ' || &TC)                            
336.00 160927                                                                                 
337.00 160927              /*TEST CASE 4.C: VIP Success Tele Transaction wGrp only */         
338.00 160927              /*308633xVIP   +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.018  */    
339.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.018 = 0.12489384  */                  
340.00 160927              CHGVAR     VAR(&PCIF)      VALUE('          ')                     
341.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
342.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
343.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
344.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
345.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
346.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
347.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('VIP   ')                         
348.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('ECHAN ')                         
349.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
350.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
351.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
352.00 160927              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
353.00 160927                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
354.00 160927                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
355.00 160927                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
356.00 160927                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
357.00 160927                           &PIND2 &PIND3 &PSTATUS)                               
358.00 160927              IF         COND((&PRATE *EQ 0.1248938) &          +                
359.00 160927                              (&PSTATUS *EQ '0'))                 +              
360.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
361.00 160927              SNDUSRMSG  MSG('TEST CASE 4C: ' || &TC)                            
362.00 160926                                                                                 
363.00 160927              /*TEST CASE 5.A: Corp Success Cash Transaction wCIF only */        
364.00 160927              /* 34630xCORP  +  MOP2USD  +  USDR:7.9888  +  USDTNSS:0.018  */    
365.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.018 = 0.12489384  */                  
366.00 160927              CHGVAR     VAR(&PCIF)      VALUE('0000034630')                     
367.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
368.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
369.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
370.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
371.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('C')                              
372.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
373.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('      ')                         
374.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
375.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
376.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
377.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
378.00 160927              CALL  PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT &PTOCCY &PTOAMT + 
379.00 160927                    &PEXCHGTYP &PFUNC &PGROUP  &PCHANNEL &PEXCHGDT &PEXCHGTM   + 
380.00 160927                    &PRATE &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE &PTODATE  + 
381.00 160927                    &PTOTIME &PDSPCCYRT &PIND1 &PIND2 &PIND3 &PSTATUS)           
382.00 160927              IF         COND((&PRATE *EQ 0.1248938) &          +                
383.00 160927                              (&PSTATUS *EQ '0'))                 +              
384.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
385.00 160927              SNDUSRMSG  MSG('TEST CASE 5A: ' || &TC)                            
386.00 160927                                                                                 
387.00 160927              /*TEST CASE 5.B: NET Success Cash Transaction wCIF only */         
388.00 160927              /* 62138xNET   +  MOP2USD  +  USDR:7.9888  +  USDTNSS:0.022  */    
389.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.022 = 0.12483147  */                  
390.00 160927              CHGVAR     VAR(&PCIF)      VALUE('0000062138')                     
391.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
392.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
393.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
394.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
395.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('C')                              
396.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
397.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('      ')                         
398.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
399.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
400.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
401.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
402.00 160927              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
403.00 160927                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
404.00 160927                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
405.00 160927                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
406.00 160927                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
407.00 160927                           &PIND2 &PIND3 &PSTATUS)                               
408.00 160927              IF         COND((&PRATE *EQ 0.1248314) &          +                
409.00 160927                              (&PSTATUS *EQ '0'))                 +              
410.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
411.00 160927              SNDUSRMSG  MSG('TEST CASE 5B: ' || &TC)                            
412.00 160927                                                                                 
413.00 160927              /*TEST CASE 5.C: VIP Success Cash Transaction wCif only */         
414.00 160927              /*308633xVIP   +  MOP2USD  +  USDR:7.9888  +  USDTNSS:0.020  */    
415.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.020 = 0.12486265  */                  
416.00 160927              CHGVAR     VAR(&PCIF)      VALUE('0000308633')                     
417.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
418.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
419.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
420.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
421.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('C')                              
422.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
423.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('      ')                         
424.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
425.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
426.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
427.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
428.00 160927              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
429.00 160927                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
430.00 160927                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
431.00 160927                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
432.00 160927                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
433.00 160927                           &PIND2 &PIND3 &PSTATUS)                               
434.00 160927              IF         COND((&PRATE *EQ 0.1248626) &          +                
435.00 160927                              (&PSTATUS *EQ '0'))                 +              
436.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
437.00 160927              SNDUSRMSG  MSG('TEST CASE 5C: ' || &TC)                            
438.00 160927                                                                                 
439.00 160927              /*TEST CASE 6.A: Corp Success Tele Transaction wCIF */             
440.00 160927              /* 34630xCORP  +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.017  */    
441.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.017 = 0.12490944  */                  
442.00 160927              CHGVAR     VAR(&PCIF)      VALUE('0000034630')                     
443.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
444.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
445.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
446.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
447.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
448.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
449.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('      ')                         
450.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
451.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
452.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
453.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
454.00 160927              CALL  PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT &PTOCCY &PTOAMT + 
455.00 160927                    &PEXCHGTYP &PFUNC &PGROUP  &PCHANNEL &PEXCHGDT &PEXCHGTM   + 
456.00 160927                    &PRATE &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE &PTODATE  + 
457.00 160927                    &PTOTIME &PDSPCCYRT &PIND1 &PIND2 &PIND3 &PSTATUS)           
458.00 160927              IF         COND((&PRATE *EQ 0.1249094) &          +                
459.00 160927                              (&PSTATUS *EQ '0'))                 +              
460.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
461.00 160927              SNDUSRMSG  MSG('TEST CASE 6A: ' || &TC)                            
462.00 160927                                                                                 
463.00 160927              /*TEST CASE 6.B: NET Success Tele Transaction wCIF only */         
464.00 160927              /* 62138xNET   +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.019  */    
465.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.019 = 0.12487824  */                  
466.00 160927              CHGVAR     VAR(&PCIF)      VALUE('0000062138')                     
467.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
468.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
469.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
470.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
471.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
472.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
473.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('      ')                         
474.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
475.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
476.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
477.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
478.00 160927              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
479.00 160927                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
480.00 160927                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
481.00 160927                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
482.00 160927                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
483.00 160927                           &PIND2 &PIND3 &PSTATUS)                               
484.00 160927              IF         COND((&PRATE *EQ 0.1248782) &          +                
485.00 160927                              (&PSTATUS *EQ '0'))                 +              
486.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
487.00 160927              SNDUSRMSG  MSG('TEST CASE 6B: ' || &TC)                            
488.00 160927                                                                                 
489.00 160927              /*TEST CASE 6.C: VIP Success Tele Transaction wCIF only */         
490.00 160927              /*308633xVIP   +  MOP2USD  +  USDR:7.9888  +  USDATSS:0.018  */    
491.00 160927              /* Rate= 1-MOPTNBS/ 7.9888+0.018 = 0.12489384  */                  
492.00 160927              CHGVAR     VAR(&PCIF)      VALUE('0000308633')                     
493.00 160927              CHGVAR     VAR(&PFRCCY)    VALUE(000)                              
494.00 160927              CHGVAR     VAR(&PFRAMT)    VALUE(0)                                
495.00 160927              CHGVAR     VAR(&PTOCCY)    VALUE(840)                              
496.00 160927              CHGVAR     VAR(&PTOAMT)    VALUE(0)                                
497.00 160927              CHGVAR     VAR(&PEXCHGTYP) VALUE('T')                              
498.00 160927              CHGVAR     VAR(&PFUNC)     VALUE('    ')                           
499.00 160927              CHGVAR     VAR(&PGROUP)    VALUE('      ')                         
500.00 160927              CHGVAR     VAR(&PCHANNEL)  VALUE('      ')                         
501.00 160927              CHGVAR     VAR(&PEXCHGDT)  VALUE(0)                                
502.00 160927              CHGVAR     VAR(&PEXCHGTM)  VALUE(0)                                
503.00 160927              CHGVAR     VAR(&TC) VALUE('FAILED')                                
504.00 160927              CALL       PGM(GGRPRATECL) PARM(&PCIF &PFRCCY &PFRAMT +            
505.00 160927                           &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC &PGROUP +           
506.00 160927                           &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE +                
507.00 160927                           &PFRCCYRATE &PFRDATE &PFRTIME &PTOCCYRATE +           
508.00 160927                           &PTODATE &PTOTIME &PDSPCCYRT &PIND1 +                 
509.00 160927                           &PIND2 &PIND3 &PSTATUS)                               
510.00 160927              IF         COND((&PRATE *EQ 0.1248938) &          +                
511.00 160927                              (&PSTATUS *EQ '0'))                 +              
512.00 160927                           THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                
513.00 160927              SNDUSRMSG  MSG('TEST CASE 6C: ' || &TC)                            
514.00 160926                                                                                 
515.00 160610              ENDPGM                                                             
516.00 160610                                                                                 
