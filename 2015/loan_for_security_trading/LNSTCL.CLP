1.00 160414 /******************************************************************************/
2.00 160617 /* REFERENCE NO. : CHG-0200-16 (D6200)                                        */
3.00 160414 /* AUTHOR        : Myles Ieong                                                */
4.00 160414 /* USER ID.      : BI77PGM                                                    */
5.00 160414 /* DATE WRITTEN  : 29 Mar 2016                                                */
6.00 160617 /* DESCRPITION   : 1. Append new transaction records to LNSTTRAN and perform  */
7.00 160617 /*                    Housekeeping.                                           */
8.00 160504 /*                 2. Call LNSTEXTC and LNSTCTR to generate file for user     */
9.00 160504 /*                    to download and process                                 */
10.00 160414 /*                                                                            */
11.00 160414 /******************************************************************************/
12.00 160329          PGM                                                                    
13.00 160414                                                                                 
14.00 160414              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('ZNOTELIB')      
15.00 160414              DCL        VAR(&IMODULE) TYPE(*CHAR) LEN(10) VALUE('IMODULE')      
16.00 160617              DCL        VAR(&ZISTOCK) TYPE(*CHAR) LEN(10) VALUE('ZISTOCK')      
17.00 160505                                                                                 
18.00 160414              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1) VALUE('Y')           
19.00 160414              DCL        VAR(&RMVIMODULE) TYPE(*CHAR) LEN(1) VALUE('Y')          
20.00 160617              DCL        VAR(&RMVZISTOCK) TYPE(*CHAR) LEN(1) VALUE('Y')          
21.00 160505                                                                                 
22.00 160622              DCL        VAR(&REPLY) TYPE(*CHAR) LEN(1)                          
23.00 160622              RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                                  
24.00 160622  ASK1:       SNDPGMMSG  MSG('Personal Loan For Security Trading (EOM), Press+   
25.00 160622                         (G) to go or (X) to exit') TOPGMQ(*EXT) MSGTYPE(*INQ)   
26.00 160622              RCVMSG     PGMQ(*EXT) MSGTYPE(*RPY) MSG(&REPLY)                    
27.00 160622              IF         COND((&REPLY *NE 'G') *AND (&REPLY *NE 'g')  +          
28.00 160622                         *AND (&REPLY *NE 'X') *AND (&REPLY *NE 'x')) +          
29.00 160622                           THEN(GOTO CMDLBL(ASK1))                               
30.00 160622              IF         COND((&REPLY *EQ 'X') *OR (&REPLY *EQ 'x')) +           
31.00 160622                           THEN( GOTO CMDLBL(END))                               
32.00 160622                                                                                 
33.00 160414              ADDLIBLE   LIB(&IMODULE)                                           
34.00 160414              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVIMODULE) VALUE('N')) 
35.00 160617              ADDLIBLE   LIB(&ZISTOCK)                                           
36.00 160617              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZISTOCK) VALUE('N')) 
37.00 160617              ADDLIBLE   LIB(&WRKLIB)                                            
38.00 160617              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))  
39.00 160617                                                                                 
40.00 160505              /* insert latest transaction records and house keeping*/           
40.01 160810              CPYF       FROMFILE(&WRKLIB/LNSTTRAN) TOFILE(&WRKLIB/LNSTTRANBK) + 
40.02 160810                            MBROPT(*REPLACE) FMTOPT(*NOCHK)                      
41.00 160617              CPYF       FROMFILE(&ZISTOCK/IMTRANSB) TOFILE(&WRKLIB/LNSTTRAN) +  
42.00 160617                            MBROPT(*ADD) FMTOPT(*NOCHK)                          
43.00 160617              CALL       PGM(&WRKLIB/LNSTTXUPD)                                  
44.00 160617              CALL       PGM(&WRKLIB/LNSTTXDLT)                                  
45.00 160617                                                                                 
46.00 160504              /* build master file */                                            
47.00 160414              CALL       PGM(&WRKLIB/LNSTEXTC)                                   
48.00 160414                                                                                 
49.00 160504              /* count transaction qty and amt and update lnstpf */              
50.00 160620              CLRPFM     FILE(&WRKLIB/LNSTLCIF)                                  
51.00 160620              CLRPFM     FILE(&WRKLIB/LNSTSCIF)                                  
52.00 160620              CLRPFM     FILE(&WRKLIB/LNSTLSACC)                                 
53.00 160421              RUNSQLSTM  SRCFILE(&WRKLIB/QLNSTSRC) SRCMBR(LNSTSQL) +             
54.00 160421                            COMMIT(*NONE)                                        
55.00 160421              CALL       PGM(&WRKLIB/LNSTCTR)                                    
55.01 160726                                                                                 
55.02 160811 /*D6200*/   OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(LNSTRPT) +             
55.03 160811                        OUTQ(RPTLIB/MISCOUQMIG)                                  
55.04 160811 /*D6200*/   RUNQRY     QRY(&WRKLIB/LNSTRPT)                                     
55.05 160811 /*D6200*/   DLTOVR     FILE(QPQUPRFIL)                                          
56.00 160329                                                                                 
63.00 160414              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))    
64.00 160414              IF         COND(&RMVIMODULE *EQ 'Y') THEN(RMVLIBLE LIB(&IMODULE))  
65.00 160617              IF         COND(&RMVZISTOCK *EQ 'Y') THEN(RMVLIBLE LIB(&ZISTOCK))  
66.00 160622                                                                                 
67.00 160622 END:                                                                            
68.00 160329              ENDPGM                                                             
