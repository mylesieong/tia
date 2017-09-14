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
33.00 161025                                                                                                     
34.00 160825              ADDLIBLE   LIB(&ZECSDLIB)                                                              
35.00 160825              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZECSD) VALUE('N'))                       
36.00 160727                                                                                                     
37.00 170112  /*TEST CASE #1 RUN- non exist account- result: 1 non exist account*/                               
38.00 170914              CHGVAR     VAR(&PACTCODE) VALUE('UPDR')                                                
39.00 170113              CHGVAR     VAR(&PEMAPPCODE) VALUE('90')                                                
40.00 170914              CHGVAR     VAR(&PEMKEY) VALUE('0000031607          ')                                  
41.00 170914              CHGVAR     VAR(&PEMCLASS) VALUE('CIF       ')                                          
42.00 170113              CHGVAR     VAR(&PEMTYPE)  VALUE('STMT      ')                                          
43.00 161124              CHGVAR     VAR(&PEMSUTYPE) VALUE('  ')                                                 
44.00 170914              CHGVAR     VAR(&PEMOP1) VALUE('Y')                                                     
45.00 161124              CHGVAR     VAR(&PEMDATE) VALUE(0)                                                      
46.00 161124              CHGVAR     VAR(&PEMTIME) VALUE(0)                                                      
47.00 161025              CALL       PGM(ECSDACTCL) PARM(&PCHANNEL &PACTCODE &PACTTYPE +                         
48.00 161025                           &PEMAPPCODE &PEMKEY &PEMCLASS &PEMTYPE &PEMSUTYPE +                       
49.00 161025                           &PEMOP1 &PEMOP2 &PEMOP3 &PEMDATE +                                        
50.00 161025                           &PEMTIME &PEMSRUPD &PEMREL +                                              
51.00 161025                           &PICBSSTS &PSTS &PMOMENT )                                                
52.00 170112              IF         COND(&PICBSSTS *EQ '1') THEN(DO)                                            
53.00 170914              SNDUSRMSG  MSG('NOT OK')                                                               
54.00 170111              ENDDO                                                                                  
55.00 170914                                                                                                     
56.00 170914              IF         COND(&RMVZECSD *EQ 'Y') THEN(RMVLIBLE LIB(&ZECSDLIB))                       
57.00 160727                                                                                                     
58.00 161025              ENDPGM                                                                                 
