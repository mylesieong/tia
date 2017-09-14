1.00 160414 /******************************************************************************/
2.00 160804 /* REFERENCE NO. : CHG-0250-16 (D6250)                                        */
3.00 160414 /* AUTHOR        : Myles Ieong                                                */
4.00 160414 /* USER ID.      : BI77PGM                                                    */
5.00 160526 /* DATE WRITTEN  : 25 May 2016                                                */
6.00 160804 /* DESCRPITION   : EChannel exchange rate monitoring                          */
7.00 160526 /*                                                                            */
8.00 160414 /******************************************************************************/
9.00 160329          PGM                                                                    
10.00 160414                                                                                 
11.00 160913              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('I700BCM')       
12.00 160907              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1) VALUE('Y')           
13.00 160414              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
14.00 160414              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')          
15.00 160907              DCL        VAR(&ZCSERVICE) TYPE(*CHAR) LEN(10) VALUE('ZCSERVICE')  
16.00 160907              DCL        VAR(&RMVZCSERV) TYPE(*CHAR) LEN(1) VALUE('Y')           
17.00 160505                                                                                 
18.00 160414              ADDLIBLE   LIB(&WRKLIB)                                            
19.00 160505              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))  
20.00 160526              ADDLIBLE   LIB(&IMODULE)                                           
21.00 160526              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N')) 
22.00 160907              ADDLIBLE   LIB(&ZCSERVICE)                                         
23.00 160907              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZCSERV) VALUE('N'))  
24.00 160526                                                                                 
25.00 160823              /* Update master file */                                           
26.00 160913              CALL       PGM(&WRKLIB/MTFXTX)                                     
27.00 160913              CALL       PGM(&WRKLIB/MTFXCCY)                                    
28.00 160913              CALL       PGM(&WRKLIB/MTFXMOV)                                    
29.00 160822                                                                                 
30.00 160823              /* Scan alert record */                                            
31.00 160823              CALL       PGM(&WRKLIB/MTFXALT)                                    
32.00 160823                                                                                 
33.00 160823              /* Send alert msg or email to specified recipient */               
34.00 160913              CALL       PGM(&WRKLIB/MTFXALTSD)                                  
35.00 160329                                                                                 
36.00 160414              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))    
37.00 160414              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))  
38.00 160907              IF         COND(&RMVZCSERV *EQ 'Y') THEN(RMVLIBLE LIB(&ZCSERVICE)) 
39.00 160823                                                                                 
40.00 160329              ENDPGM                                                             
