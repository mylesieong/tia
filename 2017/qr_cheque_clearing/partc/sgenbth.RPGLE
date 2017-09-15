1.00 140410      /*************************************************************/            
2.00 140410      /*   FILE      : SGENBTH                                     */            
3.00 140902      /*   REFERENCE : CHG-179-14                                  */            
4.00 140410      /*   USER      : BG58 Wine Chan                              */            
5.00 140410      /*   DATE      : 10 Apr 2014                                 */            
6.00 140410      /*   PURPOSE   : Write The Batch Number For The Success      */            
7.00 140410      /*               Income Cheque And Generate Report           */            
8.00 140410      /*************************************************************/            
9.00 141201      /*   REFERENCE : CHG-437-14                                  */            
10.00 141201      /*   USER      : BG58 Wine Chan                              */            
11.00 141201      /*   DATE      : 25 Nov 2014                                 */            
12.00 141201      /*   PURPOSE   : Modify to check the cheque is it has        */            
13.00 141201      /*               duplicate record                            */            
14.00 170824      /*************************************************************/            
15.00 170906      /*   REFERENCE : CHG-266-17                                  */            
16.00 170824      /*   USER      : BI77 Myles Ieong                            */            
17.00 170824      /*   DATE      : 24 Aug 2017                                 */            
18.00 170824      /*   PURPOSE   : Add Amount Field and Set the Value          */            
19.00 141201      /*************************************************************/            
20.00 140410      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
21.00 140410       ************************************************************************  
22.00 140410       * File Specification                                                      
23.00 140410       ************************************************************************  
24.00 140417      FSCHQWRK   UF A E             DISK                                         
25.00 140509      FSCHQLOG   UF A E             DISK                                         
26.00 141201 D4437FSCHQBKL1  IF   E           K DISK     RENAME(RSCHQLOG:RSCHQBKL1)          
27.00 140410      FTAP001    IF   E           K DISK                                         
28.00 140410       **************************************************************************
29.00 140410       * DEFINE VARIABLE                                                        *
30.00 140410       **************************************************************************
31.00 140410       *                                                                         
32.00 140410      D KDMBK           S              3S 0 INZ(1)                               
33.00 140410      D CHQBA1          S              2A   INZ('CH')                            
34.00 140905      D TSCHBATNO       S             10A                                        
35.00 141201 D4437D KACCNUM         S             10S 0                                      
36.00 141201 D4437D KCHQNUM         S              7S 0                                      
37.00 140410       **************************************************************************
38.00 140410       * KEY DEFINE                                                             *
39.00 140410       **************************************************************************
40.00 140410       * Key for TAP001                                                          
41.00 140410      C     KTAP001       KLIST                                                  
42.00 140410      C                   KFLD                    KDMBK                          
43.00 140410      C                                                                          
44.00 141201 D4437 * Key for SCHQBKL1                                                        
45.00 141201 D4437C     KSCHQBKL1     KLIST                                                  
46.00 141201 D4437C                   KFLD                    KACCNUM                        
47.00 141201 D4437C                   KFLD                    KCHQNUM                        
48.00 141125      C                                                                          
49.00 140410       **************************************************************************
50.00 140410       * MAIN ROUTINE                                                           *
51.00 140410       **************************************************************************
52.00 140415      C     *ENTRY        PLIST                                                  
53.00 140417      C                   PARM                    TSCHBATNO                      
54.00 140415      C                                                                          
55.00 140905 D4179C                   EVAL      TSCHBATNO = ' '                              
56.00 140410      C                   READ      SCHQWRK                                      
57.00 140410      C                   DOW       NOT %EOF(SCHQWRK)                            
58.00 140417      C                   EVAL      LSCHACCNUM = SCHACCNUM                       
59.00 140509      C                   MOVE      SCHCHQNUM     LSCHCHQNUM                     
60.00 170906 D7266C                   MOVE      SCHAMT        LSCHAMT                        
61.00 140417      C                   EVAL      LSCHDATE   = SCHDATE                         
62.00 140417      C                   EVAL      LSCHTIME   = SCHTIME                         
63.00 140417      C                   EVAL      LSCHSTATUS = SCHSTATUS                       
64.00 140417      C                   EVAL      LSCHREASON = SCHREASON                       
65.00 140417      C                   EVAL      LSCHBATNO  = ' '                             
66.00 140417      C                                                                          
67.00 140410      C                   IF        SCHSTATUS = 'Y'                              
68.00 140905      C                                                                          
69.00 140905 D4179C                   IF        TSCHBATNO = ' '                              
70.00 140410      C     KTAP001       CHAIN     TAP001                                       
71.00 140410      C                   EVAL      JULDAT = DSDT                                
72.00 140410      C                   CALL      'DFJJTOYY'                                   
73.00 140410      C                   PARM                    JULDAT            7 0          
74.00 140410      C                   PARM                    PLNDAT            8 0          
75.00 140410      C                   Z-ADD     0             SEQNO             2 0          
76.00 140410      C                   MOVE      *BLANK        BATSEQ            2            
77.00 140410      C     *DTAARA       DEFINE                  CHQBNO            2            
78.00 140410      C     *LOCK         IN        *DTAARA                                      
79.00 140410      C                   MOVE      CHQBNO        SEQNO                          
80.00 140410      C                   ADD       1             SEQNO                          
81.00 140410      C                   MOVE      SEQNO         BATSEQ                         
82.00 140410      C                   MOVE      BATSEQ        CHQBNO                         
83.00 140410      C                   OUT       *DTAARA                                      
84.00 140410      C                   UNLOCK    *DTAARA                                      
85.00 140410      C                   MOVE      PLNDAT        CHQBA3            6            
86.00 140410      C     CHQBA1        CAT       CHQBA3        TSCHBATNO                      
87.00 140410      C                   CAT       BATSEQ:0      TSCHBATNO                      
88.00 140905 D4179C                   ENDIF                                                  
89.00 141125      C                                                                          
90.00 141201 D4437C                   EVAL      KACCNUM = SCHACCNUM                          
91.00 141201 D4437C                   MOVE      SCHCHQNUM     KCHQNUM                        
92.00 141201 D4437C     KSCHQBKL1     CHAIN     SCHQBKL1                                     
93.00 141201 D4437C                   IF        NOT %FOUND(SCHQBKL1)                         
94.00 141125      C                   EVAL      SCHBATNO = TSCHBATNO                         
95.00 141125      C                   EVAL      LSCHBATNO = TSCHBATNO                        
96.00 141201 D4437C                   ELSE                                                   
97.00 141201 D4437C                   EVAL      SCHSTATUS = 'N'                              
98.00 141201 D4437C                   EVAL      LSCHSTATUS = 'N'                             
99.00 141201 D4437C                   EVAL      SCHREASON = 'Duplicate Chq No.'              
100.00 141201 D4437C                   EVAL      LSCHREASON = 'Duplicate Chq No.'             
101.00 141201 D4437C                   ENDIF                                                  
102.00 141125      C                                                                          
103.00 140410      C                   UPDATE    RSCHQWRK                                     
104.00 140410      C                   ENDIF                                                  
105.00 140509      C                   WRITE     RSCHQLOG                                     
106.00 140410      C                                                                          
107.00 140410      C                   READ      SCHQWRK                                      
108.00 140410      C                   ENDDO                                                  
109.00 140410      C                                                                          
110.00 140410      C                   SETON                                        LR        
111.00 140410      C                                                                          
