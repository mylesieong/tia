1.00 0      H DATEDIT(*DMY) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 0      A************************************************************************* 
3.00 0      A*  Name     :  LNSTPST                                                  * 
4.00 160622      A*  Ref ID   :  CHG-200-16 (D6200)                                       * 
5.00 0      A*  Author   :  Myles Ieong                                              * 
6.00 0      A*  User ID  :  BI77PGM                                                  * 
7.00 0      A*  Date     :  21-APR-2016                                              * 
8.00 160425      A*  Purpose  :  Post of penalty fee and G/L of security loan type        * 
9.00 160728      A************************************************************************* 
10.00 160422      FLNSTPF    UF   E           K DISK                                         
11.00 160506      FLNSTLOG   UF A E           K DISK                                         
12.00 160720      FLNSTDBGLPFUF A E           K DISK                                         
13.00 160720      FLNSTCRGLPFUF A E           K DISK                                         
14.00 160721      D*********************************************************************     
15.00 160721      D*                       Variable Definition                         *     
16.00 160721      D*********************************************************************     
17.00 160422      D TODAYYMD        S              8P 0                                      
18.00 160721      D TODAYDMY        S              6P 0                                      
19.00 160721      D TTIME           S               T                                        
20.00 160721      DDBGLAC          UDS            20                                         
21.00 160721      D  DBGLACC                1     12                                         
22.00 160721      D  DBGLCTR               13     17                                         
23.00 160721      D  DBGLCCY               18     20                                         
24.00 160721      DCRGLAC          UDS            20                                         
25.00 160721      D  CRGLACC                1     12                                         
26.00 160721      D  CRGLCTR               13     17                                         
27.00 160721      D  CRGLCCY               18     20                                         
28.00 160721      C*********************************************************************     
29.00 160721      C*                            Key List                               *     
30.00 160721      C*********************************************************************     
31.00 160620      C     KLNP003       KLIST                                                  
32.00 160620      C                   KFLD                    KBK               3 0          
33.00 160620      C                   KFLD                    KNOTE            12 0          
34.00 160620      C                   KFLD                    KRECIND           1            
35.00 160620      C*********************************************************************     
36.00 160620      C*                          Main Routine                             *     
37.00 160620      C*********************************************************************     
38.00 160620      C*                                                                         
39.00 160620      C*    Get today & convert to ddmmyy                                        
40.00 160620      C*                                                                         
41.00 160422      C                   CALL      'DICBSYMD'                                   
42.00 160422      C                   PARM                    TODAYYMD                       
43.00 160620      C                                                                          
44.00 160422      C                   CALL      'DFYYTODD'                                   
45.00 160422      C                   PARM                    TODAYYMD                       
46.00 160425      C                   PARM                    TODAYDMY                       
47.00 160425      C                   PARM                    TODAYDMYY         8 0          
48.00 160721      C*                                                                         
49.00 160721      C*    Read GL Account, Cost Center and Currency                            
50.00 160721      C*                                                                         
51.00 160721      C     *DTAARA       DEFINE    LNSTDBGLAC    DBGLAC                         
52.00 160721      C                   IN        DBGLAC                                       
53.00 160721      C     *DTAARA       DEFINE    LNSTCRGLAC    CRGLAC                         
54.00 160721      C                   IN        CRGLAC                                       
55.00 160721      C*                                                                         
56.00 160620      C*    Iterate master file                                                  
57.00 160620      C*                                                                         
58.00 160425      C                   READ      LNSTPF                                       
59.00 160425      C                   DOW       NOT %EOF(LNSTPF)                             
60.00 160620      C**                                                                        
61.00 160620      C**   Calc charge ammount                                                  
62.00 160620      C**                                                                        
63.00 160426      C                   EVAL      SIFEE1 =  LNSTPNT *100                       
64.00 160426      C                   EVAL      LCYE =  LNSTPNT                              
65.00 160726      C                                                                          
66.00 160801      C                   IF        LNSTLNCMCN <> 0                              
67.00 160801      C                   CALL      'GDRTRATE'                                   
68.00 160801      C                   PARM      LNSTLNCMCN    PFRCCY            3 0          
69.00 160801      C                   PARM      0             PTOCCY            3 0          
70.00 160801      C                   PARM      'T'           PEXCHGTYP         1            
71.00 160801      C                   PARM      0             PEXCHGDT          8 0          
72.00 160801      C                   PARM      0             PEXCHGTM          6 0          
73.00 160801      C                   PARM                    PRATE            11 7          
74.00 160801      C                   PARM                    PFRCCYRATE       11 7          
75.00 160801      C                   PARM                    PFRDATE           8 0          
76.00 160801      C                   PARM                    PFRTIME           6 0          
77.00 160801      C                   PARM                    PTOCCYRATE       11 7          
78.00 160801      C                   PARM                    PTODATE           8 0          
79.00 160801      C                   PARM                    PTOTIME           6 0          
80.00 160801      C                   PARM                    PSTATUS           1            
81.00 160801      C                   IF        PSTATUS = '0'                                
82.00 160802 D6200C*                  EVAL      SIFEE1 =  SIFEE1 * PRATE                     
83.00 160802 D6200C*                  EVAL      LCYE =  LCYE * PRATE                         
84.00 160801      C                   ENDIF                                                  
85.00 160801      C                   ELSE                                                   
86.00 160801      C                   EVAL      PRATE=1                                      
87.00 160802 D6200C*                  EVAL      SIFEE1 =  SIFEE1 * PRATE                     
88.00 160802 D6200C*                  EVAL      LCYE =  LCYE * PRATE                         
89.00 160801      C                   ENDIF                                                  
90.00 160620      C**                                                                        
91.00 160620      C**   Aciton 1: Execute Penalty Fee Posting                                
92.00 160620      C**                                                                        
93.00 160810 6200BC                   IF        LNSTFPSTF='X'                                
94.00 160426      C                                                                          
95.00 160721       *               ***post penalty fee***                                    
96.00 160422      C                   Z-ADD     1             KBANK             3 0          
97.00 160422      C                   EVAL      SINOTE =  LNSTLNNOTE                         
98.00 160422      C                   EVAL      SIEFDT =  TODAYDMY                           
99.00 160422      C                   EVAL      SIBK   = 1                                   
100.00 160422      C                   EVAL      SIFNBR = 3                                   
101.00 160422      C                   EVAL      SIBLCA = '1'                                 
102.00 160422      C                   MOVEL     '16'          CHGCDE                         
103.00 160422      C                   MOVE      *BLANKS       SICLSF                         
104.00 160422      C                   MOVE      'R'           LHRTM                          
105.00 160422      C                   MOVE      ' '           LHCSYM            8            
106.00 160422      C                   MOVE      0             LHSSYM           10 0          
107.00 160422      C                   MOVE      ' '           LHVSYM           10            
108.00 160422      C                   MOVE      ' '           LNINDR            1            
109.00 160422      C                   MOVE      *BLANKS       SICLSF                         
110.00 160422      C                   EVAL      SIDESC = ''                                  
111.00 160422      C                                                                          
112.00 160422      C                   CALL      'LN0225'                                     
113.00 160422      C/COPY LNSORC,LNSS25C                                                      
114.00 160721       *               ***/post penalty fee***                                   
115.00 160422      C                                                                          
116.00 160721       *               ***update post fee flag in lnstpf***                      
117.00 160422      C                   IF        RETURN = '3'                                 
118.00 160422      C                   EVAL      LNSTFPSTF='C'                                
119.00 160422      C                   UPDATE    RLNSTPF                                      
120.00 160422      C                   ENDIF                                                  
121.00 160721       *               ***/update post fee flag in lnstpf***                     
122.00 160425      C                                                                          
123.00 160721       *               ***write log file***                                      
124.00 160620      C                   EVAL      LNLGDTE=TODAYYMD                             
125.00 160620      C                   EVAL      LNLGTIM=%CHAR(TTIME)                         
126.00 160620      C                   EVAL      LNLGLNNOTE=LNSTLNNOTE                        
127.00 160620      C                   EVAL      LNLGRWDTE=LNSTRWDTE                          
128.00 160620      C                   EVAL      LNLGACT='P'                                  
129.00 160620      C                   EVAL      LNLGLNCMCN=LNSTLNCMCN                        
130.00 160620      C*                  EVAL      LNLGLNCPET=LNSTLNCPET                        
131.00 160620      C                   EVAL      LNLGCHG=LNSTPNT                              
132.00 160620      C                   EVAL      LNLGSTS=''                                   
133.00 160620      C                   IF        RETURN = '3'                                 
134.00 160620      C                   EVAL      LNLGSTS='P'                                  
135.00 160620      C                   ELSE                                                   
136.00 160620      C                   EVAL      LNLGSTS='E'                                  
137.00 160620      C                   ENDIF                                                  
138.00 160620      C                   WRITE     RLNSTLOG                                     
139.00 160721       *               ***/write log file***                                     
140.00 160422      C                                                                          
141.00 160425      C                   ENDIF                                                  
142.00 160620      C                                                                          
143.00 160620      C**                                                                        
144.00 160620      C**   Action 2: Prepare GL Posting Files                                   
145.00 160620      C**                                                                        
146.00 160810 6200BC                   IF        LNSTFPSTGL='X'                               
147.00 160425      C                                                                          
148.00 160721       *               ***write dbglpf***                                        
149.00 160721      C                   EVAL      DBJCST=%INT(DBGLCTR)                         
150.00 160721      C                   EVAL      DBJACN=%INT(DBGLACC)                         
151.00 160802 D6200C*                  EVAL      DBJAMT=LCYE                                  
152.00 160802 D6200C                   EVAL      DBJAMT=LNSTPNT * PRATE                       
153.00 160721      C                   EVAL      DBJCCY=%INT(DBGLCCY)                         
154.00 160721      C                   EVAL      DBJFXR=1                                     
155.00 160802 D6200C*                  EVAL      DBJLCY=LCYE                                  
156.00 160802 D6200C                   EVAL      DBJLCY=LNSTPNT * PRATE                       
157.00 160721      C                   EVAL      DBVDAT=TODAYYMD                              
158.00 160721      C                   EVAL      DBNAR1='LN SECURITIES '+%CHAR(LNSTLNNOTE)    
159.00 160426      C                   EVAL      DBNAR2=''                                    
160.00 160426      C                   EVAL      DBNAR3=''                                    
161.00 160426      C                   EVAL      DBEOFA='999'                                 
162.00 160426      C                   EVAL      DBAOFA='999'                                 
163.00 160426      C                   WRITE     RDBTXS                                       
164.00 160721       *               ***/write dbglpf***                                       
165.00 160425      C                                                                          
166.00 160721       *               ***write crglpf***                                        
167.00 160721      C                   EVAL      CRJCST=%INT(CRGLCTR)                         
168.00 160721      C                   EVAL      CRJACN=%INT(CRGLACC)                         
169.00 160802 D6200C*                  EVAL      CRJAMT=LCYE                                  
170.00 160802 D6200C                   EVAL      CRJAMT=LNSTPNT * PRATE                       
171.00 160721      C                   EVAL      CRJCCY=%INT(CRGLCCY)                         
172.00 160720      C                   EVAL      CRJFXR=1                                     
173.00 160802 D6200C*                  EVAL      CRJLCY=LCYE                                  
174.00 160802 D6200C                   EVAL      CRJLCY=LNSTPNT * PRATE                       
175.00 160426      C                   EVAL      CRVDAT=TODAYYMD                              
176.00 160620      C                   EVAL      CRNAR1='LN SECURITIES '+%CHAR(LNSTLNNOTE)    
177.00 160426      C                   EVAL      CRNAR2=''                                    
178.00 160426      C                   EVAL      CRNAR3=''                                    
179.00 160426      C                   EVAL      CREOFA='999'                                 
180.00 160426      C                   EVAL      CRAOFA='999'                                 
181.00 160426      C                   WRITE     RCRTXS                                       
182.00 160721       *               ***/write crglpf***                                       
183.00 160425      C                                                                          
184.00 160425      C                   ENDIF                                                  
185.00 160425      C                                                                          
186.00 160425      C                   READ      LNSTPF                                       
187.00 160425      C                   ENDDO                                                  
188.00 160620      C                                                                          
189.00 160425      C                   SETON                                            LR    
190.00 160620      C*                                                                         
