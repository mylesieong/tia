1.00 160822      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 160511       ************************************************************************  
3.00 160822       * REFERENCE NO. : CHG-0250-16 (D6250)                                  *  
4.00 160511       * AUTHOR        : Myles Ieong                                          *  
5.00 160511       * USER ID.      : BI77PGM                                              *  
6.00 160908       * DATE WRITTEN  : 08 Sep 2016                                          *  
7.00 160908       * DESCRPITION   : Monitor Fx Alerts Sending PGM                        *  
8.00 160511       *                                                                      *  
9.00 160511       ************************************************************************  
10.00 160908      FMTFXALTPF UF A E           K DISK                                         
11.00 160908      FMTFXALTRV IF   E           K DISK                                         
12.00 160908      FBCM_SMSQ  UF A E           K DISK                                         
13.00 160823      D*****************************************************************         
14.00 160823      D*               VARIABLES / CONSTANT DEFINITION                 *         
15.00 160823      D*****************************************************************         
16.00 160908       * alert criteria amount                                                   
17.00 160908      DVGROUPID         S             10A   INZ('3')                             
18.00 160909      DVEVENTID         S              3P 0 INZ(996)                             
19.00 160908      DVLANGID          S              8A   INZ('EN')                            
20.00 160908      DVCHANMAIL        S              3P 0 INZ(4)                               
21.00 160913      DVCHANSMS         S              3P 0 INZ(3)                               
22.00 160913      DVCHANPR          S              3P 0 INZ(0)                               
23.00 160913      DVMAILLIST        S            256A                                        
24.00 160913      D                 DS                                                       
25.00 160913      DVTXDESC                  1     34                                         
26.00 160913      D  VACT                   1     13                                         
27.00 160913      D  VSPACE1               14     14    INZ(' ')                             
28.00 160913      D  VPET                  15     17                                         
29.00 160913      D  VSPACE2               18     18    INZ(' ')                             
30.00 160913      D  VAMT                  19     34                                         
31.00 160913      C*****************************************************************         
32.00 160913      C*                        MAIN ROUTINE                           *         
33.00 160913      C*****************************************************************         
34.00 160913       *    Get mailing list from mtfxaltrv                                      
35.00 160913      C                   EVAL      VMAILLIST = ''                               
36.00 160912      C                   READ      MTFXALTRV                                    
37.00 160912      C                   DOW       NOT %EOF(MTFXALTRV)                          
38.00 170629 D7xxxC                                                                          
39.00 170629 D7xxx **   Write first receiver on mail list                                    
40.00 170629 D7xxxC                   IF        VMAILLIST = ''                               
41.00 170629 D7xxxC                                                                          
42.00 170629 D7xxxC                   EVAL      VMAILLIST = %TRIM(MFRVML)                    
43.00 170629 D7xxxC                                                                          
44.00 170629 D7xxxC                   ELSE                                                   
45.00 170629 D7xxxC                                                                          
46.00 170629 D7xxx **   Write other receivers if enough space left in string                 
47.00 160912      C                   IF        %LEN(VMAILLIST) - %LEN(%TRIM(VMAILLIST)) >   
48.00 160912      C                             %LEN(%TRIM(MFRVML)+';')                      
49.00 160912      C                   EVAL      VMAILLIST = %TRIM(MFRVML) + ';' + VMAILLIST  
50.00 160912      C                   ENDIF                                                  
51.00 170629 D7xxxC                                                                          
52.00 170629 D7xxxC                   ENDIF                                                  
53.00 170629 D7xxxC                                                                          
54.00 160912      C                   READ      MTFXALTRV                                    
55.00 160912      C                   ENDDO                                                  
56.00 160912      C                                                                          
57.00 160913       *    Iterate master file                                                  
58.00 160908      C                   READ      MTFXALTPF                                    
59.00 160908      C                   DOW       NOT %EOF(MTFXALTPF)                          
60.00 160908      C                                                                          
61.00 160919      C                   IF        MFATMTH='M' AND MFATFLG ='P'                 
62.00 160919      C                             AND VMAILLIST <> ''                          
63.00 160908       **   Write to BCM_SMSQ                                                    
64.00 160908      C                   EVAL      GROUPID = VGROUPID                           
65.00 160908      C                   EVAL      IDUSER = MFRVCIF                             
66.00 160908      C                   EVAL      EVENTID = VEVENTID                           
67.00 160908      C                   EVAL      LANGID = VLANGID                             
68.00 160908      C                   EVAL      CHAN = VCHANMAIL                             
69.00 160912      C                   EVAL      CHANPR = VCHANPR                             
70.00 160912      C                   EVAL      LASTUPD = %TIMESTAMP()                       
71.00 160912      C                   EVAL      S1 = MFATTLDS                                
72.00 160912      C                   EVAL      VACT = %CHAR(%DEC(MFATACT:13:0))             
73.00 160912      C                   MOVE      MFATPET       VPET                           
74.00 160912      C                   EVAL      VAMT = %CHAR(%DEC(MFATTC:13:2))              
75.00 160912      C                   MOVEL     VTXDESC       S2                             
76.00 160912      C                   EVAL      VACT = %CHAR(%DEC(MFATTACT:13:0))            
77.00 160912      C                   MOVE      MFATTPET      VPET                           
78.00 160912      C                   EVAL      VAMT = %CHAR(%DEC(MFATTTC:13:2))             
79.00 160912      C                   MOVEL     VTXDESC       S3                             
80.00 160912      C                   EVAL      S4 = MFATCIF                                 
81.00 160912      C                   EVAL      S5 = MFATTIM                                 
82.00 160912      C                   EVAL      S7 = VMAILLIST                               
83.00 160908      C                   WRITE     RBCM_SMSQ                                    
84.00 160908      C                                                                          
85.00 160913       **   Update action flag in MTFXALTPF                                      
86.00 160908      C                   EVAL      MFATFLG ='C'                                 
87.00 160908      C                   UPDATE    RMTFXALTPF                                   
88.00 160908      C                                                                          
89.00 160908      C                   ENDIF                                                  
90.00 160908      C                                                                          
91.00 160908      C                   READ      MTFXALTPF                                    
92.00 160908      C                                                                          
93.00 160511      C                   ENDDO                                                  
94.00 160823      C                                                                          
95.00 160511      C                   SETON                                        LR        
