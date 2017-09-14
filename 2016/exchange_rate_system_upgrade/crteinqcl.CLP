1.00 121119 /*---------------------------------------------------------------------*/       
2.00 140212 /*        REFERENCE NO. : CHG-0058-14 (D4058)                          */       
3.00 140128 /*        AUTHOR        : ALBERT AU                                    */       
4.00 140128 /*        CHANGED DATE  : 28 JAN 2014                                  */       
5.00 140212 /*        REASON        : Currency Exchange Application                */       
6.00 130918 /*                                                                     */       
7.00 121119 /*---------------------------------------------------------------------*/       
8.00 160922 /*        REFERENCE NO. : CHG-0250-16 (D6250)                          */       
9.00 160922 /*        AUTHOR        : Myles Ieong                                  */       
10.00 160922 /*        CHANGED DATE  : 22 Sep 2016                                  */       
11.00 160922 /*        REASON        : Change Working Library to I700BCM            */       
12.00 160922 /*---------------------------------------------------------------------*/       
13.00 30428              PGM                                                                
14.00 130729 /* LIB */                                                                       
15.00 160922 /*D6250      DCL        VAR(&WRKLIB)  TYPE(*CHAR) LEN(10) VALUE('ZCHEXAPP')   */
16.00 160922 /*D6250*/    DCL        VAR(&WRKLIB)  TYPE(*CHAR) LEN(10) VALUE('I700BCM')      
17.00 140128              DCL        VAR(&ICBS1)   TYPE(*CHAR) LEN(10) VALUE('ICBSBCMDB1')   
18.00 140128              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
19.00 140218              DCL        VAR(&BCMGPL)  TYPE(*CHAR) LEN(10) VALUE('BCMGPL')       
20.00 130731 /* VAR */                                                                       
21.00 140128              DCL        VAR(&RMVWRKLIB)  TYPE(*CHAR) LEN(1) VALUE('Y')          
22.00 140128              DCL        VAR(&RMVICBS1)   TYPE(*CHAR) LEN(1) VALUE('Y')          
23.00 140128              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')          
24.00 140218              DCL        VAR(&RMVBCMGPL)  TYPE(*CHAR) LEN(1) VALUE('Y')          
25.00 140128                                                                                 
26.00 140128              DCL        VAR(&USER)      TYPE(*CHAR) LEN(10)                     
27.00 140218              DCL        VAR(&TMOPT)     TYPE(*CHAR) LEN(6) VALUE('RTEINQ')      
28.00 140128              DCL        VAR(&TLEVEL)    TYPE(*CHAR) LEN(1) VALUE('0')           
29.00 140128              DCL        VAR(&INOPT)     TYPE(*CHAR) LEN(1)                      
30.00 140128              DCL        VAR(&TOPT)      TYPE(*CHAR) LEN(2)                      
31.00 140128                                                                                 
32.00 131003              DCL        VAR(&BRN)       TYPE(*CHAR) LEN(3) VALUE(' ')           
33.00 131003              DCL        VAR(&IBRN)      TYPE(*CHAR) LEN(3) VALUE(' ')           
34.00 131003              DCL        VAR(&BNAME)     TYPE(*CHAR) LEN(30) VALUE(' ')          
35.00 131003              DCL        VAR(&AUT)       TYPE(*CHAR) LEN(1) VALUE('N')           
36.00 130801 /*****************************************************************************/ 
37.00 130731                                                                                 
38.00 130731  /* ADD LIB */                                                                  
39.00 140128              ADDLIBLE   LIB(&WRKLIB)                                            
40.00 140128              MONMSG MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))      
41.00 130729                                                                                 
42.00 140128              ADDLIBLE   LIB(&ICBS1)                                             
43.00 140128              MONMSG MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVICBS1)  VALUE('N'))      
44.00 140128                                                                                 
45.00 140128              ADDLIBLE   LIB(&IMODULE)                                           
46.00 140128              MONMSG MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N'))     
47.00 140128                                                                                 
48.00 140218              ADDLIBLE   LIB(&BCMGPL)                                            
49.00 140218              MONMSG MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVBCMGPL) VALUE('N'))      
50.00 140218                                                                                 
51.00 130801  /***************************************************************************/  
52.00 130801                                                                                 
53.00 130801  /* PROGRAM */                                                                  
54.00 140218              RTVJOBA    USER(&USER)                                             
55.00 140212                                                                                 
56.00 131003              CALL       PGM(CHKAUT) PARM(&USER &TMOPT &TLEVEL &TOPT +           
57.00 131003                           &BRN &IBRN &BNAME &AUT)                               
58.00 140218                                                                                 
59.00 140212  /* Check User Level */                                                         
60.00 140128              IF         COND(&AUT *EQ 'N') THEN(DO)                             
61.00 131003                         RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                       
62.00 131003                         SNDPGMMSG  MSG('YOU ARE NOT AUTHORIZED TO PERFORM +     
63.00 131003                                 THIS FUNCTION') TOPGMQ(*EXT)                    
64.00 131003                         GOTO CMDLBL(EXIT)                                       
65.00 131003                         ENDDO                                                   
66.00 140128                                                                                 
67.00 140218              CALL       PGM(CRTEINQ)                                            
68.00 130801  /**************************************************************************/   
69.00 130801                                                                                 
70.00 130729  /* REMOVE LIB */                                                               
71.00 130731                                                                                 
72.00 140128  EXIT:       IF         COND(&RMVWRKLIB  *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))   
73.00 140128              IF         COND(&RMVICBS1   *EQ 'Y') THEN(RMVLIBLE LIB(&ICBS1))    
74.00 140128              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))  
75.00 140218              IF         COND(&RMVBCMGPL  *EQ 'Y') THEN(RMVLIBLE LIB(&BCMGPL))   
76.00 130729  END:        ENDPGM                                                             
77.00 130731                                                                                 
