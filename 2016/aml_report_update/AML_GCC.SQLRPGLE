1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                                       
2.00 60608      H********************************************************************************************** 
3.00 60608      H* Program      : AML_GCC                                                                       
4.00 60608      H* Reference    : CHG-166-06                                                                    
5.00 60608      H* Created By   : Aries Lung (B454PGM)                                                          
6.00 60608      H* Changed Date : 08 Jun 2006                                                                   
7.00 60608      H* Description  : Generate CC Acc with Credit Bal>=MOP 5,000(10)                                
8.00 60608      H********************************************************************************************** 
9.00 111024      H* Reference    : CHG-315-11 (D1315)                                                            
10.00 111024      H* Created By   : Karl (BA55PGM)                                                                
11.00 111024      H* Changed Date : 19 Oct 2011                                                                   
12.00 111024      H* Description  : Add SCC code in report                                                        
13.00 111024      H********************************************************************************************** 
14.00 120817      H* Reference    : CHG-230-12 (D2230)                                                            
15.00 120817      H* Created By   : Karl (BA55PGM)                                                                
16.00 120817      H* Changed Date : 17 AUG 2012                                                                   
17.00 120817      H* Description  : Add Logic to get CNY credit card no. and calculate                            
18.00 120817      H*                the CNY TXN amount to MOP                                                     
19.00 120914      H********************************************************************************************** 
20.00 120914      H* Reference    : CHG-216-12 (D2216)                                                            
21.00 120914      H* Created By   : Joanna(BE95PGM)                                                               
22.00 120914      H* Changed Date : 14 SEP 2012                                                                   
23.00 120914      H* Description  : Add new field Scc code2                                                       
24.00 120914      H*                                                                                              
25.00 160825      H********************************************************************************************** 
26.00 160825      H* Reference    : CHG-262-16 (D6262)                                                            
27.00 160825      H* Created By   : Myles Ieong (BI77PGM)                                                         
28.00 160825      H* Changed Date : 04 Aug 2016                                                                   
29.00 160825      H* Description  : AML report parameter changing and revoking                                    
30.00 160825      H*                                                                                              
31.00 160825      H********************************************************************************************** 
32.00 170606      H* Reference    : CHG-196-17 (D7196)                                                            
33.00 170420      H* Created By   : Albert Au   (BG09PGM)                                                         
34.00 170420      H* Changed Date : 10 Apr 2017                                                                   
35.00 170420      H* Description  : Remove the transaction for CIF's with officer code as 'PER'                   
36.00 170420      H*                                                                                              
37.00 170420      H********************************************************************************************** 
38.00 60606      FCRDTX1    UF   E           K DISK    USROPN                                                    
39.00 60606      FCRDTX2    UF   E           K DISK    USROPN                                                    
40.00 60915      F*AML_CRDNO IF   E           K DISK    USROPN                                                   
41.00 60606      FAML_CRDTX UF   E           K DISK    USROPN                                                    
42.00 60606      FCUP003    IF   E           K DISK                                                              
43.00 60606      FTAP00101B IF   E             DISK                                                              
44.00 60606      FAMLDDNCRCDUF A E           K DISK                                                              
45.00 60606      FAMLDDOCRCDUF A E           K DISK                                                              
46.00 60529      FICBSRATE  IF   E             DISK    USROPN                                                    
47.00 60530      FAML_CCRPT O    E             PRINTER OFLIND(*IN98)                                             
48.00 170606 D7196F                                     USROPN                                                    
49.00 60516      D                                                                                               
50.00 60516      C*----------------------------------------------------------------------------------------------
51.00 60516      C* Initial Variable                                                                             
52.00 60516      C*----------------------------------------------------------------------------------------------
53.00 60517      C                                                                                               
54.00 60519      C*----------------------------------------------------------------------------------------------
55.00 60519      C* PARM LIST                                                                                    
56.00 60519      C*----------------------------------------------------------------------------------------------
57.00 60517      C     *ENTRY        PLIST                                                                       
58.00 60523      C                   PARM                    RNO               1                                 
59.00 170606 D7196C                   PARM                    PRPT              1                                 
60.00 60517      C                                                                                               
61.00 60519      C*----------------------------------------------------------------------------------------------
62.00 60519      C* KEY LIST                                                                                     
63.00 60519      C*----------------------------------------------------------------------------------------------
64.00 60530      C     KTD           KLIST                                                                       
65.00 60519      C                   KFLD                    KTCIF            10                                 
66.00 60606      C                   KFLD                    KTINOUT           3                                 
67.00 60516      C                                                                                               
68.00 60606      C     KC03          KLIST                                                                       
69.00 60527      C                   KFLD                    K03BNO            3 0                               
70.00 60527      C                   KFLD                    K03CIF           10                                 
71.00 60527      C                   Z-ADD     001           K03BNO                                              
72.00 60516      C*----------------------------------------------------------------------------------------------
73.00 60527      C* Main Program                                                                                 
74.00 60516      C*----------------------------------------------------------------------------------------------
75.00 60527      C                   EXSR      GETFLDTE                                                          
76.00 170606 D7196C                   IF        PRPT = 'C'                                                        
77.00 60527      C                   IF        RNO='R'                                                           
78.00 60529      C***EXTRACT DATA FROM AML003                                                                    
79.00 60529      C                   EXSR      CLSQL                                                             
80.00 60529      C***GET BRANCH NO AND MOP AMOUNT                                                                
81.00 60606      C                   OPEN      AML_CRDTX                                                         
82.00 60606      C                   READ      AML_CRDTX                              50                         
83.00 60529      C                   DOW       *IN50='0'                                                         
84.00 60527      C                   EXSR      GETFLD                                                            
85.00 60606      C                   UPDATE    RCRDTX                                                            
86.00 60606      C                   READ      AML_CRDTX                              50                         
87.00 60529      C                   ENDDO                                                                       
88.00 60606      C                   CLOSE     AML_CRDTX                                                         
89.00 60606      C                   EXSR      SEPGRP                                                            
90.00 60527      C                                                                                               
91.00 60529      C                   EXSR      CALTMPTLAMT                                                       
92.00 60606      C                   OPEN      CRDTX1                                                            
93.00 60606      C                   READ      CRDTX1                                 50                         
94.00 60529      C                   DOW       *IN50='0'                                                         
95.00 60529      C                   EXSR      CALTLAMT                                                          
96.00 60606      C                   UPDATE    RCTX1                                                             
97.00 60606      C                   READ      CRDTX1                                 50                         
98.00 60530      C                   ENDDO                                                                       
99.00 60606      C                   CLOSE     CRDTX1                                                            
100.00 60529      C                                                                                               
101.00 60606      C                   OPEN      CRDTX2                                                            
102.00 60606      C                   READ      CRDTX2                                 40                         
103.00 60529      C                   DOW       *IN40='0'                                                         
104.00 60529      C                   EXSR      CALTLAMT                                                          
105.00 60606      C                   UPDATE    RCTX2                                                             
106.00 60606      C                   READ      CRDTX2                                 40                         
107.00 60529      C                   ENDDO                                                                       
108.00 60606      C                   CLOSE     CRDTX2                                                            
109.00 60529      C                                                                                               
110.00 60519      C                                                                                               
111.00 60518      C                   EXSR      GWKTXN                                                            
112.00 60523      C                   ENDIF                                                                       
113.00 170606 D7196C                   ENDIF                                                                       
114.00 60519      C                                                                                               
115.00 170606 D7196C                   IF        PRPT = 'P'                                                        
116.00 170606 D7196C                   OPEN      AML_CCRPT                                                         
117.00 60517      C                   EXSR      GENRPT                                                            
118.00 170606 D7196C                   CLOSE     AML_CCRPT                                                         
119.00 170606 D7196C                   ENDIF                                                                       
120.00 60516      C                   SETON                                        LR                             
121.00 60527      C                                                                                               
122.00 60606      C     SEPGRP        BEGSR                                                                       
123.00 60606      C                                                                                               
124.00 60606      C/EXEC SQL                                                                                      
125.00 60606      C+                                                                                              
126.00 60606      C+ INSERT INTO CRDTX1                                                                           
127.00 60606      C+ SELECT * FROM AML_CRDTX WHERE CTXMARK='RET'                                                  
128.00 60606      C+                                                                                              
129.00 60606      C/END-EXEC                                                                                      
130.00 60606      C                                                                                               
131.00 60606      C/EXEC SQL                                                                                      
132.00 60606      C+                                                                                              
133.00 60606      C+ INSERT INTO CRDTX2                                                                           
134.00 60606      C+ SELECT * FROM AML_CRDTX WHERE CTXMARK<>'RET'                                                 
135.00 60606      C+                                                                                              
136.00 60606      C/END-EXEC                                                                                      
137.00 60606      C                   ENDSR                                                                       
138.00 60527      C*----------------------------------------------------------------------------------------------
139.00 60527      C* GET BRANCH NO AND CCY CODE                                                                   
140.00 60527      C*----------------------------------------------------------------------------------------------
141.00 60527      C     GETFLD        BEGSR                                                                       
142.00 60606      C                                                                                               
143.00 60606      C                                                                                               
144.00 60606      C***GET BRANCH NO                                                                               
145.00 60606      C                   EVAL      K03CIF=CTXCIF                                                     
146.00 60606      C     KC03          CHAIN     CUP003                             45                             
147.00 60606      C                   IF        *IN45='0'                                                         
148.00 60606      C                   EVAL      CTXMARK = CUMARK                                                  
149.00 60606      C                   EVAL      CTXOFF  = CUPOFF                                                  
150.00 60606      C                   EVAL      CTXBRCH=CUBRCH                                                    
151.00 60606      C                   ENDIF                                                                       
152.00 60527      C                                                                                               
153.00 60527      C***GET CCY CODE AND CALCULATE MOP AMOUNT                                                       
154.00 70214 c7004c                   select                                                                      
155.00 70214 c7004c     ctxccy        wheneq    '801'                                                             
156.00 120817 D2230C     CTXCCY        OREQ      '805'                                                             
157.00 70214 c7004c                   movel(p)  '000'         CTXCCY                                              
158.00 70214 c7004c     ctxccy        wheneq    '802'                                                             
159.00 70214 c7004c                   movel(p)  '344'         CTXCCY                                              
160.00 120817 D2230c     ctxccy        wheneq    '806'                                                             
161.00 120817 D2230c                   movel(p)  '156'         CTXCCY                                              
162.00 70214 c7004c                   endsl                                                                       
163.00 70214 c7004c                   move      ctxccy        ctxstlccy                                           
164.00 60901      C                   MOVE      CTXSTLCCY     TMPCCY            3 0                               
165.00 60606      C                   IF        TMPCCY=0 OR TMPCCY=446                                            
166.00 60606      C                   EVAL      CTXMAMT=CTXTXNAMT                                                 
167.00 60606      C                   LEAVESR                                                                     
168.00 60606      C                   ENDIF                                                                       
169.00 60529      C                   OPEN      ICBSRATE                                                          
170.00 60527      C                   READ      ICBSRATE                               55                         
171.00 60527      C                   DOW       *IN55='0'                                                         
172.00 60530      C                   IF        RCCY=TMPCCY                                                       
173.00 60606      C                   EVAL      CTXMAMT    =CTXTXNAMT*RCCRTE                                      
174.00 60530      C                   CLOSE     ICBSRATE                                                          
175.00 60530      C                   LEAVESR                                                                     
176.00 60527      C                   ENDIF                                                                       
177.00 60527      C                   READ      ICBSRATE                               55                         
178.00 60527      C                   ENDDO                                                                       
179.00 60529      C                   CLOSE     ICBSRATE                                                          
180.00 60527      C                   ENDSR                                                                       
181.00 60527      C                                                                                               
182.00 60527      C                                                                                               
183.00 60516      C*----------------------------------------------------------------------------------------------
184.00 60516      C* SQL                                                                                          
185.00 60516      C*----------------------------------------------------------------------------------------------
186.00 60516      C     CLSQL         BEGSR                                                                       
187.00 60612      C                   MOVEL     TODTE         TODT              6                                 
188.00 60612      C                   MOVE      TODT          YYMM              4                                 
189.00 60612      C                   MOVE      TODT          YYYYMM            6 0                               
190.00 60527      C                                                                                               
191.00 60605      C***MOP                                                                                         
192.00 70105 C7004C*EXEC SQL                                                                                      
193.00 70105 C7004C* INSERT INTO AML_CRDNO SELECT SHPCRD , SHCARD, SDMLBR ,                                       
194.00 70105 C7004C* SHADD1 , SHPRIM ,SMPMPB*-1/100 FROM SCRDPRF                                                  
195.00 70105 C7004C* WHERE SMPMPB/100<=-5000 and (SMCURC =' ' or SMCURC='446')                                    
196.00 70105 C7004C*END-EXEC                                                                                      
197.00 60527      C                                                                                               
198.00 60605      C***HKD                                                                                         
199.00 70105 C7004C*EXEC SQL                                                                                      
200.00 70105 C7004C* INSERT INTO AML_CRDNO SELECT SHPCRD , SHCARD, SDMLBR ,                                       
201.00 70105 C7004C* SHADD1 , SHPRIM ,SMPMPB*-1.03/100 FROM SCRDPRF                                               
202.00 70105 C7004C* WHERE SMPMPB*1.03/100<=-5000 AND SMCURC ='344'                                               
203.00 70105 C7004C*END-EXEC                                                                                      
204.00 60605      C                                                                                               
205.00 61027      C*****NOT YET TESTING FOR CARD LINK                                                             
206.00 61026      C***MOP                                                                                         
207.00 70105 C7004C/EXEC SQL                                                                                      
208.00 70105 C7004C+                                                                                              
209.00 70105 C7004C+ INSERT INTO AML_CRDNO                                                                        
210.00 70105 C7004C+ SELECT  DIGITS(CHLCARDNO),DIGITS(CHLCARDNO),                                                 
211.00 70105 C7004C+ SUBSTR(DIGITS(CHLACHACCT),7,10),                                                             
212.00 70105 C7004C+ CRCCNAME,' '  ,CHLCURBAL*-1                                                                  
213.00 70105 C7004C+ FROM ZPDCRCDC,ZPDCRCUC                                                                       
214.00 70105 C7004C+ WHERE CHLCRORGNO=CRCORGCDE  AND CHLCRACCNO=CRCACNO AND                                       
215.00 160825 C7004C*+ D6262 CHLCURBAL<=-5000 and CHLCCYCDE='MOP'                                                  
216.00 160825 D6262C+ CHLCURBAL<=-20000 and CHLCCYCDE='MOP'                                                        
217.00 70105 C7004C+                                                                                              
218.00 70105 C7004C/END-EXEC                                                                                      
219.00 70105 C7004C                                                                                               
220.00 70105 C7004C***HKD                                                                                         
221.00 70105 C7004C/EXEC SQL                                                                                      
222.00 70105 C7004C+                                                                                              
223.00 70105 C7004C+  INSERT INTO AML_CRDNO                                                                       
224.00 70105 C7004C+  SELECT  DIGITS(CHLCARDNO),DIGITS(CHLCARDNO),                                                
225.00 70105 C7004C+  SUBSTR(DIGITS(CHLACHACCT),7,10),                                                            
226.00 70105 C7004C+  CRCCNAME,' '  ,CHLCURBAL*-1.03                                                              
227.00 70105 C7004C+  FROM ZPDCRCDC,ZPDCRCUC                                                                      
228.00 70105 C7004C+  WHERE CHLCRORGNO=CRCORGCDE  AND CHLCRACCNO=CRCACNO AND                                      
229.00 160825 C7004C*+ D6262 CHLCURBAL<=-5000 and CHLCCYCDE='HKD'                                                  
230.00 160825 D6262C+  CHLCURBAL<=-20000 and CHLCCYCDE='HKD'                                                       
231.00 70105 C7004C/END-EXEC                                                                                      
232.00 60605      C                                                                                               
233.00 61026      C                                                                                               
234.00 120817 D2230C***CNY                                                                                         
235.00 120817   |  C/EXEC SQL                                                                                      
236.00 120817   |  C+                                                                                              
237.00 120817   |  C+  INSERT INTO AML_CRDNO                                                                       
238.00 120817   |  C+  SELECT  DIGITS(CHLCARDNO),DIGITS(CHLCARDNO),                                                
239.00 120817   |  C+  SUBSTR(DIGITS(CHLACHACCT),7,10),                                                            
240.00 120817   |  C+  CRCCNAME,' '  ,CHLCURBAL*RCCRTE                                                             
241.00 120817   |  C+  FROM ZPDCRCDC,ZPDCRCUC,ICBSRATE                                                             
242.00 120817   |  C+  WHERE CHLCRORGNO=CRCORGCDE  AND CHLCRACCNO=CRCACNO AND                                      
243.00 160825   |  C*+ D6262 CHLCURBAL*RCCRTE<=-5000 and CHLCCYCDE='CNY'                                           
244.00 160825 D6262C+  CHLCURBAL*RCCRTE<=-20000 and CHLCCYCDE='CNY'                                                
245.00 120817   |  C+  AND RBANK=1 AND RCCY=156                                                                    
246.00 120817 D2230C/END-EXEC                                                                                      
247.00 61026      C                                                                                               
248.00 61026      C                                                                                               
249.00 61026      C                                                                                               
250.00 61026      C                                                                                               
251.00 70105 C7004C*EXEC SQL                                                                                      
252.00 70105 C7004C* INSERT INTO AML_CRDTX                                                                        
253.00 70105 C7004C* (CTXACCNO, CTXNO, CTXCIF, CTXNAME,                                                           
254.00 70105 C7004C* CTXPRISEC, CTXCRDR, CTXTXNDT,CTXPOSDT, CTXCCY,CTXSTLCCY,                                     
255.00 70105 C7004C* CTXTXNAMT, CTXDS,CTXDS1,CTXCBAMT)                                                            
256.00 70105 C7004C* SELECT                                                                                       
257.00 70105 C7004C* CDN.CRDACCNO, CDN.CRDNO,CDN.CRDCIF,CDN.CRDNAME,                                              
258.00 70105 C7004C* CDN.CRDPRISEC,C0P.CTDBCR, C0P.CTTRDT,CTPRDT, C0P.CTTRCC ,CTISCC,                             
259.00 70105 C7004C* C0P.CTISSA/100, C0P.CTPDS1,C0P.CTCADS,CRDCBAMT                                               
260.00 70105 C7004C* FROM CTRNCU0P C0P,AML_CRDNO CDN WHERE                                                        
261.00 70105 C7004C* CTACCT=CDN.CRDACCNO AND CTCARD=CDN.CRDNO AND                                                 
262.00 70105 C7004C* SUBSTR(DIGITS(C0P.CTPRDT),2,4)=:YYMM                                                         
263.00 70105 C7004C*END-EXEC                                                                                      
264.00 60605      C                                                                                               
265.00 61027      C                                                                                               
266.00 61027      C                                                                                               
267.00 70105 C7004C/EXEC SQL                                                                                      
268.00 70105 C7004C+ INSERT INTO AML_CRDTX                                                                        
269.00 70105 C7004C+ (CTXACCNO, CTXNO, CTXCIF, CTXNAME,                                                           
270.00 70105 C7004C+ CTXPRISEC, CTXCRDR, CTXTXNDT,CTXPOSDT, CTXCCY,CTXSTLCCY,                                     
271.00 70105 C7004C+ CTXTXNAMT, CTXDS,CTXDS1,CTXCBAMT)                                                            
272.00 70105 C7004C+ SELECT                                                                                       
273.00 70105 C7004C+ CDN.CRDACCNO, CDN.CRDNO,CDN.CRDCIF,CDN.CRDNAME,                                              
274.00 70214 C7004C+ CDN.CRDPRISEC,CTXCRDRIND,mod(CTXEFFDATE,1000000),                                            
275.00 70214 C7004C*+ mod(CTXPSTDATE,1000000),CTXOGCCY ,' '   ,                                                   
276.00 70214 C7004C+ mod(CTXPSTDATE,1000000),digits(CTXORGNMBR),' '   ,                                           
277.00 70105 C7004C+ CTXTXAMT,CTXDESC,CTXDESC,CRDCBAMT                                                            
278.00 70105 C7004C+ FROM ZPDCRTDC TDC,AML_CRDNO CDN                                                              
279.00 70105 C7004C+ WHERE                                                                                        
280.00 70105 C7004C+ DIGITS(CTXCARDNO)=SUBSTR(CDN.CRDACCNO,1,16)                                                  
281.00 70214 C7004C+ AND SUBSTR(DIGITS(CTXPSTDATE),3,4)=:YYMM                                                     
282.00 70105 C7004C/END-EXEC                                                                                      
283.00 61027      C                                                                                               
284.00 61027      C                                                                                               
285.00 61027      C                                                                                               
286.00 61027      C                                                                                               
287.00 60915      C*                  OPEN      AML_CRDNO                                                         
288.00 60915      C*                  READ      AML_CRDNO                              80                         
289.00 60915      C*                  DOW       *IN80='0'                                                         
290.00 60915      C*                  CALL      'GETCCMBR'                                                        
291.00 60915      C*                  PARM                    CRDACCNO                                            
292.00 60915      C*                  PARM                    CRDNO                                               
293.00 60915      C*                  PARM                    CRDCIF                                              
294.00 60915      C*                  PARM                    CRDNAME                                             
295.00 60915      C*                  PARM                    CRDPRISEC                                           
296.00 60915      C*                  PARM                    CRDCBAMT                                            
297.00 60915      C*                  PARM                    YYYYMM                                              
298.00 60915      C*                  READ      AML_CRDNO                              80                         
299.00 60915      C*                  ENDDO                                                                       
300.00 60915      C*                  CLOSE     AML_CRDNO                                                         
301.00 61027      C                                                                                               
302.00 70105 C7004C*EXEC SQL                                                                                      
303.00 70105 C7004C* INSERT INTO AML_CRDTX                                                                        
304.00 70105 C7004C* (CTXACCNO, CTXNO, CTXCIF, CTXNAME,                                                           
305.00 70105 C7004C* CTXPRISEC, CTXCRDR, CTXTXNDT,CTXPOSDT, CTXCCY,CTXSTLCCY,                                     
306.00 70105 C7004C* CTXTXNAMT, CTXDS,CTXDS1,CTXCBAMT)                                                            
307.00 70105 C7004C* SELECT                                                                                       
308.00 70105 C7004C* CDN.CRDACCNO, CDN.CRDNO,CDN.CRDCIF,CDN.CRDNAME,                                              
309.00 70105 C7004C* CDN.CRDPRISEC,C0P.HSDBCR, C0P.HSTRDT,HSPRDT, C0P.HSTRCC ,C0P.HSISCC,                         
310.00 70105 C7004C* C0P.HSISSA/100, C0P.HSPDS1,C0P.HSCADS,CDN.CRDCBAMT                                           
311.00 70105 C7004C* FROM CTRNHS0P_P C0P,AML_CRDNO CDN WHERE                                                      
312.00 70105 C7004C* HSACCT=CDN.CRDACCNO AND HSCARD=CDN.CRDNO AND                                                 
313.00 70105 C7004C* SUBSTR(DIGITS(C0P.HSPRDT),2,4)=:YYMM                                                         
314.00 70105 C7004C*END-EXEC                                                                                      
315.00 60606      C                                                                                               
316.00 60516      C                   ENDSR                                                                       
317.00 60518      C                                                                                               
318.00 60518      C*----------------------------------------------------------------------------------------------
319.00 60518      C* CAL TOTAL AMOUNT IN TMP PF                                                                   
320.00 60518      C*----------------------------------------------------------------------------------------------
321.00 60518      C     CALTMPTLAMT   BEGSR                                                                       
322.00 60518      C                                                                                               
323.00 60606      C*--Calculate Cr/Db transaction total amount                                                    
324.00 60606      C*------------------------------------------                                                    
325.00 60606      C/EXEC SQL                                                                                      
326.00 60606      C+ INSERT INTO AMLDDOCRCD                                                                       
327.00 60606      C+ SELECT CTXCIF,CTXCRDR  ,SUM(CTXMAMT)                                                         
328.00 60606      C+ FROM CRDTX1                                                                                  
329.00 60606      C+ GROUP BY CTXCIF,CTXCRDR                                                                      
330.00 60606      C/END-EXEC                                                                                      
331.00 60606      C                                                                                               
332.00 60606      C/EXEC SQL                                                                                      
333.00 60606      C+ INSERT INTO AMLDDOCRCD                                                                       
334.00 60606      C+ SELECT CTXCIF,CTXCRDR  ,SUM(CTXMAMT)                                                         
335.00 60607      C+ FROM CRDTX2                                                                                  
336.00 60606      C+ GROUP BY CTXCIF,CTXCRDR                                                                      
337.00 60606      C/END-EXEC                                                                                      
338.00 60606      C                                                                                               
339.00 60606      C                                                                                               
340.00 60606      C*--Calculate Cr and Db transaction total amount                                                
341.00 60606      C*------------------------------------------                                                    
342.00 60606      C/EXEC SQL                                                                                      
343.00 60606      C+ INSERT INTO AMLDDNCRCD                                                                       
344.00 60606      C+ SELECT CTXCIF, SUM(CTXMAMT) ,COUNT(CTXCIF)                                                   
345.00 60606      C+ FROM CRDTX1                                                                                  
346.00 60606      C+ GROUP BY CTXCIF                                                                              
347.00 60606      C/END-EXEC                                                                                      
348.00 60606      C                                                                                               
349.00 60606      C/EXEC SQL                                                                                      
350.00 60606      C+ INSERT INTO AMLDDNCRCD                                                                       
351.00 60606      C+ SELECT CTXCIF, SUM(CTXMAMT)  ,COUNT(CTXCIF)                                                  
352.00 60607      C+ FROM CRDTX2                                                                                  
353.00 60606      C+ GROUP BY CTXCIF                                                                              
354.00 60606      C/END-EXEC                                                                                      
355.00 60606      C                                                                                               
356.00 60518      C                                                                                               
357.00 60518      C                   ENDSR                                                                       
358.00 60518      C                                                                                               
359.00 60524      C     GETFLDTE      BEGSR                                                                       
360.00 60524      C                   READ      TAP00101B                              10                         
361.00 60524      C                   DOW       *IN10='0'                                                         
362.00 60524      C                   IF        DSBK=1                                                            
363.00 60606      C                   CALL      'DFJJTOYY'                                                        
364.00 60606      C                   PARM                    DSFDM                                               
365.00 60606      C                   PARM                    FDTE                                                
366.00 60606      C                                                                                               
367.00 60606      C                   CALL      'DFJJTOYY'                                                        
368.00 60606      C                   PARM                    DSLDM                                               
369.00 60606      C                   PARM                    LDTE                                                
370.00 60606      C                                                                                               
371.00 60605      C                   CALL      'DFJJTOYY'                                                        
372.00 60605      C                   PARM                    DSDT                                                
373.00 60605      C                   PARM                    TODTE             8 0                               
374.00 60605      C                                                                                               
375.00 60605      C                                                                                               
376.00 60530      C                   ENDIF                                                                       
377.00 60524      C                   READ      TAP00101B                              10                         
378.00 60524      C                   ENDDO                                                                       
379.00 60524      C                                                                                               
380.00 60524      C                   ENDSR                                                                       
381.00 60518      C                                                                                               
382.00 60518      C     GWKTXN        BEGSR                                                                       
383.00 60519      C                                                                                               
384.00 60606      C*EXEC SQL                                                                                      
385.00 60606      C* INSERT INTO CRDTXWRK1                                                                        
386.00 60606      C* SELECT *                                                                                     
387.00 60606      C* FROM TXNWCD1                                                                                 
388.00 60606      C*END-EXEC                                                                                      
389.00 60519      C                                                                                               
390.00 60606      C*EXEC SQL                                                                                      
391.00 60606      C* INSERT INTO CRDTXWRK2                                                                        
392.00 60606      C* SELECT *                                                                                     
393.00 60606      C* FROM TXNWCD2                                                                                 
394.00 60606      C*END-EXEC                                                                                      
395.00 60518      C                   ENDSR                                                                       
396.00 60518      C                                                                                               
397.00 60518      C*----------------------------------------------------------------------------------------------
398.00 60518      C* CALCULATE CREDIT OR DEBIT AND TOTAL CR+DB DAILY TXN AMOUNT                                   
399.00 60518      C*----------------------------------------------------------------------------------------------
400.00 60518      C     CALTLAMT      BEGSR                                                                       
401.00 60606      C***GET CREDIT OR DEBIT TOTAL WEEKLY TXN AMOUNT                                                 
402.00 60606      C                   EVAL      KTCIF =CTXCIF                                                     
403.00 70214      C                   EVAL      KTINOUT='2'                                                       
404.00 60606      C     KTD           CHAIN     AMLDDOCRCD                         55                             
405.00 60606      C                   IF        *IN55='0'                                                         
406.00 60606      C                   EVAL      CTXMCRAMT=DOCTMTXAMT                                              
407.00 60606      C                   ENDIF                                                                       
408.00 60606      C                                                                                               
409.00 70214      C                   EVAL      KTINOUT='1'                                                       
410.00 60606      C     KTD           CHAIN     AMLDDOCRCD                         55                             
411.00 60606      C                   IF        *IN55='0'                                                         
412.00 60606      C                   EVAL      CTXMDRAMT=DOCTMTXAMT                                              
413.00 60606      C                   ENDIF                                                                       
414.00 60606      C                                                                                               
415.00 60606      C*** GET IN + OUT TOTAL TXN AMOUNT                                                              
416.00 60606      C     CTXCIF        CHAIN     AMLDDNCRCD                         45                             
417.00 60606      C                   IF        *IN45='0'                                                         
418.00 60606      C                   EVAL      CTXMTTLAMT =DNCTMTXAMT                                            
419.00 60606      C                   EVAL      CTXNOTXN   =DNCTNOTXN                                             
420.00 60606      C                   ENDIF                                                                       
421.00 60519      C                                                                                               
422.00 60518      C                   ENDSR                                                                       
423.00 60516      C*----------------------------------------------------------------------------------------------
424.00 60516      C* Generate Report                                                                              
425.00 60516      C*----------------------------------------------------------------------------------------------
426.00 60516      C     GENRPT        BEGSR                                                                       
427.00 60523      C                                                                                               
428.00 60523      C                   Z-ADD     39            LTLN              2 0                               
429.00 60523      C                                                                                               
430.00 60523      C                   IF        RNO='R'                                                           
431.00 60516      C*READ RETAIL CUSTOMER                                                                          
432.00 60516      C                   MOVE      *BLANK        OFFI              3                                 
433.00 60530      C                   Z-ADD     0             BRCH              3 0                               
434.00 60516      C                   MOVE      *BLANK        TMPCIF           10                                 
435.00 60516      C                   Z-ADD     1             LINE              2 0                               
436.00 60517      C                   SETOFF                                       89                             
437.00 60606      C                   OPEN      CRDTX1                                                            
438.00 60606      C                   READ      CRDTX1                                 80                         
439.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
440.00 60517      C                   IF        *IN80='1'                                                         
441.00 60517      C                   SETON                                        89                             
442.00 60517      C                   ENDIF                                                                       
443.00 60516      C                   DOW       *IN80='0'                                                         
444.00 60516      C                   SELECT                                                                      
445.00 60530      C                   WHEN      BRCH=0 AND OFFI=*BLANK                                            
446.00 60516      C***FIRST PAGE                                                                                  
447.00 60606      C                   WRITE     HEADERCTX                                                         
448.00 60517      C                   EXSR      DTLLINE                                                           
449.00 60516      C                   WRITE     DTL1                                                              
450.00 60606      C                   WRITE     DTLCTX                                                            
451.00 60519      C                   ADD       4             LINE                                                
452.00 60516      C                                                                                               
453.00 60606      C                   WHEN      BRCH<>CTXBRCH OR OFFI<>CTXOFF OR LINE>LTLN                        
454.00 60516      C***BREAK PAGE                                                                                  
455.00 60606      C                   IF        TMPCIF<>CTXCIF                                                    
456.00 60517      C***NOT SAME CIF                                                                                
457.00 70214      C                   WRITE     DTLCTX1                                                           
458.00 60517      C                   WRITE     RECLINE                                                           
459.00 60519      C                   ADD       3             LINE                                                
460.00 60519      C                   ENDIF                                                                       
461.00 60519      C                                                                                               
462.00 60519      C                   SETON                                        98                             
463.00 60606      C                   WRITE     HEADERCTX                                                         
464.00 60519      C                   SETOFF                                       98                             
465.00 60519      C                   Z-ADD     1             LINE                                                
466.00 60519      C                                                                                               
467.00 60517      C                   EXSR      DTLLINE                                                           
468.00 60517      C                   WRITE     DTL1                                                              
469.00 60606      C                   WRITE     DTLCTX                                                            
470.00 60519      C                   ADD       4             LINE                                                
471.00 60518      C                   WHEN      LINE<=LTLN                                                        
472.00 60516      C***WRITE CURRENT PAGE                                                                          
473.00 60606      C                   IF        TMPCIF<>CTXCIF                                                    
474.00 60606      C                   WRITE     DTLCTX1                                                           
475.00 60517      C                   WRITE     RECLINE                                                           
476.00 60519      C                   ADD       3             LINE                                                
477.00 60519      C                   EXSR      DTLLINE                                                           
478.00 60519      C                   WRITE     DTL1                                                              
479.00 60606      C                   WRITE     DTLCTX                                                            
480.00 60519      C                   ADD       4             LINE                                                
481.00 60519      C                   ELSE                                                                        
482.00 60517      C                   EXSR      DTLLINE                                                           
483.00 60606      C                   WRITE     DTLCTX                                                            
484.00 60519      C                   ADD       1             LINE                                                
485.00 60519      C                   ENDIF                                                                       
486.00 60517      C                   ENDSL                                                                       
487.00 60606      C                   EVAL      BRCH   = CTXBRCH                                                  
488.00 60606      C                   EVAL      OFFI     = CTXOFF                                                 
489.00 60606      C                   EVAL      TMPCIF   = CTXCIF                                                 
490.00 60607      C                   EVAL      AWTLCRAMT= CTXMCRAMT                                              
491.00 60607      C                   EVAL      AWTLDRAMT= CTXMDRAMT                                              
492.00 60606      C                   EVAL      AWTLCBAMT= CTXCBAMT                                               
493.00 60606      C                   READ      CRDTX1                                 80                         
494.00 60516      C                   ENDDO                                                                       
495.00 60606      C                   CLOSE     CRDTX1                                                            
496.00 60613      C  N89              WRITE     DTLCTX1                                                           
497.00 60517      C                                                                                               
498.00 60523      C                   ENDIF                                                  *END RETAIL RPT      
499.00 60523      C                                                                                               
500.00 60523      C                                                                                               
501.00 60523      C                   IF        RNO='O'                                                           
502.00 60517      C*READ CORP AND PRI CUSTOMER                                                                    
503.00 60530      C                   MOVE      *BLANK        MARK              4                                 
504.00 60517      C                   MOVE      *BLANK        OFFI              3                                 
505.00 60517      C                   MOVE      *BLANK        TMPCIF           10                                 
506.00 60517      C                   Z-ADD     1             LINE              2 0                               
507.00 60517      C                   Z-ADD     0             PRETLAMT         13 2                               
508.00 60523      C                   SETOFF                                       89                             
509.00 60606      C                   OPEN      CRDTX2                                                            
510.00 60606      C                   READ      CRDTX2                                 70                         
511.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
512.00 60523      C                   IF        *IN70<>'0'                                                        
513.00 60523      C                   SETON                                        89                             
514.00 60517      C                   ENDIF                                                                       
515.00 60517      C                                                                                               
516.00 60517      C                   DOW       *IN70='0'                                                         
517.00 60517      C                   SELECT                                                                      
518.00 60530      C                   WHEN      MARK=*BLANK AND OFFI=*BLANK                                       
519.00 60517      C***FIRST PAGE                                                                                  
520.00 60606      C                   WRITE     HEADERCTX                                                         
521.00 60517      C                   EXSR      DTLLINE                                                           
522.00 60517      C                   WRITE     DTL1                                                              
523.00 60606      C                   WRITE     DTLCTX                                                            
524.00 60519      C                   ADD       4             LINE                                                
525.00 60517      C                                                                                               
526.00 60606      C                   WHEN      MARK<>CTXMARK OR OFFI<>CTXOFF OR LINE>LTLN                        
527.00 60517      C***BREAK PAGE                                                                                  
528.00 60606      C                   IF        TMPCIF<>CTXCIF                                                    
529.00 60517      C***NOT SAME CIF                                                                                
530.00 60606      C                   WRITE     DTLCTX1                                                           
531.00 60517      C                   WRITE     RECLINE                                                           
532.00 60519      C                   ENDIF                                                                       
533.00 60519      C                                                                                               
534.00 60519      C                   Z-ADD     1             LINE                                                
535.00 60517      C                   SETON                                        98                             
536.00 60606      C                   WRITE     HEADERCTX                                                         
537.00 60517      C                   SETOFF                                       98                             
538.00 60517      C                   EXSR      DTLLINE                                                           
539.00 60517      C                   WRITE     DTL1                                                              
540.00 60606      C                   WRITE     DTLCTX                                                            
541.00 60519      C                   ADD       4             LINE                                                
542.00 60518      C                   WHEN      LINE<=LTLN                                                        
543.00 60517      C***WRITE CURRENT PAGE                                                                          
544.00 60606      C                   IF        TMPCIF<>CTXCIF                                                    
545.00 60606      C                   WRITE     DTLCTX1                                                           
546.00 60517      C                   WRITE     RECLINE                                                           
547.00 60519      C                   ADD       3             LINE                                                
548.00 60517      C                   EXSR      DTLLINE                                                           
549.00 60517      C                   WRITE     DTL1                                                              
550.00 60606      C                   WRITE     DTLCTX                                                            
551.00 60519      C                   ADD       4             LINE                                                
552.00 60517      C                   ELSE                                                                        
553.00 60517      C                   EXSR      DTLLINE                                                           
554.00 60606      C                   WRITE     DTLCTX                                                            
555.00 60519      C                   ADD       1             LINE                                                
556.00 60517      C                   ENDIF                                                                       
557.00 60517      C                   ENDSL                                                                       
558.00 60606      C                   EVAL      MARK  = CTXMARK                                                   
559.00 60606      C                   EVAL      OFFI     = CTXOFF                                                 
560.00 60606      C                   EVAL      TMPCIF   = CTXCIF                                                 
561.00 60607      C                   EVAL      AWTLCRAMT= CTXMCRAMT                                              
562.00 60607      C                   EVAL      AWTLDRAMT= CTXMDRAMT                                              
563.00 60606      C                   EVAL      AWTLCBAMT= CTXCBAMT                                               
564.00 60606      C                   READ      CRDTX2                                 70                         
565.00 60517      C                   ENDDO                                                                       
566.00 60606      C                   CLOSE     CRDTX2                                                            
567.00 60606      C  N89              WRITE     DTLCTX1                                                           
568.00 60523      C                   ENDIF                                                  *EXCLUDE RETAIL RPT  
569.00 60606      C   89              WRITE     HEADERCTX                                                         
570.00 60519      C   89              WRITE     RNOREC                                                            
571.00 60517      C  N89              WRITE     ENDREC                                                            
572.00 60516      C                   ENDSR                                                                       
573.00 60516      C                                                                                               
574.00 60517      C                                                                                               
575.00 60517      C     DTLLINE       BEGSR                                                                       
576.00 60517      C                                                                                               
577.00 60606      C                   EVAL      AWCIF  = CTXCIF                                                   
578.00 60606      C                   MOVEL     CTXMARK       AWMARK                                              
579.00 60606      C                   EVAL      AWBRNO = CTXBRCH                                                  
580.00 60606      C                   EVAL      AWOFF  = CTXOFF                                                   
581.00 60606      C                   EVAL      AWNAME = CTXNAME                                                  
582.00 111024 D1315C                   EVAL      AWSCCCD = ' '                                                     
583.00 120914 D2216C                   EVAL      AWSCCCD2 = ' '                                                    
584.00 111024   |  C                   EVAL      K03CIF = CTXCIF                                                   
585.00 111024   |  C     KC03          CHAIN     CUP003                                                            
586.00 111024   |  C                   IF        %FOUND(CUP003)                                                    
587.00 120914 D1315C                   EVAL      AWSCCCD = CURSPF                                                  
588.00 120914 D2216C                   EVAL      AWSCCCD2 = CUBHVF                                                 
589.00 111024 D1315C                   ENDIF                                                                       
590.00 60606      C                                                                                               
591.00 60606      C                   EVAL      AWCCNO = CTXNO                                                    
592.00 60606      C                                                                                               
593.00 60606      C                   Z-ADD     CTXTXNDT      AWDATE                                              
594.00 60612      C                   Z-ADD     CTXPOSDT      AWPDATE                                             
595.00 60606      C                   EVAL      AWPRISEC = CTXPRISEC                                              
596.00 70214 c7004c     ctxccy        ifeq      '801'                                                             
597.00 120817 D2230C     CTXCCY        OREQ      '805'                                                             
598.00 70214 c7004c                   movel(p)  '000'         CTXCCY                                              
599.00 70214 c7004c                   endif                                                                       
600.00 70214 c7004c     ctxccy        ifeq      '802'                                                             
601.00 70214 c7004c                   movel(p)  '344'         CTXCCY                                              
602.00 70214 c7004c                   endif                                                                       
603.00 120817 D2230c     ctxccy        ifeq      '806'                                                             
604.00 120817 D2230c                   movel(p)  '156'         CTXCCY                                              
605.00 120817 D2230c                   endif                                                                       
606.00 60606      C                   MOVE      CTXCCY        AWCCY                                               
607.00 60607      C                   Z-ADD     CTXMAMT       AWAMT                                               
608.00 60607      C                                                                                               
609.00 60607      C                   IF        CTXDS='POS Purchase'                                              
610.00 60607      C                   EVAL      AWNAR=CTXDS1                                                      
611.00 60607      C                   ELSE                                                                        
612.00 60606      C                   EVAL      AWNAR  = CTXDS                                                    
613.00 60607      C                   ENDIF                                                                       
614.00 70214 c7004C                   IF        CTXCRDR='1'                                                       
615.00 60606      C                   EVAL      AWCRDR='CR'                                                       
616.00 60606      C                   ELSE                                                                        
617.00 60606      C                   EVAL      AWCRDR='DR'                                                       
618.00 60606      C                   ENDIF                                                                       
619.00 60530      C                   ENDSR                                                                       
620.00 60530      C                                                                                               
621.00 60530      C                                                                                               
622.00 60530      C                                                                                               
