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
31.00 170111 /*test var*/ DCL        VAR(&TC) TYPE(*CHAR) LEN(10)                                                
32.00 160727                                                                                                     
33.00 170113  /*TEST CASE #1 PREPARATION*/                                                                       
34.00 170111              CPYF       FROMFILE(ZECSDLIB/BBTECSDPF#) +                                             
35.00 170111                           TOFILE(ZECSDLIB/BBTECSDPF) +                                              
36.00 170111                           MBROPT(*REPLACE) CRTFILE(*NO)                                             
37.00 170116              OVRDBF     FILE(ECSDPF) TOFILE(ZECSDLIB/BBTECSDPF)                                     
38.00 170111              CHGVAR     VAR(&TC) VALUE('FAILED')                                                    
39.00 170111                                                                                                     
40.00 170116  /*TEST CASE #1 RUN- not exist account- result: 1 no record found to dlt */                         
41.00 170116              CHGVAR     VAR(&PACTCODE) VALUE('DLT ')                                                
42.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
43.00 170116              CHGVAR     VAR(&PEMKEY) VALUE('0003392045          ')                                  
44.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('ACCT      ')                                          
45.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('STMT      ')                                          
46.00 161124              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
47.00 170113              CHGVAR     VAR(&PEMOP1) VALUE('Y')                                                     
48.00 161124              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
49.00 161124              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
50.00 161025              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
51.00 161025                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
52.00 161025                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
53.00 161025                           &PEMTIME &PEMSRUPD &PEMREL +                                              
54.00 161025                           &PICBSSTS &PSTS &PMOMENT )                                                
55.00 170112              IF         COND(&PICBSSTS *EQ '1') THEN(DO)                                            
56.00 170111              CHGVAR     VAR(&TC) VALUE('SUCCESS')                                                   
57.00 170111              ENDDO                                                                                  
58.00 170116              SNDUSRMSG  MSG('TEST CASE DLT1-N: ' || &TC)                                            
59.00 170111                                                                                                     
60.00 170111              DLTOVR     FILE(*ALL)                                                                  
61.00 170112                                                                                                     
62.00 170113  /*TEST CASE #2 PREPARATION*/                                                                       
63.00 170112              CPYF       FROMFILE(ZECSDLIB/BBTECSDPF#) +                                             
64.00 170112                           TOFILE(ZECSDLIB/BBTECSDPF) +                                              
65.00 170112                           MBROPT(*REPLACE) CRTFILE(*NO)                                             
66.00 170116              OVRDBF     FILE(ECSDPF) TOFILE(ZECSDLIB/BBTECSDPF)                                     
67.00 170112              CHGVAR     VAR(&TC) VALUE('FAILED')                                                    
68.00 170112                                                                                                     
69.00 170116  /*TEST CASE #2 RUN- exist acc, result:0 */                                                         
70.00 170116              CHGVAR     VAR(&PACTCODE) VALUE('DLT ')                                                
71.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
72.00 170116              CHGVAR     VAR(&PEMKEY) VALUE('0000668119          ')                                  
73.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('ACCT      ')                                          
74.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('STMT      ')                                          
75.00 170112              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
76.00 170113              CHGVAR     VAR(&PEMOP1) VALUE('Y')                                                     
77.00 170112              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
78.00 170112              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
79.00 170112              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
80.00 170112                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
81.00 170112                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
82.00 170112                           &PEMTIME &PEMSRUPD &PEMREL +                                              
83.00 170112                           &PICBSSTS &PSTS &PMOMENT )                                                
84.00 170112              IF         COND(&PICBSSTS *EQ '0') THEN(DO)                                            
85.00 170113              /* Verify the result*/                                                                 
86.00 170113              CHGVAR     VAR(&PACTCODE) VALUE('INQ ')                                                
87.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('20')                                                
88.00 170116              CHGVAR     VAR(&PEMKEY) VALUE('0000668119          ')                                  
89.00 170113              CHGVAR     VAR(&PEMCLASS) VALUE('          ')                                          
90.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('          ')                                          
91.00 170113              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
92.00 170113              CHGVAR     VAR(&PEMOP1) VALUE(' ')                                                     
93.00 170113              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
94.00 170113              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
95.00 170113              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
96.00 170113                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
97.00 170113                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
98.00 170113                           &PEMTIME &PEMSRUPD &PEMREL +                                              
99.00 170113                           &PICBSSTS &PSTS &PMOMENT )                                                
100.00 170116              IF         COND(&PICBSSTS *EQ '1') THEN(DO)                                            
101.00 170112              CHGVAR     VAR(&TC) VALUE('SUCCESS')                                                   
102.00 170113              ENDDO                                                                                  
103.00 170113                                                                                                     
104.00 170112              ENDDO                                                                                  
105.00 170116              SNDUSRMSG  MSG('TEST CASE DLT1-E: ' || &TC)                                            
106.00 170112                                                                                                     
107.00 170112              DLTOVR     FILE(*ALL)                                                                  
108.00 160727                                                                                                     
109.00 161025              ENDPGM                                                                                 
