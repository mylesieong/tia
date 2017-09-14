1.00 110308      *************************************************************************  
2.00 131213       * REFERENCE NO. :                                                     *   
3.00 131213       * AUTHOR        : Alert Au                                            *   
4.00 131213       * USER ID.      : BG09PGM                                             *   
5.00 131213       * DATE WRITTEN  : 11 Dec 2013                                         *   
6.00 131213       * DESCRPITION   : Display Currency Exchange Rate                      *   
7.00 131213       *                                                                     *   
8.00 131213       * INDICATOR     : *IN03 = Leave the application                       *   
9.00 131213       *                 *IN05 = Refresh Currency Exchange Rate              *   
10.00 150302 D5031 *                 *IN09 = Print Exchange Rate Report                  *   
11.00 150303 D5031 *                         (Call I700BCM/QEXRTESRC/CRTERPTCL)          *   
12.00 140130       * remark        : set mop<->hk to 1.03 and 1.0315                     *   
13.00 140130       *                                                                     *   
14.00 150204       *                 Bank Sell - must be 1 div                           *   
15.00 140130       *                                                                     *   
16.00 131008       ************************************************************************  
17.00 150304       * REFERENCE NO. : CHG-0031-15(D5031)                                  *   
18.00 150304       * USER ID       : BG24PGM                                             *   
19.00 150304       * USER NAME     : Eric Wong                                           *   
20.00 150304       * CHANGED DATE  : 21-Nov-2014                                         *   
21.00 150304       * DESCRPITION   : Inquiry Exchange Rate History                       *   
22.00 150226       ************************************************************************  
23.00 150304       * REFERENCE NO. : CHG-0031-15(D5031)                                  *   
24.00 150304       * USER ID       : BG09                                                *   
25.00 150304       * USER NAME     : ALBERT AU                                           *   
26.00 150304       * CHANGED DATE  : 25-Feb-2015                                         *   
27.00 150304       * DESCRPITION   : New Screen Format                                   *   
28.00 150304       ************************************************************************  
29.00 160421       * REFERENCE NO. : CHG-0122-16(D6122)                                  *   
30.00 160419       * USER ID       : BG09                                                *   
31.00 160419       * USER NAME     : ALBERT AU                                           *   
32.00 160419       * CHANGED DATE  : 19-Apr-2016                                         *   
33.00 160419       * DESCRPITION   : Modify disply format for CNY                        *   
34.00 160419       ************************************************************************  
35.00 160729       * REFERENCE NO. : CHG-0250-16(D6250)                                  *   
36.00 160603       * USER ID       : BI77                                                *   
37.00 160603       * USER NAME     : MYLES IEONG                                         *   
38.00 160603       * CHANGED DATE  : 03-Jun-2016                                         *   
39.00 160923       * DESCRPITION   : 1. Add Group & Channel Options                      *   
40.00 160603       *                 2. Add GGRPRATE module calling for group option     *   
41.00 160923       *                 3. Add Group parameter to F9 print function         *   
42.00 160603       ************************************************************************  
43.00 110308      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
44.00 110308       ************************************************************************  
45.00 110308       * File Specification                                                      
46.00 110308       ************************************************************************  
47.00 140409      FCRTECCYLSTIF   E           K DISK    USROPN                               
48.00 131211      FCRTEINQD  CF   E             WORKSTN SFILE(SCCYINQSF:RRN)                 
49.00 160729 D6250FRTGCHNLST IF   E           K DISK                                         
50.00 160729 D6250FRTGGRPLST IF   E           K DISK                                         
51.00 131213       ************************************************************************  
52.00 110308       *Variables / constant defination                                          
53.00 110308       ************************************************************************  
54.00 131011       *System Information                                                       
55.00 110310      D DSPGID         SDS                                                       
56.00 110310      D  WKDATE               191    198  0                                      
57.00 110310      D  USER                 254    263                                         
58.00 140318      D TTIME           S               T                                        
59.00 140318      D RRN             S              4  0 INZ(0)                               
60.00 140318      D                                                                          
61.00 131213      D                                                                          
62.00 131213      D PSTATUS         S              1S 0                                      
63.00 140318      D PCCYNUM         S              3  0                                      
64.00 140318      D PRATTYP         S              1A                                        
65.00 140318      D DEFFECTDATE     S              8  0                                      
66.00 140318      D DEFFECTTIME     S              6  0                                      
67.00 150226 D5031D TCCYDIGITS      S              1A   INZ('4')                             
68.00 150302 D5031D TDIGITS74       S              7  4                                      
69.00 150302 D5031D TDIGITS75       S              7  5                                      
70.00 160809 D5031D TCHKSTATUS      S              3  0                                      
71.00 160419 ERIC D TDIVCCY         S              3  0 INZ(156)                             
72.00 160421 D6122D TCNYWRK         S              1    INZ('N')                             
73.00 140214       ************************************************************************  
74.00 140214       * Parmater define                                                         
75.00 140214       ************************************************************************  
76.00 131213       ************************************************************************  
77.00 110308       * Key List define                                                         
78.00 131213       ************************************************************************  
79.00 131213       ************************************************************************  
80.00 110308       * MAIN ROUTINE                                                            
81.00 131213       ************************************************************************  
82.00 140318       *Check authorized                                                         
83.00 140318      C                   CALL      'CHKAUT'                                     
84.00 140318      C                   PARM                    USER                           
85.00 140318      C                   PARM      'RTEINQ'      PMOPT             6            
86.00 140318      C                   PARM      '0'           PLEVEL            1            
87.00 140318      C                   PARM      '  '          POPT              2            
88.00 140318      C                   PARM                    PBRN              3            
89.00 140318      C                   PARM                    PIBRN             3            
90.00 140318      C                   PARM                    PBNAME           30            
91.00 140318      C                   PARM                    PAUT              1            
92.00 140318      C                                                                          
93.00 140318      C                   IF        PAUT = 'N'                                   
94.00 140318      C                   ELSE                                                   
95.00 140318       * Run Program                                                             
96.00 131211      C                   EXSR      INZSR                                        
97.00 131211      C                                                                          
98.00 131211      C                   DOW       *IN03 = *OFF                                 
99.00 131212      C                                                                          
100.00 131211      C                   EXFMT     SRTESF                                       
101.00 160922      C                                                                          
102.00 160922 D6250 *    Parse Group information to channel field                             
103.00 160729 D6250C                   IF        SGROUP = ''                                  
104.00 160729 D6250C                   EVAL      SCHANNEL='      '                            
105.00 160729 D6250C                   ENDIF                                                  
106.00 160729 D6250C                   IF        SGROUP = 'NET   '                            
107.00 160729 D6250C                   EVAL      SCHANNEL='ECHAN '                            
108.00 160729 D6250C                   ENDIF                                                  
109.00 160729 D6250C                   IF        SGROUP = 'VIP   '                            
110.00 160729 D6250C                   EVAL      SCHANNEL='ECHAN '                            
111.00 160729 D6250C                   ENDIF                                                  
112.00 160729 D6250C                   IF        SGROUP = 'CORP  '                            
113.00 160729 D6250C                   EVAL      SCHANNEL='ECHAN '                            
114.00 160729 D6250C                   ENDIF                                                  
115.00 160729      C                                                                          
116.00 160729 D5031 * Print function                                                          
117.00 150302 D5031C                   IF        *IN09 = *ON                                  
118.00 150302 D5031C                   CALL      'CRTERPTCL'                                  
119.00 150302 D5031C                   PARM      'U'           PFUNCTION         1            
120.00 150302 D5031C                   PARM                    DEFFECTDATE                    
121.00 150302 D5031C                   PARM                    DEFFECTTIME                    
122.00 160923 D6250C                   PARM                    SGROUP                         
123.00 150302 D5031C                   ENDIF                                                  
124.00 150302 D5031C                                                                          
125.00 131213       * Refresh Currency Exchange Rate                                          
126.00 150304      C                   IF        *IN05 = *ON                                  
127.00 150304 D5031C                   MOVEL     *DATE         SDATE                          
128.00 150304 D5031C                   TIME                    STIME                          
129.00 131211      C                   EXSR      INZSR                                        
130.00 131211      C                   SETON                                            50    
131.00 131211      C                   ENDIF                                                  
132.00 131212      C                                                                          
133.00 150304 D5031 * Inquiry Exchange Rate                                                   
134.00 150304 D5031C                   IF        *IN05 = *OFF AND *IN09 = *OFF                
135.00 150304 D5031C                   EXSR      INZSR                                        
136.00 150304 D5031C                   SETON                                            50    
137.00 150304 D5031C                   ENDIF                                                  
138.00 150304 D5031C                                                                          
139.00 131211      C                   ENDDO                                                  
140.00 140318      C                   ENDIF                                                  
141.00 140318      C                                                                          
142.00 50614      C                   SETON                                            LR    
143.00 131213       ************************************************************************  
144.00 131213       * Subroutine INZSR - Data initialization                                  
145.00 131213       ************************************************************************  
146.00 131211      C     INZSR         BEGSR                                                  
147.00 150304 D5031C                   EVAL      SMSG=*BLANK                                  
148.00 150304 D5031C                   MOVEL     'N'           DATEERR           1            
149.00 150304 D5031C                   MOVEL     'N'           TIMEERR           1            
150.00 150304 D5031C                   MOVEL     'Y'           DATEFLG           1            
151.00 160729 D6250C                   MOVEL     'N'           GRPERR            1            
152.00 160729 D6250C                   MOVEL     'N'           CHNERR            1            
153.00 150304 D5031C                                                                          
154.00 150304 D5031C                   SETOFF                                       5859      
155.00 160729 D6250C                   SETOFF                                       7172      
156.00 150304 D5031 *Check Date                                                               
157.00 150306 D5031C                   IF        SDATE=0                                      
158.00 150304 D5031C                   MOVEL     *DATE         SDATE                          
159.00 150304 D5031C                   MOVEL     SDATE         DEFFECTDATE                    
160.00 150304 D5031C                   ELSE                                                   
161.00 150304 D5031C     *ISO          TEST(DE)                SDATE                          
162.00 150304 D5031C                   IF        %ERROR                                       
163.00 150306 D5031C                   EVAL      SMSG='Invalid Date'                          
164.00 150304 D5031C                   MOVEL     'Y'           DATEERR                        
165.00 150304 D5031C                   SETON                                        58        
166.00 150304 D5031C                   ELSE                                                   
167.00 150304 D5031C                   MOVEL     SDATE         DEFFECTDATE                    
168.00 150304 D5031C                   MOVEL     'N'           DATEFLG                        
169.00 150304 D5031C                   ENDIF                                                  
170.00 150304 D5031C                   ENDIF                                                  
171.00 150304 D5031 *Check Time                                                               
172.00 150304 D5031C     *HMS          TEST(TE)                STIME                          
173.00 150304 D5031C                   IF        %ERROR                                       
174.00 150306 D5031C                   EVAL      SMSG='Invalid Time'                          
175.00 150304 D5031C                   MOVEL     'Y'           TIMEERR                        
176.00 150304 D5031C                   SETON                                        59        
177.00 150304 D5031C                   ELSE                                                   
178.00 150304 D5031C                   IF        STIME=0 OR (STIME=DEFFECTTIME                
179.00 150304 D5031C                             AND DATEFLG ='Y')                            
180.00 150304 D5031C                   TIME                    STIME                          
181.00 150304 D5031C                   MOVEL     STIME         DEFFECTTIME                    
182.00 150304 D5031C                   ELSE                                                   
183.00 150304 D5031C                   MOVEL     STIME         DEFFECTTIME                    
184.00 150304 D5031C                   ENDIF                                                  
185.00 150304 D5031C                   ENDIF                                                  
186.00 160729 D6250 *Check Group Validity                                                     
187.00 160729 D6250C                   IF        SGROUP<>''                                   
188.00 160729 D6250C     SGROUP        CHAIN     RTGGRPLST                                    
189.00 160729 D6250C                   IF        NOT %FOUND(RTGGRPLST)                        
190.00 160729 D6250C                   SETON                                        71        
191.00 160729 D6250C                   EVAL      SMSG='Invalid Group.' + SMSG                 
192.00 160729 D6250C                   MOVEL     'Y'           GRPERR                         
193.00 160729 D6250C                   ENDIF                                                  
194.00 160729 D6250C                   ENDIF                                                  
195.00 160729 D6250 *Check Channel Validity                                                   
196.00 160729 D6250C                   IF        SCHANNEL<>''                                 
197.00 160729 D6250C     SCHANNEL      CHAIN     RTGCHNLST                                    
198.00 160729 D6250C                   IF        NOT %FOUND(RTGCHNLST)                        
199.00 160729 D6250C                   SETON                                        72        
200.00 160729 D6250C                   EVAL      SMSG='Invalid Channel.' + SMSG               
201.00 160729 D6250C                   MOVEL     'Y'           CHNERR                         
202.00 160729 D6250C                   ENDIF                                                  
203.00 160729 D6250C                   ENDIF                                                  
204.00 140123      C                                                                          
205.00 140123      C                   CALL      'DICBSYMD'                                   
206.00 140123      C                   PARM                    PICBSDATE         8 0          
207.00 140212       * Display Audit Date                                                      
208.00 140123      C                   EVAL      SICBSDATE=%SUBST(%CHAR(PICBSDATE):7:2) +     
209.00 140123      C                                 '/'+  %SUBST(%CHAR(PICBSDATE):5:2) +     
210.00 140123      C                                 '/'+  %SUBST(%CHAR(PICBSDATE):3:2)       
211.00 141120      C                                                                          
212.00 140123      C                                                                          
213.00 131211      C                   SETON                                        505153    
214.00 131211      C                   WRITE     SRTESF                                       
215.00 131211      C                   EVAL      RRN = 0                                      
216.00 131211      C                   SETOFF                                       505253    
217.00 131213       * Get Currency Exchange Rate                                              
218.00 150306 D5031C                   IF        DATEERR= 'N' AND TIMEERR='N'                 
219.00 160729 D6250C                             AND GRPERR ='N' AND CHNERR ='N'              
220.00 131213      C                   EXSR      GETRATEMOD                                   
221.00 150304 D5031C                   ENDIF                                                  
222.00 140212      C                   SETON                                          5250    
223.00 131212      C                   WRITE     SCCYRTEINF                                   
224.00 131211      C                   ENDSR                                                  
225.00 131213      *************************************************************************  
226.00 140407       *Subroutine GETRATEMOD - Get data from CHEXCCYLST and Call GDRTRATE module
227.00 131216      *************************************************************************  
228.00 131213      C     GETRATEMOD    BEGSR                                                  
229.00 131213      C                                                                          
230.00 140409      C                   OPEN      CRTECCYLST                                   
231.00 131213      C                                                                          
232.00 160421 D6122C                   EVAL      TCNYWRK = 'N'                                
233.00 131216       * Check Currency Activity Flag                                            
234.00 140409      C                   READ(N)   CRTECCYLST                                   
235.00 140407      C                                                                          
236.00 140409      C                   DOW       NOT %EOF(CRTECCYLST)                         
237.00 140318      C                                                                          
238.00 160421 D6122C                   IF        CLCCY   = TDIVCCY AND TCNYWRK = 'N'          
239.00 160421 D6122C                   EVAL      TCNYWRK = 'Y'                                
240.00 160421 D6122C                   ELSE                                                   
241.00 160421 D6122C                   EVAL      TCNYWRK = 'N'                                
242.00 160421 D6122C                   ENDIF                                                  
243.00 160421 D6122C                                                                          
244.00 140407      C                   EVAL      SCCYCODE  = CLCCY                            
245.00 140407      C                   EVAL      SCCYNAME  = CLCCYNAME                        
246.00 131213      C                                                                          
247.00 140407      C                   EVAL      PCCYNUM  = CLCCY                             
248.00 150304 D5031C                                                                          
249.00 160809 D5031C                   EVAL      TCHKSTATUS = 0                               
250.00 140318       *Call GDRTRATE Module                                                     
251.00 140318      C                                                                          
252.00 140318       *Bank Buy TT MOP                                                          
253.00 150304 D5031C*                  MOVEL     *DATE         DEFFECTDATE                    
254.00 150304 D5031C*                  TIME                    DEFFECTTIME                    
255.00 160729 D6250C                   IF        SGROUP = '' AND SCHANNEL = ''                
256.00 140318      C                   EVAL      PRATTYP = 'T'                                
257.00 140318      C                   CALL      'GDRTRATE'                                   
258.00 140318      C                   PARM                    PCCYNUM                        
259.00 140318      C                   PARM      000           PTOCCY            3 0          
260.00 140318      C                   PARM                    PRATTYP                        
261.00 140318      C                   PARM                    DEFFECTDATE                    
262.00 140318      C                   PARM                    DEFFECTTIME                    
263.00 140318      C                   PARM                    PRATE            11 7          
264.00 140318      C                   PARM                    FRMEXCCY         11 7          
265.00 140318      C                   PARM                    FRMDATE           8 0          
266.00 140318      C                   PARM                    FRMTIME           6 0          
267.00 140318      C                   PARM                    TOEXCCY          11 7          
268.00 140318      C                   PARM                    TODATE            8 0          
269.00 140318      C                   PARM                    TOTIME            6 0          
270.00 140318      C                   PARM                    STATUS            1            
271.00 160729 D6250C                   ELSE                                                   
272.00 160729 D6250C                   EVAL      PRATTYP = 'T'                                
273.00 160729 D6250C                   CALL      'GGRPRATE'                                   
274.00 160729 D6250C                   PARM                    PCIF             10            
275.00 160729 D6250C                   PARM                    PCCYNUM                        
276.00 160729 D6250C                   PARM                    PFRAMT           13 2          
277.00 160729 D6250C                   PARM      000           PTOCCY            3 0          
278.00 160729 D6250C                   PARM                    PTOAMT           13 2          
279.00 160729 D6250C                   PARM                    PRATTYP                        
280.00 160729 D6250C                   PARM                    PFUNC             4            
281.00 160729 D6250C                   PARM                    SGROUP                         
282.00 160729 D6250C                   PARM                    SCHANNEL                       
283.00 160729 D6250C                   PARM                    DEFFECTDATE                    
284.00 160729 D6250C                   PARM                    DEFFECTTIME                    
285.00 160729 D6250C                   PARM                    PRATE            11 7          
286.00 160729 D6250C                   PARM                    FRMEXCCY         11 7          
287.00 160729 D6250C                   PARM                    FRMDATE           8 0          
288.00 160729 D6250C                   PARM                    FRMTIME           6 0          
289.00 160729 D6250C                   PARM                    TOEXCCY          11 7          
290.00 160729 D6250C                   PARM                    TODATE            8 0          
291.00 160729 D6250C                   PARM                    TOTIME            6 0          
292.00 160729 D6250C                   PARM                    PDSPCCYRT        11 7          
293.00 160729 D6250C                   PARM                    PIND1             1            
294.00 160729 D6250C                   PARM                    PIND2             1            
295.00 160729 D6250C                   PARM                    PIND3             1            
296.00 160729 D6250C                   PARM                    STATUS            1            
297.00 160729 D6250C                   ENDIF                                                  
298.00 150304 D5031C                                                                          
299.00 160809 D5031C* D6250            EVAL      TCHKSTATUS = TCHKSTATUS + %DEC(STATUS:1:0)   
300.00 160809 D5031C* D6250            IF        STATUS = '0'                                 
301.00 160809 D6250C                   IF        STATUS <> '0'                                
302.00 160809 D6250C                   EVAL      TCHKSTATUS = 1                               
303.00 160809 D6250C                   ELSE                                                   
304.00 140318      C                                                                          
305.00 150302 D5031C*                  EVAL      SMTTBUY = PRATE                              
306.00 160419 ERIC C                   IF        PCCYNUM = TDIVCCY                            
307.00 160421 D6122C                             AND TCNYWRK = 'Y'                            
308.00 160419 ERIC C                   EVAL      PRATE = 1/PRATE                              
309.00 160419 ERIC C                   ENDIF                                                  
310.00 150316      C                                                                          
311.00 150302 D5031C                   IF        CLFDUSR1 > TCCYDIGITS                        
312.00 150302 D5031C                   EVAL      TDIGITS75 = PRATE                            
313.00 150302 D5031C                   EVALR     SMTTBUY   = %TRIM(%CHAR(TDIGITS75))          
314.00 150302 D5031C                   ELSE                                                   
315.00 150302 D5031C                   EVAL      TDIGITS74 = PRATE                            
316.00 150302 D5031C                   EVALR     SMTTBUY   = %TRIM(%CHAR(TDIGITS74))          
317.00 150302 D5031C                   ENDIF                                                  
318.00 150304 D5031C                   ENDIF                                                  
319.00 140318      C                                                                          
320.00 140318       *Bank Buy TT HKD                                                          
321.00 150304 D5031C*                  MOVEL     *DATE         DEFFECTDATE                    
322.00 150304 D5031C*                  TIME                    DEFFECTTIME                    
323.00 160729 D6250C                   IF        SGROUP='' AND SCHANNEL = ''                  
324.00 140318      C                   EVAL      PRATTYP = 'T'                                
325.00 160614      C                   CALL      'GDRTRATE'                                   
326.00 140318      C                   PARM                    PCCYNUM                        
327.00 140318      C                   PARM      344           PTOCCY            3 0          
328.00 140318      C                   PARM                    PRATTYP                        
329.00 140318      C                   PARM                    DEFFECTDATE                    
330.00 140318      C                   PARM                    DEFFECTTIME                    
331.00 140318      C                   PARM                    PRATE            11 7          
332.00 140318      C                   PARM                    FRMEXCCY         11 7          
333.00 140318      C                   PARM                    FRMDATE           8 0          
334.00 140318      C                   PARM                    FRMTIME           6 0          
335.00 140318      C                   PARM                    TOEXCCY          11 7          
336.00 140318      C                   PARM                    TODATE            8 0          
337.00 140318      C                   PARM                    TOTIME            6 0          
338.00 140318      C                   PARM                    STATUS            1            
339.00 160729 D6250C                   ELSE                                                   
340.00 160729 D6250C                   EVAL      PRATTYP = 'T'                                
341.00 160729 D6250C                   CALL      'GGRPRATE'                                   
342.00 160729 D6250C                   PARM                    PCIF             10            
343.00 160729 D6250C                   PARM                    PCCYNUM                        
344.00 160729 D6250C                   PARM                    PFRAMT           13 2          
345.00 160729 D6250C                   PARM      344           PTOCCY            3 0          
346.00 160729 D6250C                   PARM                    PTOAMT           13 2          
347.00 160729 D6250C                   PARM                    PRATTYP                        
348.00 160729 D6250C                   PARM                    PFUNC             4            
349.00 160729 D6250C                   PARM                    SGROUP                         
350.00 160729 D6250C                   PARM                    SCHANNEL                       
351.00 160729 D6250C                   PARM                    DEFFECTDATE                    
352.00 160729 D6250C                   PARM                    DEFFECTTIME                    
353.00 160729 D6250C                   PARM                    PRATE            11 7          
354.00 160729 D6250C                   PARM                    FRMEXCCY         11 7          
355.00 160729 D6250C                   PARM                    FRMDATE           8 0          
356.00 160729 D6250C                   PARM                    FRMTIME           6 0          
357.00 160729 D6250C                   PARM                    TOEXCCY          11 7          
358.00 160729 D6250C                   PARM                    TODATE            8 0          
359.00 160729 D6250C                   PARM                    TOTIME            6 0          
360.00 160729 D6250C                   PARM                    PDSPCCYRT        11 7          
361.00 160729 D6250C                   PARM                    PIND1             1            
362.00 160729 D6250C                   PARM                    PIND2             1            
363.00 160729 D6250C                   PARM                    PIND3             1            
364.00 160729 D6250C                   PARM                    STATUS            1            
365.00 160729 D6250C                   ENDIF                                                  
366.00 140318      C                                                                          
367.00 160809 D5031C* D6250            EVAL      TCHKSTATUS = TCHKSTATUS + %DEC(STATUS:1:0)   
368.00 160809 D5031C* D6250            IF        STATUS = '0'                                 
369.00 160809 D6250C                   IF        STATUS <> '0'                                
370.00 160809 D6250C                   EVAL      TCHKSTATUS = 1                               
371.00 160809 D6250C                   ELSE                                                   
372.00 150302 D5031C*                  EVAL      SHTTBUY = PRATE                              
373.00 150302      C                   IF        PCCYNUM = PTOCCY                             
374.00 150302 D5031C*                  EVAL      SHTTBUY = 1                                  
375.00 150302 D5031C                   EVAL      PRATE   = 1                                  
376.00 150302      C                   ENDIF                                                  
377.00 160419 ERIC C                   IF        PCCYNUM = TDIVCCY                            
378.00 160421 D6122C                             AND TCNYWRK = 'Y'                            
379.00 160419 ERIC C                   EVAL      PRATE = 1/PRATE                              
380.00 160419 ERIC C                   ENDIF                                                  
381.00 150302 D5031C                   IF        CLFDUSR1 > TCCYDIGITS                        
382.00 150302 D5031C                   EVAL      TDIGITS75 = PRATE                            
383.00 150302 D5031C                   EVALR     SHTTBUY   = %TRIM(%CHAR(TDIGITS75))          
384.00 150302 D5031C                   ELSE                                                   
385.00 150302 D5031C                   EVAL      TDIGITS74 = PRATE                            
386.00 150302 D5031C                   EVALR     SHTTBUY   = %TRIM(%CHAR(TDIGITS74))          
387.00 150302 D5031C                   ENDIF                                                  
388.00 150304 D5031C                   ENDIF                                                  
389.00 150304      C                                                                          
390.00 140318       *Bank Buy OD MOP                                                          
391.00 150304 D5031C*                  MOVEL     *DATE         DEFFECTDATE                    
392.00 150304 D5031C*                  TIME                    DEFFECTTIME                    
393.00 160729 D6250C                   IF        SGROUP ='' AND SCHANNEL=''                   
394.00 140318      C                   EVAL      PRATTYP = 'C'                                
395.00 140318      C                   CALL      'GDRTRATE'                                   
396.00 140318      C                   PARM                    PCCYNUM                        
397.00 140318      C                   PARM      000           PTOCCY            3 0          
398.00 140318      C                   PARM                    PRATTYP                        
399.00 140318      C                   PARM                    DEFFECTDATE                    
400.00 140318      C                   PARM                    DEFFECTTIME                    
401.00 140318      C                   PARM                    PRATE            11 7          
402.00 140318      C                   PARM                    FRMEXCCY         11 7          
403.00 140318      C                   PARM                    FRMDATE           8 0          
404.00 140318      C                   PARM                    FRMTIME           6 0          
405.00 140318      C                   PARM                    TOEXCCY          11 7          
406.00 140318      C                   PARM                    TODATE            8 0          
407.00 140318      C                   PARM                    TOTIME            6 0          
408.00 140318      C                   PARM                    STATUS            1            
409.00 160729 D6250C                   ELSE                                                   
410.00 160729 D6250C                   EVAL      PRATTYP = 'C'                                
411.00 160729 D6250C                   CALL      'GGRPRATE'                                   
412.00 160729 D6250C                   PARM                    PCIF             10            
413.00 160729 D6250C                   PARM                    PCCYNUM                        
414.00 160729 D6250C                   PARM                    PFRAMT           13 2          
415.00 160729 D6250C                   PARM      000           PTOCCY            3 0          
416.00 160729 D6250C                   PARM                    PTOAMT           13 2          
417.00 160729 D6250C                   PARM                    PRATTYP                        
418.00 160729 D6250C                   PARM                    PFUNC             4            
419.00 160729 D6250C                   PARM                    SGROUP                         
420.00 160729 D6250C                   PARM                    SCHANNEL                       
421.00 160729 D6250C                   PARM                    DEFFECTDATE                    
422.00 160729 D6250C                   PARM                    DEFFECTTIME                    
423.00 160729 D6250C                   PARM                    PRATE            11 7          
424.00 160729 D6250C                   PARM                    FRMEXCCY         11 7          
425.00 160729 D6250C                   PARM                    FRMDATE           8 0          
426.00 160729 D6250C                   PARM                    FRMTIME           6 0          
427.00 160729 D6250C                   PARM                    TOEXCCY          11 7          
428.00 160729 D6250C                   PARM                    TODATE            8 0          
429.00 160729 D6250C                   PARM                    TOTIME            6 0          
430.00 160729 D6250C                   PARM                    PDSPCCYRT        11 7          
431.00 160729 D6250C                   PARM                    PIND1             1            
432.00 160729 D6250C                   PARM                    PIND2             1            
433.00 160729 D6250C                   PARM                    PIND3             1            
434.00 160729 D6250C                   PARM                    STATUS            1            
435.00 160729 D6250C                   ENDIF                                                  
436.00 150304 D5031C                                                                          
437.00 160809 D5031C* D6250            EVAL      TCHKSTATUS = TCHKSTATUS + %DEC(STATUS:1:0)   
438.00 160809 D5031C* D6250            IF        STATUS = '0'                                 
439.00 160809 D6250C                   IF        STATUS <> '0'                                
440.00 160809 D6250C                   EVAL      TCHKSTATUS = 1                               
441.00 160809 D6250C                   ELSE                                                   
442.00 150302 D5031C*                  EVAL      SMODBUY = PRATE                              
443.00 160419 ERIC C                   IF        PCCYNUM = TDIVCCY                            
444.00 160421 D6122C                             AND TCNYWRK = 'Y'                            
445.00 160419 ERIC C                   EVAL      PRATE = 1/PRATE                              
446.00 160419 ERIC C                   ENDIF                                                  
447.00 150302 D5031C                   IF        CLFDUSR1 > TCCYDIGITS                        
448.00 150302 D5031C                   EVAL      TDIGITS75 = PRATE                            
449.00 150302 D5031C                   EVALR     SMODBUY   = %TRIM(%CHAR(TDIGITS75))          
450.00 150302 D5031C                   ELSE                                                   
451.00 150302 D5031C                   EVAL      TDIGITS74 = PRATE                            
452.00 150302 D5031C                   EVALR     SMODBUY   = %TRIM(%CHAR(TDIGITS74))          
453.00 150302 D5031C                   ENDIF                                                  
454.00 150304 D5031C                   ENDIF                                                  
455.00 140318      C                                                                          
456.00 140318       *Bank Buy OD HKD                                                          
457.00 150304 D5031C*                  MOVEL     *DATE         DEFFECTDATE                    
458.00 150304 D5031C*                  TIME                    DEFFECTTIME                    
459.00 160729 D6250C                   IF        SGROUP='' AND SCHANNEL=''                    
460.00 140318      C                   EVAL      PRATTYP = 'C'                                
461.00 140318      C                   CALL      'GDRTRATE'                                   
462.00 140318      C                   PARM                    PCCYNUM                        
463.00 140318      C                   PARM      344           PTOCCY            3 0          
464.00 140318      C                   PARM                    PRATTYP                        
465.00 140318      C                   PARM                    DEFFECTDATE                    
466.00 140318      C                   PARM                    DEFFECTTIME                    
467.00 140318      C                   PARM                    PRATE            11 7          
468.00 140318      C                   PARM                    FRMEXCCY         11 7          
469.00 140318      C                   PARM                    FRMDATE           8 0          
470.00 140318      C                   PARM                    FRMTIME           6 0          
471.00 140318      C                   PARM                    TOEXCCY          11 7          
472.00 140318      C                   PARM                    TODATE            8 0          
473.00 140318      C                   PARM                    TOTIME            6 0          
474.00 140318      C                   PARM                    STATUS            1            
475.00 160729 D6250C                   ELSE                                                   
476.00 160729 D6250C                   EVAL      PRATTYP = 'C'                                
477.00 160729 D6250C                   CALL      'GGRPRATE'                                   
478.00 160729 D6250C                   PARM                    PCIF             10            
479.00 160729 D6250C                   PARM                    PCCYNUM                        
480.00 160729 D6250C                   PARM                    PFRAMT           13 2          
481.00 160729 D6250C                   PARM      344           PTOCCY            3 0          
482.00 160729 D6250C                   PARM                    PTOAMT           13 2          
483.00 160729 D6250C                   PARM                    PRATTYP                        
484.00 160729 D6250C                   PARM                    PFUNC             4            
485.00 160729 D6250C                   PARM                    SGROUP                         
486.00 160729 D6250C                   PARM                    SCHANNEL                       
487.00 160729 D6250C                   PARM                    DEFFECTDATE                    
488.00 160729 D6250C                   PARM                    DEFFECTTIME                    
489.00 160729 D6250C                   PARM                    PRATE            11 7          
490.00 160729 D6250C                   PARM                    FRMEXCCY         11 7          
491.00 160729 D6250C                   PARM                    FRMDATE           8 0          
492.00 160729 D6250C                   PARM                    FRMTIME           6 0          
493.00 160729 D6250C                   PARM                    TOEXCCY          11 7          
494.00 160729 D6250C                   PARM                    TODATE            8 0          
495.00 160729 D6250C                   PARM                    TOTIME            6 0          
496.00 160729 D6250C                   PARM                    PDSPCCYRT        11 7          
497.00 160729 D6250C                   PARM                    PIND1             1            
498.00 160729 D6250C                   PARM                    PIND2             1            
499.00 160729 D6250C                   PARM                    PIND3             1            
500.00 160729 D6250C                   PARM                    STATUS            1            
501.00 160729 D6250C                   ENDIF                                                  
502.00 150304 D5031C                                                                          
503.00 160809 D5031C* D6250            EVAL      TCHKSTATUS = TCHKSTATUS + %DEC(STATUS:1:0)   
504.00 160809 D5031C* D6250            IF        STATUS = '0'                                 
505.00 160809 D6250C                   IF        STATUS <> '0'                                
506.00 160809 D6250C                   EVAL      TCHKSTATUS = 1                               
507.00 160809 D6250C                   ELSE                                                   
508.00 150302 D5031C*                  EVAL      SHODBUY = PRATE                              
509.00 140318      C                   IF        PCCYNUM = PTOCCY                             
510.00 150302 D5031C*                  EVAL      SHODBUY = 1                                  
511.00 150302 D5031C                   EVAL      PRATE   = 1                                  
512.00 140318      C                   ENDIF                                                  
513.00 160419 ERIC C                   IF        PCCYNUM = TDIVCCY                            
514.00 160421 D6122C                             AND TCNYWRK = 'Y'                            
515.00 160419 ERIC C                   EVAL      PRATE = 1/PRATE                              
516.00 160419 ERIC C                   ENDIF                                                  
517.00 150302 D5031C                   IF        CLFDUSR1 > TCCYDIGITS                        
518.00 150302 D5031C                   EVAL      TDIGITS75 = PRATE                            
519.00 150302 D5031C                   EVALR     SHODBUY   = %TRIM(%CHAR(TDIGITS75))          
520.00 150302 D5031C                   ELSE                                                   
521.00 150302 D5031C                   EVAL      TDIGITS74 = PRATE                            
522.00 150302 D5031C                   EVALR     SHODBUY   = %TRIM(%CHAR(TDIGITS74))          
523.00 150302 D5031C                   ENDIF                                                  
524.00 150304 D5031C                   ENDIF                                                  
525.00 140318      C                                                                          
526.00 140318       *Bank Sell TT MOP                                                         
527.00 150304 D5031C*                  MOVEL     *DATE         DEFFECTDATE                    
528.00 160729 D5031C*                  TIME                    DEFFECTTIME                    
529.00 160729 D6250C                   IF        SGROUP = '' AND SCHANNEL = ''                
530.00 140318      C                   EVAL      PRATTYP = 'C'                                
531.00 140318      C                   CALL      'GDRTRATE'                                   
532.00 140318      C                   PARM      000           PFRMCCY           3 0          
533.00 140318      C                   PARM                    PCCYNUM                        
534.00 140318      C                   PARM                    PRATTYP                        
535.00 140318      C                   PARM                    DEFFECTDATE                    
536.00 140318      C                   PARM                    DEFFECTTIME                    
537.00 140318      C                   PARM                    PRATE            11 7          
538.00 140318      C                   PARM                    FRMEXCCY         11 7          
539.00 140318      C                   PARM                    FRMDATE           8 0          
540.00 140318      C                   PARM                    FRMTIME           6 0          
541.00 140318      C                   PARM                    TOEXCCY          11 7          
542.00 140318      C                   PARM                    TODATE            8 0          
543.00 140318      C                   PARM                    TOTIME            6 0          
544.00 140318      C                   PARM                    STATUS            1            
545.00 160729 D6250C                   ELSE                                                   
546.00 160729 D6250C                   EVAL      PRATTYP = 'C'                                
547.00 160729 D6250C                   CALL      'GGRPRATE'                                   
548.00 160729 D6250C                   PARM                    PCIF             10            
549.00 160729 D6250C                   PARM      000           PFRMCCY           3 0          
550.00 160729 D6250C                   PARM                    PFRAMT           13 2          
551.00 160729 D6250C                   PARM                    PCCYNUM                        
552.00 160729 D6250C                   PARM                    PTOAMT           13 2          
553.00 160729 D6250C                   PARM                    PRATTYP                        
554.00 160729 D6250C                   PARM                    PFUNC             4            
555.00 160729 D6250C                   PARM                    SGROUP                         
556.00 160729 D6250C                   PARM                    SCHANNEL                       
557.00 160729 D6250C                   PARM                    DEFFECTDATE                    
558.00 160729 D6250C                   PARM                    DEFFECTTIME                    
559.00 160729 D6250C                   PARM                    PRATE            11 7          
560.00 160729 D6250C                   PARM                    FRMEXCCY         11 7          
561.00 160729 D6250C                   PARM                    FRMDATE           8 0          
562.00 160729 D6250C                   PARM                    FRMTIME           6 0          
563.00 160729 D6250C                   PARM                    TOEXCCY          11 7          
564.00 160729 D6250C                   PARM                    TODATE            8 0          
565.00 160729 D6250C                   PARM                    TOTIME            6 0          
566.00 160729 D6250C                   PARM                    PDSPCCYRT        11 7          
567.00 160729 D6250C                   PARM                    PIND1             1            
568.00 160729 D6250C                   PARM                    PIND2             1            
569.00 160729 D6250C                   PARM                    PIND3             1            
570.00 160729 D6250C                   PARM                    STATUS            1            
571.00 160729 D6250C                   ENDIF                                                  
572.00 150304 D5031C                                                                          
573.00 160809 D5031C* D6250            EVAL      TCHKSTATUS = TCHKSTATUS + %DEC(STATUS:1:0)   
574.00 160809 D5031C* D6250            IF        STATUS = '0'                                 
575.00 160809 D6250C                   IF        STATUS <> '0'                                
576.00 160809 D6250C                   EVAL      TCHKSTATUS =1                                
577.00 160809 D6250C                   ELSE                                                   
578.00 150302 D5031C*                  EVAL      SMTTSELL= 1 / PRATE                          
579.00 160419 ERIC C                   IF        PCCYNUM <>TDIVCCY                            
580.00 160421 D6122C                             OR TCNYWRK = 'N'                             
581.00 160419 D5031C                   EVAL      PRATE   = 1 / PRATE                          
582.00 160419 ERIC C                   ENDIF                                                  
583.00 150302 D5031C                   IF        CLFDUSR1 > TCCYDIGITS                        
584.00 150302 D5031C                   EVAL      TDIGITS75 = PRATE                            
585.00 150302 D5031C                   EVALR     SMTTSELL  = %TRIM(%CHAR(TDIGITS75))          
586.00 150302 D5031C                   ELSE                                                   
587.00 150302 D5031C                   EVAL      TDIGITS74 = PRATE                            
588.00 150302 D5031C                   EVALR     SMTTSELL  = %TRIM(%CHAR(TDIGITS74))          
589.00 150302 D5031C                   ENDIF                                                  
590.00 150304 D5031C                   ENDIF                                                  
591.00 131213      C                                                                          
592.00 140318       *Bank Sell TT HKD                                                         
593.00 150304 D5031C*                  MOVEL     *DATE         DEFFECTDATE                    
594.00 150304 D5031C*                  TIME                    DEFFECTTIME                    
595.00 160729 D6250C                   IF        SGROUP = '' AND SCHANNEL = ''                
596.00 140318      C                   EVAL      PRATTYP = 'C'                                
597.00 140318      C                   CALL      'GDRTRATE'                                   
598.00 140318      C                   PARM      344           PFRMCCY           3 0          
599.00 140318      C                   PARM                    PCCYNUM                        
600.00 140318      C                   PARM                    PRATTYP                        
601.00 140318      C                   PARM                    DEFFECTDATE                    
602.00 140318      C                   PARM                    DEFFECTTIME                    
603.00 140318      C                   PARM                    PRATE            11 7          
604.00 140318      C                   PARM                    FRMEXCCY         11 7          
605.00 140318      C                   PARM                    FRMDATE           8 0          
606.00 140318      C                   PARM                    FRMTIME           6 0          
607.00 140318      C                   PARM                    TOEXCCY          11 7          
608.00 140318      C                   PARM                    TODATE            8 0          
609.00 140318      C                   PARM                    TOTIME            6 0          
610.00 140318      C                   PARM                    STATUS            1            
611.00 160729 D6250C                   ELSE                                                   
612.00 160729 D6250C                   EVAL      PRATTYP = 'C'                                
613.00 160729 D6250C                   CALL      'GGRPRATE'                                   
614.00 160729 D6250C                   PARM                    PCIF             10            
615.00 160729 D6250C                   PARM      344           PFRMCCY           3 0          
616.00 160729 D6250C                   PARM                    PFRAMT           13 2          
617.00 160729 D6250C                   PARM                    PCCYNUM                        
618.00 160729 D6250C                   PARM                    PTOAMT           13 2          
619.00 160729 D6250C                   PARM                    PRATTYP                        
620.00 160729 D6250C                   PARM                    PFUNC             4            
621.00 160729 D6250C                   PARM                    SGROUP                         
622.00 160729 D6250C                   PARM                    SCHANNEL                       
623.00 160729 D6250C                   PARM                    DEFFECTDATE                    
624.00 160729 D6250C                   PARM                    DEFFECTTIME                    
625.00 160729 D6250C                   PARM                    PRATE            11 7          
626.00 160729 D6250C                   PARM                    FRMEXCCY         11 7          
627.00 160729 D6250C                   PARM                    FRMDATE           8 0          
628.00 160729 D6250C                   PARM                    FRMTIME           6 0          
629.00 160729 D6250C                   PARM                    TOEXCCY          11 7          
630.00 160729 D6250C                   PARM                    TODATE            8 0          
631.00 160729 D6250C                   PARM                    TOTIME            6 0          
632.00 160729 D6250C                   PARM                    PDSPCCYRT        11 7          
633.00 160729 D6250C                   PARM                    PIND1             1            
634.00 160729 D6250C                   PARM                    PIND2             1            
635.00 160729 D6250C                   PARM                    PIND3             1            
636.00 160729 D6250C                   PARM                    STATUS            1            
637.00 160729 D6250C                   ENDIF                                                  
638.00 150304 D5031C                                                                          
639.00 160809 D5031C* D6250            EVAL      TCHKSTATUS = TCHKSTATUS + %DEC(STATUS:1:0)   
640.00 160809 D5031C* D6250            IF        STATUS = '0'                                 
641.00 160809 D6250C                   IF        STATUS <> '0'                                
642.00 160809 D6250C                   EVAL      TCHKSTATUS =1                                
643.00 160809 D6250C                   ELSE                                                   
644.00 150302 D5031C*                  EVAL      SHTTSELL= 1 / PRATE                          
645.00 160419 ERIC C                   IF        PCCYNUM <>TDIVCCY                            
646.00 160421 D6122C                             OR TCNYWRK = 'N'                             
647.00 160419 D5031C                   EVAL      PRATE   = 1 / PRATE                          
648.00 160419 ERIC C                   ENDIF                                                  
649.00 140318      C                   IF        PCCYNUM = PFRMCCY                            
650.00 150302 D5031C*                  EVAL      SHTTSELL= 1                                  
651.00 150302 D5031C                   EVAL      PRATE   = 1                                  
652.00 140318      C                   ENDIF                                                  
653.00 150302 D5031C                   IF        CLFDUSR1 > TCCYDIGITS                        
654.00 150302 D5031C                   EVAL      TDIGITS75 = PRATE                            
655.00 150302 D5031C                   EVALR     SHTTSELL  = %TRIM(%CHAR(TDIGITS75))          
656.00 150302 D5031C                   ELSE                                                   
657.00 150302 D5031C                   EVAL      TDIGITS74 = PRATE                            
658.00 150302 D5031C                   EVALR     SHTTSELL  = %TRIM(%CHAR(TDIGITS74))          
659.00 150302 D5031C                   ENDIF                                                  
660.00 150304 D5031C                   ENDIF                                                  
661.00 131213      C                                                                          
662.00 140318       *Bank Sell OD MOP                                                         
663.00 150304 D5031C*                  MOVEL     *DATE         DEFFECTDATE                    
664.00 150304 D5031C*                  TIME                    DEFFECTTIME                    
665.00 160729 D6250C                   IF        SGROUP = '' AND SCHANNEL = ''                
666.00 140318      C                   EVAL      PRATTYP = 'T'                                
667.00 140318      C                   CALL      'GDRTRATE'                                   
668.00 140318      C                   PARM      000           PFRMCCY           3 0          
669.00 140318      C                   PARM                    PCCYNUM                        
670.00 140318      C                   PARM                    PRATTYP                        
671.00 140318      C                   PARM                    DEFFECTDATE                    
672.00 140318      C                   PARM                    DEFFECTTIME                    
673.00 140318      C                   PARM                    PRATE            11 7          
674.00 140318      C                   PARM                    FRMEXCCY         11 7          
675.00 140318      C                   PARM                    FRMDATE           8 0          
676.00 140318      C                   PARM                    FRMTIME           6 0          
677.00 140318      C                   PARM                    TOEXCCY          11 7          
678.00 140318      C                   PARM                    TODATE            8 0          
679.00 140318      C                   PARM                    TOTIME            6 0          
680.00 140318      C                   PARM                    STATUS            1            
681.00 160729 D6250C                   ELSE                                                   
682.00 160729 D6250C                   EVAL      PRATTYP = 'T'                                
683.00 160729 D6250C                   CALL      'GGRPRATE'                                   
684.00 160729 D6250C                   PARM                    PCIF             10            
685.00 160729 D6250C                   PARM      000           PFRMCCY           3 0          
686.00 160729 D6250C                   PARM                    PFRAMT           13 2          
687.00 160729 D6250C                   PARM                    PCCYNUM                        
688.00 160729 D6250C                   PARM                    PTOAMT           13 2          
689.00 160729 D6250C                   PARM                    PRATTYP                        
690.00 160729 D6250C                   PARM                    PFUNC             4            
691.00 160729 D6250C                   PARM                    SGROUP                         
692.00 160729 D6250C                   PARM                    SCHANNEL                       
693.00 160729 D6250C                   PARM                    DEFFECTDATE                    
694.00 160729 D6250C                   PARM                    DEFFECTTIME                    
695.00 160729 D6250C                   PARM                    PRATE            11 7          
696.00 160729 D6250C                   PARM                    FRMEXCCY         11 7          
697.00 160729 D6250C                   PARM                    FRMDATE           8 0          
698.00 160729 D6250C                   PARM                    FRMTIME           6 0          
699.00 160729 D6250C                   PARM                    TOEXCCY          11 7          
700.00 160729 D6250C                   PARM                    TODATE            8 0          
701.00 160729 D6250C                   PARM                    TOTIME            6 0          
702.00 160729 D6250C                   PARM                    PDSPCCYRT        11 7          
703.00 160729 D6250C                   PARM                    PIND1             1            
704.00 160729 D6250C                   PARM                    PIND2             1            
705.00 160729 D6250C                   PARM                    PIND3             1            
706.00 160729 D6250C                   PARM                    STATUS            1            
707.00 160729 D6250C                   ENDIF                                                  
708.00 150304 D5031C                                                                          
709.00 160809 D5031C* D6250            EVAL      TCHKSTATUS = TCHKSTATUS + %DEC(STATUS:1:0)   
710.00 160809 D5031C* D6250            IF        STATUS = '0'                                 
711.00 160809 D6250C                   IF        STATUS <> '0'                                
712.00 160809 D6250C                   EVAL      TCHKSTATUS =1                                
713.00 160809 D6250C                   ELSE                                                   
714.00 150302 D5031C*                  EVAL      SMODSELL= 1 / PRATE                          
715.00 160419 ERIC C                   IF        PCCYNUM <> TDIVCCY                           
716.00 160421 D6122C                             OR TCNYWRK = 'N'                             
717.00 160419 D5031C                   EVAL      PRATE   = 1 / PRATE                          
718.00 160419 ERIC C                   ENDIF                                                  
719.00 150302 D5031C                   IF        CLFDUSR1 > TCCYDIGITS                        
720.00 150302 D5031C                   EVAL      TDIGITS75 = PRATE                            
721.00 150302 D5031C                   EVALR     SMODSELL  = %TRIM(%CHAR(TDIGITS75))          
722.00 160729 D5031C                   ELSE                                                   
723.00 150302 D5031C                   EVAL      TDIGITS74 = PRATE                            
724.00 150302 D5031C                   EVALR     SMODSELL  = %TRIM(%CHAR(TDIGITS74))          
725.00 150302 D5031C                   ENDIF                                                  
726.00 150304 D5031C                   ENDIF                                                  
727.00 140318      C                                                                          
728.00 140318       *Bank Sell OD HKD                                                         
729.00 150304 D5031C*                  MOVEL     *DATE         DEFFECTDATE                    
730.00 150304 D5031C*                  TIME                    DEFFECTTIME                    
731.00 160729 D6250C                   IF        SGROUP = '' AND SCHANNEL = ''                
732.00 140318      C                   EVAL      PRATTYP = 'T'                                
733.00 140318      C                   CALL      'GDRTRATE'                                   
734.00 140318      C                   PARM      344           PFRMCCY           3 0          
735.00 140318      C                   PARM                    PCCYNUM                        
736.00 140318      C                   PARM                    PRATTYP                        
737.00 140318      C                   PARM                    DEFFECTDATE                    
738.00 140318      C                   PARM                    DEFFECTTIME                    
739.00 140318      C                   PARM                    PRATE            11 7          
740.00 140318      C                   PARM                    FRMEXCCY         11 7          
741.00 140318      C                   PARM                    FRMDATE           8 0          
742.00 140318      C                   PARM                    FRMTIME           6 0          
743.00 140318      C                   PARM                    TOEXCCY          11 7          
744.00 140318      C                   PARM                    TODATE            8 0          
745.00 140318      C                   PARM                    TOTIME            6 0          
746.00 140318      C                   PARM                    STATUS            1            
747.00 160729 D6250C                   ELSE                                                   
748.00 160729 D6250C                   EVAL      PRATTYP = 'T'                                
749.00 160729 D6250C                   CALL      'GGRPRATE'                                   
750.00 160729 D6250C                   PARM                    PCIF             10            
751.00 160729 D6250C                   PARM      344           PFRMCCY           3 0          
752.00 160729 D6250C                   PARM                    PFRAMT           13 2          
753.00 160729 D6250C                   PARM                    PCCYNUM                        
754.00 160729 D6250C                   PARM                    PTOAMT           13 2          
755.00 160729 D6250C                   PARM                    PRATTYP                        
756.00 160729 D6250C                   PARM                    PFUNC             4            
757.00 160729 D6250C                   PARM                    SGROUP                         
758.00 160729 D6250C                   PARM                    SCHANNEL                       
759.00 160729 D6250C                   PARM                    DEFFECTDATE                    
760.00 160729 D6250C                   PARM                    DEFFECTTIME                    
761.00 160729 D6250C                   PARM                    PRATE            11 7          
762.00 160729 D6250C                   PARM                    FRMEXCCY         11 7          
763.00 160729 D6250C                   PARM                    FRMDATE           8 0          
764.00 160729 D6250C                   PARM                    FRMTIME           6 0          
765.00 160729 D6250C                   PARM                    TOEXCCY          11 7          
766.00 160729 D6250C                   PARM                    TODATE            8 0          
767.00 160729 D6250C                   PARM                    TOTIME            6 0          
768.00 160729 D6250C                   PARM                    PDSPCCYRT        11 7          
769.00 160729 D6250C                   PARM                    PIND1             1            
770.00 160729 D6250C                   PARM                    PIND2             1            
771.00 160729 D6250C                   PARM                    PIND3             1            
772.00 160729 D6250C                   PARM                    STATUS            1            
773.00 160729 D6250C                   ENDIF                                                  
774.00 150304 D5031C                                                                          
775.00 160809 D5031C* D6250            EVAL      TCHKSTATUS = TCHKSTATUS + %DEC(STATUS:1:0)   
776.00 160809 D5031C* D6250            IF        STATUS = '0'                                 
777.00 160809 D6250C                   IF        STATUS <> '0'                                
778.00 160809 D6250C                   EVAL      TCHKSTATUS =1                                
779.00 160809 D6250C                   ELSE                                                   
780.00 150302 D5031C*                  EVAL      SHODSELL= 1 / PRATE                          
781.00 160419 ERIC C                   IF        PCCYNUM <> TDIVCCY                           
782.00 160421 D6122C                             OR TCNYWRK = 'N'                             
783.00 160419 D5031C                   EVAL      PRATE   = 1 / PRATE                          
784.00 160419 ERIC C                   ENDIF                                                  
785.00 140318      C                   IF        PCCYNUM = PFRMCCY                            
786.00 150302 D5031C*                  EVAL      SHODSELL= 1                                  
787.00 150302 D5031C                   EVAL      PRATE   = 1                                  
788.00 140318      C                   ENDIF                                                  
789.00 150302 D5031C                   IF        CLFDUSR1 > TCCYDIGITS                        
790.00 150302 D5031C                   EVAL      TDIGITS75 = PRATE                            
791.00 150302 D5031C                   EVALR     SHODSELL  = %TRIM(%CHAR(TDIGITS75))          
792.00 150302 D5031C                   ELSE                                                   
793.00 150302 D5031C                   EVAL      TDIGITS74 = PRATE                            
794.00 150302 D5031C                   EVALR     SHODSELL  = %TRIM(%CHAR(TDIGITS74))          
795.00 150302 D5031C                   ENDIF                                                  
796.00 150304 D5031C                   ENDIF                                                  
797.00 131213      C                                                                          
798.00 160420 ALB  C                   IF        PCCYNUM <> TDIVCCY                           
799.00 160421 D6122C                             OR TCNYWRK = 'N'                             
800.00 160419 ALB  C                   EVAL      SCCYDES = %EDITC(SCCYCODE:'X') + SCCYNAME    
801.00 160420 ALB  C                   ELSE                                                   
802.00 160420 ALB  C                   EVAL      SCCYDES = %EDITC(SCCYCODE:'X') + SCCYNAME+'*'
803.00 160420 ALB  C                   ENDIF                                                  
804.00 150316 ALB  C                                                                          
805.00 160421 D6122C                   IF        PCCYNUM = TDIVCCY AND TCNYWRK = 'N'          
806.00 160421 D6122C                   EVAL      SCCYDES = '   ' + SCCYNAME                   
807.00 160421 D6122C                   ENDIF                                                  
808.00 131216       * Update SubFile                                                          
809.00 160809 D5031C                   IF        TCHKSTATUS = 0                               
810.00 131213      C                   EVAL      RRN = RRN + 1                                
811.00 131213      C                   WRITE     SCCYINQSF                                    
812.00 150304 D5031C                   ENDIF                                                  
813.00 131213      C                                                                          
814.00 160420 ALB  C                   IF        PCCYNUM = TDIVCCY                            
815.00 160421 D6122C                             AND TCNYWRK = 'N'                            
816.00 160420 ALB  C                   CLEAR                   SCCYINQSF                      
817.00 160420 ALB  C                   EVAL      RRN = RRN + 1                                
818.00 160420 ALB  C                   WRITE     SCCYINQSF                                    
819.00 160420 ALB  C                   ENDIF                                                  
820.00 160420 ALB  C                                                                          
821.00 160421 D6122C                   IF        TCNYWRK = 'N'                                
822.00 140409      C                   READ(N)   CRTECCYLST                                   
823.00 160421 D6122C                   ENDIF                                                  
824.00 160421 D6122C                   IF        TCNYWRK = 'Y'                                
825.00 160421 D6122C                   EVAL      TCNYWRK = 'F'                                
826.00 160421 D6122C                   ENDIF                                                  
827.00 131213      C                   ENDDO                                                  
828.00 131213      C                                                                          
829.00 140409      C                   CLOSE     CRTECCYLST                                   
830.00 131213      C                   ENDSR                                                  
831.00 160420      C                                                                          
