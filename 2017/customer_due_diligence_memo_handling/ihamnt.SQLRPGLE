1.00 20315       ********************************************************************                                              
2.00 30805       * PROGRAM ID.   : IHAMNT                                           *                                              
3.00 30805       * DESCRIPTION   : BCM In-House Application Maintenance             *                                              
4.00 30805       *                                                                  *                                              
5.00 30809       * REFERENCE NO. : C3102 (CHG-102-03)                               *                                              
6.00 20315       * AUTHOR        : VICKY TOU                                        *                                              
7.00 20315       * USER ID.      : B460PGM                                          *                                              
8.00 30805       * DATE WRITTEN  : 05 AUG 2002                                      *                                              
9.00 20315       ********************************************************************                                              
10.00 170323       *   Reference No. : CHG-096-17                                  *                                                 
11.00 170323       *   User ID       : BI77                                        *                                                 
12.00 170323       *   User Name     : Myles Ieong                                 *                                                 
13.00 170323       *   Changed Date  : 09-Dec-2016                                 *                                                 
14.00 170323       *   Change        : Create hold function checking for CDD code  *                                                 
15.00 170323       *****************************************************************                                                 
16.00 30806      FAPPUSRL1  UF   E           K DISK    RENAME(RAPPUR:RAPPUR1)                                                       
17.00 30807      FAPPUSRL2  UF   E           K DISK    RENAME(RAPPUR:RAPPUR2)                                                       
18.00 170406 D7096FSCAPPARM  UF   E           K DISK                                                                                 
19.00 30806      FPAPPBRN   IF   E           K DISK                                                                                 
20.00 30806      FPAPPOPT   IF   E           K DISK                                                                                 
21.00 30805      FIHAMNTFM  CF   E             WORKSTN                                                                              
22.00 30806      F                                     SFILE(USRMNTS:RRN1)                                                          
23.00 30807      F                                     SFILE(OPTMNTS:RRN2)                                                          
24.00 30808      FIHAPPLST  O    E             PRINTER OFLIND(*IN30) USROPN                                                         
25.00 30805      F                                                                                                                  
26.00 30806       ********************************************************************                                              
27.00 30806       * DEFINE KEY LIST                                                                                                 
28.00 30806       ********************************************************************                                              
29.00 30807      C     KEYAPP        KLIST                                                                                          
30.00 30807      C                   KFLD                    KUSER            10                                                    
31.00 30807      C                   KFLD                    KMOPT             6                                                    
32.00 30807      C                   KFLD                    KLEVEL            1                                                    
33.00 30807      C                   KFLD                    KOPT              2                                                    
34.00 30807      C     KEYOPT        KLIST                                                                                          
35.00 30807      C                   KFLD                    KMOPT             6                                                    
36.00 30807      C                   KFLD                    KLEVEL            1                                                    
37.00 30807      C                   KFLD                    KOPT              2                                                    
38.00 20305       ********************************************************************                                              
39.00 30805       * MAIN PROGRAM                                                                                                    
40.00 20305       ********************************************************************                                              
41.00 30805      C                   EXFMT     IHAMNT                                                                               
42.00 30805      C*                                                                                                                 
43.00 30805      C     *IN03         DOWEQ     *OFF                                                                                 
44.00 30805      C     *IN12         ANDEQ     *OFF                                                                                 
45.00 30805      C     SMNUOPT       CASEQ     1             OPT01                                                                  
46.00 30805      C     SMNUOPT       CASEQ     2             OPT02                                                                  
47.00 30805      C     SMNUOPT       CASEQ     3             OPT03                                                                  
48.00 30805      C     SMNUOPT       CASEQ     4             OPT04                                                                  
49.00 30805      C     SMNUOPT       CASEQ     5             OPT05                                                                  
50.00 30805      C                   ENDCS                                                                                          
51.00 30806      C                   Z-ADD     *ZERO         SMNUOPT                                                                
52.00 30805      C  N03              EXFMT     IHAMNT                                                                               
53.00 30805      C                   ENDDO                                                                                          
54.00 30805      C*                                                                                                                 
55.00 20305      C                   SETON                                        LR                                                
56.00 30805       ********************************************************************                                              
57.00 30805       * OPT01 - USER MAINTENANCE                                                                                        
58.00 30805       ********************************************************************                                              
59.00 30805      C     OPT01         BEGSR                                                                                          
60.00 30806      C* Initialize                                                                                                      
61.00 30806      C                   MOVE      *BLANK        SAVUSR           10                                                    
62.00 30806      C                   CLEAR                   USRMNT                                                                 
63.00 30806      C                   SETON                                        42                                                
64.00 30806      C                   WRITE     USRMNT                                                                               
65.00 30806      C                   SETOFF                                       404243                                            
66.00 30806      C                   SETOFF                                       90                                                
67.00 30806      C* Display Screen                                                                                                  
68.00 30806      C                   SETON                                        41                                                
69.00 30806      C                   WRITE     USRMNTK                                                                              
70.00 30805      C                   EXFMT     USRMNT                                                                               
71.00 30806      C                   SETOFF                                       41                                                
72.00 30805      C     *IN03         DOWEQ     *OFF                                                                                 
73.00 30805      C     *IN12         ANDEQ     *OFF                                                                                 
74.00 30806      C* CHECK USER ID                                                                                                   
75.00 30806      C     SUSER         IFEQ      *BLANK                                                                               
76.00 30806      C                   MOVE      *BLANK        SAVUSR                                                                 
77.00 30806      C                   CLEAR                   USRMNT                                                                 
78.00 30806      C                   SETON                                        42                                                
79.00 30806      C                   WRITE     USRMNT                                                                               
80.00 30806      C                   SETOFF                                       404243                                            
81.00 30806      C                   ELSE                                                                                           
82.00 30806      C     SUSER         IFNE      *BLANK                                                                               
83.00 30807      C     SUSER         ANDNE     SAVUSR                                                                               
84.00 30806      C     *IN05         OREQ      *ON                                                                                  
85.00 30806      C                   MOVE      SUSER         SAVUSR                                                                 
86.00 30806      C                   EXSR      LODOPT                                                                               
87.00 30806      C                   ENDIF                                                                                          
88.00 30806      C                   ENDIF                                                                                          
89.00 30806      C* Function Key: F6=ADD, F7=COPY, F8=DELETE, F9=PRINT                                                              
90.00 30806      C     SUSER         IFNE      *BLANK                                                                               
91.00 30806      C   06              EXSR      ADDNEWOPT                                                                            
92.00 30806      C   07              EXSR      COPYOPT                                                                              
93.00 30806      C   08              EXSR      DELOPT                                                                               
94.00 30806      C   09              EXSR      PRTBYUSR                                                                             
95.00 30806      C                   ENDIF                                                                                          
96.00 30807      C* Option 4 = Delete one by one                                                                                    
97.00 30807      C                   MOVE      'N'           DELETED           1                                                    
98.00 30807      C     RRN1          IFGT      0                                                                                    
99.00 30807      C                   READC     USRMNTS                                80                                            
100.00 30807      C     *IN80         DOWEQ     *OFF                                                                                 
101.00 30807      C     SUSEL         IFEQ      '4'                                                                                  
102.00 30807      C                   MOVE      SAVUSR        KUSER                                                                  
103.00 30807      C                   MOVE      SUMOPT        KMOPT                                                                  
104.00 30807      C                   MOVE      SULVL         KLEVEL                                                                 
105.00 30807      C                   MOVE      SUOPT         KOPT                                                                   
106.00 30807      C     KEYAPP        CHAIN     RAPPUR1                            70                                                
107.00 30807      C  N70              DELETE    RAPPUR1                                                                              
108.00 30807      C                   MOVE      'Y'           DELETED           1                                                    
109.00 30807      C                   ENDIF                                                                                          
110.00 30807      C                   READC     USRMNTS                                80                                            
111.00 30807      C                   ENDDO                                                                                          
112.00 30807      C                   ENDIF                                                  RRN1 > 0                                
113.00 30807      C     DELETED       IFEQ      'Y'                                                                                  
114.00 30807      C                   EXSR      LODOPT                                                                               
115.00 30807      C                   ENDIF                                                                                          
116.00 30806      C* Display Screen                                                                                                  
117.00 30806      C                   SETON                                        41                                                
118.00 30806      C                   WRITE     USRMNTK                                                                              
119.00 30805      C                   EXFMT     USRMNT                                                                               
120.00 30806      C                   SETOFF                                       41                                                
121.00 30806      C                   SETOFF                                       90                                                
122.00 30805      C                   ENDDO                                                                                          
123.00 30805      C                   ENDSR                                                                                          
124.00 30805       ********************************************************************                                              
125.00 30805       * OPT02 - CHANGE USER BRANCH                                                                                      
126.00 30805       ********************************************************************                                              
127.00 30805      C     OPT02         BEGSR                                                                                          
128.00 30806      C* Initialize                                                                                                      
129.00 30806      C                   MOVE      *BLANK        SAVUSR           10                                                    
130.00 30806      C                   CLEAR                   USRBRN                                                                 
131.00 30806      C                   SETOFF                                       90                                                
132.00 30806      C* Display Screen                                                                                                  
133.00 30805      C                   EXFMT     USRBRN                                                                               
134.00 30805      C     *IN03         DOWEQ     *OFF                                                                                 
135.00 30805      C     *IN12         ANDEQ     *OFF                                                                                 
136.00 30806      C* F4 - Prompt for Branch Selection                                                                                
137.00 30806      C     *IN04         IFEQ      *ON                                                                                  
138.00 30806      C     FLD           ANDEQ     'SBRN'                                                                               
139.00 30805      C                   MOVEL(P)  'BRANCH'      PWIN                                                                   
140.00 30805      C                   EXSR      PROMPT                                                                               
141.00 30805      C     PRTN          IFNE      *BLANK                                                                               
142.00 30805      C                   MOVEL     PRTN          SBRN                                                                   
143.00 30805      C     3             SUBST     PRTN:4        SIBRN                                                                  
144.00 30805      C     30            SUBST     PRTN:7        SBNAME                                                                 
145.00 30805      C                   ENDIF                                                                                          
146.00 30805      C                   ENDIF                                                                                          
147.00 30806      C* CHECK USER ID                                                                                                   
148.00 30806      C     SUSER         IFEQ      *BLANK                                                                               
149.00 30806      C                   CLEAR                   USRBRN                                                                 
150.00 30806      C                   MOVE      *BLANK        SAVUSR                                                                 
151.00 30806      C                   ENDIF                                                                                          
152.00 30805      C     SUSER         IFNE      *BLANK                                                                               
153.00 30806      C     SUSER         ANDNE     SAVUSR                                                                               
154.00 30805      C     SUSER         CHAIN     RAPPUR1                            70                                                
155.00 30808      C  N70              MOVE      ABRN          SBRN                                                                   
156.00 30808      C  N70              MOVE      AIBRN         SIBRN                                                                  
157.00 30808      C  N70              MOVE      ABNAME        SBNAME                                                                 
158.00 30808      C  N70              MOVE      SUSER         SAVUSR                                                                 
159.00 30808      C   70              SETON                                        90                                                
160.00 30808      C   70              EVAL      ERRMSG = 'User Not Found'                                                            
161.00 30806      C                   ENDIF                                                                                          
162.00 30806      C* CHECK BRANCH                                                                                                    
163.00 30806      C     SBRN          IFEQ      *BLANK                                                                               
164.00 30806      C                   MOVE      *BLANK        SIBRN                                                                  
165.00 30806      C                   MOVE      *BLANK        SBNAME                                                                 
166.00 30806      C                   ELSE                                                                                           
167.00 30806      C     SBRN          CHAIN     RAPPBR                             70                                                
168.00 30808      C  N70              MOVE      ABIBRN        SIBRN                                                                  
169.00 30808      C  N70              MOVE      ABBNAM        SBNAME                                                                 
170.00 30808      C   70              SETON                                        90                                                
171.00 30808      C   70              EVAL      ERRMSG = 'Invalid Branch'                                                            
172.00 30806      C                   ENDIF                                                                                          
173.00 30806      C* F10 - Confirm                                                                                                   
174.00 30806      C     *IN10         IFEQ      *ON                                                                                  
175.00 30806      C     *IN90         ANDEQ     *OFF                                                                                 
176.00 30806      C     SUSER         IFNE      *BLANK                                                                               
177.00 30806      C/EXEC SQL                                                                                                         
178.00 30806      C+ UPDATE APPUSRPF                                                                                                 
179.00 30806      C+ SET    ABRN = :SBRN, AIBRN = :SIBRN, ABNAME = :SBNAME                                                           
180.00 30806      C+ WHERE  AUSER = :SUSER                                                                                           
181.00 30806      C/END-EXEC                                                                                                         
182.00 30806      C                   EVAL      MSGFLD = 'User branch updated successfully'                                          
183.00 30806      C                   ELSE                                                                                           
184.00 30806      C                   SETON                                        90                                                
185.00 30806      C                   EVAL      ERRMSG = 'User ID cannot be blank'                                                   
186.00 30806      C                   ENDIF                                                                                          
187.00 30806      C                   ENDIF                                                                                          
188.00 30806      C* Display Screen                                                                                                  
189.00 30805      C                   EXFMT     USRBRN                                                                               
190.00 30806      C                   MOVE      *BLANK        MSGFLD                                                                 
191.00 30806      C                   SETOFF                                       90                                                
192.00 30805      C                   ENDDO                                                                                          
193.00 30805      C                   ENDSR                                                                                          
194.00 30805       ********************************************************************                                              
195.00 30805       * OPT03 - PRINT LIST BY USER                                                                                      
196.00 30805       ********************************************************************                                              
197.00 30805      C     OPT03         BEGSR                                                                                          
198.00 30807      C* Initialize                                                                                                      
199.00 30807      C                   CLEAR                   PRTUSR                                                                 
200.00 30807      C                   SETOFF                                       90                                                
201.00 30807      C* Display Screen                                                                                                  
202.00 30805      C                   EXFMT     PRTUSR                                                                               
203.00 30805      C     *IN03         DOWEQ     *OFF                                                                                 
204.00 30805      C     *IN12         ANDEQ     *OFF                                                                                 
205.00 30807      C* CHECK USER ID                                                                                                   
206.00 30807      C     SUSER         IFNE      *BLANK                                                                               
207.00 30807      C     SUSER         CHAIN     RAPPUR1                            70                                                
208.00 30807      C   70              SETON                                        90                                                
209.00 30807      C   70              EVAL      ERRMSG = 'No options for this user'                                                  
210.00 30807      C                   ENDIF                                                                                          
211.00 30807      C* F10 - Confirm                                                                                                   
212.00 30807      C     *IN10         IFEQ      *ON                                                                                  
213.00 30807      C     *IN90         ANDEQ     *OFF                                                                                 
214.00 30807      C     SUSER         IFNE      *BLANK                                                                               
215.00 30808      C                   MOVE      SUSER         SAVUSR                                                                 
216.00 30807      C                   EXSR      PRTBYUSR                                                                             
217.00 30807      C                   EVAL      MSGFLD = 'Option list printed ' +                                                    
218.00 30807      C                             'for user ' + %TRIM(SUSER)                                                           
219.00 30807      C                   ELSE                                                                                           
220.00 30807      C                   SETON                                        90                                                
221.00 30807      C                   EVAL      ERRMSG = 'User ID cannot be blank'                                                   
222.00 30807      C                   ENDIF                                                                                          
223.00 30807      C                   ENDIF                                                                                          
224.00 30807      C* Display Screen                                                                                                  
225.00 30805      C                   EXFMT     PRTUSR                                                                               
226.00 30807      C                   MOVE      *BLANK        MSGFLD                                                                 
227.00 30807      C                   SETOFF                                       90                                                
228.00 30805      C                   ENDDO                                                                                          
229.00 30805      C                   ENDSR                                                                                          
230.00 30805       ********************************************************************                                              
231.00 30805       * OPT04 - OPTION MAINTENANCE                                                                                      
232.00 30805       ********************************************************************                                              
233.00 30805      C     OPT04         BEGSR                                                                                          
234.00 30806      C* Initialize                                                                                                      
235.00 30806      C                   MOVE      *BLANK        SVMOPT            6                                                    
236.00 30806      C                   MOVE      *BLANK        SVLVL             1                                                    
237.00 30806      C                   MOVE      *BLANK        SVOPT             2                                                    
238.00 30807      C                   MOVE      *BLANK        SVDESC           50                                                    
239.00 30806      C                   CLEAR                   OPTMNT                                                                 
240.00 30806      C                   SETON                                        52                                                
241.00 30806      C                   WRITE     OPTMNT                                                                               
242.00 30806      C                   SETOFF                                       505253                                            
243.00 30806      C                   SETOFF                                       90                                                
244.00 30806      C* Display Screen                                                                                                  
245.00 30806      C                   SETON                                        51                                                
246.00 30806      C                   WRITE     OPTMNTK                                                                              
247.00 30806      C                   EXFMT     OPTMNT                                                                               
248.00 30806      C                   SETOFF                                       51                                                
249.00 30806      C     *IN03         DOWEQ     *OFF                                                                                 
250.00 30806      C     *IN12         ANDEQ     *OFF                                                                                 
251.00 30807      C* F4 - Prompt for Option Selection                                                                                
252.00 30807      C     *IN04         IFEQ      *ON                                                                                  
253.00 30807      C     FLD           ANDEQ     'SOPTION'                                                                            
254.00 30807      C                   MOVEL(P)  'OPTION'      PWIN                                                                   
255.00 30807      C                   EXSR      PROMPT                                                                               
256.00 30807      C     PRTN          IFNE      *BLANK                                                                               
257.00 30807      C                   MOVEL     PRTN          SVMOPT                                                                 
258.00 30807      C     1             SUBST     PRTN:7        SVLVL                                                                  
259.00 30807      C     2             SUBST     PRTN:8        SVOPT                                                                  
260.00 30807      C     50            SUBST     PRTN:10       SOPTION                                                                
261.00 30807      C                   ENDIF                                                                                          
262.00 30807      C                   ENDIF                                                                                          
263.00 30806      C* CHECK OPTION                                                                                                    
264.00 30806      C     SOPTION       IFEQ      *BLANK                                                                               
265.00 30806      C                   MOVE      *BLANK        SVMOPT                                                                 
266.00 30806      C                   MOVE      *BLANK        SVLVL                                                                  
267.00 30806      C                   MOVE      *BLANK        SVOPT                                                                  
268.00 30807      C                   MOVE      *BLANK        SVDESC                                                                 
269.00 30806      C                   CLEAR                   OPTMNT                                                                 
270.00 30806      C                   SETON                                        52                                                
271.00 30806      C                   WRITE     OPTMNT                                                                               
272.00 30806      C                   SETOFF                                       505253                                            
273.00 30806      C                   ELSE                                                                                           
274.00 30806      C     SOPTION       IFNE      *BLANK                                                                               
275.00 30807      C     SOPTION       ANDNE     SVDESC                                                                               
276.00 30806      C     *IN05         OREQ      *ON                                                                                  
277.00 30807      C                   MOVE      SOPTION       SVDESC                                                                 
278.00 30806      C                   EXSR      LODUSR                                                                               
279.00 30806      C                   ENDIF                                                                                          
280.00 30806      C                   ENDIF                                                                                          
281.00 30806      C* Function Key: F6=ADD, F7=COPY, F8=DELETE, F9=PRINT                                                              
282.00 30806      C     SOPTION       IFNE      *BLANK                                                                               
283.00 30806      C   06              EXSR      ADDNEWUSR                                                                            
284.00 30806      C   07              EXSR      COPYUSR                                                                              
285.00 30806      C   08              EXSR      DELUSR                                                                               
286.00 30806      C   09              EXSR      PRTBYOPT                                                                             
287.00 30806      C                   ENDIF                                                                                          
288.00 30807      C* Option 4 = Delete one by one                                                                                    
289.00 30807      C                   MOVE      'N'           DELETED           1                                                    
290.00 30807      C     RRN2          IFGT      0                                                                                    
291.00 30807      C                   READC     OPTMNTS                                80                                            
292.00 30807      C     *IN80         DOWEQ     *OFF                                                                                 
293.00 30807      C     SOSEL         IFEQ      '4'                                                                                  
294.00 30807      C                   MOVE      SOUSER        KUSER                                                                  
295.00 30807      C                   MOVE      SVMOPT        KMOPT                                                                  
296.00 30807      C                   MOVE      SVLVL         KLEVEL                                                                 
297.00 30807      C                   MOVE      SVOPT         KOPT                                                                   
298.00 30807      C     KEYAPP        CHAIN     RAPPUR1                            70                                                
299.00 30807      C  N70              DELETE    RAPPUR1                                                                              
300.00 30807      C                   MOVE      'Y'           DELETED           1                                                    
301.00 30807      C                   ENDIF                                                                                          
302.00 30807      C                   READC     OPTMNTS                                80                                            
303.00 30807      C                   ENDDO                                                                                          
304.00 30807      C                   ENDIF                                                  RRN1 > 0                                
305.00 30807      C     DELETED       IFEQ      'Y'                                                                                  
306.00 30807      C                   EXSR      LODUSR                                                                               
307.00 30807      C                   ENDIF                                                                                          
308.00 30806      C* Display Screen                                                                                                  
309.00 30806      C                   SETON                                        51                                                
310.00 30806      C                   WRITE     OPTMNTK                                                                              
311.00 30806      C                   EXFMT     OPTMNT                                                                               
312.00 30806      C                   SETOFF                                       51                                                
313.00 30806      C                   SETOFF                                       90                                                
314.00 30806      C                   ENDDO                                                                                          
315.00 30805      C                   ENDSR                                                                                          
316.00 30805       ********************************************************************                                              
317.00 30805       * OPT05 - PRINT LIST BY OPTION                                                                                    
318.00 30805       ********************************************************************                                              
319.00 30805      C     OPT05         BEGSR                                                                                          
320.00 30807      C* Initialize                                                                                                      
321.00 30807      C                   CLEAR                   PRTOPT                                                                 
322.00 30807      C                   SETOFF                                       90                                                
323.00 30807      C* Display Screen                                                                                                  
324.00 30807      C                   EXFMT     PRTOPT                                                                               
325.00 30807      C     *IN03         DOWEQ     *OFF                                                                                 
326.00 30807      C     *IN12         ANDEQ     *OFF                                                                                 
327.00 30807      C* F4 - Prompt for Option Selection                                                                                
328.00 30807      C     *IN04         IFEQ      *ON                                                                                  
329.00 30807      C     FLD           ANDEQ     'SMOPT'                                                                              
330.00 30807      C                   MOVEL(P)  'OPTION'      PWIN                                                                   
331.00 30807      C                   EXSR      PROMPT                                                                               
332.00 30807      C     PRTN          IFNE      *BLANK                                                                               
333.00 30807      C                   MOVEL     PRTN          SMOPT                                                                  
334.00 30807      C     1             SUBST     PRTN:7        SLEVEL                                                                 
335.00 30807      C     2             SUBST     PRTN:8        SOPT                                                                   
336.00 30807      C     50            SUBST     PRTN:10       SDESC                                                                  
337.00 30807      C                   ENDIF                                                                                          
338.00 30807      C                   ENDIF                                                                                          
339.00 30807      C* CHECK OPTION                                                                                                    
340.00 30807      C     SMOPT         IFNE      *BLANK                                                                               
341.00 30807      C                   MOVE      SMOPT         KMOPT                                                                  
342.00 30807      C                   MOVE      SLEVEL        KLEVEL                                                                 
343.00 30807      C                   MOVE      SOPT          KOPT                                                                   
344.00 30807      C     KEYOPT        CHAIN     RAPPUR2                            70                                                
345.00 30807      C   70              SETON                                        90                                                
346.00 30807      C   70              EVAL      ERRMSG = 'No users for this option'                                                  
347.00 30807      C                   ENDIF                                                                                          
348.00 30807      C* F10 - Confirm                                                                                                   
349.00 30807      C     *IN10         IFEQ      *ON                                                                                  
350.00 30807      C     *IN90         ANDEQ     *OFF                                                                                 
351.00 30807      C     SMOPT         IFNE      *BLANK                                                                               
352.00 30808      C                   MOVE      SMOPT         SVMOPT                                                                 
353.00 30808      C                   MOVE      SLEVEL        SVLVL                                                                  
354.00 30808      C                   MOVE      SOPT          SVOPT                                                                  
355.00 30808      C                   MOVE      SDESC         SVDESC                                                                 
356.00 30807      C                   EXSR      PRTBYOPT                                                                             
357.00 30807      C                   EVAL      MSGFLD = 'User list printed ' +                                                      
358.00 30807      C                             'for option ' + %TRIM(SDESC)                                                         
359.00 30807      C                   ELSE                                                                                           
360.00 30807      C                   SETON                                        90                                                
361.00 30807      C                   EVAL      ERRMSG = 'Option cannot be blank'                                                    
362.00 30807      C                   ENDIF                                                                                          
363.00 30807      C                   ENDIF                                                                                          
364.00 30807      C* Display Screen                                                                                                  
365.00 30807      C                   EXFMT     PRTOPT                                                                               
366.00 30807      C                   MOVE      *BLANK        MSGFLD                                                                 
367.00 30807      C                   SETOFF                                       90                                                
368.00 30807      C                   ENDDO                                                                                          
369.00 30805      C                   ENDSR                                                                                          
370.00 30805       ********************************************************************                                              
371.00 30805       * PROMPT - F4  PROMPT FOR SELECTION WINDOW                                                                        
372.00 30805       ********************************************************************                                              
373.00 30805      C     PROMPT        BEGSR                                                                                          
374.00 30805      C                   CALL      'IHAWIN'                                                                             
375.00 30805      C                   PARM                    PWIN             10                                                    
376.00 30805      C                   PARM                    PRTN            100                                                    
377.00 30805      C                   ENDSR                                                                                          
378.00 30806       ********************************************************************                                              
379.00 30806       * LODOPT - LOAD OPTION LIST FOR USER                                                                              
380.00 30806       ********************************************************************                                              
381.00 30806      C     LODOPT        BEGSR                                                                                          
382.00 30806      C* Initialize                                                                                                      
383.00 30806      C                   SETON                                        42                                                
384.00 30806      C                   WRITE     USRMNT                                                                               
385.00 30806      C                   SETOFF                                       404243                                            
386.00 30806      C                   Z-ADD     *ZERO         RRN1              3 0                                                  
387.00 30806      C                   MOVE      *BLANK        SBRN                                                                   
388.00 30806      C                   MOVE      *BLANK        SBNAME                                                                 
389.00 30806      C                   MOVE      *BLANK        SAVIHM            3                                                    
390.00 30806      C* Load Option List                                                                                                
391.00 30806      C     SAVUSR        CHAIN     RAPPUR1                            43                                                
392.00 30806      C  N43              MOVE      ABRN          SBRN                                                                   
393.00 30806      C  N43              MOVE      ABNAME        SBNAME                                                                 
394.00 30806      C  N43              MOVE      AIBRN         SAVIHM                                                                 
395.00 30806      C     *IN43         DOWEQ     *OFF                                                                                 
396.00 30806      C                   ADD       1             RRN1                                                                   
397.00 30806      C                   MOVE      *BLANK        SUSEL                                                                  
398.00 30806      C                   MOVE      AMOPT         SUMOPT                                                                 
399.00 30806      C                   MOVE      ALEVEL        SULVL                                                                  
400.00 30806      C                   MOVE      AOPT          SUOPT                                                                  
401.00 30807      C                   MOVE      AMOPT         KMOPT                                                                  
402.00 30807      C                   MOVE      ALEVEL        KLEVEL                                                                 
403.00 30807      C                   MOVE      AOPT          KOPT                                                                   
404.00 30807      C     KEYOPT        CHAIN     RAPPOP                             70                                                
405.00 30806      C  N70              MOVE      AODESC        SUDESC                                                                 
406.00 30806      C   70              MOVE      *BLANK        SUDESC                                                                 
407.00 30806      C                   WRITE     USRMNTS                                                                              
408.00 30806      C     SAVUSR        READE     RAPPUR1                                43                                            
409.00 30806      C                   ENDDO                                                                                          
410.00 30809      C*                                                                                                                 
411.00 30806      C     RRN1          COMP      0                                  40  90                                            
412.00 30806      C   90              EVAL      ERRMSG = 'No options for this user'                                                  
413.00 30806      C                   ENDSR                                                                                          
414.00 30806       ********************************************************************                                              
415.00 30806       * ADDNEWOPT - ADD NEW OPTIONS FOR GIVEN USER                                                                      
416.00 30806       ********************************************************************                                              
417.00 30806      C     ADDNEWOPT     BEGSR                                                                                          
418.00 30806      C                   SETOFF                                       90                                                
419.00 30807      C                   MOVE      SAVUSR        PUSER                                                                  
420.00 30807      C                   MOVE      *BLANK        PMOPT                                                                  
421.00 30807      C                   MOVE      *BLANK        PLEVEL                                                                 
422.00 30807      C                   MOVE      *BLANK        POPT                                                                   
423.00 30807      C                   Z-ADD     *ZERO         PADD                                                                   
424.00 30807      C                   Z-ADD     *ZERO         PNADD                                                                  
425.00 30807      C                   CALL      'IHAADD'                                                                             
426.00 30807      C                   PARM                    PUSER            10                                                    
427.00 30807      C                   PARM                    PMOPT             6                                                    
428.00 30807      C                   PARM                    PLEVEL            1                                                    
429.00 30807      C                   PARM                    POPT              2                                                    
430.00 30807      C                   PARM                    PADD              3 0                                                  
431.00 30807      C                   PARM                    PNADD             3 0                                                  
432.00 30807      C     PADD          IFGT      *ZERO                                                                                
433.00 30807      C                   EXSR      LODOPT                                                                               
434.00 30807      C                   ENDIF                                                                                          
435.00 30806      C                   ENDSR                                                                                          
436.00 30806       ********************************************************************                                              
437.00 30806       * COPYOPT - COPY OPTIONS FROM OTHER USER TO GIVEN USER                                                            
438.00 30806       ********************************************************************                                              
439.00 30806      C     COPYOPT       BEGSR                                                                                          
440.00 30806      C* Initialize                                                                                                      
441.00 30806      C                   MOVE      *BLANK        SFRUSR                                                                 
442.00 30806      C                   MOVE      *BLANK        SFRBRN                                                                 
443.00 30806      C                   MOVE      *BLANK        SFRIHM                                                                 
444.00 30806      C                   MOVE      *BLANK        SFRBNAME                                                               
445.00 30807      C                   MOVE      *BLANK        MSGFLD                                                                 
446.00 30806      C                   SETOFF                                       90                                                
447.00 30806      C* Display Screen                                                                                                  
448.00 30806      C                   EXFMT     CPYOPT                                                                               
449.00 30806      C     *IN03         DOWEQ     *OFF                                                                                 
450.00 30806      C     *IN12         ANDEQ     *OFF                                                                                 
451.00 30806      C                   MOVE      *BLANK        SFRBRN                                                                 
452.00 30806      C                   MOVE      *BLANK        SFRIHM                                                                 
453.00 30806      C                   MOVE      *BLANK        SFRBNAME                                                               
454.00 30806      C* CHECK "FROM USER ID"                                                                                            
455.00 30806      C     SFRUSR        IFNE      *BLANK                                                                               
456.00 30806      C     SFRUSR        IFEQ      SUSER                                                                                
457.00 30806      C                   SETON                                        90                                                
458.00 30806      C                   EVAL      ERRMSG = 'Same User ID'                                                              
459.00 30806      C                   ELSE                                                                                           
460.00 30806      C     SFRUSR        CHAIN     RAPPUR1                            70                                                
461.00 30806      C  N70              MOVE      ABRN          SFRBRN                                                                 
462.00 30806      C  N70              MOVE      AIBRN         SFRIHM                                                                 
463.00 30806      C  N70              MOVE      ABNAME        SFRBNAME                                                               
464.00 30806      C   70              SETON                                        90                                                
465.00 30806      C   70              EVAL      ERRMSG = 'User Not Found'                                                            
466.00 30806      C                   ENDIF                                                                                          
467.00 30806      C                   ENDIF                                                                                          
468.00 30806      C* F10 - Confirm                                                                                                   
469.00 30806      C     *IN10         IFEQ      *ON                                                                                  
470.00 30806      C     *IN90         ANDEQ     *OFF                                                                                 
471.00 30806      C     SFRUSR        IFNE      *BLANK                                                                               
472.00 30806      C/EXEC SQL                                                                                                         
473.00 30806      C+ INSERT INTO APPUSRPF                                                                                            
474.00 30806      C+ SELECT :SUSER, AMOPT, ALEVEL, AOPT, :SBRN, :SAVIHM, :SBNAME                                                     
475.00 30806      C+ FROM APPUSRPF                                                                                                   
476.00 30806      C+ WHERE AUSER = :SFRUSR                                                                                           
477.00 30806      C/END-EXEC                                                                                                         
478.00 170418      C                                                                                                                  
479.00 170418 D709B **   Copy record for central-managed project- MENTIC                                                              
480.00 170418 D709BC                   MOVE      SUSER         KUSER                                                                  
481.00 170418 D709BC                   MOVE      'MENTIC'      KMOPT                                                                  
482.00 170418 D709BC                   MOVE      '0'           KLEVEL                                                                 
483.00 170418 D709BC                   MOVE      '  '          KOPT                                                                   
484.00 170418 D709BC     KEYAPP        CHAIN     RAPPUR1                                                                              
485.00 170418 D709BC                   IF        %FOUND(APPUSRL1)                                                                     
486.00 170406 D7096C/EXEC SQL                                                                                                         
487.00 170406 D7096C+ INSERT INTO SCAPPARM                                                                                            
488.00 170406 D7096C+ SELECT :SUSER, SPAPP, SPOPT, SPACT, SPDESC, :SBRN                                                               
489.00 170406 D7096C+ FROM SCAPPARM                                                                                                   
490.00 170406 D7096C+ WHERE SPUSER = :SFRUSR                                                                                          
491.00 170406 D7096C/END-EXEC                                                                                                         
492.00 170418 D709BC                   ENDIF                                                                                          
493.00 170418      C                                                                                                                  
494.00 30806      C                   EVAL      MSGFLD = 'All options from ' +                                                       
495.00 30806      C                             %TRIM(SFRUSR) + ' copied successfully'                                               
496.00 30806      C                   EXSR      LODOPT                                                                               
497.00 30806      C                   SETOFF                                       90                                                
498.00 30806      C                   ELSE                                                                                           
499.00 30806      C                   SETON                                        90                                                
500.00 30806      C                   EVAL      ERRMSG = 'From User ID cannot be blank'                                              
501.00 30806      C                   ENDIF                                                                                          
502.00 30806      C                   ENDIF                                                                                          
503.00 30806      C* Display Screen                                                                                                  
504.00 30806      C                   EXFMT     CPYOPT                                                                               
505.00 30807      C                   MOVE      *BLANK        MSGFLD                                                                 
506.00 30806      C                   SETOFF                                       90                                                
507.00 30806      C                   ENDDO                                                                                          
508.00 30806      C                   ENDSR                                                                                          
509.00 30806       ********************************************************************                                              
510.00 30806       * DELOPT - DELETE ALL OPTIONS FOR GIVEN USER                                                                      
511.00 30806       ********************************************************************                                              
512.00 30806      C     DELOPT        BEGSR                                                                                          
513.00 30807      C     RRN1          IFGT      *ZERO                                                                                
514.00 30806      C                   EXFMT     CFMWIN                                                                               
515.00 30806      C     *IN12         DOWEQ     *OFF                                                                                 
516.00 30806      C     *IN14         IFEQ      *ON                                                                                  
517.00 170418      C                                                                                                                  
518.00 170418 D709B **   Delete record for central-managed project- MENTIC                                                            
519.00 170418 D709BC                   MOVE      SUSER         KUSER                                                                  
520.00 170418 D709BC                   MOVE      'MENTIC'      KMOPT                                                                  
521.00 170418 D709BC                   MOVE      '0'           KLEVEL                                                                 
522.00 170418 D709BC                   MOVE      '  '          KOPT                                                                   
523.00 170418 D709BC     KEYAPP        CHAIN     RAPPUR1                                                                              
524.00 170418 D709BC                   IF        %FOUND(APPUSRL1)                                                                     
525.00 170418 D7096C/EXEC SQL                                                                                                         
526.00 170418 D7096C+ DELETE FROM SCAPPARM                                                                                            
527.00 170418 D7096C+ WHERE SPUSER = :SUSER                                                                                           
528.00 170418 D7096C/END-EXEC                                                                                                         
529.00 170418 D709BC                   ENDIF                                                                                          
530.00 170418      C                                                                                                                  
531.00 30806      C/EXEC SQL                                                                                                         
532.00 30806      C+ DELETE FROM APPUSRPF                                                                                            
533.00 30806      C+ WHERE AUSER = :SUSER                                                                                            
534.00 30806      C/END-EXEC                                                                                                         
535.00 30806      C                   EXSR      LODOPT                                                                               
536.00 30806      C                   SETOFF                                       90                                                
537.00 30806      C                   LEAVE                                                                                          
538.00 30806      C                   ENDIF                                                                                          
539.00 30806      C                   EXFMT     CFMWIN                                                                               
540.00 30806      C                   ENDDO                                                                                          
541.00 30807      C                   ELSE                                                                                           
542.00 30807      C                   SETON                                        90                                                
543.00 30807      C                   EVAL      ERRMSG = 'No options for this user'                                                  
544.00 30807      C                   ENDIF                                                                                          
545.00 30806      C                   ENDSR                                                                                          
546.00 30806       ********************************************************************                                              
547.00 30806       * PRTBYUSR - PRINT LIST FOR GIVEN USER                                                                            
548.00 30806       ********************************************************************                                              
549.00 30806      C     PRTBYUSR      BEGSR                                                                                          
550.00 30808      C                   OPEN      IHAPPLST                                                                             
551.00 30808      C* Print Header                                                                                                    
552.00 30808      C                   WRITE     RHEADER                                                                              
553.00 30808      C                   CLEAR                   RUSR                                                                   
554.00 30808      C                   MOVE      SAVUSR        IHUSER                                                                 
555.00 30808      C     IHUSER        CHAIN     RAPPUR1                            80                                                
556.00 30808      C     *IN80         IFEQ      *OFF                                                                                 
557.00 30808      C                   MOVE      ABRN          IHBRN                                                                  
558.00 30808      C                   MOVE      ABNAME        IHBNAME                                                                
559.00 30808      C                   ENDIF                                                                                          
560.00 30808      C                   WRITE     RUSR                                                                                 
561.00 30808      C* Print Details                                                                                                   
562.00 40401      C                   Z-ADD     0             TCOUNT                                                                 
563.00 30808      C     *IN80         DOWEQ     *OFF                                                                                 
564.00 30808      C                   CLEAR                   ROPTLST                                                                
565.00 30808      C                   MOVE      AMOPT         IHMOPT                                                                 
566.00 30808      C                   MOVE      ALEVEL        IHLEVEL                                                                
567.00 30808      C                   MOVE      AOPT          IHOPT                                                                  
568.00 30808      C                   MOVE      AMOPT         KMOPT                                                                  
569.00 30808      C                   MOVE      ALEVEL        KLEVEL                                                                 
570.00 30808      C                   MOVE      AOPT          KOPT                                                                   
571.00 30808      C     KEYOPT        CHAIN     RAPPOP                             70                                                
572.00 30808      C  N70              MOVE      AODESC        IHDESC                                                                 
573.00 30808      C                   WRITE     ROPTLST                                                                              
574.00 40401      C                   ADD       1             TCOUNT                                                                 
575.00 30808      C* Overflow control                                                                                                
576.00 30808      C     *IN30         IFEQ      *ON                                                                                  
577.00 30808      C                   WRITE     RHEADER                                                                              
578.00 30808      C                   WRITE     RUSR                                                                                 
579.00 30808      C                   SETOFF                                       30                                                
580.00 30808      C                   ENDIF                                                                                          
581.00 30808      C* Read next                                                                                                       
582.00 30808      C     IHUSER        READE     RAPPUR1                                80                                            
583.00 30808      C                   ENDDO                                                                                          
584.00 30808      C* Print Footer                                                                                                    
585.00 30808      C                   WRITE     RFOOTER                                                                              
586.00 30808      C                   CLOSE     IHAPPLST                                                                             
587.00 30806      C                   ENDSR                                                                                          
588.00 30807       ********************************************************************                                              
589.00 30807       * LODUSR - LOAD USER LIST FOR GIVEN OPTION                                                                        
590.00 30807       ********************************************************************                                              
591.00 30807      C     LODUSR        BEGSR                                                                                          
592.00 30807      C* Initialize                                                                                                      
593.00 30807      C                   SETON                                        52                                                
594.00 30807      C                   WRITE     OPTMNT                                                                               
595.00 30807      C                   SETOFF                                       505253                                            
596.00 30807      C                   Z-ADD     *ZERO         RRN2              3 0                                                  
597.00 30807      C* Load User List                                                                                                  
598.00 30807      C                   MOVE      SVMOPT        KMOPT                                                                  
599.00 30807      C                   MOVE      SVLVL         KLEVEL                                                                 
600.00 30807      C                   MOVE      SVOPT         KOPT                                                                   
601.00 30807      C     KEYOPT        CHAIN     RAPPUR2                            53                                                
602.00 30807      C     *IN53         DOWEQ     *OFF                                                                                 
603.00 30807      C                   ADD       1             RRN2                                                                   
604.00 30807      C                   MOVE      *BLANK        SOSEL                                                                  
605.00 30807      C                   MOVE      AUSER         SOUSER                                                                 
606.00 30807      C                   MOVE      ABRN          SOBRN                                                                  
607.00 30807      C                   MOVE      ABNAME        SOBNAME                                                                
608.00 30807      C                   WRITE     OPTMNTS                                                                              
609.00 30807      C     KEYOPT        READE     RAPPUR2                                53                                            
610.00 30807      C                   ENDDO                                                                                          
611.00 30809      C*                                                                                                                 
612.00 30807      C     RRN2          COMP      0                                  50  90                                            
613.00 30807      C   90              EVAL      ERRMSG = 'No users for this option'                                                  
614.00 30807      C                   ENDSR                                                                                          
615.00 30807       ********************************************************************                                              
616.00 30807       * ADDNEWUSR - ADD NEW USERS FOR GIVEN OPTION                                                                      
617.00 30807       ********************************************************************                                              
618.00 30807      C     ADDNEWUSR     BEGSR                                                                                          
619.00 30807      C                   SETOFF                                       90                                                
620.00 30807      C                   MOVE      *BLANK        PUSER                                                                  
621.00 30807      C                   MOVE      SVMOPT        PMOPT                                                                  
622.00 30807      C                   MOVE      SVLVL         PLEVEL                                                                 
623.00 30807      C                   MOVE      SVOPT         POPT                                                                   
624.00 30807      C                   Z-ADD     *ZERO         PADD                                                                   
625.00 30807      C                   Z-ADD     *ZERO         PNADD                                                                  
626.00 30807      C                   CALL      'IHAADD'                                                                             
627.00 30807      C                   PARM                    PUSER            10                                                    
628.00 30807      C                   PARM                    PMOPT             6                                                    
629.00 30807      C                   PARM                    PLEVEL            1                                                    
630.00 30807      C                   PARM                    POPT              2                                                    
631.00 30807      C                   PARM                    PADD              3 0                                                  
632.00 30807      C                   PARM                    PNADD             3 0                                                  
633.00 30807      C     PADD          IFGT      *ZERO                                                                                
634.00 30807      C                   EXSR      LODUSR                                                                               
635.00 30807      C                   ENDIF                                                                                          
636.00 30807      C                   ENDSR                                                                                          
637.00 30807       ********************************************************************                                              
638.00 30807       * COPYUSR - COPY USERS FROM OTHER OPTION TO GIVEN OPTION                                                          
639.00 30807       ********************************************************************                                              
640.00 30807      C     COPYUSR       BEGSR                                                                                          
641.00 30807      C* Initialize                                                                                                      
642.00 30807      C                   MOVE      *BLANK        SFRMOPT                                                                
643.00 30807      C                   MOVE      *BLANK        SFRLVL                                                                 
644.00 30807      C                   MOVE      *BLANK        SFROPT                                                                 
645.00 30807      C                   MOVE      *BLANK        SFRDESC                                                                
646.00 30807      C                   MOVE      *BLANK        MSGFLD                                                                 
647.00 30807      C                   SETOFF                                       90                                                
648.00 30807      C* Display Screen                                                                                                  
649.00 30807      C                   EXFMT     CPYUSR                                                                               
650.00 30807      C     *IN03         DOWEQ     *OFF                                                                                 
651.00 30807      C     *IN12         ANDEQ     *OFF                                                                                 
652.00 30807      C* F4 - Prompt for Option Selection                                                                                
653.00 30807      C     *IN04         IFEQ      *ON                                                                                  
654.00 30807      C     FLD           ANDEQ     'SFRMOPT'                                                                            
655.00 30807      C                   MOVEL(P)  'OPTION'      PWIN                                                                   
656.00 30807      C                   EXSR      PROMPT                                                                               
657.00 30807      C     PRTN          IFNE      *BLANK                                                                               
658.00 30807      C                   MOVEL     PRTN          SFRMOPT                                                                
659.00 30807      C     1             SUBST     PRTN:7        SFRLVL                                                                 
660.00 30807      C     2             SUBST     PRTN:8        SFROPT                                                                 
661.00 30807      C     50            SUBST     PRTN:10       SFRDESC                                                                
662.00 30807      C                   ENDIF                                                                                          
663.00 30807      C                   ENDIF                                                                                          
664.00 30807      C* CHECK "FROM MAIN OPTION"                                                                                        
665.00 30807      C     SFRMOPT       IFNE      *BLANK                                                                               
666.00 30807      C     SFRDESC       IFEQ      SOPTION                                                                              
667.00 30807      C                   SETON                                        90                                                
668.00 30807      C                   EVAL      ERRMSG = 'Same Option'                                                               
669.00 30809      C                   ELSE                                                                                           
670.00 30809      C                   MOVE      SFRMOPT       KMOPT                                                                  
671.00 30809      C                   MOVE      SFRLVL        KLEVEL                                                                 
672.00 30809      C                   MOVE      SFROPT        KOPT                                                                   
673.00 30809      C     KEYOPT        CHAIN     RAPPUR2                            70                                                
674.00 30809      C   70              SETON                                        90                                                
675.00 30809      C   70              EVAL      ERRMSG = 'No users for this option'                                                  
676.00 30807      C                   ENDIF                                                                                          
677.00 30807      C                   ENDIF                                                                                          
678.00 30807      C* F10 - Confirm                                                                                                   
679.00 30807      C     *IN10         IFEQ      *ON                                                                                  
680.00 30807      C     *IN90         ANDEQ     *OFF                                                                                 
681.00 30807      C     SFRMOPT       IFNE      *BLANK                                                                               
682.00 30807      C/EXEC SQL                                                                                                         
683.00 30807      C+ INSERT INTO APPUSRPF                                                                                            
684.00 30807      C+ SELECT AUSER, :SVMOPT, :SVLVL, :SVOPT, ABRN, AIBRN, ABNAME                                                      
685.00 30807      C+ FROM APPUSRPF                                                                                                   
686.00 30807      C+ WHERE AMOPT = :SFRMOPT AND ALEVEL = :SFRLVL AND AOPT = :SFROPT                                                  
687.00 30807      C/END-EXEC                                                                                                         
688.00 30807      C                   EVAL      MSGFLD = 'All users copied' +                                                        
689.00 30807      C                             ' successfully'                                                                      
690.00 30807      C                   EXSR      LODUSR                                                                               
691.00 30807      C                   SETOFF                                       90                                                
692.00 30807      C                   ELSE                                                                                           
693.00 30807      C                   SETON                                        90                                                
694.00 30807      C                   EVAL      ERRMSG = 'From Option cannot be blank'                                               
695.00 30807      C                   ENDIF                                                                                          
696.00 30807      C                   ENDIF                                                                                          
697.00 30807      C* Display Screen                                                                                                  
698.00 30807      C                   EXFMT     CPYUSR                                                                               
699.00 30807      C                   MOVE      *BLANK        MSGFLD                                                                 
700.00 30807      C                   SETOFF                                       90                                                
701.00 30807      C                   ENDDO                                                                                          
702.00 30807      C                   ENDSR                                                                                          
703.00 30807       ********************************************************************                                              
704.00 30807       * DELUSR - DELETE ALL USERS FOR GIVEN OPTION                                                                      
705.00 30807       ********************************************************************                                              
706.00 30807      C     DELUSR        BEGSR                                                                                          
707.00 30807      C     RRN2          IFGT      *ZERO                                                                                
708.00 30807      C                   EXFMT     CFMWIN                                                                               
709.00 30807      C     *IN12         DOWEQ     *OFF                                                                                 
710.00 30807      C     *IN14         IFEQ      *ON                                                                                  
711.00 30807      C/EXEC SQL                                                                                                         
712.00 30807      C+ DELETE FROM APPUSRPF                                                                                            
713.00 30807      C+ WHERE AMOPT = :SVMOPT AND ALEVEL = :SVLVL AND AOPT = :SVOPT                                                     
714.00 30807      C/END-EXEC                                                                                                         
715.00 30807      C                   EXSR      LODUSR                                                                               
716.00 30807      C                   SETOFF                                       90                                                
717.00 30807      C                   LEAVE                                                                                          
718.00 30807      C                   ENDIF                                                                                          
719.00 30807      C                   EXFMT     CFMWIN                                                                               
720.00 30807      C                   ENDDO                                                                                          
721.00 30807      C                   ELSE                                                                                           
722.00 30807      C                   SETON                                        90                                                
723.00 30807      C                   EVAL      ERRMSG = 'No users for this option'                                                  
724.00 30807      C                   ENDIF                                                                                          
725.00 30807      C                   ENDSR                                                                                          
726.00 30807       ********************************************************************                                              
727.00 30807       * PRTBYOPT - PRINT LIST FOR GIVEN OPTION                                                                          
728.00 30807       ********************************************************************                                              
729.00 30807      C     PRTBYOPT      BEGSR                                                                                          
730.00 30808      C                   OPEN      IHAPPLST                                                                             
731.00 30808      C* Print Header                                                                                                    
732.00 30808      C                   WRITE     RHEADER                                                                              
733.00 30808      C                   CLEAR                   ROPT                                                                   
734.00 30808      C                   MOVE      SVMOPT        IHMOPT                                                                 
735.00 30808      C                   MOVE      SVLVL         IHLEVEL                                                                
736.00 30808      C                   MOVE      SVOPT         IHOPT                                                                  
737.00 30808      C                   MOVE      SVDESC        IHDESC                                                                 
738.00 30808      C                   WRITE     ROPT                                                                                 
739.00 30808      C* Print Details                                                                                                   
740.00 30808      C                   MOVE      IHMOPT        KMOPT                                                                  
741.00 30808      C                   MOVE      IHLEVEL       KLEVEL                                                                 
742.00 30808      C                   MOVE      IHOPT         KOPT                                                                   
743.00 30808      C     KEYOPT        CHAIN     RAPPUR2                            80                                                
744.00 40401      C                   Z-ADD     0             TCOUNT                                                                 
745.00 30808      C     *IN80         DOWEQ     *OFF                                                                                 
746.00 30808      C                   CLEAR                   RUSRLST                                                                
747.00 30808      C                   MOVE      AUSER         IHUSER                                                                 
748.00 30808      C                   MOVE      ABRN          IHBRN                                                                  
749.00 30808      C                   MOVE      AIBRN         IHIBRN                                                                 
750.00 30808      C                   MOVE      ABNAME        IHBNAME                                                                
751.00 30808      C                   WRITE     RUSRLST                                                                              
752.00 40401      C                   ADD       1             TCOUNT                                                                 
753.00 30808      C* Overflow Control                                                                                                
754.00 30808      C     *IN30         IFEQ      *ON                                                                                  
755.00 30808      C                   WRITE     RHEADER                                                                              
756.00 30808      C                   WRITE     ROPT                                                                                 
757.00 30808      C                   SETOFF                                       30                                                
758.00 30808      C                   ENDIF                                                                                          
759.00 30808      C* Read next                                                                                                       
760.00 30808      C     KEYOPT        READE     RAPPUR2                                80                                            
761.00 30808      C                   ENDDO                                                                                          
762.00 30808      C* Print Footer                                                                                                    
763.00 30808      C                   WRITE     RFOOTER                                                                              
764.00 30808      C                   CLOSE     IHAPPLST                                                                             
765.00 30807      C                   ENDSR                                                                                          
