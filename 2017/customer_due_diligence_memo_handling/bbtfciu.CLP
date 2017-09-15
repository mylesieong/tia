1.00 100805 /************************************************************************/      
2.00 161209 /* PROGRAM ID   : BBTFCIU                                               */      
3.00 160727 /* REFERENCE    : CHG-xxx-16 (D6xxx)                                    */      
4.00 160727 /* AUTHOR       : Myles Ieong                                           */      
5.00 160727 /* Written Date : BI77PGM                                               */      
6.00 161209 /* DESCRIPTION  : Unit test for FCIUMEMO                                */      
7.00 100805 /************************************************************************/      
8.00 161020              PGM                                                                
9.00 160727                                                                                 
10.00 161209              DCL        VAR(&PPGMNAM) TYPE(*CHAR) LEN(6) VALUE('      ')        
11.00 161209              DCL        VAR(&PTLTSWT) TYPE(*CHAR) LEN(2) VALUE('  ')            
12.00 161209              DCL        VAR(&PTLTNBR) TYPE(*DEC ) LEN(4 0) VALUE(0)             
13.00 161209              DCL        VAR(&PTLTBRN) TYPE(*DEC ) LEN(5 0) VALUE(0)             
14.00 161209              DCL        VAR(&PTLTRCR) TYPE(*CHAR) LEN(1) VALUE(' ')             
15.00 161209              DCL        VAR(&PFRAPP ) TYPE(*CHAR) LEN(2) VALUE('  ')            
16.00 161209              DCL        VAR(&PTOAPP ) TYPE(*CHAR) LEN(2) VALUE('  ')            
17.00 161209              DCL        VAR(&PTLTCOR) TYPE(*CHAR) LEN(1) VALUE(' ')             
18.00 161209              DCL        VAR(&PDMAMFG) TYPE(*DEC ) LEN(1 0) VALUE(0)             
19.00 161209              DCL        VAR(&PTYP   ) TYPE(*DEC ) LEN(1 0) VALUE(0)             
20.00 161212              DCL        VAR(&PACCT  ) TYPE(*DEC ) LEN(12 0) VALUE(0)            
21.00 161209              DCL        VAR(&PREJCOD) TYPE(*CHAR) LEN(3) VALUE('   ')           
22.00 161209              DCL        VAR(&PINQREJ) TYPE(*DEC ) LEN(1 0) VALUE(0)             
23.00 161209              DCL        VAR(&PERRIND) TYPE(*CHAR) LEN(1) VALUE(' ')             
24.00 161209                                                                                 
25.00 170110              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('i700bcm')       
26.00 161209              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1) VALUE('Y')           
27.00 160727                                                                                 
28.00 161025 /*dbg var*/  DCL        VAR(&TC) TYPE(*CHAR) LEN(10)                            
29.00 161025                                                                                 
30.00 161209              ADDLIBLE   LIB(&WRKLIB)                                            
31.00 161209              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))  
32.00 160727                                                                                 
33.00 170110  /*[test section0: free style testing]*/                                        
34.00 170109              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
35.00 161212              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
36.00 161212              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
37.00 161212              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
38.00 161212              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
39.00 161212              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
40.00 170109              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
41.00 161212              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
42.00 161212              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
43.00 170214              CHGVAR     VAR(&PTYP   ) VALUE(6)                                  
44.00 170214              CHGVAR     VAR(&PACCT  ) VALUE(3374140)                            
45.00 161025              CHGVAR     VAR(&TC) VALUE('FAILED')                                
46.00 170109              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
47.00 170109                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
48.00 170109                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
49.00 170109                             &PERRIND  )                                         
50.00 170109              IF         COND(&PREJCOD *EQ '434') +                              
51.00 161025                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
52.00 170214              SNDUSRMSG  MSG('Free Test :  ' || &TC || ' Code:' || &PREJCOD)     
53.00 161025                                                                                 
54.00 170110  /*[test section1: acc memo & cif memo -> 434]*/                                
55.00 170109              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
56.00 170109              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
57.00 170109              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
58.00 170109              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
59.00 170109              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
60.00 170109              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
61.00 170109              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
62.00 170109              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
63.00 170109              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
64.00 170109              CHGVAR     VAR(&PTYP   ) VALUE(1)                                  
65.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(1055549221)                         
66.00 170109              CHGVAR     VAR(&TC) VALUE('FAILED')                                
67.00 170109              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
68.00 170109                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
69.00 170109                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
70.00 170109                             &PERRIND  )                                         
71.00 170110              IF         COND(&PREJCOD *EQ '434') +                              
72.00 170109                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
73.00 170110              SNDUSRMSG  MSG('TEST CASE 1A: ' || &TC || ' Code:' || &PREJCOD)    
74.00 170109                                                                                 
75.00 170110  /*[test section2: acc memo reviewed & cif memo -> 433]*/                       
76.00 170110              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
77.00 170110              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
78.00 170110              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
79.00 170110              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
80.00 170110              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
81.00 170110              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
82.00 170110              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
83.00 170110              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
84.00 170110              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
85.00 170110              CHGVAR     VAR(&PTYP   ) VALUE(6)                                  
86.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(3394981)                            
87.00 170110              CHGVAR     VAR(&TC) VALUE('FAILED')                                
88.00 170110              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
89.00 170110                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
90.00 170110                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
91.00 170110                             &PERRIND  )                                         
92.00 170110              IF         COND(&PREJCOD *EQ '433') +                              
93.00 170110                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
94.00 170110              SNDUSRMSG  MSG('TEST CASE 2A: ' || &TC || ' Code:' || &PREJCOD)    
95.00 170110                                                                                 
96.00 170110  /*[test section3: only cif memo -> 433]*/                                      
97.00 170110              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
98.00 170110              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
99.00 170110              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
100.00 170110              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
101.00 170110              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
102.00 170110              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
103.00 170110              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
104.00 170110              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
105.00 170110              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
106.00 170110              CHGVAR     VAR(&PTYP   ) VALUE(1)                                  
107.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(1522432)                            
108.00 170110              CHGVAR     VAR(&TC) VALUE('FAILED')                                
109.00 170110              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
110.00 170110                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
111.00 170110                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
112.00 170110                             &PERRIND  )                                         
113.00 170110              IF         COND(&PREJCOD *EQ '433') +                              
114.00 170110                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
115.00 170110              SNDUSRMSG  MSG('TEST CASE 3A: ' || &TC || ' Code:' || &PREJCOD)    
116.00 170110                                                                                 
117.00 170110  /*[test section4: acc memo & cif memo reviewed (or not dangerous) -> 432]*/    
118.00 170110              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
119.00 170110              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
120.00 170110              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
121.00 170110              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
122.00 170110              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
123.00 170110              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
124.00 170110              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
125.00 170110              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
126.00 170110              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
127.00 170110              CHGVAR     VAR(&PTYP   ) VALUE(1)                                  
128.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(3380549)                            
129.00 170110              CHGVAR     VAR(&TC) VALUE('FAILED')                                
130.00 170110              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
131.00 170110                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
132.00 170110                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
133.00 170110                             &PERRIND  )                                         
134.00 170110              IF         COND(&PREJCOD *EQ '432') +                              
135.00 170110                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
136.00 170110              SNDUSRMSG  MSG('TEST CASE 4A: ' || &TC || ' Code:' || &PREJCOD)    
137.00 170110                                                                                 
138.00 170110  /*[test section5: only acc memo -> 432]*/                                      
139.00 170110              CHGVAR     VAR(&PPGMNAM) VALUE('PS3008')                           
140.00 170110              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
141.00 170110              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
142.00 170110              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
143.00 170110              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
144.00 170110              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
145.00 170110              CHGVAR     VAR(&PTOAPP ) VALUE('30')                               
146.00 170110              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
147.00 170110              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
148.00 170110              CHGVAR     VAR(&PTYP   ) VALUE(0)                                  
149.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(3382245)                            
150.00 170110              CHGVAR     VAR(&TC) VALUE('FAILED')                                
151.00 170110              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
152.00 170110                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
153.00 170110                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
154.00 170110                             &PERRIND  )                                         
155.00 170110              IF         COND(&PREJCOD *EQ '432') +                              
156.00 170110                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
157.00 170110              SNDUSRMSG  MSG('TEST CASE 5A: ' || &TC || ' Code:' || &PREJCOD)    
158.00 170110                                                                                 
159.00 170110  /*[test section6a: acc memo reviewed & cif memo not dangerous -> 0}*/          
160.00 170110              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
161.00 170110              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
162.00 170110              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
163.00 170110              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
164.00 170110              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
165.00 170110              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
166.00 170110              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
167.00 170110              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
168.00 170110              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
169.00 170110              CHGVAR     VAR(&PTYP   ) VALUE(6)                                  
170.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(3394966)                            
171.00 170110              CHGVAR     VAR(&TC) VALUE('FAILED')                                
172.00 170110              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
173.00 170110                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
174.00 170110                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
175.00 170110                             &PERRIND  )                                         
176.00 170110              IF         COND(&PREJCOD *EQ '   ') +                              
177.00 170110                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
178.00 170110              SNDUSRMSG  MSG('TEST CASE 6A: ' || &TC || ' Code:' || &PREJCOD)    
179.00 170110                                                                                 
180.00 170110  /*[test section6b: acc memo reviewed & cif memo dangerous but reviewed-> 0}*/  
181.00 170110              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
182.00 170110              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
183.00 170110              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
184.00 170110              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
185.00 170110              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
186.00 170110              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
187.00 170110              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
188.00 170110              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
189.00 170110              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
190.00 170110              CHGVAR     VAR(&PTYP   ) VALUE(6)                                  
191.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(3394979)                            
192.00 170110              CHGVAR     VAR(&TC) VALUE('FAILED')                                
193.00 170110              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
194.00 170110                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
195.00 170110                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
196.00 170110                             &PERRIND  )                                         
197.00 170110              IF         COND(&PREJCOD *EQ '   ') +                              
198.00 170110                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
199.00 170110              SNDUSRMSG  MSG('TEST CASE 6B: ' || &TC || ' Code:' || &PREJCOD)    
200.00 170110                                                                                 
201.00 170110  /*[test section7: only acc memo reviewed-> 0]*/                                
202.00 170110              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
203.00 170110              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
204.00 170110              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
205.00 170110              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
206.00 170110              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
207.00 170110              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
208.00 170110              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
209.00 170110              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
210.00 170110              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
211.00 170110              CHGVAR     VAR(&PTYP   ) VALUE(6)                                  
212.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(3395008)                            
213.00 170110              CHGVAR     VAR(&TC) VALUE('FAILED')                                
214.00 170110              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
215.00 170110                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
216.00 170110                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
217.00 170110                             &PERRIND  )                                         
218.00 170110              IF         COND(&PREJCOD *EQ '   ') +                              
219.00 170110                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
220.00 170110              SNDUSRMSG  MSG('TEST CASE 7A: ' || &TC || ' Code:' || &PREJCOD)    
221.00 170110                                                                                 
222.00 170110  /*[test section8: only cif memo reviewed (or not dangerous) -> 0]*/            
223.00 170110              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
224.00 170110              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
225.00 170110              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
226.00 170110              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
227.00 170110              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
228.00 170110              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
229.00 170110              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
230.00 170110              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
231.00 170110              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
232.00 170110              CHGVAR     VAR(&PTYP   ) VALUE(6)                                  
233.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(2529898)                            
234.00 170110              CHGVAR     VAR(&TC) VALUE('FAILED')                                
235.00 170110              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
236.00 170110                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
237.00 170110                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
238.00 170110                             &PERRIND  )                                         
239.00 170110              IF         COND(&PREJCOD *EQ '   ') +                              
240.00 170110                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
241.00 170110              SNDUSRMSG  MSG('TEST CASE 8A: ' || &TC || ' Code:' || &PREJCOD)    
242.00 170110                                                                                 
243.00 170110  /*[test section9: no memo -> 0]*/                                              
244.00 170110              CHGVAR     VAR(&PPGMNAM) VALUE('PS1002')                           
245.00 170110              CHGVAR     VAR(&PTLTSWT) VALUE('WT')                               
246.00 170110              CHGVAR     VAR(&PTLTNBR) VALUE(0)                                  
247.00 170110              CHGVAR     VAR(&PTLTBRN) VALUE(0)                                  
248.00 170110              CHGVAR     VAR(&PTLTRCR) VALUE(' ')                                
249.00 170110              CHGVAR     VAR(&PFRAPP ) VALUE('40')                               
250.00 170110              CHGVAR     VAR(&PTOAPP ) VALUE('20')                               
251.00 170110              CHGVAR     VAR(&PTLTCOR) VALUE(' ')                                
252.00 170110              CHGVAR     VAR(&PDMAMFG) VALUE(0)                                  
253.00 170110              CHGVAR     VAR(&PTYP   ) VALUE(6)                                  
254.00 170110              CHGVAR     VAR(&PACCT  ) VALUE(3394954)                            
255.00 170110              CHGVAR     VAR(&TC) VALUE('FAILED')                                
256.00 170110              CALL       PGM(FCIUMEMO) PARM(&PPGMNAM &PTLTSWT &PTLTNBR  +        
257.00 170110                             &PTLTBRN &PTLTRCR &PFRAPP &PTOAPP &PTLTCOR  +       
258.00 170110                             &PDMAMFG &PTYP &PACCT &PREJCOD &PINQREJ  +          
259.00 170110                             &PERRIND  )                                         
260.00 170110              IF         COND(&PREJCOD *EQ '   ') +                              
261.00 170110                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
262.00 170110              SNDUSRMSG  MSG('TEST CASE 9A: ' || &TC || ' Code:' || &PREJCOD)    
263.00 170110                                                                                 
264.00 170110                                                                                 
265.00 170109  /*end the test */                                                              
266.00 161209              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))    
267.00 160727                                                                                 
268.00 161025              ENDPGM                                                             
