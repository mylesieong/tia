1.00 0       ************************************************************************  
2.00 160622       * REFERENCE NO. : CHG-0200-16 (D6200)                                  *  
3.00 0       * AUTHOR        : Myles Ieong                                          *  
4.00 0       * USER ID.      : BI77PGM                                              *  
5.00 0       * DATE WRITTEN  : 04 May 2016                                          *  
6.00 0       * DESCRPITION   : Update field LTRASNMN of LNSTTRAN and house-keeping  *  
7.00 0       *                                                                      *  
8.00 0       ************************************************************************  
9.00 0      FTAP001B   IF   E           K DISK                                         
10.00 160510      FLNSTTRAN  UF A E           K DISK                                         
11.00 160810 6200B *define lnsttran house keeping period as 6 month*                         
12.00 160810 6200BDHOUSEKPG         S              3P 0 INZ(6)                               
13.00 160510       *date of tap00101b ddmmyyyy*                                              
14.00 160510      D                 DS                                                       
15.00 160510      D SDSCDT                  1      8  0                                      
16.00 160510      D SDSCDTD                 1      2  0                                      
17.00 160510      D SDSCDTM                 3      4  0                                      
18.00 160510      D SDSCDTY                 5      8  0                                      
19.00 160510       *date of tap00101b yyyymmdd*                                              
20.00 160510      D                 DS                                                       
21.00 160510      D SDSCDTYMD               1      8  0                                      
22.00 160510      D SDSCDTYMDY              1      4  0                                      
23.00 160510      D SDSCDTYMDM              5      6  0                                      
24.00 160510      D SDSCDTYMDD              7      8  0                                      
25.00 160510       *date of house-keeping point yyyymmdd*                                    
26.00 160510      D                 DS                                                       
27.00 160510      D DDSCDTYMD               1      8  0                                      
28.00 160510      D DDSCDTYMDY              1      4  0                                      
29.00 160510      D DDSCDTYMDM              5      6  0                                      
30.00 160510      D DDSCDTYMDD              7      8  0                                      
31.00 160510       *date of house-keeping point yyyymm*                                      
32.00 160510      D                 DS                                                       
33.00 160510      D DASNMN                  1      6  0                                      
34.00 160510      D DASNMNY                 1      4  0                                      
35.00 160510      D DASNMNM                 5      6  0                                      
36.00 160510       *******************keylist**********************************************  
37.00 160510      C     KTAP001B      KLIST                                                  
38.00 160510      C                   KFLD                    KDSBK             3 0          
39.00 160510       *******************main route*******************************************  
40.00 160510       *get year and month of last month*                                        
41.00 160510      C                   Z-ADD     0             SDSCDT                         
42.00 160510      C                   MOVE      1             KDSBK                          
43.00 160510      C     KTAP001B      CHAIN     TAP001B                                      
44.00 160510      C                   IF        %FOUND(TAP001B)                              
45.00 160510      C                   EVAL      SDSCDT=DSCDT                                 
46.00 0      C                   ENDIF                                                  
47.00 160510      C                                                                          
48.00 160510       *translate to YYYYMMDD                                                    
49.00 160510      C                   EVAL      SDSCDTYMDY=SDSCDTY                           
50.00 160510      C                   EVAL      SDSCDTYMDM=SDSCDTM                           
51.00 160510      C                   EVAL      SDSCDTYMDD=SDSCDTD                           
52.00 160510      C                                                                          
53.00 160510       *calc 6 months before SDSCDTYMD                                           
54.00 160510      C                   MOVE      SDSCDTYMD     WRKDAY            8 0          
55.00 160510      C                   MOVE      1             WRKSPDY           2 0          
56.00 160510      C                   MOVE      'M'           WRKPER            1            
57.00 160510      C                   MOVE      0             OCSDT             6 0          
58.00 160510      C                   MOVE      0             RSTDAY            8 0          
59.00 160510      C                   CALL      'DCALBDTE'                                   
60.00 160510      C                   PARM                    WRKDAY                         
61.00 160510      C                   PARM                    HOUSEKPG                       
62.00 160510      C                   PARM                    WRKSPDY                        
63.00 160510      C                   PARM                    WRKPER                         
64.00 160510      C                   PARM                    OCSDT                          
65.00 160510      C                   PARM                    RSTDAY                         
66.00 160510      C                   MOVE      RSTDAY        DDSCDTYMD                      
67.00 160510      C                                                                          
68.00 160510       *calc house-keeping yyyymm                                                
69.00 160510      C                   EVAL      DASNMNY=DDSCDTYMDY                           
70.00 160510      C                   EVAL      DASNMNM=DDSCDTYMDM                           
71.00 160510      C                                                                          
72.00 160510       *iterate lnsttran: house-keeping according to LTRASNMN */                 
73.00 160510      C                   READ      LNSTTRAN                                     
74.00 160510      C                   DOW       NOT %EOF(LNSTTRAN)                           
75.00 160510      C                                                                          
76.00 160510      C                   IF        LTRASNMN=DASNMN                              
77.00 160510      C                   DELETE    LNSTTRAN                                     
78.00 160510      C                   ENDIF                                                  
79.00 160510      C                                                                          
80.00 160510      C                   READ      LNSTTRAN                                     
81.00 0      C                   ENDDO                                                  
82.00 0      C                   SETON                                        LR        
