1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                                       
2.00 60608      H********************************************************************************************** 
3.00 111110      H* Program      : AML_GMCC                                                                      
4.00 111024      H* Reference    : CHG-315-11 (D1315)                                                            
5.00 111024      H* Created By   : Karl (BA55PGM)                                                                
6.00 111024      H* Changed Date : 24 Oct 2011                                                                   
7.00 111024      H* Description  : Generate CC Acc with Credit Bal>=MOP 5,000(10)                                
8.00 111024      H********************************************************************************************** 
9.00 120119      H* Reference    : CHG-016-12 (D2016)                                                            
10.00 120117      H* Created By   : Karl (BA55PGM)                                                                
11.00 120117      H* Changed Date : 17 Jan 2012                                                                   
12.00 120117      H* Description  : Change get credit card no. logic: once the CC has credit                      
13.00 120117      H*                Bal.>=10000 or 50000 in past 3/6 months.                                      
14.00 120117      H********************************************************************************************** 
15.00 120820      H* Reference    : CHG-230-12 (D2230)                                                            
16.00 120814      H* Created By   : Karl (BA55PGM)                                                                
17.00 120814      H* Changed Date : 14 AUG 2012                                                                   
18.00 120814      H* Description  : 1. Change get credit card no. logic: the CC has credit                        
19.00 120814      H*                Bal.>=10000 or 50000 in past 3/6 consecutive months.                          
20.00 120814      H*                2. Add credit card CCY: 156                                                   
21.00 120814      H********************************************************************************************** 
22.00 120914      H* Reference    : CHG-216-12 (D2216)                                                            
23.00 120914      H* Created By   : Joanna(BE95PGM)                                                               
24.00 120914      H* Changed Date : 14 SEP 2012                                                                   
25.00 120914      H* Description  : Add new field Scc code2                                                       
26.00 120914      H*                                                                                              
27.00 120914      H********************************************************************************************** 
28.00 160825      H* Reference    : CHG-262-16 (D6262)                                                            
29.00 160825      H* Created By   : Myles Ieong (BI77PGM)                                                         
30.00 160825      H* Changed Date : 14 Jul 2016                                                                   
31.00 160825      H* Description  : AML report parameter changing and revoking                                    
32.00 160825      H*                                                                                              
33.00 160825      H********************************************************************************************** 
34.00 170606      H* Reference    : CHG-196-17 (D7196)                                                            
35.00 170420      H* Created By   : Albert Au   (BG09PGM)                                                         
36.00 170420      H* Changed Date : 10 Apr 2017                                                                   
37.00 170420      H* Description  : Remove the transaction for CIF's with officer code as 'PER'                   
38.00 170420      H*                                                                                              
39.00 170420      H********************************************************************************************** 
40.00 60606      FCRDTX1    UF   E           K DISK    USROPN                                                    
41.00 60606      FCRDTX2    UF   E           K DISK    USROPN                                                    
42.00 60915      F*AML_CRDNO IF   E           K DISK    USROPN                                                   
43.00 60606      FAML_CRDTX UF   E           K DISK    USROPN                                                    
44.00 60606      FCUP003    IF   E           K DISK                                                              
45.00 60606      FTAP00101B IF   E             DISK                                                              
46.00 60606      FAMLDDNCRCDUF A E           K DISK                                                              
47.00 60606      FAMLDDOCRCDUF A E           K DISK                                                              
48.00 60529      FICBSRATE  IF   E             DISK    USROPN                                                    
49.00 120817 D2016F*D2230 AML_CRDBALIF   E             DISK    USROPN                                             
50.00 120817 D2016F*D2230 AML_CRDNO IF A E           K DISK                                                       
51.00 120817 D2230FAML_CRDBALIF   E           K DISK    USROPN                                                    
52.00 120817 D2230FAML_CRDNO UF A E           K DISK    USROPN                                                    
53.00 111024      FAML_MCCRPTO    E             PRINTER OFLIND(*IN98)                                             
54.00 170606 D7196F                                     USROPN                                                    
55.00 60516      D                                                                                               
56.00 120119 D2016D STNCBAL         S             15S 2 INZ(0)                                                    
57.00 120817 D2230D CRCOUNT         S              2S 0 INZ(0)                                                    
58.00 60516      C*----------------------------------------------------------------------------------------------
59.00 60516      C* Initial Variable                                                                             
60.00 60516      C*----------------------------------------------------------------------------------------------
61.00 60517      C                                                                                               
62.00 60519      C*----------------------------------------------------------------------------------------------
63.00 60519      C* PARM LIST                                                                                    
64.00 60519      C*----------------------------------------------------------------------------------------------
65.00 60517      C     *ENTRY        PLIST                                                                       
66.00 60523      C                   PARM                    RNO               1                                 
67.00 111024      C                   PARM                    RFLG              1                                 
68.00 170606 D7196C                   PARM                    PRPT              1                                 
69.00 60517      C                                                                                               
70.00 60519      C*----------------------------------------------------------------------------------------------
71.00 60519      C* KEY LIST                                                                                     
72.00 60519      C*----------------------------------------------------------------------------------------------
73.00 60530      C     KTD           KLIST                                                                       
74.00 60519      C                   KFLD                    KTCIF            10                                 
75.00 60606      C                   KFLD                    KTINOUT           3                                 
76.00 60516      C                                                                                               
77.00 60606      C     KC03          KLIST                                                                       
78.00 60527      C                   KFLD                    K03BNO            3 0                               
79.00 60527      C                   KFLD                    K03CIF           10                                 
80.00 60527      C                   Z-ADD     001           K03BNO                                              
81.00 120119 D2016C* Key for AML_CRDBAL                                                                           
82.00 120118   |  C     KCRDBAL       KLIST                                                                       
83.00 120814   |  C                   KFLD                    KCRDNO19         19                                 
84.00 120817 D2016C*D2230             KFLD                    KCRDNO19                                            
85.00 120817 D2230C                   KFLD                    KCRDDT            6 0                               
86.00 60516      C*----------------------------------------------------------------------------------------------
87.00 60527      C* Main Program                                                                                 
88.00 60516      C*----------------------------------------------------------------------------------------------
89.00 60527      C                   EXSR      GETFLDTE                                                          
90.00 170606 D7196C                   IF        PRPT = 'C'                                                        
91.00 60527      C                   IF        RNO='R'                                                           
92.00 60529      C***EXTRACT DATA FROM AML003                                                                    
93.00 60529      C                   EXSR      CLSQL                                                             
94.00 60529      C***GET BRANCH NO AND MOP AMOUNT                                                                
95.00 60606      C                   OPEN      AML_CRDTX                                                         
96.00 60606      C                   READ      AML_CRDTX                              50                         
97.00 60529      C                   DOW       *IN50='0'                                                         
98.00 60527      C                   EXSR      GETFLD                                                            
99.00 60606      C                   UPDATE    RCRDTX                                                            
100.00 60606      C                   READ      AML_CRDTX                              50                         
101.00 60529      C                   ENDDO                                                                       
102.00 60606      C                   CLOSE     AML_CRDTX                                                         
103.00 60606      C                   EXSR      SEPGRP                                                            
104.00 60527      C                                                                                               
105.00 60529      C                   EXSR      CALTMPTLAMT                                                       
106.00 60606      C                   OPEN      CRDTX1                                                            
107.00 60606      C                   READ      CRDTX1                                 50                         
108.00 60529      C                   DOW       *IN50='0'                                                         
109.00 60529      C                   EXSR      CALTLAMT                                                          
110.00 60606      C                   UPDATE    RCTX1                                                             
111.00 60606      C                   READ      CRDTX1                                 50                         
112.00 60530      C                   ENDDO                                                                       
113.00 60606      C                   CLOSE     CRDTX1                                                            
114.00 60529      C                                                                                               
115.00 60606      C                   OPEN      CRDTX2                                                            
116.00 60606      C                   READ      CRDTX2                                 40                         
117.00 60529      C                   DOW       *IN40='0'                                                         
118.00 60529      C                   EXSR      CALTLAMT                                                          
119.00 60606      C                   UPDATE    RCTX2                                                             
120.00 60606      C                   READ      CRDTX2                                 40                         
121.00 60529      C                   ENDDO                                                                       
122.00 60606      C                   CLOSE     CRDTX2                                                            
123.00 60529      C                                                                                               
124.00 60519      C                                                                                               
125.00 60518      C                   EXSR      GWKTXN                                                            
126.00 60523      C                   ENDIF                                                                       
127.00 170606 D7196C                   ENDIF                                                                       
128.00 60519      C                                                                                               
129.00 170606 D7196C                   IF        PRPT = 'P'                                                        
130.00 170606 D7196C                   OPEN      AML_MCCRPT                                                        
131.00 60517      C                   EXSR      GENRPT                                                            
132.00 170606 D7196C                   CLOSE     AML_MCCRPT                                                        
133.00 170606 D7196C                   ENDIF                                                                       
134.00 60516      C                   SETON                                        LR                             
135.00 60527      C                                                                                               
136.00 60606      C     SEPGRP        BEGSR                                                                       
137.00 60606      C                                                                                               
138.00 60606      C/EXEC SQL                                                                                      
139.00 60606      C+                                                                                              
140.00 60606      C+ INSERT INTO CRDTX1                                                                           
141.00 60606      C+ SELECT * FROM AML_CRDTX WHERE CTXMARK='RET'                                                  
142.00 60606      C+                                                                                              
143.00 60606      C/END-EXEC                                                                                      
144.00 60606      C                                                                                               
145.00 60606      C/EXEC SQL                                                                                      
146.00 60606      C+                                                                                              
147.00 60606      C+ INSERT INTO CRDTX2                                                                           
148.00 60606      C+ SELECT * FROM AML_CRDTX WHERE CTXMARK<>'RET'                                                 
149.00 60606      C+                                                                                              
150.00 60606      C/END-EXEC                                                                                      
151.00 60606      C                   ENDSR                                                                       
152.00 60527      C*----------------------------------------------------------------------------------------------
153.00 60527      C* GET BRANCH NO AND CCY CODE                                                                   
154.00 60527      C*----------------------------------------------------------------------------------------------
155.00 60527      C     GETFLD        BEGSR                                                                       
156.00 60606      C                                                                                               
157.00 60606      C                                                                                               
158.00 60606      C***GET BRANCH NO                                                                               
159.00 60606      C                   EVAL      K03CIF=CTXCIF                                                     
160.00 60606      C     KC03          CHAIN     CUP003                             45                             
161.00 60606      C                   IF        *IN45='0'                                                         
162.00 60606      C                   EVAL      CTXMARK = CUMARK                                                  
163.00 60606      C                   EVAL      CTXOFF  = CUPOFF                                                  
164.00 60606      C                   EVAL      CTXBRCH=CUBRCH                                                    
165.00 60606      C                   ENDIF                                                                       
166.00 60527      C                                                                                               
167.00 60527      C***GET CCY CODE AND CALCULATE MOP AMOUNT                                                       
168.00 111024      c                   select                                                                      
169.00 111024      c     ctxccy        wheneq    '801'                                                             
170.00 120817 D2230C     CTXCCY        OREQ      '805'                                                             
171.00 111024      c                   movel(p)  '000'         CTXCCY                                              
172.00 111024      c     ctxccy        wheneq    '802'                                                             
173.00 111024      c                   movel(p)  '344'         CTXCCY                                              
174.00 120817 D2230c     ctxccy        wheneq    '806'                                                             
175.00 120817 D2230c                   movel(p)  '156'         CTXCCY                                              
176.00 111024      c                   endsl                                                                       
177.00 111024      c                   move      ctxccy        ctxstlccy                                           
178.00 111024      C                   MOVE      CTXSTLCCY     TMPCCY            3 0                               
179.00 60606      C                   IF        TMPCCY=0 OR TMPCCY=446                                            
180.00 60606      C                   EVAL      CTXMAMT=CTXTXNAMT                                                 
181.00 60606      C                   LEAVESR                                                                     
182.00 60606      C                   ENDIF                                                                       
183.00 60529      C                   OPEN      ICBSRATE                                                          
184.00 60527      C                   READ      ICBSRATE                               55                         
185.00 60527      C                   DOW       *IN55='0'                                                         
186.00 60530      C                   IF        RCCY=TMPCCY                                                       
187.00 60606      C                   EVAL      CTXMAMT    =CTXTXNAMT*RCCRTE                                      
188.00 60530      C                   CLOSE     ICBSRATE                                                          
189.00 60530      C                   LEAVESR                                                                     
190.00 60527      C                   ENDIF                                                                       
191.00 60527      C                   READ      ICBSRATE                               55                         
192.00 60527      C                   ENDDO                                                                       
193.00 60529      C                   CLOSE     ICBSRATE                                                          
194.00 60527      C                   ENDSR                                                                       
195.00 60527      C                                                                                               
196.00 60527      C                                                                                               
197.00 60516      C*----------------------------------------------------------------------------------------------
198.00 60516      C* SQL                                                                                          
199.00 60516      C*----------------------------------------------------------------------------------------------
200.00 60516      C     CLSQL         BEGSR                                                                       
201.00 60605      C                                                                                               
202.00 111024       * Quarterly                                                                                    
203.00 111024      C                   IF        RFLG = 'Q'                                                        
204.00 160825 D2016C* D6262            EVAL      STNCBAL = 10000                                                   
205.00 160825 D6262C                   EVAL      STNCBAL = 50000                                                   
206.00 120817 D2230C                   EVAL      CRCOUNT = 3                                                       
207.00 120119 D2016C                   EXSR      GETCCNO                                                           
208.00 111024      C***MOP                                                                                         
209.00 120119 D2016C*EXEC SQL                                                                                      
210.00 120119 D2016C* INSERT INTO AML_CRDNO                                                                        
211.00 120119 D2016C* SELECT  DIGITS(CHLCARDNO),DIGITS(CHLCARDNO),                                                 
212.00 120119 D2016C* SUBSTR(DIGITS(CHLACHACCT),7,10),                                                             
213.00 120119 D2016C* CRCCNAME,' '  ,CHLCURBAL*-1                                                                  
214.00 120119 D2016C* FROM ZPDCRCDC,ZPDCRCUC                                                                       
215.00 120119 D2016C* WHERE CHLCRORGNO=CRCORGCDE  AND CHLCRACCNO=CRCACNO AND                                       
216.00 120119 D2016C* CHLCURBAL<=-10000 and CHLCCYCDE='MOP'                                                        
217.00 120119 D2016C*END-EXEC                                                                                      
218.00 111024      C                                                                                               
219.00 111024      C***HKD                                                                                         
220.00 120119 D2016C*EXEC SQL                                                                                      
221.00 120119 D2016C*  INSERT INTO AML_CRDNO                                                                       
222.00 120119 D2016C*  SELECT  DIGITS(CHLCARDNO),DIGITS(CHLCARDNO),                                                
223.00 120119 D2016C*  SUBSTR(DIGITS(CHLACHACCT),7,10),                                                            
224.00 120119 D2016C*  CRCCNAME,' '  ,CHLCURBAL*-1.03                                                              
225.00 120119 D2016C*  FROM ZPDCRCDC,ZPDCRCUC                                                                      
226.00 120119 D2016C*  WHERE CHLCRORGNO=CRCORGCDE  AND CHLCRACCNO=CRCACNO AND                                      
227.00 120119 D2016C*  CHLCURBAL<=-10000 and CHLCCYCDE='HKD'                                                       
228.00 120119 D2016C*END-EXEC                                                                                      
229.00 60605      C                                                                                               
230.00 61027      C                                                                                               
231.00 111024      C/EXEC SQL                                                                                      
232.00 111024      C+ INSERT INTO AML_CRDTX                                                                        
233.00 111024      C+ (CTXACCNO, CTXNO, CTXCIF, CTXNAME,                                                           
234.00 111024      C+ CTXPRISEC, CTXCRDR, CTXTXNDT,CTXPOSDT, CTXCCY,CTXSTLCCY,                                     
235.00 111024      C+ CTXTXNAMT, CTXDS,CTXDS1,CTXCBAMT)                                                            
236.00 111024      C+ SELECT                                                                                       
237.00 120118      C+ CDN.CRDACCNO, CDN.CRDNO,CDN.CRDCIF,CDN.CRDNAME,                                              
238.00 111024      C+ CDN.CRDPRISEC,CTXCRDRIND,mod(CTXEFFDATE,1000000),                                            
239.00 111024      C+ mod(CTXPSTDATE,1000000),digits(CTXORGNMBR),' '   ,                                           
240.00 120117      C+ CTXTXAMT,CTXDESC,CTXDESC,CRDCBAMT                                                            
241.00 111024      C+ FROM ZPDCRTDC TDC,AML_CRDNO CDN                                                              
242.00 111024      C+ WHERE                                                                                        
243.00 111024      C+ DIGITS(CTXCARDNO)=SUBSTR(CDN.CRDACCNO,1,16)                                                  
244.00 111024      C+ AND ZONED(SUBSTR(DIGITS(CTXPSTDATE),3,4),4,0) >= :STRMON2                                    
245.00 111024      C+ AND ZONED(SUBSTR(DIGITS(CTXPSTDATE),3,4),4,0) <= :ENDMON2                                    
246.00 111024      C/END-EXEC                                                                                      
247.00 61027      C                                                                                               
248.00 111024       * Semi-annual                                                                                  
249.00 111024      C                   ELSE                                                                        
250.00 120119 D2016C                   EVAL      STNCBAL = 50000                                                   
251.00 120817 D2230C                   EVAL      CRCOUNT = 6                                                       
252.00 120119 D2016C                   EXSR      GETCCNO                                                           
253.00 111024      C***MOP                                                                                         
254.00 120119 D2016C*EXEC SQL                                                                                      
255.00 120119 D2016C* INSERT INTO AML_CRDNO                                                                        
256.00 120119 D2016C* SELECT  DIGITS(CHLCARDNO),DIGITS(CHLCARDNO),                                                 
257.00 120119 D2016C* SUBSTR(DIGITS(CHLACHACCT),7,10),                                                             
258.00 120119 D2016C* CRCCNAME,' '  ,CHLCURBAL*-1                                                                  
259.00 120119 D2016C* FROM ZPDCRCDC,ZPDCRCUC                                                                       
260.00 120119 D2016C* WHERE CHLCRORGNO=CRCORGCDE  AND CHLCRACCNO=CRCACNO AND                                       
261.00 120119 D2016C* CHLCURBAL<=-50000 and CHLCCYCDE='MOP'                                                        
262.00 120119 D2016C*END-EXEC                                                                                      
263.00 111024      C                                                                                               
264.00 111024      C***HKD                                                                                         
265.00 120119 D2016C*EXEC SQL                                                                                      
266.00 120119 D2016C*  INSERT INTO AML_CRDNO                                                                       
267.00 120119 D2016C*  SELECT  DIGITS(CHLCARDNO),DIGITS(CHLCARDNO),                                                
268.00 120119 D2016C*  SUBSTR(DIGITS(CHLACHACCT),7,10),                                                            
269.00 120119 D2016C*  CRCCNAME,' '  ,CHLCURBAL*-1.03                                                              
270.00 120119 D2016C*  FROM ZPDCRCDC,ZPDCRCUC                                                                      
271.00 120119 D2016C*  WHERE CHLCRORGNO=CRCORGCDE  AND CHLCRACCNO=CRCACNO AND                                      
272.00 120119 D2016C*  CHLCURBAL<=-50000 and CHLCCYCDE='HKD'                                                       
273.00 120119 D2016C*END-EXEC                                                                                      
274.00 111024      C                                                                                               
275.00 111024      C                                                                                               
276.00 111024      C/EXEC SQL                                                                                      
277.00 111024      C+ INSERT INTO AML_CRDTX                                                                        
278.00 111024      C+ (CTXACCNO, CTXNO, CTXCIF, CTXNAME,                                                           
279.00 111024      C+ CTXPRISEC, CTXCRDR, CTXTXNDT,CTXPOSDT, CTXCCY,CTXSTLCCY,                                     
280.00 111024      C+ CTXTXNAMT, CTXDS,CTXDS1,CTXCBAMT)                                                            
281.00 111024      C+ SELECT                                                                                       
282.00 111024      C+ CDN.CRDACCNO, CDN.CRDNO,CDN.CRDCIF,CDN.CRDNAME,                                              
283.00 111024      C+ CDN.CRDPRISEC,CTXCRDRIND,mod(CTXEFFDATE,1000000),                                            
284.00 111024      C+ mod(CTXPSTDATE,1000000),digits(CTXORGNMBR),' '   ,                                           
285.00 120117      C+ CTXTXAMT,CTXDESC,CTXDESC,CRDCBAMT                                                            
286.00 111024      C+ FROM ZPDCRTDC TDC,AML_CRDNO CDN                                                              
287.00 111024      C+ WHERE                                                                                        
288.00 111024      C+ DIGITS(CTXCARDNO)=SUBSTR(CDN.CRDACCNO,1,16)                                                  
289.00 111024      C+ AND ZONED(SUBSTR(DIGITS(CTXPSTDATE),3,4),4,0) >= :STRMON2                                    
290.00 111024      C+ AND ZONED(SUBSTR(DIGITS(CTXPSTDATE),3,4),4,0) <= :ENDMON2                                    
291.00 111024      C/END-EXEC                                                                                      
292.00 111024      C                   ENDIF                                                                       
293.00 60606      C                                                                                               
294.00 60516      C                   ENDSR                                                                       
295.00 60518      C                                                                                               
296.00 60518      C*----------------------------------------------------------------------------------------------
297.00 60518      C* CAL TOTAL AMOUNT IN TMP PF                                                                   
298.00 60518      C*----------------------------------------------------------------------------------------------
299.00 60518      C     CALTMPTLAMT   BEGSR                                                                       
300.00 60518      C                                                                                               
301.00 60606      C*--Calculate Cr/Db transaction total amount                                                    
302.00 60606      C*------------------------------------------                                                    
303.00 60606      C/EXEC SQL                                                                                      
304.00 60606      C+ INSERT INTO AMLDDOCRCD                                                                       
305.00 60606      C+ SELECT CTXCIF,CTXCRDR  ,SUM(CTXMAMT)                                                         
306.00 60606      C+ FROM CRDTX1                                                                                  
307.00 60606      C+ GROUP BY CTXCIF,CTXCRDR                                                                      
308.00 60606      C/END-EXEC                                                                                      
309.00 60606      C                                                                                               
310.00 60606      C/EXEC SQL                                                                                      
311.00 60606      C+ INSERT INTO AMLDDOCRCD                                                                       
312.00 60606      C+ SELECT CTXCIF,CTXCRDR  ,SUM(CTXMAMT)                                                         
313.00 60607      C+ FROM CRDTX2                                                                                  
314.00 60606      C+ GROUP BY CTXCIF,CTXCRDR                                                                      
315.00 60606      C/END-EXEC                                                                                      
316.00 60606      C                                                                                               
317.00 60606      C                                                                                               
318.00 60606      C*--Calculate Cr and Db transaction total amount                                                
319.00 60606      C*------------------------------------------                                                    
320.00 60606      C/EXEC SQL                                                                                      
321.00 60606      C+ INSERT INTO AMLDDNCRCD                                                                       
322.00 60606      C+ SELECT CTXCIF, SUM(CTXMAMT) ,COUNT(CTXCIF)                                                   
323.00 60606      C+ FROM CRDTX1                                                                                  
324.00 60606      C+ GROUP BY CTXCIF                                                                              
325.00 60606      C/END-EXEC                                                                                      
326.00 60606      C                                                                                               
327.00 60606      C/EXEC SQL                                                                                      
328.00 60606      C+ INSERT INTO AMLDDNCRCD                                                                       
329.00 60606      C+ SELECT CTXCIF, SUM(CTXMAMT)  ,COUNT(CTXCIF)                                                  
330.00 60607      C+ FROM CRDTX2                                                                                  
331.00 60606      C+ GROUP BY CTXCIF                                                                              
332.00 60606      C/END-EXEC                                                                                      
333.00 60606      C                                                                                               
334.00 60518      C                                                                                               
335.00 60518      C                   ENDSR                                                                       
336.00 60518      C                                                                                               
337.00 60524      C     GETFLDTE      BEGSR                                                                       
338.00 60524      C                   READ      TAP00101B                              10                         
339.00 60524      C                   DOW       *IN10='0'                                                         
340.00 60524      C                   IF        DSBK=1                                                            
341.00 60605      C                   CALL      'DFJJTOYY'                                                        
342.00 60605      C                   PARM                    DSDT                                                
343.00 111024      C                   PARM                    CURDATE           8 0                               
344.00 111024      C                   MOVEL     CURDATE       TODTE             6 0                               
345.00 111024      C                   MOVE      TODTE         CURMNTH           2 0                               
346.00 111024      C                   Z-ADD     0             TODTE2            6 0                               
347.00 111110      C                   IF        RFLG = 'Q'                                                        
348.00 111110      C                   IF        CURMNTH >= 3                                                      
349.00 111110      C                   EVAL      TODTE2 = TODTE - 2                                                
350.00 111110      C                   ELSE                                                                        
351.00 111110      C                   EVAL      TODTE2 = TODTE - 100 + 12 - 2                                     
352.00 111110      C                   ENDIF                                                                       
353.00 111110      C                   ELSE                                                                        
354.00 111024      C                   IF        CURMNTH >= 6                                                      
355.00 111024      C                   EVAL      TODTE2 = TODTE - 5                                                
356.00 111024      C                   ELSE                                                                        
357.00 111024      C                   EVAL      TODTE2 = TODTE - 100 + 12 - 5                                     
358.00 111024      C                   ENDIF                                                                       
359.00 60530      C                   ENDIF                                                                       
360.00 111110      C                   ENDIF                                                                       
361.00 60524      C                   READ      TAP00101B                              10                         
362.00 60524      C                   ENDDO                                                                       
363.00 111024      C                                                                                               
364.00 111024      C                   MOVE      TODTE         ENDMON2           4 0                               
365.00 111024      C                   MOVE      TODTE         ENDMON            6 0                               
366.00 111110      C*                  IF        RFLG = 'Q'                                                        
367.00 111024      C                   MOVE      TODTE2        STRMON2           4 0                               
368.00 111024      C                   MOVE      TODTE2        STRMON            6 0                               
369.00 111110      C*                  ELSE                                                                        
370.00 111110      C*                  MOVE      TODTE2        STRMON2           4 0                               
371.00 111110      C*                  MOVE      TODTE2        STRMON            6 0                               
372.00 111110      C*                  ENDIF                                                                       
373.00 60524      C                                                                                               
374.00 60524      C                   ENDSR                                                                       
375.00 60518      C                                                                                               
376.00 60518      C     GWKTXN        BEGSR                                                                       
377.00 60519      C                                                                                               
378.00 60606      C*EXEC SQL                                                                                      
379.00 60606      C* INSERT INTO CRDTXWRK1                                                                        
380.00 60606      C* SELECT *                                                                                     
381.00 60606      C* FROM TXNWCD1                                                                                 
382.00 60606      C*END-EXEC                                                                                      
383.00 60519      C                                                                                               
384.00 60606      C*EXEC SQL                                                                                      
385.00 60606      C* INSERT INTO CRDTXWRK2                                                                        
386.00 60606      C* SELECT *                                                                                     
387.00 60606      C* FROM TXNWCD2                                                                                 
388.00 60606      C*END-EXEC                                                                                      
389.00 60518      C                   ENDSR                                                                       
390.00 60518      C                                                                                               
391.00 60518      C*----------------------------------------------------------------------------------------------
392.00 60518      C* CALCULATE CREDIT OR DEBIT AND TOTAL CR+DB DAILY TXN AMOUNT                                   
393.00 60518      C*----------------------------------------------------------------------------------------------
394.00 60518      C     CALTLAMT      BEGSR                                                                       
395.00 60606      C***GET CREDIT OR DEBIT TOTAL WEEKLY TXN AMOUNT                                                 
396.00 60606      C                   EVAL      KTCIF =CTXCIF                                                     
397.00 70214      C                   EVAL      KTINOUT='2'                                                       
398.00 60606      C     KTD           CHAIN     AMLDDOCRCD                         55                             
399.00 60606      C                   IF        *IN55='0'                                                         
400.00 60606      C                   EVAL      CTXMCRAMT=DOCTMTXAMT                                              
401.00 60606      C                   ENDIF                                                                       
402.00 60606      C                                                                                               
403.00 70214      C                   EVAL      KTINOUT='1'                                                       
404.00 60606      C     KTD           CHAIN     AMLDDOCRCD                         55                             
405.00 60606      C                   IF        *IN55='0'                                                         
406.00 60606      C                   EVAL      CTXMDRAMT=DOCTMTXAMT                                              
407.00 60606      C                   ENDIF                                                                       
408.00 60606      C                                                                                               
409.00 60606      C*** GET IN + OUT TOTAL TXN AMOUNT                                                              
410.00 60606      C     CTXCIF        CHAIN     AMLDDNCRCD                         45                             
411.00 60606      C                   IF        *IN45='0'                                                         
412.00 60606      C                   EVAL      CTXMTTLAMT =DNCTMTXAMT                                            
413.00 60606      C                   EVAL      CTXNOTXN   =DNCTNOTXN                                             
414.00 60606      C                   ENDIF                                                                       
415.00 60519      C                                                                                               
416.00 60518      C                   ENDSR                                                                       
417.00 60516      C*----------------------------------------------------------------------------------------------
418.00 60516      C* Generate Report                                                                              
419.00 60516      C*----------------------------------------------------------------------------------------------
420.00 60516      C     GENRPT        BEGSR                                                                       
421.00 60523      C                                                                                               
422.00 60523      C                   Z-ADD     39            LTLN              2 0                               
423.00 60523      C                                                                                               
424.00 60523      C                   IF        RNO='R'                                                           
425.00 60516      C*READ RETAIL CUSTOMER                                                                          
426.00 60516      C                   MOVE      *BLANK        OFFI              3                                 
427.00 60530      C                   Z-ADD     0             BRCH              3 0                               
428.00 60516      C                   MOVE      *BLANK        TMPCIF           10                                 
429.00 60516      C                   Z-ADD     1             LINE              2 0                               
430.00 60517      C                   SETOFF                                       89                             
431.00 60606      C                   OPEN      CRDTX1                                                            
432.00 60606      C                   READ      CRDTX1                                 80                         
433.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
434.00 60517      C                   IF        *IN80='1'                                                         
435.00 60517      C                   SETON                                        89                             
436.00 60517      C                   ENDIF                                                                       
437.00 60516      C                   DOW       *IN80='0'                                                         
438.00 60516      C                   SELECT                                                                      
439.00 60530      C                   WHEN      BRCH=0 AND OFFI=*BLANK                                            
440.00 60516      C***FIRST PAGE                                                                                  
441.00 111024      C                   IF        RFLG = 'Q'                                                        
442.00 60606      C                   WRITE     HEADERCTX                                                         
443.00 111024      C                   ELSE                                                                        
444.00 111024      C                   WRITE     HEADERCTQ                                                         
445.00 111024      C                   ENDIF                                                                       
446.00 60517      C                   EXSR      DTLLINE                                                           
447.00 60516      C                   WRITE     DTL1                                                              
448.00 60606      C                   WRITE     DTLCTX                                                            
449.00 60519      C                   ADD       4             LINE                                                
450.00 60516      C                                                                                               
451.00 60606      C                   WHEN      BRCH<>CTXBRCH OR OFFI<>CTXOFF OR LINE>LTLN                        
452.00 60516      C***BREAK PAGE                                                                                  
453.00 60606      C                   IF        TMPCIF<>CTXCIF                                                    
454.00 60517      C***NOT SAME CIF                                                                                
455.00 70214      C                   WRITE     DTLCTX1                                                           
456.00 60517      C                   WRITE     RECLINE                                                           
457.00 60519      C                   ADD       3             LINE                                                
458.00 60519      C                   ENDIF                                                                       
459.00 60519      C                                                                                               
460.00 60519      C                   SETON                                        98                             
461.00 111024      C                   IF        RFLG = 'Q'                                                        
462.00 60606      C                   WRITE     HEADERCTX                                                         
463.00 111024      C                   ELSE                                                                        
464.00 111024      C                   WRITE     HEADERCTQ                                                         
465.00 111024      C                   ENDIF                                                                       
466.00 60519      C                   SETOFF                                       98                             
467.00 60519      C                   Z-ADD     1             LINE                                                
468.00 60519      C                                                                                               
469.00 60517      C                   EXSR      DTLLINE                                                           
470.00 60517      C                   WRITE     DTL1                                                              
471.00 60606      C                   WRITE     DTLCTX                                                            
472.00 60519      C                   ADD       4             LINE                                                
473.00 60518      C                   WHEN      LINE<=LTLN                                                        
474.00 60516      C***WRITE CURRENT PAGE                                                                          
475.00 60606      C                   IF        TMPCIF<>CTXCIF                                                    
476.00 60606      C                   WRITE     DTLCTX1                                                           
477.00 60517      C                   WRITE     RECLINE                                                           
478.00 60519      C                   ADD       3             LINE                                                
479.00 60519      C                   EXSR      DTLLINE                                                           
480.00 60519      C                   WRITE     DTL1                                                              
481.00 60606      C                   WRITE     DTLCTX                                                            
482.00 60519      C                   ADD       4             LINE                                                
483.00 60519      C                   ELSE                                                                        
484.00 60517      C                   EXSR      DTLLINE                                                           
485.00 60606      C                   WRITE     DTLCTX                                                            
486.00 60519      C                   ADD       1             LINE                                                
487.00 60519      C                   ENDIF                                                                       
488.00 60517      C                   ENDSL                                                                       
489.00 60606      C                   EVAL      BRCH   = CTXBRCH                                                  
490.00 60606      C                   EVAL      OFFI     = CTXOFF                                                 
491.00 60606      C                   EVAL      TMPCIF   = CTXCIF                                                 
492.00 60607      C                   EVAL      AWTLCRAMT= CTXMCRAMT                                              
493.00 60607      C                   EVAL      AWTLDRAMT= CTXMDRAMT                                              
494.00 60606      C                   EVAL      AWTLCBAMT= CTXCBAMT                                               
495.00 60606      C                   READ      CRDTX1                                 80                         
496.00 60516      C                   ENDDO                                                                       
497.00 60606      C                   CLOSE     CRDTX1                                                            
498.00 60613      C  N89              WRITE     DTLCTX1                                                           
499.00 60517      C                                                                                               
500.00 60523      C                   ENDIF                                                  *END RETAIL RPT      
501.00 60523      C                                                                                               
502.00 60523      C                                                                                               
503.00 60523      C                   IF        RNO='O'                                                           
504.00 60517      C*READ CORP AND PRI CUSTOMER                                                                    
505.00 60530      C                   MOVE      *BLANK        MARK              4                                 
506.00 60517      C                   MOVE      *BLANK        OFFI              3                                 
507.00 60517      C                   MOVE      *BLANK        TMPCIF           10                                 
508.00 60517      C                   Z-ADD     1             LINE              2 0                               
509.00 60517      C                   Z-ADD     0             PRETLAMT         13 2                               
510.00 60523      C                   SETOFF                                       89                             
511.00 60606      C                   OPEN      CRDTX2                                                            
512.00 60606      C                   READ      CRDTX2                                 70                         
513.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
514.00 60523      C                   IF        *IN70<>'0'                                                        
515.00 60523      C                   SETON                                        89                             
516.00 60517      C                   ENDIF                                                                       
517.00 60517      C                                                                                               
518.00 60517      C                   DOW       *IN70='0'                                                         
519.00 60517      C                   SELECT                                                                      
520.00 60530      C                   WHEN      MARK=*BLANK AND OFFI=*BLANK                                       
521.00 60517      C***FIRST PAGE                                                                                  
522.00 111024      C                   IF        RFLG = 'Q'                                                        
523.00 60606      C                   WRITE     HEADERCTX                                                         
524.00 111024      C                   ELSE                                                                        
525.00 111024      C                   WRITE     HEADERCTQ                                                         
526.00 111024      C                   ENDIF                                                                       
527.00 60517      C                   EXSR      DTLLINE                                                           
528.00 60517      C                   WRITE     DTL1                                                              
529.00 60606      C                   WRITE     DTLCTX                                                            
530.00 60519      C                   ADD       4             LINE                                                
531.00 60517      C                                                                                               
532.00 60606      C                   WHEN      MARK<>CTXMARK OR OFFI<>CTXOFF OR LINE>LTLN                        
533.00 60517      C***BREAK PAGE                                                                                  
534.00 60606      C                   IF        TMPCIF<>CTXCIF                                                    
535.00 60517      C***NOT SAME CIF                                                                                
536.00 60606      C                   WRITE     DTLCTX1                                                           
537.00 60517      C                   WRITE     RECLINE                                                           
538.00 60519      C                   ENDIF                                                                       
539.00 60519      C                                                                                               
540.00 60519      C                   Z-ADD     1             LINE                                                
541.00 60517      C                   SETON                                        98                             
542.00 111024      C                   IF        RFLG = 'Q'                                                        
543.00 60606      C                   WRITE     HEADERCTX                                                         
544.00 111024      C                   ELSE                                                                        
545.00 111024      C                   WRITE     HEADERCTQ                                                         
546.00 111024      C                   ENDIF                                                                       
547.00 60517      C                   SETOFF                                       98                             
548.00 60517      C                   EXSR      DTLLINE                                                           
549.00 60517      C                   WRITE     DTL1                                                              
550.00 60606      C                   WRITE     DTLCTX                                                            
551.00 60519      C                   ADD       4             LINE                                                
552.00 60518      C                   WHEN      LINE<=LTLN                                                        
553.00 60517      C***WRITE CURRENT PAGE                                                                          
554.00 60606      C                   IF        TMPCIF<>CTXCIF                                                    
555.00 60606      C                   WRITE     DTLCTX1                                                           
556.00 60517      C                   WRITE     RECLINE                                                           
557.00 60519      C                   ADD       3             LINE                                                
558.00 60517      C                   EXSR      DTLLINE                                                           
559.00 60517      C                   WRITE     DTL1                                                              
560.00 60606      C                   WRITE     DTLCTX                                                            
561.00 60519      C                   ADD       4             LINE                                                
562.00 60517      C                   ELSE                                                                        
563.00 60517      C                   EXSR      DTLLINE                                                           
564.00 60606      C                   WRITE     DTLCTX                                                            
565.00 60519      C                   ADD       1             LINE                                                
566.00 60517      C                   ENDIF                                                                       
567.00 60517      C                   ENDSL                                                                       
568.00 60606      C                   EVAL      MARK  = CTXMARK                                                   
569.00 60606      C                   EVAL      OFFI     = CTXOFF                                                 
570.00 60606      C                   EVAL      TMPCIF   = CTXCIF                                                 
571.00 60607      C                   EVAL      AWTLCRAMT= CTXMCRAMT                                              
572.00 60607      C                   EVAL      AWTLDRAMT= CTXMDRAMT                                              
573.00 60606      C                   EVAL      AWTLCBAMT= CTXCBAMT                                               
574.00 60606      C                   READ      CRDTX2                                 70                         
575.00 60517      C                   ENDDO                                                                       
576.00 60606      C                   CLOSE     CRDTX2                                                            
577.00 60606      C  N89              WRITE     DTLCTX1                                                           
578.00 111024      C                   ENDIF                                                  *EXCLUDE RETAIL RPT  
579.00 111024      C                   IF        RFLG = 'Q'                                                        
580.00 60606      C   89              WRITE     HEADERCTX                                                         
581.00 111024      C                   ELSE                                                                        
582.00 111024      C   89              WRITE     HEADERCTQ                                                         
583.00 111024      C                   ENDIF                                                                       
584.00 60519      C   89              WRITE     RNOREC                                                            
585.00 60517      C  N89              WRITE     ENDREC                                                            
586.00 60516      C                   ENDSR                                                                       
587.00 60516      C                                                                                               
588.00 60517      C                                                                                               
589.00 60517      C     DTLLINE       BEGSR                                                                       
590.00 60517      C                                                                                               
591.00 60606      C                   EVAL      AWCIF  = CTXCIF                                                   
592.00 60606      C                   MOVEL     CTXMARK       AWMARK                                              
593.00 60606      C                   EVAL      AWBRNO = CTXBRCH                                                  
594.00 60606      C                   EVAL      AWOFF  = CTXOFF                                                   
595.00 60606      C                   EVAL      AWNAME = CTXNAME                                                  
596.00 111108      C                   EVAL      AWSCCCD = ' '                                                     
597.00 120914 D2216C                   EVAL      AWSCCCD2 = ' '                                                    
598.00 111108      C                   EVAL      K03CIF = CTXCIF                                                   
599.00 111108      C     KC03          CHAIN     CUP003                                                            
600.00 111108      C                   IF        %FOUND(CUP003)                                                    
601.00 111108      C                   EVAL      AWSCCCD = CURSPF                                                  
602.00 120914 D2216C                   EVAL      AWSCCCD2 = CUBHVF                                                 
603.00 111108      C                   ENDIF                                                                       
604.00 60606      C                                                                                               
605.00 60606      C                   EVAL      AWCCNO = CTXNO                                                    
606.00 60606      C                                                                                               
607.00 60606      C                   Z-ADD     CTXTXNDT      AWDATE                                              
608.00 60612      C                   Z-ADD     CTXPOSDT      AWPDATE                                             
609.00 60606      C                   EVAL      AWPRISEC = CTXPRISEC                                              
610.00 111108      c     ctxccy        ifeq      '801'                                                             
611.00 120817 D2230C     CTXCCY        OREQ      '805'                                                             
612.00 111108      c                   movel(p)  '000'         CTXCCY                                              
613.00 111108      c                   endif                                                                       
614.00 111108      c     ctxccy        ifeq      '802'                                                             
615.00 111108      c                   movel(p)  '344'         CTXCCY                                              
616.00 111108      c                   endif                                                                       
617.00 120817 D2230c     ctxccy        ifeq      '806'                                                             
618.00 120817 D2230c                   movel(p)  '156'         CTXCCY                                              
619.00 120817 D2230c                   endif                                                                       
620.00 60606      C                   MOVE      CTXCCY        AWCCY                                               
621.00 60607      C                   Z-ADD     CTXMAMT       AWAMT                                               
622.00 60607      C                                                                                               
623.00 60607      C                   IF        CTXDS='POS Purchase'                                              
624.00 60607      C                   EVAL      AWNAR=CTXDS1                                                      
625.00 60607      C                   ELSE                                                                        
626.00 60606      C                   EVAL      AWNAR  = CTXDS                                                    
627.00 60607      C                   ENDIF                                                                       
628.00 111108      C                   IF        CTXCRDR='1'                                                       
629.00 60606      C                   EVAL      AWCRDR='CR'                                                       
630.00 60606      C                   ELSE                                                                        
631.00 60606      C                   EVAL      AWCRDR='DR'                                                       
632.00 60606      C                   ENDIF                                                                       
633.00 60530      C                   ENDSR                                                                       
634.00 60530      C                                                                                               
635.00 60530      C                                                                                               
636.00 60530      C                                                                                               
637.00 120119 D2016C*----------------------------------------------------------------------------------------------
638.00 120118   |  C* Get Credit Card Number                                                                       
639.00 120118   |  C*----------------------------------------------------------------------------------------------
640.00 120118   |  C     GETCCNO       BEGSR                                                                       
641.00 120118   |  C                                                                                               
642.00 120118   |  C                   OPEN      AML_CRDBAL                                                        
643.00 120817 D2230C*                  OPEN      AML_CRDNO                                                         
644.00 120817 D2230C/EXEC SQL                                                                                      
645.00 120817 D2230C+ INSERT INTO IPROD/AML_CRDNO (CRDNO)                                                          
646.00 120817 D2230C+ SELECT CRDNUM FROM IPROD/AML_CRDBAL WHERE CRDCBAL >= :STNCBAL AND                            
647.00 120817 D2230C+ CRDBALDT >= :STRMON GROUP BY CRDNUM HAVING COUNT(*) = :CRCOUNT                               
648.00 120817 D2230C/END-EXEC                                                                                      
649.00 120817 D2230C*                  CLOSE     AML_CRDNO                                                         
650.00 120817 D2230C                   OPEN      AML_CRDNO                                                         
651.00 120817 D2230C                   READ      AML_CRDNO                                                         
652.00 120817 D2230C                   DOW       NOT %EOF(AML_CRDNO)                                               
653.00 120817 D2230C                   EVAL      KCRDNO19 = CRDNO                                                  
654.00 120817 D2230C                   EVAL      KCRDDT   = ENDMON                                                 
655.00 120817 D2230C     KCRDBAL       CHAIN     AML_CRDBAL                                                        
656.00 120817 D2230C                   IF        %FOUND(AML_CRDBAL)                                                
657.00 120817 D2230C                   EVAL      CRDACCNO = KCRDNO19                                               
658.00 120817 D2230C                   EVAL      CRDCIF   = CRDCIF                                                 
659.00 120817 D2230C                   EVAL      CRDNAME  = CRDNAME                                                
660.00 120817 D2230C                   EVAL      CRDCBAMT = CRDCBAL                                                
661.00 120817 D2230C                   UPDATE    RCRDNO                                                            
662.00 120817 D2230C                   ENDIF                                                                       
663.00 120817 D2230C                   READ      AML_CRDNO                                                         
664.00 120817 D2230C                   ENDDO                                                                       
665.00 120817 D2230C                   CLOSE     AML_CRDNO                                                         
666.00 120817 D2230C                                                                                               
667.00 120817   |  C*D2230             READ      AML_CRDBAL                                                        
668.00 120817   |  C*D2230             DOW       NOT %EOF(AML_CRDBAL)                                              
669.00 120118   |   * With request credit balance                                                                  
670.00 120817   |  C*D2230             IF        CRDCBAL >= STNCBAL AND CRDBALDT >= STRMON                         
671.00 120817   |  C*D2230             EVAL      KCRDNO19 = CRDNUM                                                 
672.00 120817   |  C*D2230KCRDBAL       CHAIN     AML_CRDNO                                                        
673.00 120817   |  C*D2230             IF        NOT %FOUND(AML_CRDNO)                                             
674.00 120817   |  C*D2230             EVAL      CRDACCNO = CRDNUM                                                 
675.00 120817   |  C*D2230             EVAL      CRDNO    = CRDNUM                                                 
676.00 120817   |  C*D2230             EVAL      CRDCIF   = CRDCIF                                                 
677.00 120817   |  C*D2230             EVAL      CRDNAME  = CRDNAME                                                
678.00 120817   |  C*D2230             EVAL      CRDPRISEC= ' '                                                    
679.00 120817   |  C*D2230             EVAL      CRDCBAMT = CRDCBAL                                                
680.00 120817   |  C*D2230             WRITE     RCRDNO                                                            
681.00 120817   |  C*D2230             ENDIF                                                                       
682.00 120817   |  C*D2230             ENDIF                                                                       
683.00 120817   |  C*D2230             READ      AML_CRDBAL                                                        
684.00 120817   |  C*D2230             ENDDO                                                                       
685.00 120118   |  C                   CLOSE     AML_CRDBAL                                                        
686.00 120118   |  C                                                                                               
687.00 120119 D2016C                   ENDSR                                                                       
