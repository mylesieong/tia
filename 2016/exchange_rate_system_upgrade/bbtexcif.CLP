1.00 160610 /*-----------------------------------------------------------------*/           
2.00 160610 /*        Program ID.   : GEXCIFGPCL                               */           
3.00 160610 /*        Program Name  : Get group from cif for exchange rate     */           
4.00 160610 /*        Parameter     : incoming - CIF Number (10A)              */           
5.00 160610 /*                                 - Channel (6A)                  */           
6.00 160610 /*                        outgoing - GroupIN (6A)                  */           
7.00 160610 /*                                   Status (1A) 0:SUCCESS 1:ERR   */           
8.00 160610 /*        Author        : Myles Ieong                              */           
9.00 160902 /*        Date written  : 2016-09-02                               */           
10.00 160610 /*                                                                 */           
11.00 160610 /*-----------------------------------------------------------------*/           
12.00 160902              PGM                                                                
13.00 160610                                                                                 
14.00 160610              DCL        VAR(&PCIF) TYPE(*CHAR) LEN(10)                          
15.00 160610              DCL        VAR(&PCHN) TYPE(*CHAR) LEN(6)                           
16.00 160610              DCL        VAR(&PGRP) TYPE(*CHAR) LEN(6)                           
17.00 160610              DCL        VAR(&PSTS) TYPE(*CHAR) LEN(1)                           
18.00 160610                                                                                 
19.00 160610              DCL        VAR(&ZVIPLIB) TYPE(*CHAR) LEN(10) VALUE('ZVIPLIB')      
20.00 160610              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
21.00 160715              DCL        VAR(&ZCSERVICE) TYPE(*CHAR) LEN(10) VALUE('ZCSERVICE')  
22.00 160610              DCL        VAR(&RMVZVIPLIB) TYPE(*CHAR) LEN(1) VALUE('Y')          
23.00 160610              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')          
24.00 160715              DCL        VAR(&RMVZCSERV) TYPE(*CHAR) LEN(1) VALUE('Y')           
25.00 160902                                                                                 
26.00 160902              DCL        VAR(&TC) TYPE(*CHAR) LEN(10)                            
27.00 160610                                                                                 
28.00 160610              ADDLIBLE   LIB(&ZVIPLIB)                                           
29.00 160610              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZVIPLIB) VALUE('N')) 
30.00 160610              ADDLIBLE   LIB(&IMODULE)                                           
31.00 160610              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N')) 
32.00 160715              ADDLIBLE   LIB(&ZCSERVICE)                                         
33.00 160715              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZCSERV) VALUE('N'))  
34.00 160610                                                                                 
35.00 160902  /*TEST CASE 1.A* * a cif 0000308633 should be VIP  */                          
36.00 160902              CHGVAR     VAR(&PCIF) VALUE('0000308633')                          
37.00 160902              CHGVAR     VAR(&TC) VALUE('FAILED')                                
38.00 160902              CALL       PGM(GEXCIFGRP) PARM(&PCIF &PCHN &PGRP &PSTS)            
39.00 160902              IF         COND(   (&PGRP *EQ 'VIP   ')                        +   
40.00 160902                               & (&PSTS *EQ '0'))                            +   
41.00 160902                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
42.00 160902              SNDUSRMSG  MSG('TEST CASE 1A: ' || &TC)                            
43.00 160902                                                                                 
44.00 160902  /*TEST CASE 1.B  a cif 0000010936 should be NET  */                            
45.00 160902              CHGVAR     VAR(&PCIF) VALUE('0000010936')                          
46.00 160902              CHGVAR     VAR(&TC) VALUE('FAILED')                                
47.00 160902              CALL       PGM(GEXCIFGRP) PARM(&PCIF &PCHN &PGRP &PSTS)            
48.00 160902              IF         COND(  (&PGRP *EQ 'NET   ')                         +   
49.00 160902                              & (&PSTS *EQ '0'))                             +   
50.00 160902                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
51.00 160902              SNDUSRMSG  MSG('TEST CASE 1B: ' || &TC)                            
52.00 160902                                                                                 
53.00 160902  /*TEST CASE 1.C a cif 0000010944 should be NET */                              
54.00 160902              CHGVAR     VAR(&PCIF) VALUE('0000010944')                          
55.00 160902              CHGVAR     VAR(&TC) VALUE('FAILED')                                
56.00 160902              CALL       PGM(GEXCIFGRP) PARM(&PCIF &PCHN &PGRP &PSTS)            
57.00 160902              IF         COND((&PGRP *EQ 'NET   ') & (&PSTS *EQ '0'))        +   
58.00 160902                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
59.00 160902              SNDUSRMSG  MSG('TEST CASE 1C: ' || &TC)                            
60.00 160902                                                                                 
61.00 160902  /*TEST CASE 1.D a cif 0000034630 should be CORP (active in mup030) */          
62.00 160902              CHGVAR     VAR(&PCIF) VALUE('0000034630')                          
63.00 160902              CHGVAR     VAR(&TC) VALUE('FAILED')                                
64.00 160902              CALL       PGM(GEXCIFGRP) PARM(&PCIF &PCHN &PGRP &PSTS)            
65.00 160902              IF         COND((&PGRP *EQ 'CORP  ') & (&PSTS *EQ '0'))        +   
66.00 160902                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
67.00 160902              SNDUSRMSG  MSG('TEST CASE 1D: ' || &TC)                            
68.00 160902                                                                                 
69.00 160902  /*TEST CASE 1.E a cif 0000062138 should be NET (inactive in mup030)  */        
70.00 160902              CHGVAR     VAR(&PCIF) VALUE('0000062138')                          
71.00 160902              CHGVAR     VAR(&TC) VALUE('FAILED')                                
72.00 160902              CALL       PGM(GEXCIFGRP) PARM(&PCIF &PCHN &PGRP &PSTS)            
73.00 160902              IF         COND((&PGRP *EQ 'NET   ') & (&PSTS *EQ '0'))        +   
74.00 160902                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
75.00 160902              SNDUSRMSG  MSG('TEST CASE 1E: ' || &TC)                            
76.00 160902                                                                                 
77.00 160902  /*TEST CASE 1.F a cif 0000283515 should be CORP(active in spcifpf))  */        
78.00 160902              CHGVAR     VAR(&PCIF) VALUE('0000283515')                          
79.00 160902              CHGVAR     VAR(&TC) VALUE('FAILED')                                
80.00 160902              CALL       PGM(GEXCIFGRP) PARM(&PCIF &PCHN &PGRP &PSTS)            
81.00 160902              IF         COND((&PGRP *EQ 'CORP  ') & (&PSTS *EQ '0'))        +   
82.00 160902                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
83.00 160902              SNDUSRMSG  MSG('TEST CASE 1F: ' || &TC)                            
84.00 160902                                                                                 
85.00 160902  /*TEST CASE 1.G a cif 0000283503 should be NET (inactive in spcifpf) */        
86.00 160902              CHGVAR     VAR(&PCIF) VALUE('0000283503')                          
87.00 160902              CHGVAR     VAR(&TC) VALUE('FAILED')                                
88.00 160902              CALL       PGM(GEXCIFGRP) PARM(&PCIF &PCHN &PGRP &PSTS)            
89.00 160902              IF         COND((&PGRP *EQ 'NET   ') & (&PSTS *EQ '0'))        +   
90.00 160902                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
91.00 160902              SNDUSRMSG  MSG('TEST CASE 1G: ' || &TC)                            
92.00 160902                                                                                 
93.00 160902  /*TEST CASE 2.A a cif 0000012174 should be not found */                        
94.00 160902              CHGVAR     VAR(&PCIF) VALUE('0000012174')                          
95.00 160902              CHGVAR     VAR(&TC) VALUE('FAILED')                                
96.00 160902              CALL       PGM(GEXCIFGRP) PARM(&PCIF &PCHN &PGRP &PSTS)            
97.00 160902              IF         COND((&PGRP *EQ '      ') & (&PSTS *EQ '1'))        +   
98.00 160902                         THEN(CHGVAR VAR(&TC) VALUE('SUCCESS'))                  
99.00 160902              SNDUSRMSG  MSG('TEST CASE 2A: ' || &TC)                            
100.00 160902                                                                                 
101.00 160902                                                                                 
102.00 160610              IF         COND(&RMVZVIPLIB *EQ 'Y') THEN(RMVLIBLE LIB(&ZVIPLIB))  
103.00 160610              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))  
104.00 160715              IF         COND(&RMVZCSERV *EQ 'Y') THEN(RMVLIBLE LIB(&ZCSERVICE)) 
105.00 160610                                                                                 
106.00 160610              ENDPGM                                                             
107.00 160610                                                                                 
