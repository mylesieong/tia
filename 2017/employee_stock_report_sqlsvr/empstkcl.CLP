1.00 170120 /******************************************************************************/                    
2.00 170126 /* REFERENCE NO. : CHG-0048-17 (D7048)                                        */                    
3.00 170120 /* AUTHOR        : Myles Ieong                                                */                    
4.00 170120 /* USER ID.      : BI77PGM                                                    */                    
5.00 170120 /* DATE WRITTEN  : 20 Jan 2017                                                */                    
6.00 170210 /* DESCRPITION   : Employee Stock Report CLP                                  */                    
7.00 170120 /*                                                                            */                    
8.00 170120 /******************************************************************************/                    
9.00 170120          PGM                                                                                        
10.00 170120                                                                                                     
11.00 170210              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('IPROD')                             
12.00 170120              DCL        VAR(&ZISTOCK) TYPE(*CHAR) LEN(10) VALUE('ZISTOCK')                          
13.00 170126              DCL        VAR(&ZCSERVICE) TYPE(*CHAR) LEN(10) VALUE('ZCSERVICE')                      
14.00 170126              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')                          
15.00 170120                                                                                                     
16.00 170120              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1) VALUE('Y')                               
17.00 170120              DCL        VAR(&RMVZISTOCK) TYPE(*CHAR) LEN(1) VALUE('Y')                              
18.00 170126              DCL        VAR(&RMVZCSERV) TYPE(*CHAR) LEN(1) VALUE('Y')                               
19.00 170126              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')                              
20.00 170120                                                                                                     
21.00 170210              /* VARIABLES FOR IMODULE/CHKEOM */                                                     
22.00 170210              DCL        VAR(&EOM)      TYPE(*CHAR) LEN(1)                                           
23.00 170210              DCL        VAR(&DATE)     TYPE(*DEC)  LEN(8 0)                                         
24.00 170210                                                                                                     
25.00 170126              ADDLIBLE   LIB(&IMODULE)                                                               
26.00 170126              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N'))                     
27.00 170126              ADDLIBLE   LIB(&ZCSERVICE)                                                             
28.00 170126              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZCSERV) VALUE('N'))                      
29.00 170120              ADDLIBLE   LIB(&ZISTOCK)                                                               
30.00 170120              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZISTOCK) VALUE('N'))                     
31.00 170120              ADDLIBLE   LIB(&WRKLIB)                                                                
32.00 170120              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))                      
33.00 170120                                                                                                     
34.00 170210              CALL       PGM(CHKEOM) PARM(&EOM &DATE)                                                
35.00 170215              IF         COND(&EOM *EQ 'Y') THEN(DO)                                                 
36.00 170210                                                                                                     
37.00 170215              CLRPFM     FILE(&WRKLIB/EMPSTKACC)                                                     
38.00 170215              CLRPFM     FILE(&WRKLIB/EMPSTKPRF)                                                     
39.00 170215              CLRPFM     FILE(&WRKLIB/EMPSTKTX)                                                      
40.00 170215              RUNSQLSTM  SRCFILE(&WRKLIB/QDDSSRC) SRCMBR(EMPSTKSQL) +                                
41.00 170215                            COMMIT(*NONE)                                                            
42.00 170215              CALL       PGM(EMPSTKPGM)                                                              
43.00 170215                                                                                                     
44.00 170210              ENDDO                                                                                  
45.00 170120                                                                                                     
46.00 170120              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))                        
47.00 170120              IF         COND(&RMVZISTOCK *EQ 'Y') THEN(RMVLIBLE LIB(&ZISTOCK))                      
48.00 170126              IF         COND(&RMVZCSERV *EQ 'Y') THEN(RMVLIBLE LIB(&ZCSERVICE))                     
49.00 170126              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))                      
50.00 170120                                                                                                     
51.00 170120              ENDPGM                                                                                 
