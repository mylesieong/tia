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
46.00 170112  /*TEST CASE #1 RUN- non exist account- result: 1 non exist account*/                               
47.00 170112              CHGVAR     VAR(&PACTCODE) VALUE('UPD ')                                                
48.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('90')                                                
49.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0000007780          ')                                  
50.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('VIP       ')                                          
51.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('STMT      ')                                          
52.00 161124              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
53.00 170113              CHGVAR     VAR(&PEMOP1) VALUE('B')                                                     
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
64.00 170113              SNDUSRMSG  MSG('TEST CASE UPD3-N: ' || &TC)                                            
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
75.00 170113  /*TEST CASE #2 RUN- exist account, result:0 and below sow account is updated */                    
76.00 170112              CHGVAR     VAR(&PACTCODE) VALUE('UPD ')                                                
77.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('90')                                                
78.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0000095869          ')                                  
79.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('VIP       ')                                          
80.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('STMT      ')                                          
81.00 170112              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
82.00 170113              CHGVAR     VAR(&PEMOP1) VALUE('B')                                                     
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
94.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0000748951          ')                                  
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
106.00 170113              IF         COND((&PICBSSTS *EQ '0') *AND (&PEMOP1 *EQ 'B')) THEN(DO)                   
107.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('INQ ')                                                
108.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
109.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0000749110          ')                                  
110.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('          ')                                          
111.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('          ')                                          
112.00 170113              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
113.00 170113              CHGVAR     VAR(&PEMOP1) VALUE(' ')                                                     
114.00 170113              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
115.00 170113              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
116.00 170113              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
117.00 170113                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
118.00 170113                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
119.00 170113                           &PEMTIME &PEMSRUPD &PEMREL +                                              
120.00 170113                           &PICBSSTS &PSTS &PMOMENT )                                                
121.00 170113              IF         COND((&PICBSSTS *EQ '0') *AND (&PEMOP1 *EQ 'B')) THEN(DO)                   
122.00 170112              CHGVAR     VAR(&TC) VALUE('SUCCESS')                                                   
123.00 170113              ENDDO                                                                                  
124.00 170113              ENDDO                                                                                  
125.00 170113                                                                                                     
126.00 170112              ENDDO                                                                                  
127.00 170113              SNDUSRMSG  MSG('TEST CASE UPD3-Y(B to Y): ' || &TC)                                    
128.00 170112                                                                                                     
129.00 170112              DLTOVR     FILE(*ALL)                                                                  
130.00 160727                                                                                                     
131.00 170113  /*TEST CASE #3 PREPARATION: No need to restore to std test data file cause we need to test +       
132.00 170113                              a backward operation (vip B->Y) */                                     
133.00 170113                                                                                                     
134.00 170113  /*TEST CASE #3 RUN- exist account, result:0 and below sow account is updated */                    
135.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('UPD ')                                                
136.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('90')                                                
137.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0000095869          ')                                  
138.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('VIP       ')                                          
139.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('STMT      ')                                          
140.00 170113              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
141.00 170113              CHGVAR     VAR(&PEMOP1) VALUE('Y')                                                     
142.00 170113              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
143.00 170113              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
144.00 170113              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
145.00 170113                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
146.00 170113                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
147.00 170113                           &PEMTIME &PEMSRUPD &PEMREL +                                              
148.00 170113                           &PICBSSTS &PSTS &PMOMENT )                                                
149.00 170113              IF         COND(&PICBSSTS *EQ '0') THEN(DO)                                            
150.00 170113              /* Verify the result*/                                                                 
151.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('INQ ')                                                
152.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
153.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0000748951          ')                                  
154.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('          ')                                          
155.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('          ')                                          
156.00 170113              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
157.00 170113              CHGVAR     VAR(&PEMOP1) VALUE(' ')                                                     
158.00 170113              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
159.00 170113              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
160.00 170113              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
161.00 170113                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
162.00 170113                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
163.00 170113                           &PEMTIME &PEMSRUPD &PEMREL +                                              
164.00 170113                           &PICBSSTS &PSTS &PMOMENT )                                                
165.00 170113              IF         COND((&PICBSSTS *EQ '0') *AND (&PEMOP1 *EQ 'Y')) THEN(DO)                   
166.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('INQ ')                                                
167.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
168.00 170113              CHGVAR     VAR(&PEMKEY) VALUE('0000749110          ')                                  
169.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('          ')                                          
170.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('          ')                                          
171.00 170113              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
172.00 170113              CHGVAR     VAR(&PEMOP1) VALUE(' ')                                                     
173.00 170113              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
174.00 170113              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
175.00 170113              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
176.00 170113                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
177.00 170113                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
178.00 170113                           &PEMTIME &PEMSRUPD &PEMREL +                                              
179.00 170113                           &PICBSSTS &PSTS &PMOMENT )                                                
180.00 170113              IF         COND((&PICBSSTS *EQ '0') *AND (&PEMOP1 *EQ 'Y')) THEN(DO)                   
181.00 170113              CHGVAR     VAR(&TC) VALUE('SUCCESS')                                                   
182.00 170113              ENDDO                                                                                  
183.00 170113              ENDDO                                                                                  
184.00 170113                                                                                                     
185.00 170113              ENDDO                                                                                  
186.00 170113              SNDUSRMSG  MSG('TEST CASE UPD3-Y(B to Y): ' || &TC)                                    
187.00 170113                                                                                                     
188.00 170113              DLTOVR     FILE(*ALL)                                                                  
189.00 170112                                                                                                     
190.00 160825              IF         COND(&RMVZECSD *EQ 'Y') THEN(RMVLIBLE LIB(&ZECSDLIB))                       
191.00 160727                                                                                                     
192.00 161025              ENDPGM                                                                                 
