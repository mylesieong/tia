1.00 160824 /*****************************************************************************/ 
2.00 160913 /*  DATE CREATED : 13/09/16                                                  */ 
3.00 160913 /*  REFERNCE     : CHG-0250-16                                               */ 
4.00 160913 /*  PROGRAM NAME : MTFXBEG                                                   */ 
5.00 160824 /*  AUTHOR       : Myles Ieong                                               */ 
6.00 160913 /*  REASON       : Monitor Fx Begin                                          */ 
7.00 160824 /*****************************************************************************/ 
8.00 160913              PGM                                                                
9.00 160913              DCL        VAR(&I700BCM) TYPE(*CHAR) LEN(10) VALUE('I700BCM')      
10.00 160913              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
11.00 160913              DCL        VAR(&USER) TYPE(*CHAR) LEN(10)                          
12.00 160913              DCL        VAR(&TODAY) TYPE(*DEC) LEN(8 0)                         
13.00 160913              DCL        VAR(&CTODAY) TYPE(*CHAR) LEN(8)                         
14.00 160913              DCL        VAR(&CDD) TYPE(*CHAR) LEN(2)                            
15.00 160913              DCL        VAR(&CMM) TYPE(*CHAR) LEN(2)                            
16.00 160913              DCL        VAR(&CYY) TYPE(*CHAR) LEN(4)                            
17.00 160913              DCL        VAR(&WEEKDAY) TYPE(*CHAR) LEN(4)                        
18.00 160913                                                                                 
19.00 160919              DCL        VAR(&SCDTM) TYPE(*CHAR) LEN(8) VALUE('16:50:00')        
20.00 160913                                                                                 
21.00 160913              CALL       PGM(&IMODULE/DICBSYMD) PARM(&TODAY)                     
22.00 160913              CHGVAR     VAR(&CTODAY) VALUE(&TODAY)                              
23.00 160913              CHGVAR     VAR(&CDD) VALUE(%SST(&CTODAY 7 2))                      
24.00 160913              CHGVAR     VAR(&CMM) VALUE(%SST(&CTODAY 5 2))                      
25.00 160913              CHGVAR     VAR(&CYY) VALUE(%SST(&CTODAY 1 4))                      
26.00 160913              CHGVAR     VAR(&CTODAY) VALUE(&CDD *TCAT &CMM *TCAT &CYY)          
27.00 160913                                                                                 
28.00 160913              RTVJOBA    USER(&USER)                                             
29.00 160913              CALL       PGM(&IMODULE/DDOW1) PARM(&TODAY &WEEKDAY)               
30.00 160913                                                                                 
31.00 160913              IF         COND(&WEEKDAY *NE '*SAT') THEN(DO)                      
32.00 160913              CHGDTAARA  DTAARA(&I700BCM/MTFXLOOP (1 14)) +                      
33.00 160919                           VALUE('090000 180000 ')                               
34.00 160913              CHGDTAARA  DTAARA(&I700BCM/MTFXLOOP (15 28)) +                     
35.00 160913                           VALUE('000300 000015 ')                               
36.00 160913              CHGDTAARA  DTAARA(&I700BCM/MTFXLOOP (29 15)) +                     
37.00 160913                           VALUE('READY SS       ')                              
38.00 160919              ADDJOBSCDE JOB(MTFXLOOP) CMD(CALL +                                
39.00 160919                           PGM(&I700BCM/MTFXLOOP)) FRQ(*ONCE) +                  
40.00 160919                           SCDDATE(&CTODAY) SCDTIME(&SCDTM) USER(&USER)          
41.00 160913              ENDDO                                                              
42.00 160913                                                                                 
43.00 160905              ENDPGM                                                             
