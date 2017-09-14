1.00 160610 /*-----------------------------------------------------------------*/           
2.00 160715 /*        Program ID.   : GGRPRATECL                               */           
3.00 160715 /*        Program Name  : Get the driect rate from one currency    */           
4.00 160715 /*                        exchange into another currency           */           
5.00 160610 /*        Author        : Myles Ieong                              */           
6.00 160610 /*        Date written  : 2016-06-10                               */           
7.00 160610 /*                                                                 */           
8.00 160610 /*-----------------------------------------------------------------*/           
9.00 160729      PGM     PARM(&PCIF &PFRCCY &PFRAMT &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC    +  
10.00 160729                   &PGROUP &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE &PFRCCYRATE   +  
11.00 160729                   &PFRDATE &PFRTIME &PTOCCYRATE &PTODATE &PTOTIME            +  
12.00 160729                   &PDSPCCYRT &PIND1 &PIND2 &PIND3 &PSTATUS)                     
13.00 160729                                                                                 
14.00 160809              DCL        VAR(&ZCSERVICE) TYPE(*CHAR) LEN(10) VALUE('ZCSERVICE')  
15.00 160809                                                                                 
16.00 160809              DCL        VAR(&RMVZCSERV) TYPE(*CHAR) LEN(1) VALUE('Y')           
17.00 160809                                                                                 
18.00 160729              DCL        VAR(&PCIF) TYPE(*CHAR) LEN(10)                          
19.00 160729              DCL        VAR(&PFRCCY) TYPE(*DEC) LEN(3 0)                        
20.00 160715              DCL        VAR(&PFRAMT) TYPE(*DEC) LEN(13 2)                       
21.00 160715              DCL        VAR(&PTOCCY) TYPE(*DEC) LEN(3 0)                        
22.00 160715              DCL        VAR(&PTOAMT) TYPE(*DEC) LEN(13 2)                       
23.00 160715              DCL        VAR(&PEXCHGTYP) TYPE(*CHAR) LEN(1)                      
24.00 160715              DCL        VAR(&PFUNC) TYPE(*CHAR) LEN(4)                          
25.00 160715              DCL        VAR(&PGROUP) TYPE(*CHAR) LEN(6)                         
26.00 160715              DCL        VAR(&PCHANNEL) TYPE(*CHAR) LEN(6)                       
27.00 160715              DCL        VAR(&PEXCHGDT) TYPE(*DEC) LEN(8 0)                      
28.00 160715              DCL        VAR(&PEXCHGTM) TYPE(*DEC) LEN(6 0)                      
29.00 160715                                                                                 
30.00 160715              DCL        VAR(&PRATE) TYPE(*DEC) LEN(11 7)                        
31.00 160715              DCL        VAR(&PFRCCYRATE) TYPE(*DEC) LEN(11 7)                   
32.00 160715              DCL        VAR(&PFRDATE) TYPE(*DEC) LEN(8 0)                       
33.00 160715              DCL        VAR(&PFRTIME) TYPE(*DEC) LEN(6 0)                       
34.00 160715              DCL        VAR(&PTOCCYRATE) TYPE(*DEC) LEN(11 7)                   
35.00 160715              DCL        VAR(&PTODATE) TYPE(*DEC) LEN(8 0)                       
36.00 160715              DCL        VAR(&PTOTIME) TYPE(*DEC) LEN(6 0)                       
37.00 160715              DCL        VAR(&PDSPCCYRT) TYPE(*DEC) LEN(11 7)                    
38.00 160715              DCL        VAR(&PIND1) TYPE(*CHAR) LEN(1)                          
39.00 160715              DCL        VAR(&PIND2) TYPE(*CHAR) LEN(1)                          
40.00 160715              DCL        VAR(&PIND3) TYPE(*CHAR) LEN(1)                          
41.00 160715              DCL        VAR(&PSTATUS) TYPE(*CHAR) LEN(1)                        
42.00 160610                                                                                 
43.00 160809              ADDLIBLE   LIB(&ZCSERVICE)                                         
44.00 160809              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVZCSERV) +            
45.00 160809                           VALUE('N'))                                           
46.00 160809                                                                                 
47.00 160729  /* The dependency is included in the standard library list on icbs */          
48.00 160715                                                                                 
49.00 160729   CALL       PGM(GGRPRATE)                                                   +  
50.00 160729              PARM(&PCIF &PFRCCY &PFRAMT &PTOCCY &PTOAMT &PEXCHGTYP &PFUNC    +  
51.00 160729                   &PGROUP &PCHANNEL &PEXCHGDT &PEXCHGTM &PRATE &PFRCCYRATE   +  
52.00 160729                   &PFRDATE &PFRTIME &PTOCCYRATE &PTODATE &PTOTIME            +  
53.00 160729                   &PDSPCCYRT &PIND1 &PIND2 &PIND3 &PSTATUS)                     
54.00 160809                                                                                 
55.00 160809             IF         COND(&RMVZCSERV *EQ 'Y') THEN(RMVLIBLE +                 
56.00 160809                          LIB(&ZCSERVICE))                                       
57.00 160729                                                                                 
58.00 160729              ENDPGM                                                             
