1.00 150204      ************************************************************************   
2.00 150227       * REFERENCE NO. : CHG-031-2015                                        *   
3.00 150304       * USER ID.      : BG24PGM Eric Wong                                   *   
4.00 150227       * DATE WRITTEN  : 26/02/2015                                          *   
5.00 150227       * DESCRPITION   : GENERATE THE EXCHANGE RATE REPORT BY SCHEDULE       *   
6.00 150204       ***********************************************************************   
7.00 150304       * REFERENCE NO. : CHG-031-2015                                        *   
8.00 150304       * USER ID.      : BG09PGM Albert Au                                   *   
9.00 150304       * DATE WRITTEN  : 02/03/2015                                          *   
10.00 150304       * DESCRPITION   : GENERATE THE EXCHANGE RATE REPORT BY SCHEDULE       *   
11.00 150304       ***********************************************************************   
12.00 160922       * REFERENCE NO. : CHG-0250-16                                         *   
13.00 160922       * USER ID.      : BI77PGM Myles Ieong                                 *   
14.00 160922       * DATE WRITTEN  : 22/09/2016                                          *   
15.00 160922       * DESCRPITION   : 1. Call new module with customer group              *   
16.00 160922       *                 2. Run with all groups in system call               *   
17.00 160922       ***********************************************************************   
18.00 110308      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
19.00 150204       ***********************************************************************   
20.00 110308       * File Specification                                                      
21.00 150204       ***********************************************************************   
22.00 150204      FCRTECCYLSTIF   E           K DISK    USROPN                               
23.00 150204      FCRTERPTP  UF A E           K DISK                                         
24.00 160922 D6250FRTGGRPLST IF   E           K DISK                                         
25.00 150204       ***********************************************************************   
26.00 110308       *Variables / constant defination                                          
27.00 150204       ***********************************************************************   
28.00 131011       *System Information                                                       
29.00 110310      D DSPGID         SDS                                                       
30.00 110310      D  WKDATE               191    198  0                                      
31.00 110310      D  USER                 254    263                                         
32.00 140318      D TTIME           S               T                                        
33.00 140318      D                                                                          
34.00 131213      D PSTATUS         S              1S 0                                      
35.00 140318      D PCCYNUM         S              3  0                                      
36.00 140318      D PRATTYP         S              1A                                        
37.00 150204      D TEMPRATE        S             11S 7                                      
38.00 150204      D TRATE4          S             11S 4                                      
39.00 150204      D TRATE5          S             11S 5                                      
40.00 150204      D TRATE6          S             11S 6                                      
41.00 150204      D TRATE7          S             11S 7                                      
42.00 150316      D TDIVCCY         S              3  0 inz(156)                             
43.00 131213       ************************************************************************  
44.00 110308       * MAIN ROUTINE                                                            
45.00 131213       ************************************************************************  
46.00 150227      C     *ENTRY        PLIST                                                  
47.00 150227      C                   PARM                    DEFFECTDATE       8 0          
48.00 150227      C                   PARM                    DEFFECTTIME       6 0          
49.00 160922 D6250C                   PARM                    DGROUP            6            
50.00 160922 D6250C                                                                          
51.00 160922 D6250C                   IF        DGROUP = '*ALL  '                            
52.00 160923 D6250 *    generate rate of non-group customer                                  
53.00 160923 D6250C                   EVAL      DGROUP = '      '                            
54.00 160923 D6250C                   EXSR      WRTRPTP                                      
55.00 160923 D6250 *    generate rate of all existing groups                                 
56.00 160922 D6250C                   READ      RTGGRPLST                                    
57.00 160922 D6250C                   DOW       NOT %EOF(RTGGRPLST)                          
58.00 160922 D6250C                   EVAL      DGROUP = RTGGROUP                            
59.00 160922 D6250C                   EXSR      WRTRPTP                                      
60.00 160922 D6250C                   READ      RTGGRPLST                                    
61.00 160922 D6250C                   ENDDO                                                  
62.00 160922 D6250C                   ELSE                                                   
63.00 160922 D6250C                   EXSR      WRTRPTP                                      
64.00 160922 D6250C                   ENDIF                                                  
65.00 160922 D6250C                                                                          
66.00 160922 D6250C                   SETON                                        LR        
67.00 160922 D6250 ************************************************************************  
68.00 160922 D6250 * WRTRPTP ROUTINE                                                         
69.00 160922 D6250 ************************************************************************  
70.00 160922 D6250C     WRTRPTP       BEGSR                                                  
71.00 150302      C*    DEFFECTDATE   DSPLY                                                  
72.00 150302      C*    DEFFECTTIME   DSPLY                                                  
73.00 140409      C                   OPEN      CRTECCYLST                                   
74.00 131213      C                                                                          
75.00 140409      C                   READ(N)   CRTECCYLST                                   
76.00 140407      C                                                                          
77.00 140409      C                   DOW       NOT %EOF(CRTECCYLST)                         
78.00 140318      C                                                                          
79.00 150204      C                   EVAL      CRCCY     = CLCCY                            
80.00 150204      C                   EVAL      CRCCYNME  = CLCCYNAME                        
81.00 131213      C                                                                          
82.00 140407      C                   EVAL      PCCYNUM  = CLCCY                             
83.00 160420 D5031c                   IF        PCCYNUM = TDIVCCY                            
84.00 160420 D5031c                   EVAL      CRUSR1 ='*'                                  
85.00 160420 D5031C                   ELSE                                                   
86.00 150611 D5031C                   EVAL      CRUSR1 =*BLANK                               
87.00 160420 D5031c                   ENDIF                                                  
88.00 160922 D6250 *Call GDRTRATE Module                                                     
89.00 160922 D6250 *Call GGRPRATE Module                                                     
90.00 140318      C                                                                          
91.00 140318       *Bank Buy TT MOP                                                          
92.00 160922      C                   EVAL      PRATTYP = 'T'                                
93.00 160922 D6250C*                  CALL      'GDRTRATE'                                   
94.00 160922 D6250C*                  PARM                    PCCYNUM                        
95.00 160922 D6250C*                  PARM      000           PTOCCY            3 0          
96.00 160922 D6250C*                  PARM                    PRATTYP                        
97.00 160922 D6250C*                  PARM                    DEFFECTDATE                    
98.00 160922 D6250C*                  PARM                    DEFFECTTIME                    
99.00 160922 D6250C*                  PARM                    PRATE            11 7          
100.00 160922 D6250C*                  PARM                    FRMEXCCY         11 7          
101.00 160922 D6250C*                  PARM                    FRMDATE           8 0          
102.00 160922 D6250C*                  PARM                    FRMTIME           6 0          
103.00 160922 D6250C*                  PARM                    TOEXCCY          11 7          
104.00 160922 D6250C*                  PARM                    TODATE            8 0          
105.00 160922 D6250C*                  PARM                    TOTIME            6 0          
106.00 160922 D6250C*                  PARM                    STATUS            1            
107.00 160922      C                                                                          
108.00 160922 D6250C                   CALL      'GGRPRATE'                                   
109.00 160922 D6250C                   PARM                    PCIF             10            
110.00 160922 D6250C                   PARM                    PCCYNUM                        
111.00 160922 D6250C                   PARM                    PFRAMT           13 2          
112.00 160922 D6250C                   PARM      000           PTOCCY            3 0          
113.00 160922 D6250C                   PARM                    PTOAMT           13 2          
114.00 160922 D6250C                   PARM                    PRATTYP                        
115.00 160922 D6250C                   PARM                    PFUNC             4            
116.00 160922 D6250C                   PARM                    DGROUP                         
117.00 160922 D6250C                   PARM                    PCHANNEL          6            
118.00 160922 D6250C                   PARM                    DEFFECTDATE                    
119.00 160922 D6250C                   PARM                    DEFFECTTIME                    
120.00 160922 D6250C                   PARM                    PRATE            11 7          
121.00 160922 D6250C                   PARM                    FRMEXCCY         11 7          
122.00 160922 D6250C                   PARM                    FRMDATE           8 0          
123.00 160922 D6250C                   PARM                    FRMTIME           6 0          
124.00 160922 D6250C                   PARM                    TOEXCCY          11 7          
125.00 160922 D6250C                   PARM                    TODATE            8 0          
126.00 160922 D6250C                   PARM                    TOTIME            6 0          
127.00 160922 D6250C                   PARM                    PDSPCCYRT        11 7          
128.00 160922 D6250C                   PARM                    PIND1             1            
129.00 160922 D6250C                   PARM                    PIND2             1            
130.00 160922 D6250C                   PARM                    PIND3             1            
131.00 160922 D6250C                   PARM                    STATUS            1            
132.00 160922 D6250C                                                                          
133.00 160922 D6250C                   IF        STATUS = '0'                                 
134.00 150611 D5031C                   IF        PCCYNUM = TDIVCCY                            
135.00 150611 D5031C                   EVAL      TEMPRATE = 1/PRATE                           
136.00 150611 D5031C                   ELSE                                                   
137.00 150204      C                   EVAL      TEMPRATE = PRATE                             
138.00 150611 D5031C                   ENDIF                                                  
139.00 150204      C                   EXSR      ADJDIGITS                                    
140.00 150204      C                   EVAL      CRTTBUYM= TEMPRATEA                          
141.00 160922 D6250C                   ENDIF                                                  
142.00 140318      C                                                                          
143.00 140318       *Bank Buy TT HKD                                                          
144.00 140318      C                   EVAL      PRATTYP = 'T'                                
145.00 160922 D6250C*                  CALL      'GDRTRATE'                                   
146.00 160922 D6250C*                  PARM                    PCCYNUM                        
147.00 160922 D6250C*                  PARM      344           PTOCCY            3 0          
148.00 160922 D6250C*                  PARM                    PRATTYP                        
149.00 160922 D6250C*                  PARM                    DEFFECTDATE                    
150.00 160922 D6250C*                  PARM                    DEFFECTTIME                    
151.00 160922 D6250C*                  PARM                    PRATE            11 7          
152.00 160922 D6250C*                  PARM                    FRMEXCCY         11 7          
153.00 160922 D6250C*                  PARM                    FRMDATE           8 0          
154.00 160922 D6250C*                  PARM                    FRMTIME           6 0          
155.00 160922 D6250C*                  PARM                    TOEXCCY          11 7          
156.00 160922 D6250C*                  PARM                    TODATE            8 0          
157.00 160922 D6250C*                  PARM                    TOTIME            6 0          
158.00 160922 D6250C*                  PARM                    STATUS            1            
159.00 150204      C                                                                          
160.00 160922 D6250C                   CALL      'GGRPRATE'                                   
161.00 160922 D6250C                   PARM                    PCIF             10            
162.00 160922 D6250C                   PARM                    PCCYNUM                        
163.00 160922 D6250C                   PARM                    PFRAMT           13 2          
164.00 160922 D6250C                   PARM      344           PTOCCY            3 0          
165.00 160922 D6250C                   PARM                    PTOAMT           13 2          
166.00 160922 D6250C                   PARM                    PRATTYP                        
167.00 160922 D6250C                   PARM                    PFUNC             4            
168.00 160922 D6250C                   PARM                    DGROUP                         
169.00 160922 D6250C                   PARM                    PCHANNEL          6            
170.00 160922 D6250C                   PARM                    DEFFECTDATE                    
171.00 160922 D6250C                   PARM                    DEFFECTTIME                    
172.00 160922 D6250C                   PARM                    PRATE            11 7          
173.00 160922 D6250C                   PARM                    FRMEXCCY         11 7          
174.00 160922 D6250C                   PARM                    FRMDATE           8 0          
175.00 160922 D6250C                   PARM                    FRMTIME           6 0          
176.00 160922 D6250C                   PARM                    TOEXCCY          11 7          
177.00 160922 D6250C                   PARM                    TODATE            8 0          
178.00 160922 D6250C                   PARM                    TOTIME            6 0          
179.00 160922 D6250C                   PARM                    PDSPCCYRT        11 7          
180.00 160922 D6250C                   PARM                    PIND1             1            
181.00 160922 D6250C                   PARM                    PIND2             1            
182.00 160922 D6250C                   PARM                    PIND3             1            
183.00 160922 D6250C                   PARM                    STATUS            1            
184.00 160922 D6250C                                                                          
185.00 160922 D6250C                   IF        STATUS = '0'                                 
186.00 150611 D5031C                   IF        PCCYNUM = TDIVCCY                            
187.00 150611 D5031C                   EVAL      TEMPRATE = 1/PRATE                           
188.00 150611 D5031C                   ELSE                                                   
189.00 150204      C                   EVAL      TEMPRATE = PRATE                             
190.00 150611 D5031C                   ENDIF                                                  
191.00 150204      C                   EXSR      ADJDIGITS                                    
192.00 150204      C                   EVAL      CRTTBUYH= TEMPRATEA                          
193.00 140318      C                   IF        PCCYNUM = PTOCCY                             
194.00 150204      C                   EVAL      CRTTBUYH= 1                                  
195.00 140318      C                   ENDIF                                                  
196.00 160922 D6250C                   ENDIF                                                  
197.00 140318      C                                                                          
198.00 140318       *Bank Buy OD MOP                                                          
199.00 140318      C                   EVAL      PRATTYP = 'C'                                
200.00 160922 D6250C*                  CALL      'GDRTRATE'                                   
201.00 160922 D6250C*                  PARM                    PCCYNUM                        
202.00 160922 D6250C*                  PARM      000           PTOCCY            3 0          
203.00 160922 D6250C*                  PARM                    PRATTYP                        
204.00 160922 D6250C*                  PARM                    DEFFECTDATE                    
205.00 160922 D6250C*                  PARM                    DEFFECTTIME                    
206.00 160922 D6250C*                  PARM                    PRATE            11 7          
207.00 160922 D6250C*                  PARM                    FRMEXCCY         11 7          
208.00 160922 D6250C*                  PARM                    FRMDATE           8 0          
209.00 160922 D6250C*                  PARM                    FRMTIME           6 0          
210.00 160922 D6250C*                  PARM                    TOEXCCY          11 7          
211.00 160922 D6250C*                  PARM                    TODATE            8 0          
212.00 160922 D6250C*                  PARM                    TOTIME            6 0          
213.00 160922 D6250C*                  PARM                    STATUS            1            
214.00 150316      C                                                                          
215.00 160922 D6250C                   CALL      'GGRPRATE'                                   
216.00 160922 D6250C                   PARM                    PCIF             10            
217.00 160922 D6250C                   PARM                    PCCYNUM                        
218.00 160922 D6250C                   PARM                    PFRAMT           13 2          
219.00 160922 D6250C                   PARM      000           PTOCCY            3 0          
220.00 160922 D6250C                   PARM                    PTOAMT           13 2          
221.00 160922 D6250C                   PARM                    PRATTYP                        
222.00 160922 D6250C                   PARM                    PFUNC             4            
223.00 160922 D6250C                   PARM                    DGROUP                         
224.00 160922 D6250C                   PARM                    PCHANNEL          6            
225.00 160922 D6250C                   PARM                    DEFFECTDATE                    
226.00 160922 D6250C                   PARM                    DEFFECTTIME                    
227.00 160922 D6250C                   PARM                    PRATE            11 7          
228.00 160922 D6250C                   PARM                    FRMEXCCY         11 7          
229.00 160922 D6250C                   PARM                    FRMDATE           8 0          
230.00 160922 D6250C                   PARM                    FRMTIME           6 0          
231.00 160922 D6250C                   PARM                    TOEXCCY          11 7          
232.00 160922 D6250C                   PARM                    TODATE            8 0          
233.00 160922 D6250C                   PARM                    TOTIME            6 0          
234.00 160922 D6250C                   PARM                    PDSPCCYRT        11 7          
235.00 160922 D6250C                   PARM                    PIND1             1            
236.00 160922 D6250C                   PARM                    PIND2             1            
237.00 160922 D6250C                   PARM                    PIND3             1            
238.00 160922 D6250C                   PARM                    STATUS            1            
239.00 160922 D6250C                                                                          
240.00 160922 D6250C                   IF        STATUS = '0'                                 
241.00 150611 D5031C                   IF        PCCYNUM  = TDIVCCY                           
242.00 150611 D5031C                   EVAL      TEMPRATE =  1/PRATE                          
243.00 150611 D5031C                   ELSE                                                   
244.00 150204      C                   EVAL      TEMPRATE = PRATE                             
245.00 150611 D5031C                   ENDIF                                                  
246.00 150204      C                   EXSR      ADJDIGITS                                    
247.00 150204      C                   EVAL      CRODBUYM= TEMPRATEA                          
248.00 160922 D6250C                   ENDIF                                                  
249.00 140318      C                                                                          
250.00 140318       *Bank Buy OD HKD                                                          
251.00 160922      C                   EVAL      PRATTYP = 'C'                                
252.00 160922 D6250C*                  CALL      'GDRTRATE'                                   
253.00 160922 D6250C*                  PARM                    PCCYNUM                        
254.00 160922 D6250C*                  PARM      344           PTOCCY            3 0          
255.00 160922 D6250C*                  PARM                    PRATTYP                        
256.00 160922 D6250C*                  PARM                    DEFFECTDATE                    
257.00 160922 D6250C*                  PARM                    DEFFECTTIME                    
258.00 160922 D6250C*                  PARM                    PRATE            11 7          
259.00 160922 D6250C*                  PARM                    FRMEXCCY         11 7          
260.00 160922 D6250C*                  PARM                    FRMDATE           8 0          
261.00 160922 D6250C*                  PARM                    FRMTIME           6 0          
262.00 160922 D6250C*                  PARM                    TOEXCCY          11 7          
263.00 160922 D6250C*                  PARM                    TODATE            8 0          
264.00 160922 D6250C*                  PARM                    TOTIME            6 0          
265.00 160922 D6250C*                  PARM                    STATUS            1            
266.00 160922      C                                                                          
267.00 160922 D6250C                   CALL      'GGRPRATE'                                   
268.00 160922 D6250C                   PARM                    PCIF             10            
269.00 160922 D6250C                   PARM                    PCCYNUM                        
270.00 160922 D6250C                   PARM                    PFRAMT           13 2          
271.00 160922 D6250C                   PARM      344           PTOCCY            3 0          
272.00 160922 D6250C                   PARM                    PTOAMT           13 2          
273.00 160922 D6250C                   PARM                    PRATTYP                        
274.00 160922 D6250C                   PARM                    PFUNC             4            
275.00 160922 D6250C                   PARM                    DGROUP                         
276.00 160922 D6250C                   PARM                    PCHANNEL          6            
277.00 160922 D6250C                   PARM                    DEFFECTDATE                    
278.00 160922 D6250C                   PARM                    DEFFECTTIME                    
279.00 160922 D6250C                   PARM                    PRATE            11 7          
280.00 160922 D6250C                   PARM                    FRMEXCCY         11 7          
281.00 160922 D6250C                   PARM                    FRMDATE           8 0          
282.00 160922 D6250C                   PARM                    FRMTIME           6 0          
283.00 160922 D6250C                   PARM                    TOEXCCY          11 7          
284.00 160922 D6250C                   PARM                    TODATE            8 0          
285.00 160922 D6250C                   PARM                    TOTIME            6 0          
286.00 160922 D6250C                   PARM                    PDSPCCYRT        11 7          
287.00 160922 D6250C                   PARM                    PIND1             1            
288.00 160922 D6250C                   PARM                    PIND2             1            
289.00 160922 D6250C                   PARM                    PIND3             1            
290.00 160922 D6250C                   PARM                    STATUS            1            
291.00 160922 D6250C                                                                          
292.00 160922 D6250C                   IF        STATUS = '0'                                 
293.00 150611 D5031C                   IF        PCCYNUM = TDIVCCY                            
294.00 150611 D5031C                   EVAL      TEMPRATE = 1/PRATE                           
295.00 150611 D5031C                   ELSE                                                   
296.00 150204      C                   EVAL      TEMPRATE = PRATE                             
297.00 150611 D5031C                   ENDIF                                                  
298.00 150204      C                   EXSR      ADJDIGITS                                    
299.00 150204      C                   EVAL      CRODBUYH= TEMPRATEA                          
300.00 140318      C                   IF        PCCYNUM = PTOCCY                             
301.00 150204      C                   EVAL      CRODBUYH= 1                                  
302.00 140318      C                   ENDIF                                                  
303.00 160922 D6250C                   ENDIF                                                  
304.00 140318      C                                                                          
305.00 140318       *Bank Sell TT MOP                                                         
306.00 150204      C                   EVAL      PRATTYP = 'T'                                
307.00 160922 D6250C*                  CALL      'GDRTRATE'                                   
308.00 160922 D6250C*                  PARM      000           PFRMCCY           3 0          
309.00 160922 D6250C*                  PARM                    PCCYNUM                        
310.00 160922 D6250C*                  PARM                    PRATTYP                        
311.00 160922 D6250C*                  PARM                    DEFFECTDATE                    
312.00 160922 D6250C*                  PARM                    DEFFECTTIME                    
313.00 160922 D6250C*                  PARM                    PRATE            11 7          
314.00 160922 D6250C*                  PARM                    FRMEXCCY         11 7          
315.00 160922 D6250C*                  PARM                    FRMDATE           8 0          
316.00 160922 D6250C*                  PARM                    FRMTIME           6 0          
317.00 160922 D6250C*                  PARM                    TOEXCCY          11 7          
318.00 160922 D6250C*                  PARM                    TODATE            8 0          
319.00 160922 D6250C*                  PARM                    TOTIME            6 0          
320.00 160922 D6250C*                  PARM                    STATUS            1            
321.00 150204      C                                                                          
322.00 160922 D6250C                   CALL      'GGRPRATE'                                   
323.00 160922 D6250C                   PARM                    PCIF             10            
324.00 160922 D6250C                   PARM      000           PFRMCCY           3 0          
325.00 160922 D6250C                   PARM                    PFRAMT           13 2          
326.00 160922 D6250C                   PARM                    PCCYNUM                        
327.00 160922 D6250C                   PARM                    PTOAMT           13 2          
328.00 160922 D6250C                   PARM                    PRATTYP                        
329.00 160922 D6250C                   PARM                    PFUNC             4            
330.00 160922 D6250C                   PARM                    DGROUP                         
331.00 160922 D6250C                   PARM                    PCHANNEL          6            
332.00 160922 D6250C                   PARM                    DEFFECTDATE                    
333.00 160922 D6250C                   PARM                    DEFFECTTIME                    
334.00 160922 D6250C                   PARM                    PRATE            11 7          
335.00 160922 D6250C                   PARM                    FRMEXCCY         11 7          
336.00 160922 D6250C                   PARM                    FRMDATE           8 0          
337.00 160922 D6250C                   PARM                    FRMTIME           6 0          
338.00 160922 D6250C                   PARM                    TOEXCCY          11 7          
339.00 160922 D6250C                   PARM                    TODATE            8 0          
340.00 160922 D6250C                   PARM                    TOTIME            6 0          
341.00 160922 D6250C                   PARM                    PDSPCCYRT        11 7          
342.00 160922 D6250C                   PARM                    PIND1             1            
343.00 160922 D6250C                   PARM                    PIND2             1            
344.00 160922 D6250C                   PARM                    PIND3             1            
345.00 160922 D6250C                   PARM                    STATUS            1            
346.00 160922 D6250C                                                                          
347.00 160922 D6250C                   IF        STATUS = '0'                                 
348.00 150611 D5031C                   IF        PCCYNUM = TDIVCCY                            
349.00 160420 D5031C                   EVAL      TEMPRATE = PRATE                             
350.00 150611 D5031C                   ELSE                                                   
351.00 160420      C                   EVAL      TEMPRATE = 1 / PRATE                         
352.00 150611 D5031C                   ENDIF                                                  
353.00 150204      C                   EXSR      ADJDIGITS                                    
354.00 150204      C                   EVAL      CRTTSELM= TEMPRATEA                          
355.00 160922 D6250C                   ENDIF                                                  
356.00 131213      C                                                                          
357.00 140318       *Bank Sell TT HKD                                                         
358.00 150204      C                   EVAL      PRATTYP = 'T'                                
359.00 160922 D6250C*                  CALL      'GDRTRATE'                                   
360.00 160922 D6250C*                  PARM      344           PFRMCCY           3 0          
361.00 160922 D6250C*                  PARM                    PCCYNUM                        
362.00 160922 D6250C*                  PARM                    PRATTYP                        
363.00 160922 D6250C*                  PARM                    DEFFECTDATE                    
364.00 160922 D6250C*                  PARM                    DEFFECTTIME                    
365.00 160922 D6250C*                  PARM                    PRATE            11 7          
366.00 160922 D6250C*                  PARM                    FRMEXCCY         11 7          
367.00 160922 D6250C*                  PARM                    FRMDATE           8 0          
368.00 160922 D6250C*                  PARM                    FRMTIME           6 0          
369.00 160922 D6250C*                  PARM                    TOEXCCY          11 7          
370.00 160922 D6250C*                  PARM                    TODATE            8 0          
371.00 160922 D6250C*                  PARM                    TOTIME            6 0          
372.00 160922 D6250C*                  PARM                    STATUS            1            
373.00 160922      C                                                                          
374.00 160922 D6250C                   CALL      'GGRPRATE'                                   
375.00 160922 D6250C                   PARM                    PCIF             10            
376.00 160922 D6250C                   PARM      344           PFRMCCY           3 0          
377.00 160922 D6250C                   PARM                    PFRAMT           13 2          
378.00 160922 D6250C                   PARM                    PCCYNUM                        
379.00 160922 D6250C                   PARM                    PTOAMT           13 2          
380.00 160922 D6250C                   PARM                    PRATTYP                        
381.00 160922 D6250C                   PARM                    PFUNC             4            
382.00 160922 D6250C                   PARM                    DGROUP                         
383.00 160922 D6250C                   PARM                    PCHANNEL          6            
384.00 160922 D6250C                   PARM                    DEFFECTDATE                    
385.00 160922 D6250C                   PARM                    DEFFECTTIME                    
386.00 160922 D6250C                   PARM                    PRATE            11 7          
387.00 160922 D6250C                   PARM                    FRMEXCCY         11 7          
388.00 160922 D6250C                   PARM                    FRMDATE           8 0          
389.00 160922 D6250C                   PARM                    FRMTIME           6 0          
390.00 160922 D6250C                   PARM                    TOEXCCY          11 7          
391.00 160922 D6250C                   PARM                    TODATE            8 0          
392.00 160922 D6250C                   PARM                    TOTIME            6 0          
393.00 160922 D6250C                   PARM                    PDSPCCYRT        11 7          
394.00 160922 D6250C                   PARM                    PIND1             1            
395.00 160922 D6250C                   PARM                    PIND2             1            
396.00 160922 D6250C                   PARM                    PIND3             1            
397.00 160922 D6250C                   PARM                    STATUS            1            
398.00 160922 D6250C                                                                          
399.00 160922 D6250C                   IF        STATUS = '0'                                 
400.00 150611 D5031C                   IF        PCCYNUM = TDIVCCY                            
401.00 150611 D5031C                   EVAL      TEMPRATE = PRATE                             
402.00 150611 D5031C                   ELSE                                                   
403.00 150204      C                   EVAL      TEMPRATE =1 / PRATE                          
404.00 150611 D5031C                   ENDIF                                                  
405.00 150204      C                   EXSR      ADJDIGITS                                    
406.00 150204      C                   EVAL      CRTTSELH= TEMPRATEA                          
407.00 140318      C                   IF        PCCYNUM = PFRMCCY                            
408.00 150204      C                   EVAL      CRTTSELH= 1                                  
409.00 140318      C                   ENDIF                                                  
410.00 160922 D6250C                   ENDIF                                                  
411.00 131213      C                                                                          
412.00 140318       *Bank Sell OD MOP                                                         
413.00 150204      C                   EVAL      PRATTYP = 'C'                                
414.00 160922 D6250C*                  CALL      'GDRTRATE'                                   
415.00 160922 D6250C*                  PARM      000           PFRMCCY           3 0          
416.00 160922 D6250C*                  PARM                    PCCYNUM                        
417.00 160922 D6250C*                  PARM                    PRATTYP                        
418.00 160922 D6250C*                  PARM                    DEFFECTDATE                    
419.00 160922 D6250C*                  PARM                    DEFFECTTIME                    
420.00 160922 D6250C*                  PARM                    PRATE            11 7          
421.00 160922 D6250C*                  PARM                    FRMEXCCY         11 7          
422.00 160922 D6250C*                  PARM                    FRMDATE           8 0          
423.00 160922 D6250C*                  PARM                    FRMTIME           6 0          
424.00 160922 D6250C*                  PARM                    TOEXCCY          11 7          
425.00 160922 D6250C*                  PARM                    TODATE            8 0          
426.00 160922 D6250C*                  PARM                    TOTIME            6 0          
427.00 160922 D6250C*                  PARM                    STATUS            1            
428.00 150316      C                                                                          
429.00 160922 D6250C                   CALL      'GGRPRATE'                                   
430.00 160922 D6250C                   PARM                    PCIF             10            
431.00 160922 D6250C                   PARM      000           PFRMCCY           3 0          
432.00 160922 D6250C                   PARM                    PFRAMT           13 2          
433.00 160922 D6250C                   PARM                    PCCYNUM                        
434.00 160922 D6250C                   PARM                    PTOAMT           13 2          
435.00 160922 D6250C                   PARM                    PRATTYP                        
436.00 160922 D6250C                   PARM                    PFUNC             4            
437.00 160922 D6250C                   PARM                    DGROUP                         
438.00 160922 D6250C                   PARM                    PCHANNEL          6            
439.00 160922 D6250C                   PARM                    DEFFECTDATE                    
440.00 160922 D6250C                   PARM                    DEFFECTTIME                    
441.00 160922 D6250C                   PARM                    PRATE            11 7          
442.00 160922 D6250C                   PARM                    FRMEXCCY         11 7          
443.00 160922 D6250C                   PARM                    FRMDATE           8 0          
444.00 160922 D6250C                   PARM                    FRMTIME           6 0          
445.00 160922 D6250C                   PARM                    TOEXCCY          11 7          
446.00 160922 D6250C                   PARM                    TODATE            8 0          
447.00 160922 D6250C                   PARM                    TOTIME            6 0          
448.00 160922 D6250C                   PARM                    PDSPCCYRT        11 7          
449.00 160922 D6250C                   PARM                    PIND1             1            
450.00 160922 D6250C                   PARM                    PIND2             1            
451.00 160922 D6250C                   PARM                    PIND3             1            
452.00 160922 D6250C                   PARM                    STATUS            1            
453.00 160922 D6250C                                                                          
454.00 160922 D6250C                   IF        STATUS = '0'                                 
455.00 150611 D5031C                   IF        PCCYNUM  = TDIVCCY                           
456.00 150611 D5031C                   EVAL      TEMPRATE = PRATE                             
457.00 150611 D5031C                   ELSE                                                   
458.00 150204      C                   EVAL      TEMPRATE = 1 / PRATE                         
459.00 150611 D5031C                   ENDIF                                                  
460.00 150204      C                   EXSR      ADJDIGITS                                    
461.00 150204      C                   EVAL      CRODSELM= TEMPRATEA                          
462.00 160922 D6250C                   ENDIF                                                  
463.00 140318      C                                                                          
464.00 140318       *Bank Sell OD HKD                                                         
465.00 150204      C                   EVAL      PRATTYP = 'C'                                
466.00 160922 D6250C*                  CALL      'GDRTRATE'                                   
467.00 160922 D6250C*                  PARM      344           PFRMCCY           3 0          
468.00 160922 D6250C*                  PARM                    PCCYNUM                        
469.00 160922 D6250C*                  PARM                    PRATTYP                        
470.00 160922 D6250C*                  PARM                    DEFFECTDATE                    
471.00 160922 D6250C*                  PARM                    DEFFECTTIME                    
472.00 160922 D6250C*                  PARM                    PRATE            11 7          
473.00 160922 D6250C*                  PARM                    FRMEXCCY         11 7          
474.00 160922 D6250C*                  PARM                    FRMDATE           8 0          
475.00 160922 D6250C*                  PARM                    FRMTIME           6 0          
476.00 160922 D6250C*                  PARM                    TOEXCCY          11 7          
477.00 160922 D6250C*                  PARM                    TODATE            8 0          
478.00 160922 D6250C*                  PARM                    TOTIME            6 0          
479.00 160922 D6250C*                  PARM                    STATUS            1            
480.00 140318      C                                                                          
481.00 160922 D6250C                   CALL      'GGRPRATE'                                   
482.00 160922 D6250C                   PARM                    PCIF             10            
483.00 160922 D6250C                   PARM      344           PFRMCCY           3 0          
484.00 160922 D6250C                   PARM                    PFRAMT           13 2          
485.00 160922 D6250C                   PARM                    PCCYNUM                        
486.00 160922 D6250C                   PARM                    PTOAMT           13 2          
487.00 160922 D6250C                   PARM                    PRATTYP                        
488.00 160922 D6250C                   PARM                    PFUNC             4            
489.00 160922 D6250C                   PARM                    DGROUP                         
490.00 160922 D6250C                   PARM                    PCHANNEL          6            
491.00 160922 D6250C                   PARM                    DEFFECTDATE                    
492.00 160922 D6250C                   PARM                    DEFFECTTIME                    
493.00 160922 D6250C                   PARM                    PRATE            11 7          
494.00 160922 D6250C                   PARM                    FRMEXCCY         11 7          
495.00 160922 D6250C                   PARM                    FRMDATE           8 0          
496.00 160922 D6250C                   PARM                    FRMTIME           6 0          
497.00 160922 D6250C                   PARM                    TOEXCCY          11 7          
498.00 160922 D6250C                   PARM                    TODATE            8 0          
499.00 160922 D6250C                   PARM                    TOTIME            6 0          
500.00 160922 D6250C                   PARM                    PDSPCCYRT        11 7          
501.00 160922 D6250C                   PARM                    PIND1             1            
502.00 160922 D6250C                   PARM                    PIND2             1            
503.00 160922 D6250C                   PARM                    PIND3             1            
504.00 160922 D6250C                   PARM                    STATUS            1            
505.00 160922 D6250C                                                                          
506.00 160922 D6250C                   IF        STATUS = '0'                                 
507.00 150611 D5031C                   IF        PCCYNUM = TDIVCCY                            
508.00 150611 D5031C                   EVAL      TEMPRATE = PRATE                             
509.00 150611 D5031C                   ELSE                                                   
510.00 150204      C                   EVAL      TEMPRATE = 1 / PRATE                         
511.00 150611 D5031C                   ENDIF                                                  
512.00 150204      C                   EXSR      ADJDIGITS                                    
513.00 150204      C                   EVAL      CRODSELH= TEMPRATEA                          
514.00 140318      C                   IF        PCCYNUM = PFRMCCY                            
515.00 150204      C                   EVAL      CRODSELH= 1                                  
516.00 140318      C                   ENDIF                                                  
517.00 160922 D6250C                   ENDIF                                                  
518.00 131213      C                                                                          
519.00 150304      C                   MOVE      DEFFECTDATE   CRTDATE                        
520.00 150304      C                   MOVE      DEFFECTTIME   CRTTIME                        
521.00 160922 D6250C                   MOVE      DGROUP        CRUSR4                         
522.00 150204      C                                                                          
523.00 150204      C                   WRITE     RCRTERPTP                                    
524.00 131213      C                                                                          
525.00 131213      C                                                                          
526.00 140409      C                   READ(N)   CRTECCYLST                                   
527.00 131213      C                   ENDDO                                                  
528.00 131213      C                                                                          
529.00 140409      C                   CLOSE     CRTECCYLST                                   
530.00 150204      C                                                                          
531.00 160922 D6250C*                  SETON                                            LR    
532.00 160922 D6250C                   ENDSR                                                  
533.00 150204      C**************************************************************************
534.00 150204      C*                                                                         
535.00 150204      C**************************************************************************
536.00 150204      C     ADJDIGITS     BEGSR                                                  
537.00 150204      C                   MOVEL     *BLANK        TEMPRATEA        11 7          
538.00 150204      C                   SELECT                                                 
539.00 150204      C                   WHEN      CLFDUSR1 = '4'                               
540.00 150204      C                   EVAL      TRATE4 = TEMPRATE                            
541.00 150204      C                   EVAL      TEMPRATEA = TRATE4                           
542.00 150204      C                   WHEN      CLFDUSR1 = '5'                               
543.00 150204      C                   EVAL      TRATE5 = TEMPRATE                            
544.00 150204      C                   EVAL      TEMPRATEA = TRATE5                           
545.00 150204      C                   WHEN      CLFDUSR1 = '6'                               
546.00 150204      C                   EVAL      TRATE6 = TEMPRATE                            
547.00 150204      C                   EVAL      TEMPRATEA = TRATE6                           
548.00 150204      C                   WHEN      CLFDUSR1 = '7'                               
549.00 150204      C                   EVAL      TRATE7 = TEMPRATE                            
550.00 150204      C                   EVAL      TEMPRATEA = TRATE7                           
551.00 150204      C                   ENDSL                                                  
552.00 150204      C                   ENDSR                                                  
