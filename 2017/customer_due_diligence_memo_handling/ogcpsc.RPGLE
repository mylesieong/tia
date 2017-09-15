1.00 110308      *************************************************************************  
2.00 150604       * REFERENCE NO. : CHG-0183-15 (D5183)                                     
3.00 150528       * AUTHOR        : Tommy Tong                                              
4.00 150602       * USER ID.      : BH90PGM                                                 
5.00 150528       * DATE WRITTEN  : 28 May 2015                                             
6.00 150528       * DESCRPITION   : OPG and Customer Position Maintenance                   
7.00 130918       *                                                                         
8.00 130911       * INDICATOR     : *IN03 = Leave the application                           
9.00 130911       *                 *IN06 = Add User ID                                     
10.00 130911       *                 *IN09 = Modify User ID                                  
11.00 130911       *                 *IN11 = Delete User ID                                  
12.00 130911       *                 *IN12 = Clear Input Value                               
13.00 150605       *                 *IN39 = Protect APPCODE and User ID field               
14.00 150603       *                 *IN40 = Validate APPCODE field                          
15.00 150605       *                 *IN41 = Protect Group & Branch field for CUS            
16.00 150605       *                 *IN42 = Protect Role field for OPG                      
17.00 170331 D7096 *                 *IN43 = Protect Option & Action field for Mentic        
18.00 150608       *                 *IN77 = Indicate any records found by CHAIN             
19.00 130903       *                                                                         
20.00 170330       ************************************************************************  
21.00 170331       * REFERENCE NO. : CHG-0096-17 (D7096)                             *       
22.00 170330       * AUTHOR        : Myles Ieong                                     *       
23.00 170330       * USER ID.      : BI77PGM                                         *       
24.00 170330       * DATE WRITTEN  : 30 Mar 2017                                     *       
25.00 170330       * DESCRPITION   : Add Memo/Tickler Authority Maintenance          *       
26.00 170330       *******************************************************************       
27.00 121019      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
28.00 110308       ************************************************************************  
29.00 121024       * File Specification                                                      
30.00 110308       ************************************************************************  
31.00 150528      FOGUSRID   UF A E           K DISK                                         
32.00 150601      FSECACC    UF A E           K DISK                                         
33.00 170331 D7096FSCAPPARM  UF A E           K DISK                                         
34.00 170331 D7096FSCAPGRP   UF A E           K DISK                                         
35.00 170420 D7096FAPPUSRL1  UF A E           K DISK                                         
36.00 150528      FOGCPDSP   CF   E             WORKSTN                                      
37.00 150601      FOGCPUSRLOGUF A E           K DISK                                         
38.00 121019       ************************************************************************  
39.00 110308       *Variables / constant defination                                          
40.00 110308       ************************************************************************  
41.00 130903      D DSPGID         SDS                                                       
42.00 130903      D  WUSER                254    263                                         
43.00 150605      DTUSRID           S              4A                                        
44.00 150605      DTCPUSRID         S              4A                                        
45.00 110308       **************************************************************************
46.00 121024       * Main routine                                                            
47.00 110308       **************************************************************************
48.00 170331 D7096C     KSCAPPARM     KLIST                                                  
49.00 170331 D7096C                   KFLD                    KSPUSER          10            
50.00 170331 D7096C                   KFLD                    KSPOPT           10            
51.00 170331 D7096C                   KFLD                    KSPACT            3            
52.00 170330      C                                                                          
53.00 170420 D7096C     KAPPUSRL1     KLIST                                                  
54.00 170420 D7096C                   KFLD                    KAUSER           10            
55.00 170420 D7096C                   KFLD                    KAMOPT            6            
56.00 170420 D7096C                   KFLD                    KALEVEL           1            
57.00 170420 D7096C                   KFLD                    KAOPT             2            
58.00 170418      C                                                                          
59.00 170418      C                   DOW       *IN03 = *OFF                                 
60.00 170418      ***** Call Main Screen                                                     
61.00 170418      C                   EXFMT     OGCPINF                                      
62.00 131004      C                                                                          
63.00 130903      C**** Clear Input Field                                                    
64.00 130911      C                   IF        *IN12 = *ON                                  
65.00 130903      C                   EXSR      CLRDTA                                       
66.00 150605      C                   MOVE      *BLANK        DSPMSG                         
67.00 130903      C                   ENDIF                                                  
68.00 150603      C                                                                          
69.00 150603      C**** Create New User,                                                     
70.00 150603      C****   check if no any input field is empty, then call the subroutine to  
71.00 150603      C****   create the new OPG or CUS user accordingly.                        
72.00 150602      C                   IF        *IN06 = *ON AND DCPUSRID = *BLANK            
73.00 150603      C                             AND DUSRID <> *BLANK                         
74.00 150603      C                             AND (                                        
75.00 150603      C                             (DAPPCODE = 'OPG' AND DGROUP <> *BLANK       
76.00 150603      C                             AND DBRANCH <> 0) OR                         
77.00 170331 D7096C*                            (DAPPCODE = 'CUS' AND DROLE <> *BLANK))      
78.00 170331 D7096C                             (DAPPCODE = 'CUS' AND DROLE <> *BLANK)       
79.00 170331 D7096C                             OR (DAPPCODE = 'MENTIC'                      
80.00 170331 D7096C                               AND DMENOPT <> *BLANK                      
81.00 170331 D7096C                               AND DMENACT <> *BLANK )                    
82.00 170331 D7096C                             )                                            
83.00 150602      C                   EVAL      SLYNMSG = 'Create this User ID ?'            
84.00 150602      C                   EVAL      SWNFLG = 'Y'                                 
85.00 150602      C                   EXFMT     SELECTYN                                     
86.00 150602      C                   IF        SWNFLG = 'Y' and DAPPCODE = 'OPG'            
87.00 150605      C                   EXSR      ADDOPGUSRREC                                 
88.00 150602      C                   ELSE                                                   
89.00 150602      C                   IF        SWNFLG = 'Y' and DAPPCODE = 'CUS'            
90.00 150605      C                   EXSR      ADDCUSUSRREC                                 
91.00 150602      C                   ENDIF                                                  
92.00 170331 D7096C                   IF        SWNFLG = 'Y' and DAPPCODE = 'MENTIC'         
93.00 170331 D7096C                   EXSR      ADDMENTIC                                    
94.00 170331 D7096C                   ENDIF                                                  
95.00 150602      C                   ENDIF                                                  
96.00 150602      C                   ENDIF                                                  
97.00 150603      C                                                                          
98.00 150608      C****   based on the Copied User ID inputted and call subroutine           
99.00 150608      C****   to create OPG and CUS user.                                        
100.00 150608      C                   IF        *IN06 = *ON AND *IN77 = *OFF AND             
101.00 150608      C                             DCPUSRID <> *BLANK AND                       
102.00 150608      C                             DUSRID <> *BLANK                             
103.00 170331 D7096C*                            AND (DAPPCODE = 'OPG' OR DAPPCODE = 'CUS')   
104.00 170331 D7096C                             AND (DAPPCODE = 'OPG' OR DAPPCODE = 'CUS'    
105.00 170331 D7096C                               OR DAPPCODE = 'MENTIC' )                   
106.00 150608      C                   EVAL      SLYNMSG = 'Create this User ID ?'            
107.00 150608      C                   EVAL      SWNFLG = 'Y'                                 
108.00 150608      C                   EXFMT     SELECTYN                                     
109.00 150608      C                   IF        SWNFLG = 'Y' and DAPPCODE = 'OPG'            
110.00 150608      C                   EXSR      CPYOPGUSRREC                                 
111.00 150608      C                   ELSE                                                   
112.00 150608      C                   IF        SWNFLG = 'Y' and DAPPCODE = 'CUS'            
113.00 150608      C                   EXSR      CPYCUSUSRREC                                 
114.00 170330      C                   ENDIF                                                  
115.00 170331 D7096C                   IF        SWNFLG = 'Y' and DAPPCODE = 'MENTIC'         
116.00 170331 D7096C                   EXSR      CPYMENTIC                                    
117.00 170331 D7096C                   ENDIF                                                  
118.00 150608      C                   ENDIF                                                  
119.00 150608      C                   ENDIF                                                  
120.00 150603      C**** Modify User                                                          
121.00 150603      C****   check if no any input field is empty, then call the subroutine to  
122.00 150603      C****   modify OPG or CUS user accordingly.                                
123.00 150605      C                   IF        *IN09 = *ON AND                              
124.00 170331 D7096C*                            (DAPPCODE = 'OPG' OR DAPPCODE = 'CUS')       
125.00 170331 D7096C                             (DAPPCODE = 'OPG' OR DAPPCODE = 'CUS'        
126.00 170331 D7096C                               OR DAPPCODE = 'MENTIC' )                   
127.00 150529      C                   EVAL      SLYNMSG = 'Modify this User ID ?'            
128.00 150529      C                   EVAL      SWNFLG = 'Y'                                 
129.00 150529      C                   EXFMT     SELECTYN                                     
130.00 150601      C                   IF        SWNFLG = 'Y' AND DAPPCODE = 'OPG'            
131.00 150605      C                   EXSR      MDYOPGUSRREC                                 
132.00 150601      C                   ELSE                                                   
133.00 150601      C                   IF        SWNFLG = 'Y' and DAPPCODE = 'CUS'            
134.00 150605      C                   EXSR      MDYCUSUSRREC                                 
135.00 150601      C                   ENDIF                                                  
136.00 170331 D7096C                   IF        SWNFLG = 'Y' and DAPPCODE = 'MENTIC'         
137.00 170331 D7096C                   EXSR      MDYMENTIC                                    
138.00 170331 D7096C                   ENDIF                                                  
139.00 150529      C                   ENDIF                                                  
140.00 150529      C                   ENDIF                                                  
141.00 150603      C                                                                          
142.00 150603      C**** Validate App Code inputtd, OPG and CUS only.                         
143.00 150605      C                   SETOFF                                       40        
144.00 150605      C                   IF        DAPPCODE <> *BLANK  AND                      
145.00 150605      C                             DAPPCODE <> 'OPG' AND DAPPCODE <> 'CUS'      
146.00 170331 D7096C                             AND DAPPCODE <> 'MENTIC'                     
147.00 150605      C                   SETON                                        40        
148.00 150605      C                   ENDIF                                                  
149.00 150605      C                                                                          
150.00 150603      C**** Display user's details based on the AppCode and User ID inputted     
151.00 150602      C                   IF        DUSRID <> *BLANK                             
152.00 150602      C                   SETON                                        39        
153.00 150601      C                   IF        DAPPCODE = 'OPG'                             
154.00 150603      C                   SETON                                        42        
155.00 150605      C                   EVAL      TUSRID     = %SUBST(DUSRID:1:4)              
156.00 150605      C     TUSRID        CHAIN     OGUSRID                                      
157.00 150601      C                   IF        %FOUND(OGUSRID)                              
158.00 150601      C                   EVAL      DGROUP = UUSRGP                              
159.00 150601      C                   EVAL      DBRANCH = UBRNCD                             
160.00 150605      C                   ENDIF                                                  
161.00 150601      C                   ELSE                                                   
162.00 150601      C                   IF        DAPPCODE = 'CUS'                             
163.00 150603      C                   SETON                                        41        
164.00 150601      C     DUSRID        CHAIN     SECACC                                       
165.00 150601      C                   IF        %FOUND(SECACC)                               
166.00 150601      C                   EVAL      DROLE = AROLE                                
167.00 150601      C                   ENDIF                                                  
168.00 150601      C                   ENDIF                                                  
169.00 150601      C                   ENDIF                                                  
170.00 170331 D7096C                   IF        DAPPCODE = 'MENTIC'                          
171.00 170331 D7096C                   EVAL      KSPUSER = DUSRID                             
172.00 170331 D7096C                   EVAL      KSPOPT = ''                                  
173.00 170331 D7096C                   EVAL      KSPACT = ''                                  
174.00 170331 D7096C     KSCAPPARM     SETLL     SCAPPARM                                     
175.00 170331 D7096C                   READ      SCAPPARM                                     
176.00 170331 D7096C                   IF        NOT %EOF(SCAPPARM)                           
177.00 170331 D7096C                             AND SPUSER = KSPUSER                         
178.00 170331 D7096C                   EVAL      DMENOPT = SPOPT                              
179.00 170331 D7096C                   EVAL      DMENACT = SPACT                              
180.00 170331 D7096 **   Chk if there are more auth under user                                
181.00 170331 D7096C                   READ      SCAPPARM                                     
182.00 170331 D7096C                   IF        NOT %EOF(SCAPPARM)                           
183.00 170331 D7096C                             AND SPUSER = KSPUSER                         
184.00 170420 D7096C*                  EVAL      DMENMORE = '+'                               
185.00 170331 D7096C                   ENDIF                                                  
186.00 170331 D7096C                                                                          
187.00 170331 D7096C                   ENDIF                                                  
188.00 170331 D7096C                   ENDIF                                                  
189.00 150605      C                   MOVE      *BLANK        DSPMSG                         
190.00 150601      C                   ENDIF                                                  
191.00 150603      C                                                                          
192.00 150601      C**** Get Group ID and Branch number or Role from UserID Copy Field        
193.00 150601      C                   IF        DCPUSRID <> *BLANK                           
194.00 150601      C                   IF        DAPPCODE = 'OPG'                             
195.00 150605      C                   EVAL      TCPUSRID     = %SUBST(DCPUSRID:1:4)          
196.00 150605      C     TCPUSRID      CHAIN     OGUSRID                            77        
197.00 150601      C                   IF        %FOUND(OGUSRID)                              
198.00 150601      C                   EVAL      DGROUP = UUSRGP                              
199.00 150601      C                   EVAL      DBRANCH = UBRNCD                             
200.00 150601      C                   ELSE                                                   
201.00 150601      C                   ENDIF                                                  
202.00 150601      C                   ELSE                                                   
203.00 150601      C                   IF        DAPPCODE = 'CUS'                             
204.00 150601      C     DCPUSRID      CHAIN     SECACC                             77        
205.00 150601      C                   IF        %FOUND(SECACC)                               
206.00 150601      C                   EVAL      DROLE = AROLE                                
207.00 150601      C                   ELSE                                                   
208.00 150601      C                   ENDIF                                                  
209.00 150601      C                   ENDIF                                                  
210.00 150601      C                   ENDIF                                                  
211.00 170331 D7096C                   IF        DAPPCODE = 'MENTIC'                          
212.00 170331 D7096C                   EVAL      KSPUSER = DCPUSRID                           
213.00 170331 D7096C                   EVAL      KSPOPT = ''                                  
214.00 170331 D7096C                   EVAL      KSPACT = ''                                  
215.00 170331 D7096C     KSCAPPARM     SETLL     SCAPPARM                                     
216.00 170331 D7096C                   READ      SCAPPARM                                     
217.00 170331 D7096C                   IF        NOT %EOF(SCAPPARM)                           
218.00 170331 D7096C                             AND SPUSER = KSPUSER                         
219.00 170331 D7096C                   EVAL      DMENOPT = SPOPT                              
220.00 170331 D7096C                   EVAL      DMENACT = SPACT                              
221.00 170331 D7096 **   Chk if there are more auth under user                                
222.00 170331 D7096C                   READ      SCAPPARM                                     
223.00 170331 D7096C                   IF        NOT %EOF(SCAPPARM)                           
224.00 170331 D7096C                             AND SPUSER = KSPUSER                         
225.00 170420 D7096C*                  EVAL      DMENMORE = '+'                               
226.00 170331 D7096C                   ENDIF                                                  
227.00 170331 D7096C                                                                          
228.00 170331 D7096C                   ENDIF                                                  
229.00 170331 D7096C                   ENDIF                                                  
230.00 150601      C                   ENDIF                                                  
231.00 150602      C                                                                          
232.00 150603      C                                                                          
233.00 150603      C**** Delete the User                                                      
234.00 150604      C****   based on the User ID inputed and call the subroutine to delete     
235.00 150604      C****   the users.                                                         
236.00 150603      C                                                                          
237.00 150529      C                   IF        *IN11 = *ON                                  
238.00 170331 D7096C*                            AND (DAPPCODE = 'OPG' OR DAPPCODE = 'CUS')   
239.00 170331 D7096C                             AND (DAPPCODE = 'OPG' OR DAPPCODE = 'CUS'    
240.00 170331 D7096C                               OR DAPPCODE = 'MENTIC' )                   
241.00 150529      C                   EVAL      SLYNMSG = 'Delete this User ID ?'            
242.00 150529      C                   EVAL      SWNFLG = 'Y'                                 
243.00 150529      C                   EXFMT     SELECTYN                                     
244.00 150601      C                   IF        SWNFLG = 'Y' and DAPPCODE = 'OPG'            
245.00 150605      C                   EXSR      DELOPGUSRREC                                 
246.00 150601      C                   ELSE                                                   
247.00 150601      C                   IF        SWNFLG = 'Y' and DAPPCODE = 'CUS'            
248.00 150605      C                   EXSR      DELCUSUSRREC                                 
249.00 150601      C                   ENDIF                                                  
250.00 170331 D7096C                   IF        SWNFLG = 'Y' and DAPPCODE = 'MENTIC'         
251.00 170331 D7096C                   EXSR      DELMENTIC                                    
252.00 170331 D7096C                   ENDIF                                                  
253.00 150529      C                   ENDIF                                                  
254.00 150529      C                   ENDIF                                                  
255.00 150528      C                   ENDDO                                                  
256.00 150528      C                   SETON                                            LR    
257.00 150528      C************************************************************************* 
258.00 150528       ************************************************************************* 
259.00 150528       * Subroutine CLRDATA - Clear Main screen input value                      
260.00 150528       ************************************************************************* 
261.00 150528      C     CLRDTA        BEGSR                                                  
262.00 150528      C                   MOVE      *BLANK        DAPPCODE                       
263.00 150528      C                   MOVE      *BLANK        DUSRID                         
264.00 150528      C                   MOVE      *BLANK        DGROUP                         
265.00 150528      C                   MOVE      *BLANK        DCPUSRID                       
266.00 150601      C                   MOVE      *BLANK        DBRANCH                        
267.00 150601      C                   MOVE      *BLANK        DROLE                          
268.00 170331 D7096C                   MOVE      *BLANK        DMENOPT                        
269.00 170331 D7096C                   MOVE      *BLANK        DMENACT                        
270.00 170331 D7096C                   MOVE      *BLANK        DMENMORE                       
271.00 150528      C                   MOVE      'N'           SWNFLG                         
272.00 150601      C                   SETOFF                                         38      
273.00 150602      C                   SETOFF                                         39      
274.00 150603      C                   SETOFF                                         41      
275.00 150603      C                   SETOFF                                         42      
276.00 170331 D7096C                   SETOFF                                         43      
277.00 150528      C                   ENDSR                                                  
278.00 150528      **********************************************************************     
279.00 150602       ************************************************************************* 
280.00 150605       * Subroutine ADDOPGUSRREC - create the new user id data based on the input
281.00 150603       * value (User ID, group and branch) for OPG users.                        
282.00 150602       ************************************************************************* 
283.00 150605      C     ADDOPGUSRREC  BEGSR                                                  
284.00 150605      C                   EVAL      TUSRID     = %SUBST(DUSRID:1:4)              
285.00 150605      C                   EVAL      UUSRID = TUSRID                              
286.00 150602      C                   EVAL      UUSRGP = DGROUP                              
287.00 150602      C                   EVAL      UBRNCD = DBRANCH                             
288.00 150602      C                   WRITE     RUSRID                                       
289.00 150605      C                   EXSR      ADDLOG                                       
290.00 150605      C                   EVAL      DSPMSG = 'Create User ID Complete !'         
291.00 150605      C                   EXSR      CLRDTA                                       
292.00 150602      C                   ENDSR                                                  
293.00 150602      **********************************************************************     
294.00 150528       ************************************************************************* 
295.00 150605       * Subroutine CPYOPGUSRREC - create new user id data based on the User     
296.00 150602       * ID in the copied user field                                             
297.00 150528       ************************************************************************* 
298.00 150605      C     CPYOPGUSRREC  BEGSR                                                  
299.00 150529      C                                                                          
300.00 150605      C                   EVAL      TCPUSRID     = %SUBST(DCPUSRID:1:4)          
301.00 150605      C     TCPUSRID      CHAIN     OGUSRID                                      
302.00 150529      C                   IF        %FOUND(OGUSRID)                              
303.00 150604      C                   DOW       UUSRID = DCPUSRID AND NOT %EOF(OGUSRID)      
304.00 150529      C                   EVAL      UUSRID = DUSRID                              
305.00 150529      C                   WRITE     RUSRID                                       
306.00 150605      C                   EXSR      ADDLOG                                       
307.00 150529      C                   READ      OGUSRID                                      
308.00 150529      C                   ENDDO                                                  
309.00 150605      C                   EVAL      DSPMSG = 'Create User ID Complete !'         
310.00 150605      C                   EXSR      CLRDTA                                       
311.00 150529      C                   ENDIF                                                  
312.00 150529      C                   ENDSR                                                  
313.00 150528      **********************************************************************     
314.00 150528       ************************************************************************* 
315.00 150605       * Subroutine DELOPGUSRREC - delete the user id data for OPG users         
316.00 150528       ************************************************************************* 
317.00 150605      C     DELOPGUSRREC  BEGSR                                                  
318.00 150605      C                   EVAL      TUSRID     = %SUBST(DUSRID:1:4)              
319.00 150605      C     TUSRID        CHAIN     OGUSRID                                      
320.00 150529      C                   IF        %FOUND(OGUSRID)                              
321.00 150529      C                   DOW       UUSRID = DUSRID AND NOT %EOF(OGUSRID)        
322.00 150529      C                   DELETE    OGUSRID                                      
323.00 150605      C                   EXSR      ADDLOG                                       
324.00 150529      C                   READ      OGUSRID                                      
325.00 150529      C                   ENDDO                                                  
326.00 150605      C                   EVAL      DSPMSG = 'Delete User ID Complete !'         
327.00 150605      C                   EXSR      CLRDTA                                       
328.00 150529      C                   ENDIF                                                  
329.00 150529      C                   ENDSR                                                  
330.00 150528      **********************************************************************     
331.00 150528       ************************************************************************* 
332.00 150605       * Subroutine MDYOPGUSRREC - modify the user id data for OPG users.        
333.00 150528       ************************************************************************* 
334.00 150605      C     MDYOPGUSRREC  BEGSR                                                  
335.00 150605      C                   EVAL      TUSRID     = %SUBST(DUSRID:1:4)              
336.00 150605      C     TUSRID        CHAIN     OGUSRID                                      
337.00 150529      C                   IF        %FOUND(OGUSRID)                              
338.00 150529      C                   EVAL      UUSRGP = DGROUP                              
339.00 150529      C                   EVAL      UBRNCD = DBRANCH                             
340.00 150529      C                   UPDATE    RUSRID                                       
341.00 150605      C                   EXSR      ADDLOG                                       
342.00 150605      C                   EVAL      DSPMSG = 'Modify User ID Complete !'         
343.00 150605      C                   EXSR      CLRDTA                                       
344.00 150529      C                   ENDIF                                                  
345.00 150529      C                   ENDSR                                                  
346.00 150528      ************************************************************************** 
347.00 150528       ************************************************************************* 
348.00 150603       * Subroutine ADDLOG - create log for updating of user id data             
349.00 150528       ************************************************************************* 
350.00 150601      C     ADDLOG        BEGSR                                                  
351.00 150601      C                   MOVE      *DATE         LOGDATE                        
352.00 150601      C                   TIME                    LOGTIME                        
353.00 150601      C                   EVAL      LOGUSR = WUSER                               
354.00 150601      C                   SELECT                                                 
355.00 150601      C                   WHEN      *IN06 = *ON                                  
356.00 150601      C                   EVAL      LOGACTION = 'A'                              
357.00 150601      C                   WHEN      *IN09 = *ON                                  
358.00 150601      C                   EVAL      LOGACTION = 'M'                              
359.00 150601      C                   WHEN      *IN11 = *ON                                  
360.00 150601      C                   EVAL      LOGACTION = 'D'                              
361.00 150601      C                   ENDSL                                                  
362.00 150605      C                   IF        DAPPCODE = 'OPG'                             
363.00 150605      C                   EVAL      LOGUSRID = UUSRID                            
364.00 150605      C                   EVAL      LOGOPGGROP = UUSRGP                          
365.00 150605      C                   EVAL      LOGOPGBRCH = UBRNCD                          
366.00 150605      C                   EVAL      LOGCUSROLE = ''                              
367.00 170405 D7096C                   EVAL      LOGMENOPT = ''                               
368.00 170405 D7096C                   EVAL      LOGMENACT = ''                               
369.00 150605      C                   ELSE                                                   
370.00 150605      C                   IF        DAPPCODE = 'CUS'                             
371.00 150604      C                   EVAL      LOGUSRID = APROFIL                           
372.00 150605      C                   EVAL      LOGOPGGROP = ''                              
373.00 150605      C                   EVAL      LOGOPGBRCH = 0                               
374.00 150605      C                   EVAL      LOGCUSROLE = AROLE                           
375.00 170405 D7096C                   EVAL      LOGMENOPT = ''                               
376.00 170405 D7096C                   EVAL      LOGMENACT = ''                               
377.00 150605      C                   ENDIF                                                  
378.00 150605      C                   ENDIF                                                  
379.00 170331 D7096C                   IF        DAPPCODE = 'MENTIC'                          
380.00 170405 D7096C                   EVAL      LOGUSRID = SPUSER                            
381.00 170405 D7096C                   EVAL      LOGOPGGROP = ''                              
382.00 170405 D7096C                   EVAL      LOGOPGBRCH = 0                               
383.00 170405 D7096C                   EVAL      LOGCUSROLE = ''                              
384.00 170405 D7096C                   EVAL      LOGMENOPT = SPOPT                            
385.00 170405 D7096C                   EVAL      LOGMENACT = SPACT                            
386.00 170331 D7096C                   ENDIF                                                  
387.00 150601      C                   EVAL      LOGCPUSRID = DCPUSRID                        
388.00 150601      C                   EVAL      LOGAPPCODE = DAPPCODE                        
389.00 150601      C                   WRITE     ROGCPLOG                                     
390.00 150601      C                   ENDSR                                                  
391.00 150602       ************************************************************************* 
392.00 150605       * Subroutine ADDCUSUSRREC - create the new user id data based on input    
393.00 150603       * value (userid and role) for CUS users.                                  
394.00 150602       ************************************************************************* 
395.00 150605      C     ADDCUSUSRREC  BEGSR                                                  
396.00 150602      C                   EVAL      APROFIL = DUSRID                             
397.00 150602      C                   EVAL      AROLE = DROLE                                
398.00 150602      C                   WRITE     RSECACC                                      
399.00 150605      C                   EXSR      ADDLOG                                       
400.00 150605      C                   EVAL      DSPMSG = 'Create Use ID Complete !'          
401.00 150605      C                   EXSR      CLRDTA                                       
402.00 150602      C                   ENDSR                                                  
403.00 150602      **********************************************************************     
404.00 150601       ************************************************************************* 
405.00 150605       * Subroutine CPYCUSUSRREC - create the new user id data based on the User 
406.00 150603       * ID in the copied user field for CUS users.                              
407.00 150601       ************************************************************************* 
408.00 150605      C     CPYCUSUSRREC  BEGSR                                                  
409.00 150601      C     DCPUSRID      CHAIN     SECACC                                       
410.00 150601      C                   IF        %FOUND(SECACC)                               
411.00 150605      C                   DOW       APROFIL = DCPUSRID AND NOT %EOF(SECACC)      
412.00 150601      C                   EVAL      APROFIL = DUSRID                             
413.00 150601      C                   WRITE     RSECACC                                      
414.00 150605      C                   EXSR      ADDLOG                                       
415.00 150601      C                   READ      SECACC                                       
416.00 150601      C                   ENDDO                                                  
417.00 150605      C                   EVAL      DSPMSG = 'Create User ID Complete !'         
418.00 150605      C                   EXSR      CLRDTA                                       
419.00 150601      C                   ENDIF                                                  
420.00 150601      C                   ENDSR                                                  
421.00 150601      **********************************************************************     
422.00 150601       ************************************************************************* 
423.00 150605       * Subroutine DELCUSUSRREC - delete the user id data for CUS users.        
424.00 150601       ************************************************************************* 
425.00 150605      C     DELCUSUSRREC  BEGSR                                                  
426.00 150601      C     DUSRID        CHAIN     SECACC                                       
427.00 150601      C                   IF        %FOUND(SECACC)                               
428.00 150601      C                   DOW       APROFIL = DUSRID AND NOT %EOF(SECACC)        
429.00 150601      C                   DELETE    SECACC                                       
430.00 150605      C                   EXSR      ADDLOG                                       
431.00 150601      C                   READ      SECACC                                       
432.00 150601      C                   ENDDO                                                  
433.00 150605      C                   EVAL      DSPMSG = 'Delete Use ID Complete !'          
434.00 150605      C                   EXSR      CLRDTA                                       
435.00 150601      C                   ENDIF                                                  
436.00 150601      C                   ENDSR                                                  
437.00 150601      **********************************************************************     
438.00 150601       ************************************************************************* 
439.00 150605       * Subroutine MDYCUSUSRREC - modify the user id data for CUS users.        
440.00 150601       ************************************************************************* 
441.00 150605      C     MDYCUSUSRREC  BEGSR                                                  
442.00 150601      C     DUSRID        CHAIN     SECACC                                       
443.00 150601      C                   IF        %FOUND(SECACC)                               
444.00 150601      C                   EVAL      AROLE = DROLE                                
445.00 150601      C                   UPDATE    RSECACC                                      
446.00 150604      C                   EXSR      ADDLOG                                       
447.00 150605      C                   EVAL      DSPMSG = 'Modify User ID Complete !'         
448.00 150605      C                   EXSR      CLRDTA                                       
449.00 150601      C                   ENDIF                                                  
450.00 150601      C                   ENDSR                                                  
451.00 150601      ************************************************************************** 
452.00 170331 D7096 ************************************************************************* 
453.00 170331 D7096 * Subroutine ADDMENTIC  - create the new user id for memo/tickler         
454.00 170331 D7096 ************************************************************************* 
455.00 170331 D7096C     ADDMENTIC     BEGSR                                                  
456.00 170331 D7096C                   Z-ADD     0             VFLG              1 0          
457.00 170331 D7096C                                                                          
458.00 170331 D7096 *    Check auth exist already                                             
459.00 170331 D7096C                   EVAL      KSPUSER = DUSRID                             
460.00 170331 D7096C                   EVAL      KSPOPT = DMENOPT                             
461.00 170331 D7096C                   EVAL      KSPACT = DMENACT                             
462.00 170331 D7096C     KSCAPPARM     CHAIN     SCAPPARM                                     
463.00 170331 D7096C                   IF        %FOUND(SCAPPARM)                             
464.00 170331 D7096C                   MOVE      1             VFLG                           
465.00 170331 D7096C                   EVAL      DSPMSG = 'Option already exist.'             
466.00 170331 D7096C                   EXSR      CLRDTA                                       
467.00 170331 D7096C                   ENDIF                                                  
468.00 170331 D7096C                                                                          
469.00 170331 D7096 *    Perform adding                                                       
470.00 170331 D7096C                   IF        VFLG = 0                                     
471.00 170331 D7096C                   EVAL      SPUSER = DUSRID                              
472.00 170331 D7096C                   EVAL      SPAPP = DAPPCODE                             
473.00 170331 D7096C                   EVAL      SPOPT = DMENOPT                              
474.00 170331 D7096C                   EVAL      SPACT = DMENACT                              
475.00 170331 D7096C                   WRITE     RSCAPPARM                                    
476.00 170420 D7096 **   Add the centralized record                                           
477.00 170420 D7096C                   EXSR      ADDCNTRCD                                    
478.00 170420 D7096C                   EXSR      ADDLOG                                       
479.00 170331 D7096C                   EVAL      DSPMSG = 'Create User ID Complete !'         
480.00 170331 D7096C                   EXSR      CLRDTA                                       
481.00 170331 D7096C                   ENDIF                                                  
482.00 170331 D7096C                                                                          
483.00 170331 D7096C                   ENDSR                                                  
484.00 170331 D7096 ************************************************************************* 
485.00 170331 D7096 * Subroutine CPYMENTIC  - create new user id data based on ref User       
486.00 170331 D7096 ************************************************************************* 
487.00 170331 D7096C     CPYMENTIC     BEGSR                                                  
488.00 170331 D7096C                                                                          
489.00 170331 D7096C                   EVAL      KSPUSER = DCPUSRID                           
490.00 170331 D7096C                   EVAL      KSPOPT = ''                                  
491.00 170331 D7096C                   EVAL      KSPACT = ''                                  
492.00 170331 D7096C     KSCAPPARM     SETLL     SCAPPARM                                     
493.00 170331 D7096C                   READ      SCAPPARM                                     
494.00 170331 D7096C                                                                          
495.00 170331 D7096C                   DOW       NOT %EOF(SCAPPARM) AND SPUSER = KSPUSER      
496.00 170331 D7096C                                                                          
497.00 170331 D7096C                   EVAL      SPUSER = DUSRID                              
498.00 170331 D7096C                   WRITE     RSCAPPARM                                    
499.00 170331 D7096C                   EXSR      ADDLOG                                       
500.00 170331 D7096C                   READ      SCAPPARM                                     
501.00 170331 D7096C                                                                          
502.00 170331 D7096C                   ENDDO                                                  
503.00 170331 D7096C                                                                          
504.00 170420 D7096 *   Add the centralized record                                            
505.00 170420 D7096C                   EXSR      ADDCNTRCD                                    
506.00 170420 D7096C                                                                          
507.00 170331 D7096C                   EVAL      DSPMSG = 'Copy User ID Complete !'           
508.00 170331 D7096C                   EXSR      CLRDTA                                       
509.00 170331 D7096C                                                                          
510.00 170331 D7096C                   ENDSR                                                  
511.00 170331 D7096 ************************************************************************* 
512.00 170331 D7096 * Subroutine DELMENTIC  - delete the user id data for Memo/tickler        
513.00 170331 D7096 ************************************************************************* 
514.00 170331 D7096C     DELMENTIC     BEGSR                                                  
515.00 170331 D7096C                                                                          
516.00 170331 D7096C                   EVAL      KSPUSER = DUSRID                             
517.00 170331 D7096C                   EVAL      KSPOPT = ''                                  
518.00 170331 D7096C                   EVAL      KSPACT = ''                                  
519.00 170331 D7096C     KSCAPPARM     SETLL     SCAPPARM                                     
520.00 170331 D7096C                   READ      SCAPPARM                                     
521.00 170331 D7096C                                                                          
522.00 170331 D7096C                   DOW       NOT %EOF(SCAPPARM) AND SPUSER = KSPUSER      
523.00 170331 D7096C                                                                          
524.00 170331 D7096C                   DELETE    RSCAPPARM                                    
525.00 170331 D7096C                   EXSR      ADDLOG                                       
526.00 170331 D7096C                   READ      SCAPPARM                                     
527.00 170331 D7096C                                                                          
528.00 170331 D7096C                   ENDDO                                                  
529.00 170331 D7096C                                                                          
530.00 170420 D7096 *   Remove the centralized record                                         
531.00 170420 D7096C                   EXSR      RMVCNTRCD                                    
532.00 170420 D7096C                                                                          
533.00 170331 D7096C                   EVAL      DSPMSG = 'Delete User ID Complete !'         
534.00 170331 D7096C                   EXSR      CLRDTA                                       
535.00 170331 D7096C                                                                          
536.00 170331 D7096C                   ENDSR                                                  
537.00 170331 D7096 ************************************************************************* 
538.00 170331 D7096 * Subroutine MDYMENTIC  - modify the user id data for Memo/Tickler        
539.00 170331 D7096 ************************************************************************* 
540.00 170331 D7096C     MDYMENTIC     BEGSR                                                  
541.00 170331 D7096C                   EVAL      DSPMSG = 'Modify feature not provided'       
542.00 170331 D7096C                   EXSR      CLRDTA                                       
543.00 170331 D7096C                   ENDSR                                                  
544.00 170420 D7096 ************************************************************************* 
545.00 170420 D7096 * Subroutine ADDCNTRCD - Add centralized record to bcmgpl/appusrpf        
546.00 170420 D7096 ************************************************************************* 
547.00 170420 D7096C     ADDCNTRCD     BEGSR                                                  
548.00 170420 D7096C                   EVAL      KAUSER = DUSRID                              
549.00 170420 D7096C                   EVAL      KAMOPT = DAPPCODE                            
550.00 170420 D7096C                   EVAL      KALEVEL = '0'                                
551.00 170420 D7096C                   EVAL      KAOPT = '  '                                 
552.00 170420 D7096C     KAPPUSRL1     CHAIN     APPUSRL1                                     
553.00 170420 D7096C                   IF        NOT %FOUND(APPUSRL1)                         
554.00 170420 D7096C                   EVAL      AUSER = DUSRID                               
555.00 170420 D7096C                   EVAL      AMOPT = DAPPCODE                             
556.00 170420 D7096C                   EVAL      ALEVEL = '0'                                 
557.00 170420 D7096C                   EVAL      AOPT = '  '                                  
558.00 170420 D7096C                   WRITE     RAPPUR                                       
559.00 170420 D7096C                   ENDIF                                                  
560.00 170420 D7096C                   ENDSR                                                  
561.00 170420 D7096 ************************************************************************* 
562.00 170420 D7096 * Subroutine RMVCNTRCD - Remove centralized record to bcmgpl/appusrpf     
563.00 170420 D7096 ************************************************************************* 
564.00 170420 D7096C     RMVCNTRCD     BEGSR                                                  
565.00 170420 D7096C                   EVAL      KAUSER = DUSRID                              
566.00 170420 D7096C                   EVAL      KAMOPT = DAPPCODE                            
567.00 170420 D7096C                   EVAL      KALEVEL = '0'                                
568.00 170420 D7096C                   EVAL      KAOPT = '  '                                 
569.00 170420 D7096C     KAPPUSRL1     CHAIN     APPUSRL1                                     
570.00 170420 D7096C                   IF        %FOUND(APPUSRL1)                             
571.00 170420 D7096C                   DELETE    RAPPUR                                       
572.00 170420 D7096C                   ENDIF                                                  
573.00 170420 D7096C                   ENDSR                                                  
574.00 170420 D7096 **                                                                        
