1.00 140320       **************************************************************************
2.00 140724       *   PROGRAM ID    : SCBATALL                                             *
3.00 140902       *   IT REF. NO.   : CHG-179-14                                           *
4.00 140320       *   AUTHOR        : Wine Chan(BG58PGM)                                   *
5.00 140324       *   DATE          : 24/Mar/2014                                          *
6.00 140425       *   DESCRIPTION   : Insert the Cheque header and detail data             *
7.00 140320       **************************************************************************
8.00 170906       *   REFERENCE : CHG-266-17 (D7266)                          *             
9.00 170824       *   USER      : BI77 Myles Ieong                            *             
10.00 170824       *   DATE      : 24 Aug 2017                                 *             
11.00 170824       *   PURPOSE   : Add Amount Summary for QR Code Cheque       *             
12.00 170824       *                                                           *             
13.00 170824       *************************************************************             
14.00 140324      FCHQDTL    O    E             DISK                                         
15.00 140324      FCHQHDR    O    E             DISK                                         
16.00 140422      FSCHQWRK   IF   E             DISK    USROPN                               
17.00 140324      FTAP002L5  IF   E           K DISK                                         
18.00 140324      FTAP001    IF   E           K DISK                                         
19.00 140320       *                                                                         
20.00 140320       **************************************************************************
21.00 140320       * DEFINE VARIABLE                                                         
22.00 140320       **************************************************************************
23.00 140711       *System Information                                                       
24.00 140711      D DSPGID         SDS                                                       
25.00 140711      D  WKDATE               191    198  0                                      
26.00 140711      D  WKSTN                244    253                                         
27.00 140711      D  USER                 254    263                                         
28.00 140320       *                                                                         
29.00 140425      D TCHSEQ          S              5S 0                                      
30.00 170906 D7266D TCHAMT          S             15S 2                                      
31.00 140324      D KDMBK           S              3S 0 INZ(1)                               
32.00 140422      D BATID           S             10A                                        
33.00 140422      D CCY             S              3A                                        
34.00 140422      D FLAG            S              1A                                        
35.00 140320       **************************************************************************
36.00 140320       * KEY DEFINE                                                              
37.00 140320       **************************************************************************
38.00 140324       * Key for TAP002L5                                                        
39.00 140324      C     KTAP002L5     KLIST                                                  
40.00 140324      C                   KFLD                    KDMBK                          
41.00 140422      C                   KFLD                    DACTNO                         
42.00 140324      C                                                                          
43.00 140324       * Key for TAP001                                                          
44.00 140324      C     KTAP001       KLIST                                                  
45.00 140324      C                   KFLD                    KDMBK                          
46.00 140324      C                                                                          
47.00 140324       **************************************************************************
48.00 140509       * MAIN ROUTINE - Wirte the Header File data                               
49.00 140324       **************************************************************************
50.00 140422      C     *ENTRY        PLIST                                                  
51.00 140422      C                   PARM                    BATID                          
52.00 140422      C                   PARM                    CCY                            
53.00 140422      C                   PARM                    FLAG                           
54.00 140422      C                                                                          
55.00 140422      C                   IF        FLAG = 'Y'                                   
56.00 140324      C     KTAP001       CHAIN     TAP001                                       
57.00 140324      C                   EVAL      JULDAT = DSDT                                
58.00 140324      C                   CALL      'DFJJTOYY'                                   
59.00 140324      C                   PARM                    JULDAT            7 0          
60.00 140324      C                   PARM                    PLNDAT            8 0          
61.00 140422      C                   EVAL      HBTHNO = BATID                               
62.00 140422      C                   EVAL      HBHCYN = CCY                                 
63.00 140610      C                   CALL      'CCCYCHK'                                    
64.00 140610      C                   PARM                    CCY                            
65.00 140610      C                   PARM                    OUTCCY            3 0          
66.00 140610      C                   PARM                    ERRIND            1            
67.00 140610      C                   EVAL      HBHCCY = OUTCCY                              
68.00 140324      C                   EVAL      HEFFDT = PLNDAT                              
69.00 140324      C                   EVAL      HCRAPL = 40                                  
70.00 140324      C                   EVAL      HCRACT = 1010700                             
71.00 140324      C                   EVAL      HCRCST = 800                                 
72.00 140422      C                   EVAL      HCRDES = CCY + ' CHEQUE CLEARING'            
73.00 140324      C                   EXSR      WREDTL                                       
74.00 140324      C                   EVAL      HCRNOR = TCHSEQ                              
75.00 170906 D7266C                   EVAL      HCRAMT = TCHAMT                              
76.00 140324      C                   EVAL      HPSNOR = 0                                   
77.00 140327      C                   EVAL      HSTSID = 'IHD0002'                           
78.00 140324      C                   EVAL      HBTHST = 'PND'                               
79.00 140711      C                   EVAL      HUPDUS = USER                                
80.00 140324      C                   EVAL      HUPDDT = PLNDAT                              
81.00 140324      C                   TIME                    HUPDTM                         
82.00 140711      C                   EVAL      HVFYUS = USER                                
83.00 140324      C                   EVAL      HVFYDT = PLNDAT                              
84.00 140324      C                   TIME                    HVFYTM                         
85.00 140711      C                   EVAL      HPSTUS = USER                                
86.00 140324      C                   EVAL      HPSTDT = PLNDAT                              
87.00 140324      C                   TIME                    HPSTTM                         
88.00 140324      C                   WRITE     RCHQHDR                                      
89.00 140422      C                   ENDIF                                                  
90.00 140422      C                                                                          
91.00 140324      C                   SETON                                        LR        
92.00 140324       **************************************************************************
93.00 140509       * Subroutine WREDTL - Wirte the Detail File data                          
94.00 140324       **************************************************************************
95.00 140324      C     WREDTL        BEGSR                                                  
96.00 140324      C                                                                          
97.00 140422      C                   EVAL      TCHSEQ = 0                                   
98.00 170906 D7266C                   EVAL      TCHAMT = 0                                   
99.00 140422      C                   OPEN      SCHQWRK                                      
100.00 140422      C                   READ      SCHQWRK                                      
101.00 140422      C                   DOW       NOT %EOF(SCHQWRK)                            
102.00 140422      C                   IF        SCHSTATUS = 'Y'                              
103.00 140324      C                   EVAL      TCHSEQ = TCHSEQ + 1                          
104.00 170906 D7266C                   EVAL      TCHAMT = TCHAMT + SCHAMT                     
105.00 140422      C                   EVAL      DBTHNO = BATID                               
106.00 140324      C                   EVAL      DCHSEQ = TCHSEQ                              
107.00 140324      C                   EVAL      DAPLCD = 20                                  
108.00 140422      C                   EVAL      DACTNO = SCHACCNUM                           
109.00 140422      C                                                                          
110.00 140324      C     KTAP002L5     CHAIN     TAP002L5                                     
111.00 140324      C                   IF        %FOUND(TAP002L5)                             
112.00 140324      C                   EVAL      DACTNM = DMSHRT                              
113.00 140324      C                   ELSE                                                   
114.00 140324      C                   EVAL      DACTNM = 'NO NAME'                           
115.00 140324      C                   ENDIF                                                  
116.00 140324      C                                                                          
117.00 140424      C*                  EVAL      DBRNCH = '001'                               
118.00 140424      C*                  EVAL      DMRKSG = 'RET'                               
119.00 170906 D7266C                   MOVE      SCHAMT        DCHQAM                         
120.00 140509      C                   MOVE      SCHCHQNUM     DCHQNO                         
121.00 140509      C                   EVAL      DCHQDS = %Char(SCHCHQNUM)                    
122.00 140422      C                   EVAL      DSTSID = 'IHD0002'                           
123.00 140324      C                   EVAL      DCTHST = 'PND'                               
124.00 140711      C                   EVAL      DUPDUS = USER                                
125.00 140324      C                   EVAL      DUPDDT = PLNDAT                              
126.00 140324      C                   TIME                    DUPDTM                         
127.00 140711      C                   EVAL      DPSTUS = USER                                
128.00 140324      C                   EVAL      DPSTDT = PLNDAT                              
129.00 140324      C                   TIME                    DPSTTM                         
130.00 140324      C                   EVAL      DSRVCD = '000'                               
131.00 140324      C                   WRITE     RCHQDTL                                      
132.00 140422      C                   ENDIF                                                  
133.00 140422      C                                                                          
134.00 140422      C                   READ      SCHQWRK                                      
135.00 140324      C                   ENDDO                                                  
136.00 140422      C                   CLOSE     SCHQWRK                                      
137.00 140324      C                                                                          
138.00 140324      C                   ENDSR                                                  
139.00 140324      C                                                                          
140.00 140324      C                                                                          
