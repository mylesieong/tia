1.00 100805 /************************************************************************/                          
2.00 161020 /* PROGRAM ID   : ECSDPGMCL                                             */                          
3.00 160727 /* REFERENCE    : CHG-xxx-16 (D6xxx)                                    */                          
4.00 160727 /* AUTHOR       : Myles Ieong                                           */                          
5.00 160727 /* Written Date : BI77PGM                                               */                          
6.00 170112 /* DESCRIPTION  : Unit test framework of ECSDACTCL                      */                          
7.00 100805 /************************************************************************/                          
8.00 161020              PGM                                                                                    
9.00 160727                                                                                                     
10.00 161025              DCL        VAR(&PCHANNEL) TYPE(*CHAR) LEN(3) VALUE('   ')                              
11.00 170111              DCL        VAR(&PACTCODE) TYPE(*CHAR) LEN(4) VALUE('    ')                             
12.00 161025              DCL        VAR(&PACTTYPE) TYPE(*CHAR) LEN(4) VALUE('    ')                             
13.00 170111              DCL        VAR(&PEMAPPCODE) TYPE(*CHAR) LEN(2) VALUE('  ')                             
14.00 161025              DCL        VAR(&PEMKEY) TYPE(*CHAR) LEN(20) +                                          
15.00 170111                           VALUE('                    ')                                             
16.00 161020              DCL        VAR(&PEMCLASS) TYPE(*CHAR) LEN(10) +                                        
17.00 170111                           VALUE('     ')                                                            
18.00 170111              DCL        VAR(&PEMTYPE) TYPE(*CHAR) LEN(10) VALUE('    ')                             
19.00 170111              DCL        VAR(&PEMSUTYPE) TYPE(*CHAR) LEN(2) VALUE('  ')                              
20.00 170111              DCL        VAR(&PEMOP1) TYPE(*CHAR) LEN(1) VALUE(' ')                                  
21.00 161020              DCL        VAR(&PEMOP2) TYPE(*CHAR) LEN(1) VALUE(' ')                                  
22.00 161020              DCL        VAR(&PEMOP3) TYPE(*CHAR) LEN(2) VALUE('  ')                                 
23.00 161020              DCL        VAR(&PEMDATE) TYPE(*DEC) LEN(8 0) VALUE(0)                                  
24.00 161020              DCL        VAR(&PEMTIME) TYPE(*DEC) LEN(6 0) VALUE(0)                                  
25.00 161020              DCL        VAR(&PEMSRUPD) TYPE(*CHAR) LEN(10) VALUE('          ')                      
26.00 161020              DCL        VAR(&PEMREL) TYPE(*CHAR) LEN(10) VALUE('          ')                        
27.00 161025              DCL        VAR(&PICBSSTS) TYPE(*CHAR) LEN(1) VALUE(' ')                                
28.00 161025              DCL        VAR(&PSTS) TYPE(*CHAR) LEN(10) VALUE('          ')                          
29.00 161025              DCL        VAR(&PMOMENT) TYPE(*CHAR) LEN(26) VALUE('                          ')       
30.00 161020                                                                                                     
31.00 160825              DCL        VAR(&ZECSDLIB) TYPE(*CHAR) LEN(10) VALUE('ZECSDLIB')                        
32.00 160825              DCL        VAR(&RMVZECSD) TYPE(*CHAR) LEN(1) VALUE('Y')                                
33.00 160727                                                                                                     
34.00 170111 /*test var*/ DCL        VAR(&TC) TYPE(*CHAR) LEN(10)                                                
35.00 161025                                                                                                     
36.00 160825              ADDLIBLE   LIB(&ZECSDLIB)                                                              
37.00 160825              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZECSD) VALUE('N'))                       
38.00 160727                                                                                                     
39.00 170113  /*TEST CASE #1 PREPARATION*/                                                                       
40.00 170111              CPYF       FROMFILE(ZECSDLIB/BBTECSDPF#) +                                             
41.00 170111                           TOFILE(ZECSDLIB/BBTECSDPF) +                                              
42.00 170111                           MBROPT(*REPLACE) CRTFILE(*NO)                                             
43.00 170111              OVRDBF     FILE(ECSDPF) TOFILE(&ZECSDLIB/BBTECSDPF)                                    
44.00 170111              CHGVAR     VAR(&TC) VALUE('FAILED')                                                    
45.00 170111                                                                                                     
46.00 170113  /*TEST CASE #1 RUN- already exist account- result: 1 already exist account*/                       
47.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('CRT ')                                                
48.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
49.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0000668119          ')                                  
50.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('ACCT      ')                                          
51.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('STMT      ')                                          
52.00 161124              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
53.00 170113              CHGVAR     VAR(&PEMOP1) VALUE('Y')                                                     
54.00 161124              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
55.00 161124              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
56.00 161025              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
57.00 161025                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
58.00 161025                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
59.00 161025                           &PEMTIME &PEMSRUPD &PEMREL +                                              
60.00 161025                           &PICBSSTS &PSTS &PMOMENT )                                                
61.00 170112              IF         COND(&PICBSSTS *EQ '1') THEN(DO)                                            
62.00 170111              CHGVAR     VAR(&TC) VALUE('SUCCESS')                                                   
63.00 170111              ENDDO                                                                                  
64.00 170113              SNDUSRMSG  MSG('TEST CASE CRT1-Y/-: ' || &TC)                                          
65.00 170111                                                                                                     
66.00 170111              DLTOVR     FILE(*ALL)                                                                  
67.00 170112                                                                                                     
68.00 170113  /*TEST CASE #2 PREPARATION*/                                                                       
69.00 170112              CPYF       FROMFILE(ZECSDLIB/BBTECSDPF#) +                                             
70.00 170112                           TOFILE(ZECSDLIB/BBTECSDPF) +                                              
71.00 170112                           MBROPT(*REPLACE) CRTFILE(*NO)                                             
72.00 170112              OVRDBF     FILE(ECSDPF) TOFILE(&ZECSDLIB/BBTECSDPF)                                    
73.00 170112              CHGVAR     VAR(&TC) VALUE('FAILED')                                                    
74.00 170112                                                                                                     
75.00 170113  /*TEST CASE #2 RUN- not exist acc, and its cif in not in ecsdpf, result:0 chg its op1 alone */     
76.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('CRT ')                                                
77.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
78.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0003392045          ')                                  
79.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('ACCT      ')                                          
80.00 170123              CHGVAR     VAR(&PEMTYPE) VALUE('STMT      ')                                           
81.00 170112              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
82.00 170113              CHGVAR     VAR(&PEMOP1) VALUE('Y')                                                     
83.00 170112              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
84.00 170112              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
85.00 170112              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
86.00 170112                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
87.00 170112                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
88.00 170112                           &PEMTIME &PEMSRUPD &PEMREL +                                              
89.00 170112                           &PICBSSTS &PSTS &PMOMENT )                                                
90.00 170112              IF         COND(&PICBSSTS *EQ '0') THEN(DO)                                            
91.00 170113              /* Verify the result*/                                                                 
92.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('INQ ')                                                
93.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
94.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0003392045          ')                                  
95.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('          ')                                          
96.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('          ')                                          
97.00 170113              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
98.00 170113              CHGVAR     VAR(&PEMOP1) VALUE(' ')                                                     
99.00 170113              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
100.00 170113              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
101.00 170113              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
102.00 170113                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
103.00 170113                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
104.00 170113                           &PEMTIME &PEMSRUPD &PEMREL +                                              
105.00 170113                           &PICBSSTS &PSTS &PMOMENT )                                                
106.00 170113              IF         COND((&PICBSSTS *EQ '0') *AND (&PEMOP1 *EQ 'Y')) THEN(DO)                   
107.00 170112              CHGVAR     VAR(&TC) VALUE('SUCCESS')                                                   
108.00 170113              ENDDO                                                                                  
109.00 170113                                                                                                     
110.00 170112              ENDDO                                                                                  
111.00 170123              SNDUSRMSG  MSG('TEST CASE CRT1-N/Ind(20): ' || &TC)                                    
112.00 170112                                                                                                     
113.00 170112              DLTOVR     FILE(*ALL)                                                                  
114.00 160727                                                                                                     
115.00 170113  /*TEST CASE #3 PREPARATION*/                                                                       
116.00 170113              CPYF       FROMFILE(ZECSDLIB/BBTECSDPF#) +                                             
117.00 170113                           TOFILE(ZECSDLIB/BBTECSDPF) +                                              
118.00 170113                           MBROPT(*REPLACE) CRTFILE(*NO)                                             
119.00 170113              OVRDBF     FILE(ECSDPF) TOFILE(&ZECSDLIB/BBTECSDPF)                                    
120.00 170113              CHGVAR     VAR(&TC) VALUE('FAILED')                                                    
121.00 170113                                                                                                     
122.00 170113  /*TEST CASE #3 RUN- no exist acc, but its cif in ecsdpf, result:0 follow its cif setting Y */      
123.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('CRT ')                                                
124.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
125.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0001166188          ')                                  
126.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('ACCT      ')                                          
127.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('STMT      ')                                          
128.00 170113              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
129.00 170113              CHGVAR     VAR(&PEMOP1) VALUE('B')                                                     
130.00 170113              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
131.00 170113              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
132.00 170113              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
133.00 170113                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
134.00 170113                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
135.00 170113                           &PEMTIME &PEMSRUPD &PEMREL +                                              
136.00 170113                           &PICBSSTS &PSTS &PMOMENT )                                                
137.00 170113              IF         COND(&PICBSSTS *EQ '0') THEN(DO)                                            
138.00 170113              /* Verify the result*/                                                                 
139.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('INQ ')                                                
140.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
141.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0001166188          ')                                  
142.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('          ')                                          
143.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('          ')                                          
144.00 170113              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
145.00 170113              CHGVAR     VAR(&PEMOP1) VALUE(' ')                                                     
146.00 170113              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
147.00 170113              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
148.00 170113              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
149.00 170113                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
150.00 170113                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
151.00 170113                           &PEMTIME &PEMSRUPD &PEMREL +                                              
152.00 170113                           &PICBSSTS &PSTS &PMOMENT )                                                
153.00 170113              IF         COND((&PICBSSTS *EQ '0') *AND (&PEMOP1 *EQ 'Y')) THEN(DO)                   
154.00 170113              CHGVAR     VAR(&TC) VALUE('SUCCESS')                                                   
155.00 170113              ENDDO                                                                                  
156.00 170113                                                                                                     
157.00 170113              ENDDO                                                                                  
158.00 170123              SNDUSRMSG  MSG('TEST CASE CRT1-N/Dep(20): ' || &TC)                                    
159.00 170113                                                                                                     
160.00 170113              DLTOVR     FILE(*ALL)                                                                  
161.00 170112                                                                                                     
162.00 170123  /*TEST CASE #4 PREPARATION*/                                                                       
163.00 170123              CPYF       FROMFILE(ZECSDLIB/BBTECSDPF#) +                                             
164.00 170123                           TOFILE(ZECSDLIB/BBTECSDPF) +                                              
165.00 170123                           MBROPT(*REPLACE) CRTFILE(*NO)                                             
166.00 170123              OVRDBF     FILE(ECSDPF) TOFILE(&ZECSDLIB/BBTECSDPF)                                    
167.00 170123              CHGVAR     VAR(&TC) VALUE('FAILED')                                                    
168.00 170123                                                                                                     
169.00 170123  /*TEST CASE #4 RUN- not exist acc, and its cif in not in ecsdpf, result:0 chg its op1 alone */     
170.00 170123              CHGVAR     VAR(&PACTCODE) VALUE('CRT ')                                                
171.00 170123              CHGVAR     VAR(&PEMAPPCODE) VALUE('26')                                                
172.00 170123              CHGVAR     VAR(&PEMKEY) VALUE('0001400401          ')                                  
173.00 170123              CHGVAR     VAR(&PEMCLASS) VALUE('ACCT      ')                                          
174.00 170123              CHGVAR     VAR(&PEMTYPE) VALUE('STMT      ')                                           
175.00 170123              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
176.00 170123              CHGVAR     VAR(&PEMOP1) VALUE('Y')                                                     
177.00 170123              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
178.00 170123              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
179.00 170123              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
180.00 170123                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
181.00 170123                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
182.00 170123                           &PEMTIME &PEMSRUPD &PEMREL +                                              
183.00 170123                           &PICBSSTS &PSTS &PMOMENT )                                                
184.00 170123              IF         COND(&PICBSSTS *EQ '0') THEN(DO)                                            
185.00 170123              /* Verify the result*/                                                                 
186.00 170123              CHGVAR     VAR(&PACTCODE) VALUE('INQ ')                                                
187.00 170123              CHGVAR     VAR(&PEMAPPCODE) VALUE('26')                                                
188.00 170123              CHGVAR     VAR(&PEMKEY) VALUE('0001400401          ')                                  
189.00 170123              CHGVAR     VAR(&PEMCLASS) VALUE('          ')                                          
190.00 170123              CHGVAR     VAR(&PEMTYPE)  VALUE('          ')                                          
191.00 170123              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
192.00 170123              CHGVAR     VAR(&PEMOP1) VALUE(' ')                                                     
193.00 170123              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
194.00 170123              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
195.00 170123              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
196.00 170123                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
197.00 170123                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
198.00 170123                           &PEMTIME &PEMSRUPD &PEMREL +                                              
199.00 170123                           &PICBSSTS &PSTS &PMOMENT )                                                
200.00 170123              IF         COND((&PICBSSTS *EQ '0') *AND (&PEMOP1 *EQ 'Y')) THEN(DO)                   
201.00 170123              CHGVAR     VAR(&TC) VALUE('SUCCESS')                                                   
202.00 170123              ENDDO                                                                                  
203.00 170123                                                                                                     
204.00 170123              ENDDO                                                                                  
205.00 170123              SNDUSRMSG  MSG('TEST CASE CRT1-N/Ind(26): ' || &TC)                                    
206.00 170123                                                                                                     
207.00 170123              DLTOVR     FILE(*ALL)                                                                  
208.00 170123                                                                                                     
209.00 170123  /*TEST CASE #5 PREPARATION*/                                                                       
210.00 170123              CPYF       FROMFILE(ZECSDLIB/BBTECSDPF#) +                                             
211.00 170123                           TOFILE(ZECSDLIB/BBTECSDPF) +                                              
212.00 170123                           MBROPT(*REPLACE) CRTFILE(*NO)                                             
213.00 170123              OVRDBF     FILE(ECSDPF) TOFILE(&ZECSDLIB/BBTECSDPF)                                    
214.00 170123              CHGVAR     VAR(&TC) VALUE('FAILED')                                                    
215.00 170123                                                                                                     
216.00 170123  /*TEST CASE #5 RUN- no exist acc, but its cif in ecsdpf, result:0 follow its cif setting Y */      
217.00 170123              CHGVAR     VAR(&PACTCODE) VALUE('CRT ')                                                
218.00 170123              CHGVAR     VAR(&PEMAPPCODE) VALUE('26')                                                
219.00 170123              CHGVAR     VAR(&PEMKEY) VALUE('0001306227          ')                                  
220.00 170123              CHGVAR     VAR(&PEMCLASS) VALUE('ACCT      ')                                          
221.00 170123              CHGVAR     VAR(&PEMTYPE)  VALUE('STMT      ')                                          
222.00 170123              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
223.00 170123              CHGVAR     VAR(&PEMOP1) VALUE('B')                                                     
224.00 170123              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
225.00 170123              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
226.00 170123              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
227.00 170123                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
228.00 170123                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
229.00 170123                           &PEMTIME &PEMSRUPD &PEMREL +                                              
230.00 170123                           &PICBSSTS &PSTS &PMOMENT )                                                
231.00 170123              IF         COND(&PICBSSTS *EQ '0') THEN(DO)                                            
232.00 170123              /* Verify the result*/                                                                 
233.00 170123              CHGVAR     VAR(&PACTCODE) VALUE('INQ ')                                                
234.00 170123              CHGVAR     VAR(&PEMAPPCODE) VALUE('26')                                                
235.00 170123              CHGVAR     VAR(&PEMKEY) VALUE('0001306227          ')                                  
236.00 170123              CHGVAR     VAR(&PEMCLASS) VALUE('          ')                                          
237.00 170123              CHGVAR     VAR(&PEMTYPE)  VALUE('          ')                                          
238.00 170123              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
239.00 170123              CHGVAR     VAR(&PEMOP1) VALUE(' ')                                                     
240.00 170123              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
241.00 170123              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
242.00 170123              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
243.00 170123                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
244.00 170123                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
245.00 170123                           &PEMTIME &PEMSRUPD &PEMREL +                                              
246.00 170123                           &PICBSSTS &PSTS &PMOMENT )                                                
247.00 170123              IF         COND((&PICBSSTS *EQ '0') *AND (&PEMOP1 *EQ 'Y')) THEN(DO)                   
248.00 170123              CHGVAR     VAR(&TC) VALUE('SUCCESS')                                                   
249.00 170123              ENDDO                                                                                  
250.00 170123                                                                                                     
251.00 170123              ENDDO                                                                                  
252.00 170123              SNDUSRMSG  MSG('TEST CASE CRT1-N/Dep(26): ' || &TC)                                    
253.00 170123                                                                                                     
254.00 170123              DLTOVR     FILE(*ALL)                                                                  
255.00 160825              IF         COND(&RMVZECSD *EQ 'Y') THEN(RMVLIBLE LIB(&ZECSDLIB))                       
256.00 160727                                                                                                     
257.00 161025              ENDPGM                                                                                 
