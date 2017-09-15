1.00 0       *¬   TA0603 - Delete Cheque Book Order                                                        
2.00 0       *¬                                                                                            
3.00 0       *¬ ?************************** Change Log ***************************?   ?                    
4.00 0       *¬ ?Project ID??Pgmr?? Date  ??Project Description                   ?   ?                    
5.00 0       *¬  XXXXXXXXXX  XXX   XXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                         
6.00 0       *¬  R255        RAL   21May98  Dealer Management (UK)                                         
7.00 0       *¬  RETRO9801A  LJV   23Jun98  MASS MOVE OF CODE FROM I9702                                   
8.00 0       *¬¬?*****************************************************************?   ?                    
9.00 0      F*   PROB NBR  PGMR  PROBLEM DESCRIPTION                         *                             
10.00 0      F*     REL97   MJB   Items found in the I9702.00 release         *                             
11.00 0      F*     Q313    LJV   Withholding tax liability and rate          *                             
12.00 0      F*                    calculation                                *                             
13.00 0      F*     Q414    AXR   Cheque Books and Special Answer             *                             
14.00 0      F*                    Processing                                 *                             
15.00 0      F*     Q315    IOD   Periodic service fees                       *                             
16.00 0      F*¬¬-------------------------------------------------------------*                             
17.00 170814       *   Reference No. : CHG-0266-17 (D7266)                         *                             
18.00 170620       *   User ID       : BI77                                        *                             
19.00 170620       *   User Name     : Myles Ieong                                 *                             
20.00 170620       *   Changed Date  : 20 Jun 2017                                 *                             
21.00 170620       *   Changes       : Call module CQNACCM to delete record for    *                             
22.00 170620       *                   cheque requisition                          *                             
23.00 170620       *******************************************************************                           
24.00 0      FTA0603FM  CF   E             WORKSTN                                                          
25.00 0      F                                     INFDS(INFDS)                                             
26.00 0      F*                                                                                             
27.00 0      FTAP033    UF   E           K DISK                                                             
28.00 0      F*       CHEQUE BOOK ORDER FILE                                                                
29.00 0      F*                                                                                             
30.00 0      FTAP034L1  UF   E           K DISK                                                             
31.00 0      F*       CHEQUE NUMBER RANGES FILE                                                             
32.00 0      F*                                                                                             
33.00 0      FTAP002    UF   E           K DISK                                                             
34.00 0      F*       ACCOUNT MASTER FILE                                                                   
35.00 0      F*                                                                                             
36.00 0      FTAP001    IF   E           K DISK                                                             
37.00 0      F*       TRANSACTION BANK CONTROL                                                              
38.00 0      F*                                                                                             
39.00 0      FTAT30001  O    E           K DISK                                                             
40.00 0      F*       CHEQUE BOOK MAINT LOG BOOK                                                            
41.00 0      F*                                                                                             
42.00 0      F*---------------------------------------------------------------*                             
43.00 0      F* ID F  C  M  L    FUNCTION OF INDICATORS                                                     
44.00 0      F* 03            COMMAND KEY 3 - EXIT PROGRAM                                                  
45.00 0      F* 12            COMMAND KEY 12 - CANCEL / RESTART SETUP                                       
46.00 0      F*---------------------------------------------------------------*                             
47.00 0       /COPY CFSORC,SRW000                                                                           
48.00 0      D*                                                                                             
49.00 0      D*                                                                                             
50.00 0      D**TAP001  AB  11  16 C                                                                        
51.00 0      D**/COPY TASORC,TASS011I                                                                       
52.00 0      D*       FILE INFO DATA STRUCTURE - WORKSTATION                                                
53.00 0      D*                                                                                             
54.00 0      D INFDS           DS                                                                           
55.00 0      D  WSID                 197    206                                                             
56.00 0      D  CSRLOC               370    371B 0                                                          
57.00 0      D*                                                                                             
58.00 0      D                SDS                                                                           
59.00 0      D  DHUSER               254    263                                                             
60.00 0      D*                                                                                             
61.00 0      D/COPY CFSORC,CFLDA                                                                            
62.00 0       *COPY CFSORC,SRW000I                                                                          
63.00 0       /COPY CFSORC,SRC000                                                                           
64.00 0      C*                                                                                             
65.00 0      C*****************************************************************                             
66.00 0      C*         DEFINE INPUT/OUTPUT PARAMET                           *                             
67.00 0      C*****************************************************************                             
68.00 0      C*                                                                                             
69.00 0      C     *ENTRY        PLIST                                                                      
70.00 0      C                   PARM                    G5BK                                               
71.00 0      C                   PARM                    G5TYP                                              
72.00 0      C                   PARM                    G5ACCT                                             
73.00 0      C                   PARM                    G5ORDN                                             
74.00 0      C                   PARM                    PRRTN             1                                
75.00 0      C*                                                                                             
76.00 0      C*---------------------------------------------------------------*                             
77.00 0      C*     KEY FIELD DEFINITIONS                                     *                             
78.00 0      C*---------------------------------------------------------------*                             
79.00 0      C*                                                                                             
80.00 0      C*** SEARCH KEY FOR ACCOUNT MASTER FILE                                                        
81.00 0      C*                                                                                             
82.00 0      C     TAKEY         KLIST                                                                      
83.00 0      C                   KFLD                    G5BK                           BANK NUMBER         
84.00 0      C                   KFLD                    G5TYP                          ACCOUNT TYPE        
85.00 0      C                   KFLD                    G5ACCT                         ACCOUNT NO.         
86.00 0      C*                                                                                             
87.00 0      C*** SEARCH KEY FOR CHEQUE BOOK ORDER FILE                                                     
88.00 0      C*                                                                                             
89.00 0      C     TAKEY2        KLIST                                                                      
90.00 0      C                   KFLD                    G5BK                           BANK NUMBER         
91.00 0      C                   KFLD                    G5TYP                          ACCOUNT TYPE        
92.00 0      C                   KFLD                    G5ACCT                         ACCOUNT NO.         
93.00 0      C                   KFLD                    G5ORDN                         ORDER NUMBER        
94.00 0      C*                                                                                             
95.00 0      C*---------------------------------------------------------------*                             
96.00 0      C*** INITIALIZATION ROUTINE                                                                    
97.00 0      C*---------------------------------------------------------------*                             
98.00 0      C*                                                                                             
99.00 0      C     *LIKE         DEFINE    DRBK          G5BK                                               
100.00 0      C     *LIKE         DEFINE    DRTYP         G5TYP                                              
101.00 0      C     *LIKE         DEFINE    DRACCT        G5ACCT                                             
102.00 0      C     *LIKE         DEFINE    DRORDN        G5ORDN                                             
103.00 0      C     *LIKE         DEFINE    DRFRNG        SVFRNG                                             
104.00 0      C     *LIKE         DEFINE    DRTRNG        SVTRNG                                             
105.00 0      C*                                                                                             
106.00 0      C                   MOVEL     WSID          SCID                                               
107.00 0      C*                                                                                             
108.00 0      C*** RETRIEVE BANK CONTROL RECORD                                                              
109.00 0      C*                                                                                             
110.00 0      C     G5BK          CHAIN     TAP001                             70                            
111.00 0      C*                                                                                             
112.00 0      C                   MOVE      *BLANK        PRRTN                                              
113.00 0      C                   MOVE      *BLANK        ERRFLG            1                                
114.00 0      C*                                                                                             
115.00 0      C*** RETRIEVE ACCOUNT MASTER RECORD                                                            
116.00 0      C*                                                                                             
117.00 0      C     TAKEY         CHAIN     TAP0021                            70                            
118.00 0      C*                                                                                             
119.00 0      C*** RETRIEVE CHEQUE BOOK ORDER RECORD                                                         
120.00 0      C*                                                                                             
121.00 0      C     TAKEY2        CHAIN     TAP0331                            70                            
122.00 0      C*                                                                                             
123.00 0      C*****************************************************************                             
124.00 0      C*    MAIN ROUTINE                                                                             
125.00 0      C*****************************************************************                             
126.00 0      C*                                                                                             
127.00 0      C*    DISPLAY/ACCEPT CHECK BOOK INFORMATION                                                    
128.00 0      C*                                                                                             
129.00 0      C     ERRFLG        DOUEQ     ' '                                                              
130.00 0      C                   EXSR      SCRN01                                       FIRST SCREEN        
131.00 0      C     *IN03         CABEQ     '1'           ENDJOB                         END PGM             
132.00 0      C     *IN12         CABEQ     '1'           ENDJOB                         END-1ST SCRN        
133.00 0      C                   END                                                    END ERRFLG          
134.00 0      C*                                                                                             
135.00 0      C*---------------------------------------------------------------*                             
136.00 0      C*    DELETE RECORD                                                                            
137.00 0      C*---------------------------------------------------------------*                             
138.00 0      C*                                                                                             
139.00 0      C     *IN14         IFEQ      '1'                                                              
140.00 0      C*                                                                                             
141.00 0      C*** UPDATE CHEQUE BOOK MAINTENANCE LOG FILE                                                   
142.00 0      C***    DSOLNW    '1' - OLD                                                                    
143.00 0      C***              '2' - CHANGED                                                                
144.00 0      C***              '3' - ADD                                                                    
145.00 0      C***              '4' - DELETED                                                                
146.00 0      C***                                                                                           
147.00 0      C*** WRITE MAINT LOG RECORD - NEW                                                              
148.00 0      C***                                                                                           
149.00 0      C                   Z-ADD     *ZEROS        SCAL6             6 0                              
150.00 0      C                   Z-ADD     DSCDT         FRCAL                          * DATE TO JULIA     
151.00 0      C                   EXSR      SRP001                                                           
152.00 0      C                   Z-ADD     TOJUL         DMLMTN                                             
153.00 0      C                   MOVE      '4'           DSOLNW                         * CHANGED           
154.00 0      C                   TIME                    TIMEST                                             
155.00 0      C                   WRITE     TAT3001                                                          
156.00 0      C*                                                                                             
157.00 0      C*** SAVE FROM AND TO RANGE                                                                    
158.00 0      C*                                                                                             
159.00 0      C                   Z-ADD     DRFRNG        SVFRNG                                             
160.00 0      C                   Z-ADD     DRTRNG        SVTRNG                                             
161.00 170814 D7266C*                                                                                             
162.00 170814 D7266C*** Delete record to CQNACCPF through module                                                  
163.00 170814 D7266C*                                                                                             
164.00 170814 D7266C                   CALL      'CQNACCM'                                                        
165.00 170814 D7266C                   PARM      'DLT'         PACT              3                                
166.00 170814 D7266C                   PARM      DRACCT        PACCT            12 0          Account             
167.00 170814 D7266C                   PARM      DRCBST        PCBST            10            Cheque book style   
168.00 170814 D7266C                   PARM      DRORDR        PORDR             5 0          Nbr of books        
169.00 170814 D7266C                   PARM      DRFRNG        PSTAR             7 0          Nbr start from      
170.00 170814 D7266C                   PARM                    PSTS              1 0                              
171.00 0      C*                                                                                             
172.00 0      C*** DELETE CHEQUE BOOK ORDER                                                                  
173.00 0      C*                                                                                             
174.00 0      C                   DELETE    TAP0331                                                          
175.00 0      C*                                                                                             
176.00 0      C*** CHECK ORDER STATUS                                                                        
177.00 0      C*                                                                                             
178.00 0      C     DRSTAT        IFGE      4                                                                
179.00 0      C     TAKEY2        SETLL     TAP0341                                                          
180.00 0      C                   MOVE      '0'           *IN70                                              
181.00 0      C                   Z-ADD     *ZEROS        UNUSED           12 0                              
182.00 0      C*                                                                                             
183.00 0      C*** IF ORDER HAS BEEN POSTED/MAILED (DRSTAT >= 4), DELETE                                     
184.00 0      C*** RECORD IN NUMBER RANGE FILE AND ACCUMULATE UNUSED CHECKS                                  
185.00 0      C*                                                                                             
186.00 0      C     *IN70         DOWEQ     '0'                                                              
187.00 0      C     TAKEY2        READE     TAP0341                                70                        
188.00 0      C  N70              ADD       DXUUSE        UNUSED                                             
189.00 0      C  N70              DELETE    TAP0341                                                          
190.00 0      C                   END                                                                        
191.00 0      C                   END                                                                        
192.00 0      C*                                                                                             
193.00 0      C*** IF TO-RANGE IS EQUAL TO THE HIGHEST-CHECK-NUMBER-ISSUED,                                  
194.00 0      C*** HIGHEST-NUMBER-ISSUED WOULD BE THE LAST CHECK OF THE PREVIOUS                             
195.00 0      C*** ORDER.                                                                                    
196.00 0      C*                                                                                             
197.00 0      C     SVTRNG        IFEQ      DMCBHN                                                           
198.00 0      C     SVFRNG        SUB       1             DMCBHN                                             
199.00 0      C                   END                                                                        
200.00 0      C*                                                                                             
201.00 0      C*** UPDATE UNUSED COUNTER OF ACCOUNT MASTER FILE                                              
202.00 0      C*                                                                                             
203.00 0      C     UNUSED        IFGT      *ZEROS                                                           
204.00 0      C                   SUB       UNUSED        DMCBUC                                             
205.00 0      C                   UPDATE    TAP0021                                                          
206.00 0      C                   END                                                                        
207.00 0      C                   END                                                                        
208.00 0      C*                                                                                             
209.00 0      C*---------------------------------------------------------------*                             
210.00 0      C*    END OF JOB ROUTINE                                                                       
211.00 0      C*---------------------------------------------------------------*                             
212.00 0      C*                                                                                             
213.00 0      C     ENDJOB        TAG                                                                        
214.00 0      C*                                                                                             
215.00 0      C                   MOVE      '1'           *INLR                                              
216.00 0      C     *IN03         IFEQ      '1'                                                              
217.00 0      C                   MOVE      '3'           PRRTN                                              
218.00 0      C                   END                                                                        
219.00 0      C     *IN12         IFEQ      '1'                                                              
220.00 0      C                   MOVE      'C'           PRRTN                                              
221.00 0      C                   END                                                                        
222.00 0      C*                                                                                             
223.00 0      C*****************************************************************                             
224.00 0      C*    DISPLAY CONFIRMATION SCREEN                                                              
225.00 0      C*****************************************************************                             
226.00 0      C*                                                                                             
227.00 0      C     SCRN01        BEGSR                                                                      
228.00 0      C*                                                                                             
229.00 0      C*    WRITE/READ SCREEN                                                                        
230.00 0      C*                                                                                             
231.00 0      C     DELREC        TAG                                                                        
232.00 0      C                   EXFMT     T26030                                       WRITE/READ          
233.00 0      C*                                                                                             
234.00 0      C*** LEAVE CONFIRMATION SCREEN ONLY IF F3, F12 OR F14 WAS PRESSED.                             
235.00 0      C*                                                                                             
236.00 0      C     *IN03         IFNE      '1'                                                              
237.00 0      C     *IN12         ANDNE     '1'                                                              
238.00 0      C     *IN14         ANDNE     '1'                                                              
239.00 0      C                   GOTO      DELREC                                                           
240.00 0      C                   END                                                                        
241.00 0      C*                                                                                             
242.00 0      C                   ENDSR                                                                      
243.00 0      C/COPY CFSORC,SRP011                                                                           
244.00 0      C/COPY CFSORC,SRP001                                                                           
