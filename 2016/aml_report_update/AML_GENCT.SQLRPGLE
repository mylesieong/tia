1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                                       
2.00 60608      H********************************************************************************************** 
3.00 60608      H* Program      : AML_GENCT                                                                     
4.00 60608      H* Reference    : CHG-166-06                                                                    
5.00 60608      H* Created By   : Aries Lung (B454PGM)                                                          
6.00 60608      H* Changed Date : 08 Jun 2006                                                                   
7.00 60608      H* Description  : Generate CASH TRANSACTION for AML report (2)                                  
8.00 60608      H********************************************************************************************** 
9.00 80422      H* Reference    : CHG-104-08 (C8104)                                                            
10.00 80422      H* Changed By   : Anthony (B422PGM)                                                             
11.00 80422      H* Changed Date : 22 Apr 2008                                                                   
12.00 80422      H* Description  : Found that CNY daily txn amount was wrongly updated with previous retrieved   
13.00 80422      H*                value of other CIF due to checking logic on wrong indicator 45 instead of 35  
14.00 80422      H********************************************************************************************** 
15.00 111019      H* Reference    : CHG-315-11 (D1315)                                                            
16.00 111019      H* Created By   : Karl (BA55PGM)                                                                
17.00 111019      H* Changed Date : 19 Oct 2011                                                                   
18.00 111019      H* Description  : Add SCC code in report                                                        
19.00 111019      H********************************************************************************************** 
20.00 120914      H* Reference    : CHG-216-12 (D2216)                                                            
21.00 120914      H* Created By   : Joanna(BE95PGM)                                                               
22.00 120914      H* Changed Date : 14 SEP 2012                                                                   
23.00 120914      H* Description  : Add new field Scc code2                                                       
24.00 120914      H*                                                                                              
25.00 120914      H********************************************************************************************** 
26.00 160825      H* Reference    : CHG-262-16 (D6262)                                                            
27.00 160825      H* Created By   : Myles Ieong (BI77PGM)                                                         
28.00 160825      H* Changed Date : 04 Aug 2016                                                                   
29.00 160825      H* Description  : AML report parameter changing and revoking                                    
30.00 161118      H*                  - Amend min aggregate amount & remove RMB amount                            
31.00 160825      H********************************************************************************************** 
32.00 170606      H* Reference    : CHG-196-17 (D7196)                                                            
33.00 170420      H* Created By   : Albert Au   (BG09PGM)                                                         
34.00 170420      H* Changed Date : 10 Apr 2017                                                                   
35.00 170420      H* Description  : Remove the transaction for CIF's with officer code as 'PER'                   
36.00 170420      H*                                                                                              
37.00 170420      H********************************************************************************************** 
38.00 60602      FTXNCT1    UF A E           K DISK    USROPN                                                    
39.00 60602      FTXNCT2    UF A E           K DISK    USROPN                                                    
40.00 160825 D6262FTXNCT1S   UF A E           K DISK    USROPN                                                    
41.00 160825 D6262FTXNCT2S   UF A E           K DISK    USROPN                                                    
42.00 60527      FCUP003    IF   E           K DISK                                                              
43.00 60527      FTAP00101B IF   E             DISK                                                              
44.00 60529      FAMLDDNCRCDUF A E           K DISK                                                              
45.00 60529      FAMLDDOCRCDUF A E           K DISK                                                              
46.00 60603      FAMLDTLCNY UF A E           K DISK                                                              
47.00 60602      FTXNCTWRK1 IF   E           K DISK                                                              
48.00 60602      FTXNCTWRK2 IF   E           K DISK                                                              
49.00 60615      FAMLCTXN   UF   E           K DISK    USROPN                                                    
50.00 60630      FCUP009L6  IF   E           K DISK                                                              
51.00 60529      FICBSRATE  IF   E             DISK    USROPN                                                    
52.00 60529      FAMLDLYRPT O    E             PRINTER OFLIND(*IN98)                                             
53.00 170606 D7196F                                     USROPN                                                    
54.00 60516      D                                                                                               
55.00 60602      D                 DS                                                                            
56.00 60602      DREFNO                    1     18                                                              
57.00 60602      D BRN                     1      3                                                              
58.00 60602      D AA                      4      4                                                              
59.00 60602      D TIL                     5      8                                                              
60.00 60602      D BB                      9      9                                                              
61.00 60602      D SNN                    10     12                                                              
62.00 60602      D CC                     13     13                                                              
63.00 60602      D TSN                    14     18                                                              
64.00 60602      D                                                                                               
65.00 60602      D                                                                                               
66.00 60516      C*----------------------------------------------------------------------------------------------
67.00 60516      C* Initial Variable                                                                             
68.00 60516      C*----------------------------------------------------------------------------------------------
69.00 60602      C                                                                                               
70.00 60602      C                                                                                               
71.00 60602      C                                                                                               
72.00 60602      C                                                                                               
73.00 60517      C                                                                                               
74.00 60519      C*----------------------------------------------------------------------------------------------
75.00 60519      C* PARM LIST                                                                                    
76.00 60519      C*----------------------------------------------------------------------------------------------
77.00 60517      C     *ENTRY        PLIST                                                                       
78.00 60523      C                   PARM                    RNO               1                                 
79.00 170606 D7196C                   PARM                    PRPT              1                                 
80.00 60517      C                                                                                               
81.00 60519      C*----------------------------------------------------------------------------------------------
82.00 60519      C* KEY LIST                                                                                     
83.00 60519      C*----------------------------------------------------------------------------------------------
84.00 60529      C     KRCD          KLIST                                                                       
85.00 60519      C                   KFLD                    KTCIF            10                                 
86.00 60529      C                   KFLD                    KTINOUT           3                                 
87.00 60516      C                                                                                               
88.00 60527      C     KC03          KLIST                                                                       
89.00 60527      C                   KFLD                    K03BNO            3 0                               
90.00 60630      C                   KFLD                    K03CIF           10                                 
91.00 60630      C                   Z-ADD     001           K03BNO                                              
92.00 60630      C*                                                                                              
93.00 60630      C     KC09          KLIST                                                                       
94.00 60630      C                   KFLD                    K03BNO                                              
95.00 60630      C                   KFLD                    K09REC            1                                 
96.00 60630      C                   KFLD                    K09CIF           10                                 
97.00 60630      C                   KFLD                    K09APP            2 0                               
98.00 60630      C                   KFLD                    K09ACC           12 0                               
99.00 60630      C                                                                                               
100.00 60630      C                   MOVE      '1'           K09REC                                              
101.00 60630      C                   Z-ADD     20            K09APP                                              
102.00 60630      C                                                                                               
103.00 60630      C                                                                                               
104.00 60615      C                                                                                               
105.00 60615      C                                                                                               
106.00 60516      C*----------------------------------------------------------------------------------------------
107.00 60527      C* Main Program                                                                                 
108.00 60516      C*----------------------------------------------------------------------------------------------
109.00 60527      C                   EXSR      GETFLDTE                                                          
110.00 170606 D7196C                   IF        PRPT = 'C'                                                        
111.00 60527      C                   IF        RNO='R'                                                           
112.00 60529      C***EXTRACT DATA FROM AML003                                                                    
113.00 60529      C                   EXSR      CLSQL                                                             
114.00 60529      C***GET BRANCH NO AND MOP AMOUNT                                                                
115.00 60602      C                   OPEN      TXNCT1                                                            
116.00 60602      C                   READ      TXNCT1                                 50                         
117.00 60529      C                   DOW       *IN50='0'                                                         
118.00 60527      C                   EXSR      GETFLD                                                            
119.00 60602      C                   UPDATE    RCT1                                                              
120.00 60602      C                   READ      TXNCT1                                 50                         
121.00 60529      C                   ENDDO                                                                       
122.00 60602      C                   CLOSE     TXNCT1                                                            
123.00 60529      C                                                                                               
124.00 160825 D6262C                   OPEN      TXNCT1S                                                           
125.00 160825 D6262C                   READ      TXNCT1S                                50                         
126.00 160825 D6262C                   DOW       *IN50='0'                                                         
127.00 160825 D6262C                   EXSR      GETFLD                                                            
128.00 161014 D6262C                   UPDATE    RCT1S                                                             
129.00 160825 D6262C                   READ      TXNCT1S                                50                         
130.00 160825 D6262C                   ENDDO                                                                       
131.00 160825 D6262C                   CLOSE     TXNCT1S                                                           
132.00 160825      C                                                                                               
133.00 60602      C                   OPEN      TXNCT2                                                            
134.00 60602      C                   READ      TXNCT2                                 40                         
135.00 60529      C                   DOW       *IN40='0'                                                         
136.00 60529      C                   EXSR      GETFLD                                                            
137.00 60602      C                   UPDATE    RCT2                                                              
138.00 60602      C                   READ      TXNCT2                                 40                         
139.00 60529      C                   ENDDO                                                                       
140.00 60602      C                   CLOSE     TXNCT2                                                            
141.00 60527      C                                                                                               
142.00 160825 D6262C                   OPEN      TXNCT2S                                                           
143.00 160825 D6262C                   READ      TXNCT2S                                40                         
144.00 160825 D6262C                   DOW       *IN40='0'                                                         
145.00 160825 D6262C                   EXSR      GETFLD                                                            
146.00 161014 D6262C                   UPDATE    RCT2S                                                             
147.00 160825 D6262C                   READ      TXNCT2S                                40                         
148.00 160825 D6262C                   ENDDO                                                                       
149.00 160825 D6262C                   CLOSE     TXNCT2S                                                           
150.00 160825      C                                                                                               
151.00 60529      C                   EXSR      CALTMPTLAMT                                                       
152.00 60602      C                   OPEN      TXNCT1                                                            
153.00 60602      C                   READ      TXNCT1                                 50                         
154.00 60529      C                   DOW       *IN50='0'                                                         
155.00 60529      C                   EXSR      CALTLAMT                                                          
156.00 60602      C                   UPDATE    RCT1                                                              
157.00 60602      C                   READ      TXNCT1                                 50                         
158.00 60529      C                   ENDDO                                                                       
159.00 60602      C                   CLOSE     TXNCT1                                                            
160.00 160825      C                                                                                               
161.00 160825 D6262C                   OPEN      TXNCT1S                                                           
162.00 160825 D6262C                   READ      TXNCT1S                                50                         
163.00 160825 D6262C                   DOW       *IN50='0'                                                         
164.00 160825 D6262C                   EXSR      CALTLAMT                                                          
165.00 161014 D6262C                   UPDATE    RCT1S                                                             
166.00 160825 D6262C                   READ      TXNCT1S                                50                         
167.00 160825 D6262C                   ENDDO                                                                       
168.00 160825 D6262C                   CLOSE     TXNCT1S                                                           
169.00 60529      C                                                                                               
170.00 60602      C                   OPEN      TXNCT2                                                            
171.00 60602      C                   READ      TXNCT2                                 40                         
172.00 60529      C                   DOW       *IN40='0'                                                         
173.00 60529      C                   EXSR      CALTLAMT                                                          
174.00 60602      C                   UPDATE    RCT2                                                              
175.00 60602      C                   READ      TXNCT2                                 40                         
176.00 60529      C                   ENDDO                                                                       
177.00 60602      C                   CLOSE     TXNCT2                                                            
178.00 60529      C                                                                                               
179.00 160825 D6262C                   OPEN      TXNCT2S                                                           
180.00 160825 D6262C                   READ      TXNCT2S                                40                         
181.00 160825 D6262C                   DOW       *IN40='0'                                                         
182.00 160825 D6262C                   EXSR      CALTLAMT                                                          
183.00 161014 D6262C                   UPDATE    RCT2S                                                             
184.00 160825 D6262C                   READ      TXNCT2S                                40                         
185.00 160825 D6262C                   ENDDO                                                                       
186.00 160825 D6262C                   CLOSE     TXNCT2S                                                           
187.00 160825      C                                                                                               
188.00 60519      C                                                                                               
189.00 60518      C                   EXSR      GWKTXN                                                            
190.00 60523      C                   ENDIF                                                                       
191.00 170606 D7196C                   ENDIF                                                                       
192.00 60519      C                                                                                               
193.00 170606 D7196C                   IF        PRPT = 'P'                                                        
194.00 170606 D7196C                   OPEN      AMLDLYRPT                                                         
195.00 60603      C                   EXSR      GENRPT                                                            
196.00 170606 D7196C                   CLOSE     AMLDLYRPT                                                         
197.00 170606 D7196C                   ENDIF                                                                       
198.00 60516      C                   SETON                                        LR                             
199.00 60527      C                                                                                               
200.00 60527      C*----------------------------------------------------------------------------------------------
201.00 60527      C* GET BRANCH NO AND CCY CODE                                                                   
202.00 60527      C*----------------------------------------------------------------------------------------------
203.00 60527      C     GETFLD        BEGSR                                                                       
204.00 60527      C                                                                                               
205.00 60529      C***GET BRANCH NO                                                                               
206.00 60602      C                   EVAL      K03CIF=CTCIF                                                      
207.00 60529      C     KC03          CHAIN     CUP003                             45                             
208.00 60529      C                   IF        *IN45='0'                                                         
209.00 60602      C                   EVAL      CTBRN=CUBRCH                                                      
210.00 60529      C                   ENDIF                                                                       
211.00 60602      C***GET CCY CODE AND CALCULATE MOP AMOUNT                                                       
212.00 60602      C                   CALL      'CCCYCHK'                                                         
213.00 60602      C                   PARM                    CTCCYN                                              
214.00 60602      C                   PARM                    CTCCY                                               
215.00 60602      C                   PARM                    RESULT            1                                 
216.00 60602      C                   IF        RESULT='0'                                                        
217.00 60602      C                   OPEN      ICBSRATE                                                          
218.00 60602      C                   READ      ICBSRATE                               55                         
219.00 60602      C                   DOW       *IN55='0'                                                         
220.00 60602      C                   IF        RCCY=CTCCY                                                        
221.00 60602      C                   EVAL      CTMAMT= CTTXNAMT*RCCRTE                                           
222.00 60602      C                   CLOSE     ICBSRATE                                                          
223.00 60602      C                   LEAVESR                                                                     
224.00 60602      C                   ENDIF                                                                       
225.00 60602      C                   READ      ICBSRATE                               55                         
226.00 60602      C                   ENDDO                                                                       
227.00 60602      C                   ENDIF                                                                       
228.00 60602      C                   CLOSE     ICBSRATE                                                          
229.00 60527      C                   ENDSR                                                                       
230.00 60527      C                                                                                               
231.00 60527      C                                                                                               
232.00 60516      C*----------------------------------------------------------------------------------------------
233.00 60516      C* SQL                                                                                          
234.00 60516      C*----------------------------------------------------------------------------------------------
235.00 60516      C     CLSQL         BEGSR                                                                       
236.00 60615      C                   OPEN      AMLCTXN                                                           
237.00 60615      C                   READ      AMLCTXN                                30                         
238.00 60615      C                   DOW       *IN30='0'                                                         
239.00 60620      C***SET CUSTOMER SIDE CR/DR IN MEX (MONEY EXCHANGE) TXN                                         
240.00 60620      C                   IF        A3TYPE='MEX'                                                      
241.00 60620      C                   IF        A3INOUT='IN'                                                      
242.00 60620      C                   EVAL      A3INOUT='OUT'                                                     
243.00 60620      C                   ELSE                                                                        
244.00 60620      C                   EVAL      A3INOUT='IN'                                                      
245.00 60620      C                   ENDIF                                                                       
246.00 60621      C                   ENDIF                                                                       
247.00 60620      C***GET ACCOUNT RELATIONSHIP                                                                    
248.00 60615      C                   IF        A3CIF<>' '                                                        
249.00 60615      C                   IF        A3ACTYPE='CU'                                                     
250.00 60615      C                   EVAL      K09ACC=60000000000+A3ACNO                                         
251.00 60615      C                   ELSE                                                                        
252.00 60615      C                   EVAL      K09ACC=10000000000+A3ACNO                                         
253.00 60615      C                   ENDIF                                                                       
254.00 60630      C                   EVAL      K09CIF=A3CIF                                                      
255.00 60630      C     KC09          CHAIN     CUP009L6                           25                             
256.00 60615      C                   IF        *IN25='0'                                                         
257.00 60615      C                   EVAL      A3REL1=CUXREL                                                     
258.00 60615      C                   ELSE                                                                        
259.00 60623      C                   EVAL      A3REL1=' '                                                        
260.00 60615      C                   ENDIF                                                                       
261.00 60620      C***GET TXN BRANCH NO                                                                           
262.00 60620      C                   IF        %SUBST(A3REFNO:4:1)='-'                                           
263.00 60620      C                             AND %SUBST(A3REFNO:9:1)='-'                                       
264.00 60620      C                             AND %SUBST(A3REFNO:13:1)='-'                                      
265.00 60620      C                                                                                               
266.00 60621      C                   EVAL      A3TXNBRN=%SUBST(A3REFNO:1:3)                                      
267.00 60620      C                   MOVE      *BLANK        TMP1              4                                 
268.00 60620      C                   EVAL      TMP1=%SUBST(A3REFNO:5:4)                                          
269.00 60621      C     A3TXNBRN      IFEQ      '001'                                                             
270.00 60620      C     TMP1          ANDEQ     '0099'                                                            
271.00 60621      C                   EVAL      A3TXNBRN='SYS'                                                    
272.00 60620      C                   ENDIF                                                                       
273.00 60620      C                   ELSE                                                                        
274.00 60621      C                   EVAL      A3TXNBRN='SYS'                                                    
275.00 60620      C                   ENDIF                                                                       
276.00 60620      C                                                                                               
277.00 60621      C                                                                                               
278.00 60621      C                                                                                               
279.00 60621      C                                                                                               
280.00 60621      C                                                                                               
281.00 60620      C                                                                                               
282.00 60615      C                   UPDATE    RAMLCTXN                                                          
283.00 60615      C                                                                                               
284.00 60615      C                   ENDIF                                                                       
285.00 60615      C                   READ      AMLCTXN                                30                         
286.00 60615      C                   ENDDO                                                                       
287.00 60615      C                   CLOSE     AMLCTXN                                                           
288.00 60615      C                                                                                               
289.00 60621      C***Exclude relationship records(set record flag)                                               
290.00 60621      C***UPDATE REPORT LAYOUT FLAG                                                                   
291.00 60615      C/EXEC SQL                                                                                      
292.00 60615      C+                                                                                              
293.00 60615      C+ UPDATE IPROD/AMLCTXN SET A3RFLAG = 'N'                                                       
294.00 60615      C+ WHERE A3REL1 IN (SELECT RREL FROM AML_RELTB WHERE RFLG='N')                                  
295.00 60615      C+                                                                                              
296.00 60615      C/END-EXEC                                                                                      
297.00 60621      C***Include relationship records(set record flag)                                               
298.00 60621      C***UPDATE REPORT LAYOUT FLAG                                                                   
299.00 60615      C/EXEC SQL                                                                                      
300.00 60615      C+                                                                                              
301.00 60615      C+ UPDATE IPROD/AMLCTXN SET A3RFLAG = 'Y'                                                       
302.00 60615      C+ WHERE A3REL1 IN (SELECT RREL FROM AML_RELTB WHERE RFLG='Y')                                  
303.00 60615      C+                                                                                              
304.00 60615      C/END-EXEC                                                                                      
305.00 60623      C***UNKNOW ACCOUNT RELATIONSHIP                                                                 
306.00 60623      C                                                                                               
307.00 60623      C                                                                                               
308.00 60623      C/EXEC SQL                                                                                      
309.00 60623      C+                                                                                              
310.00 60623      C+ UPDATE IPROD/AMLCTXN SET A3RFLAG = 'Y'                                                       
311.00 60623      C+ WHERE A3REL1=' '                                                                             
312.00 60623      C+                                                                                              
313.00 60623      C/END-EXEC                                                                                      
314.00 60623      C                                                                                               
315.00 60623      C                                                                                               
316.00 60621      C                                                                                               
317.00 60603      C*********EXTRACT RETAIL DAILY CASH TXN                                                         
318.00 60603      C                                                                                               
319.00 60605      C***IN TXN(CREDIT)                                                                              
320.00 60603      C                                                                                               
321.00 60603      C/EXEC SQL                                                                                      
322.00 60603      C+ INSERT INTO TXNCT1                                                                           
323.00 60605      C+ (CTMARK, CTOFF, CTCIF, CTNAME,CTACCNO, CTDATE,                                               
324.00 60621      C+ CTTYPE, CTINOUT, CTCCYN, CTTXNAMT, CTDSC,CTREL,CTOB,CTTXNBRN)                                
325.00 60605      C+ SELECT A3MARK,A3OFF,A3CIF,A3NAME,A3ACNO,A3DATE,A3TYPE ,                                      
326.00 60621      C+ 'IN', A3CCY ,A3AMT, A3DESC,A3REL1,A3CPRFD,A3TXNBRN                                           
327.00 60603      C+ FROM AMLCTXN                                                                                 
328.00 60605      C+ WHERE A3MARK ='RET' AND A3INOUT='IN'                                                         
329.00 60603      C+ AND A3CIF<>' ' AND A3MARK<>' ' AND A3OFF<> ' '                                               
330.00 60615      C+ AND A3RFLAG='Y'                                                                              
331.00 60603      C/END-EXEC                                                                                      
332.00 60603      C                                                                                               
333.00 160825 D6262C/EXEC SQL                                                                                      
334.00 160825 D6262C+ INSERT INTO TXNCT1S                                                                          
335.00 160825 D6262C+ (CTMARK, CTOFF, CTCIF, CTNAME,CTACCNO, CTDATE,                                               
336.00 160825 D6262C+ CTTYPE, CTINOUT, CTCCYN, CTTXNAMT, CTDSC,CTREL,CTOB,CTTXNBRN)                                
337.00 160825 D6262C+ SELECT A3MARK,A3OFF,A3CIF,A3NAME,A3ACNO,A3DATE,A3TYPE ,                                      
338.00 160825 D6262C+ 'IN', A3CCY ,A3AMT, A3DESC,A3REL1,A3CPRFD,A3TXNBRN                                           
339.00 160825 D6262C+ FROM AMLCTXN                                                                                 
340.00 160825 D6262C+ WHERE A3MARK ='RET' AND A3INOUT='IN'                                                         
341.00 160825 D6262C+ AND A3CIF<>' ' AND A3MARK<>' ' AND A3OFF<> ' '                                               
342.00 160825 D6262C+ AND A3RFLAG='Y' AND A3TYPE = 'MEX'                                                           
343.00 160825 D6262C/END-EXEC                                                                                      
344.00 160825      C                                                                                               
345.00 60605      C***OUT TXN(DEBIT)                                                                              
346.00 60603      C                                                                                               
347.00 60603      C/EXEC SQL                                                                                      
348.00 60603      C+ INSERT INTO TXNCT1                                                                           
349.00 60605      C+ (CTMARK, CTOFF, CTCIF, CTNAME,CTACCNO, CTDATE,                                               
350.00 60621      C+ CTTYPE, CTINOUT, CTCCYN, CTTXNAMT, CTDSC,CTREL,CTOB,CTTXNBRN)                                
351.00 60605      C+ SELECT A3MARK,A3OFF,A3CIF,A3NAME,A3ACNO,A3DATE,A3TYPE ,                                      
352.00 60621      C+ 'OUT', A3CCY ,A3AMT, A3DESC,A3REL1,A3CPRFD,A3TXNBRN                                          
353.00 60603      C+ FROM AMLCTXN                                                                                 
354.00 60605      C+ WHERE  A3MARK='RET' AND A3INOUT='OUT'                                                        
355.00 60603      C+ AND A3CIF<>' ' AND A3MARK<>' ' AND A3OFF<> ' '                                               
356.00 60615      C+ AND A3RFLAG='Y'                                                                              
357.00 60603      C/END-EXEC                                                                                      
358.00 60603      C                                                                                               
359.00 160825 D6262C/EXEC SQL                                                                                      
360.00 160825 D6262C+ INSERT INTO TXNCT1S                                                                          
361.00 160825 D6262C+ (CTMARK, CTOFF, CTCIF, CTNAME,CTACCNO, CTDATE,                                               
362.00 160825 D6262C+ CTTYPE, CTINOUT, CTCCYN, CTTXNAMT, CTDSC,CTREL,CTOB,CTTXNBRN)                                
363.00 160825 D6262C+ SELECT A3MARK,A3OFF,A3CIF,A3NAME,A3ACNO,A3DATE,A3TYPE ,                                      
364.00 160825 D6262C+ 'OUT', A3CCY ,A3AMT, A3DESC,A3REL1,A3CPRFD,A3TXNBRN                                          
365.00 160825 D6262C+ FROM AMLCTXN                                                                                 
366.00 160825 D6262C+ WHERE  A3MARK='RET' AND A3INOUT='OUT'                                                        
367.00 160825 D6262C+ AND A3CIF<>' ' AND A3MARK<>' ' AND A3OFF<> ' '                                               
368.00 160825 D6262C+ AND A3RFLAG='Y' AND A3TYPE = 'MEX'                                                           
369.00 160825 D6262C/END-EXEC                                                                                      
370.00 160825      C                                                                                               
371.00 60603      C                                                                                               
372.00 60603      C*********EXTRACT EXCLUDE RETAIL DAILY CASH TXN                                                 
373.00 60605      C***IN TXN (CREDIT)                                                                             
374.00 60603      C                                                                                               
375.00 60603      C/EXEC SQL                                                                                      
376.00 60603      C+                                                                                              
377.00 60603      C+ INSERT INTO TXNCT2                                                                           
378.00 60605      C+ (CTMARK, CTOFF, CTCIF, CTNAME,CTACCNO, CTDATE,                                               
379.00 60621      C+ CTTYPE, CTINOUT, CTCCYN, CTTXNAMT, CTDSC,CTREL,CTOB,CTTXNBRN)                                
380.00 60605      C+ SELECT A3MARK,A3OFF,A3CIF,A3NAME,A3ACNO,A3DATE,A3TYPE ,                                      
381.00 60621      C+ 'IN', A3CCY ,A3AMT, A3DESC,A3REL1,A3CPRFD,A3TXNBRN                                           
382.00 60603      C+ FROM AMLCTXN                                                                                 
383.00 60605      C+ WHERE A3MARK <>'RET' AND A3INOUT='IN'                                                        
384.00 60603      C+ AND A3CIF<>' ' AND A3MARK<>' ' AND A3OFF<> ' '                                               
385.00 60615      C+ AND A3RFLAG='Y'                                                                              
386.00 60603      C+                                                                                              
387.00 60603      C/END-EXEC                                                                                      
388.00 60603      C                                                                                               
389.00 160825 D6262C/EXEC SQL                                                                                      
390.00 160825 D6262C+                                                                                              
391.00 160825 D6262C+ INSERT INTO TXNCT2S                                                                          
392.00 160825 D6262C+ (CTMARK, CTOFF, CTCIF, CTNAME,CTACCNO, CTDATE,                                               
393.00 160825 D6262C+ CTTYPE, CTINOUT, CTCCYN, CTTXNAMT, CTDSC,CTREL,CTOB,CTTXNBRN)                                
394.00 160825 D6262C+ SELECT A3MARK,A3OFF,A3CIF,A3NAME,A3ACNO,A3DATE,A3TYPE ,                                      
395.00 160825 D6262C+ 'IN', A3CCY ,A3AMT, A3DESC,A3REL1,A3CPRFD,A3TXNBRN                                           
396.00 160825 D6262C+ FROM AMLCTXN                                                                                 
397.00 160825 D6262C+ WHERE A3MARK <>'RET' AND A3INOUT='IN'                                                        
398.00 160825 D6262C+ AND A3CIF<>' ' AND A3MARK<>' ' AND A3OFF<> ' '                                               
399.00 160825 D6262C+ AND A3RFLAG='Y' AND A3TYPE = 'MEX'                                                           
400.00 160825 D6262C+                                                                                              
401.00 160825 D6262C/END-EXEC                                                                                      
402.00 160825      C                                                                                               
403.00 60605      C***OUT TXN(DEBIT)                                                                              
404.00 60603      C                                                                                               
405.00 60603      C/EXEC SQL                                                                                      
406.00 60603      C+ INSERT INTO TXNCT2                                                                           
407.00 60605      C+ (CTMARK, CTOFF, CTCIF, CTNAME,CTACCNO, CTDATE,                                               
408.00 60621      C+ CTTYPE, CTINOUT, CTCCYN, CTTXNAMT, CTDSC,CTREL,CTOB,CTTXNBRN)                                
409.00 60605      C+ SELECT A3MARK,A3OFF,A3CIF,A3NAME,A3ACNO ,A3DATE,A3TYPE ,                                     
410.00 60621      C+ 'OUT', A3CCY ,A3AMT, A3DESC,A3REL1,A3CPRFD,A3TXNBRN                                          
411.00 60603      C+ FROM AMLCTXN                                                                                 
412.00 60605      C+ WHERE A3MARK<>'RET' AND A3INOUT='OUT'                                                        
413.00 60603      C+ AND A3CIF<>' ' AND A3MARK<>' ' AND A3OFF<> ' '                                               
414.00 60615      C+ AND A3RFLAG='Y'                                                                              
415.00 60603      C+                                                                                              
416.00 60603      C/END-EXEC                                                                                      
417.00 60603      C                                                                                               
418.00 160825 D6262C/EXEC SQL                                                                                      
419.00 160825 D6262C+ INSERT INTO TXNCT2S                                                                          
420.00 160825 D6262C+ (CTMARK, CTOFF, CTCIF, CTNAME,CTACCNO, CTDATE,                                               
421.00 160825 D6262C+ CTTYPE, CTINOUT, CTCCYN, CTTXNAMT, CTDSC,CTREL,CTOB,CTTXNBRN)                                
422.00 160825 D6262C+ SELECT A3MARK,A3OFF,A3CIF,A3NAME,A3ACNO ,A3DATE,A3TYPE ,                                     
423.00 160825 D6262C+ 'OUT', A3CCY ,A3AMT, A3DESC,A3REL1,A3CPRFD,A3TXNBRN                                          
424.00 160825 D6262C+ FROM AMLCTXN                                                                                 
425.00 160825 D6262C+ WHERE A3MARK<>'RET' AND A3INOUT='OUT'                                                        
426.00 160825 D6262C+ AND A3CIF<>' ' AND A3MARK<>' ' AND A3OFF<> ' '                                               
427.00 160825 D6262C+ AND A3RFLAG='Y' AND A3TYPE = 'MEX'                                                           
428.00 160825 D6262C+                                                                                              
429.00 160825 D6262C/END-EXEC                                                                                      
430.00 60602      C                                                                                               
431.00 60602      C                                                                                               
432.00 60516      C                                                                                               
433.00 60516      C                   ENDSR                                                                       
434.00 60518      C                                                                                               
435.00 60602      C                                                                                               
436.00 60602      C                                                                                               
437.00 60518      C*----------------------------------------------------------------------------------------------
438.00 60518      C* CAL TOTAL AMOUNT IN TMP PF                                                                   
439.00 60518      C*----------------------------------------------------------------------------------------------
440.00 60518      C     CALTMPTLAMT   BEGSR                                                                       
441.00 60518      C*--Calculate Cr/Db transaction total amount                                                    
442.00 60518      C*------------------------------------------                                                    
443.00 60518      C/EXEC SQL                                                                                      
444.00 60529      C+ INSERT INTO AMLDDOCRCD                                                                       
445.00 60602      C+ SELECT CTCIF,CTINOUT ,SUM(CTMAMT)                                                            
446.00 160825 D6262C*+ FROM TXNCT1                                                                                 
447.00 160825 D6262C+ FROM TXNCT1S                                                                                 
448.00 60602      C+ GROUP BY CTCIF,CTINOUT                                                                       
449.00 60518      C/END-EXEC                                                                                      
450.00 60518      C                                                                                               
451.00 60518      C/EXEC SQL                                                                                      
452.00 60529      C+ INSERT INTO AMLDDOCRCD                                                                       
453.00 60602      C+ SELECT CTCIF,CTINOUT ,SUM(CTMAMT)                                                            
454.00 160825 D6262C*+ FROM TXNCT2                                                                                 
455.00 160825 D6262C+ FROM TXNCT2S                                                                                 
456.00 60602      C+ GROUP BY CTCIF,CTINOUT                                                                       
457.00 60518      C/END-EXEC                                                                                      
458.00 60518      C                                                                                               
459.00 60518      C                                                                                               
460.00 60518      C*--Calculate Cr and Db transaction total amount                                                
461.00 60518      C*------------------------------------------                                                    
462.00 60518      C/EXEC SQL                                                                                      
463.00 60529      C+ INSERT INTO AMLDDNCRCD                                                                       
464.00 60602      C+ SELECT CTCIF, SUM(CTMAMT) ,COUNT(CTCIF)                                                      
465.00 160825 D6262C*+ FROM TXNCT1                                                                                 
466.00 160825 D6262C+ FROM TXNCT1S                                                                                 
467.00 60602      C+ GROUP BY CTCIF                                                                               
468.00 60518      C/END-EXEC                                                                                      
469.00 60518      C                                                                                               
470.00 60518      C/EXEC SQL                                                                                      
471.00 60529      C+ INSERT INTO AMLDDNCRCD                                                                       
472.00 60602      C+ SELECT CTCIF, SUM(CTMAMT)  ,COUNT(CTCIF)                                                     
473.00 160825 D6262C*+ FROM TXNCT2                                                                                 
474.00 160825 D6262C+ FROM TXNCT2S                                                                                 
475.00 60602      C+ GROUP BY CTCIF                                                                               
476.00 60518      C/END-EXEC                                                                                      
477.00 60518      C                                                                                               
478.00 60603      C***CALCULATE TOTAL CR AND DR TRANSACTION AMOUNT                                                
479.00 60603      C/EXEC SQL                                                                                      
480.00 60603      C+ INSERT INTO AMLDTLCNY                                                                        
481.00 60603      C+ SELECT CTCIF, SUM(CTTXNAMT) ,COUNT(CTCIF)                                                    
482.00 160825 D6262C*+ FROM TXNCT1                                                                                 
483.00 160825 D6262C+ FROM TXNCT1S                                                                                 
484.00 60603      C+ WHERE CTCCYN='CNY'                                                                           
485.00 60603      C+ GROUP BY CTCIF                                                                               
486.00 60603      C/END-EXEC                                                                                      
487.00 60603      C                                                                                               
488.00 60603      C/EXEC SQL                                                                                      
489.00 60603      C+ INSERT INTO AMLDTLCNY                                                                        
490.00 60603      C+ SELECT CTCIF, SUM(CTTXNAMT)  ,COUNT(CTCIF)                                                   
491.00 160825 D6262C*+ FROM TXNCT2                                                                                 
492.00 160825 D6262C+ FROM TXNCT2S                                                                                 
493.00 60603      C+ WHERE CTCCYN='CNY'                                                                           
494.00 60603      C+ GROUP BY CTCIF                                                                               
495.00 60603      C/END-EXEC                                                                                      
496.00 60518      C                                                                                               
497.00 60518      C                   ENDSR                                                                       
498.00 60518      C                                                                                               
499.00 60524      C     GETFLDTE      BEGSR                                                                       
500.00 60524      C                   READ      TAP00101B                              10                         
501.00 60524      C                   DOW       *IN10='0'                                                         
502.00 60524      C                   IF        DSBK=1                                                            
503.00 60529      C*                  CALL      'DFJJTOYY'                                                        
504.00 60529      C*                  PARM                    DSFDW                                               
505.00 60529      C*                  PARM                    FDTE                                                
506.00 60529      C*                                                                                              
507.00 60529      C*                  CALL      'DFJJTOYY'                                                        
508.00 60529      C*                  PARM                    DSLDW                                               
509.00 60529      C*                  PARM                    LDTE                                                
510.00 60529      C*                                                                                              
511.00 60529      C                   CALL      'DFJJTOYY'                                                        
512.00 60524      C                   PARM                    DSDT                                                
513.00 60524      C                   PARM                    TODTE                                               
514.00 60524      C                   ENDIF                                                                       
515.00 60524      C                   READ      TAP00101B                              10                         
516.00 60524      C                   ENDDO                                                                       
517.00 60524      C                                                                                               
518.00 60524      C                   ENDSR                                                                       
519.00 60518      C                                                                                               
520.00 60518      C     GWKTXN        BEGSR                                                                       
521.00 60519      C                                                                                               
522.00 60519      C/EXEC SQL                                                                                      
523.00 60602      C+ INSERT INTO TXNCTWRK1                                                                        
524.00 60519      C+ SELECT *                                                                                     
525.00 160825 D6262C*+ FROM TXNCT1                                                                                 
526.00 160825 D6262C+ FROM TXNCT1S                                                                                 
527.00 160825 D6262C*+ WHERE CTMTTLAMT>=100000 OR CTCNYAMT>=20000                                                  
528.00 161118 D6262C+ WHERE CTMTTLAMT>=250000                                                                      
529.00 60519      C/END-EXEC                                                                                      
530.00 60519      C                                                                                               
531.00 60519      C/EXEC SQL                                                                                      
532.00 60602      C+ INSERT INTO TXNCTWRK2                                                                        
533.00 60519      C+ SELECT *                                                                                     
534.00 160825 D6262C*+ FROM TXNCT2                                                                                 
535.00 160825 D6262C+ FROM TXNCT2S                                                                                 
536.00 160825 D6262C*+ WHERE CTMTTLAMT>=100000 OR CTCNYAMT>=20000                                                  
537.00 161118 D6262C+ WHERE CTMTTLAMT>=250000                                                                      
538.00 60519      C/END-EXEC                                                                                      
539.00 60518      C                   ENDSR                                                                       
540.00 60518      C                                                                                               
541.00 60518      C*----------------------------------------------------------------------------------------------
542.00 60518      C* CALCULATE CREDIT OR DEBIT AND TOTAL CR+DB DAILY TXN AMOUNT                                   
543.00 60518      C*----------------------------------------------------------------------------------------------
544.00 60518      C     CALTLAMT      BEGSR                                                                       
545.00 60529      C***GET CREDIT OR DEBIT TOTAL WEEKLY TXN AMOUNT                                                 
546.00 60602      C                   EVAL      KTCIF =CTCIF                                                      
547.00 60529      C                   EVAL      KTINOUT='IN'                                                      
548.00 60529      C     KRCD          CHAIN     AMLDDOCRCD                         55                             
549.00 60519      C                   IF        *IN55='0'                                                         
550.00 60602      C                   EVAL      CTMCRAMT=DOCTMTXAMT                                               
551.00 60519      C                   ENDIF                                                                       
552.00 60519      C                                                                                               
553.00 60529      C                   EVAL      KTINOUT='OUT'                                                     
554.00 60529      C     KRCD          CHAIN     AMLDDOCRCD                         55                             
555.00 60519      C                   IF        *IN55='0'                                                         
556.00 60602      C                   EVAL      CTMDRAMT=DOCTMTXAMT                                               
557.00 60519      C                   ENDIF                                                                       
558.00 60519      C                                                                                               
559.00 60529      C*** GET IN + OUT TOTAL TXN AMOUNT                                                              
560.00 60602      C     CTCIF         CHAIN     AMLDDNCRCD                         45                             
561.00 60519      C                   IF        *IN45='0'                                                         
562.00 60602      C                   EVAL      CTMTTLAMT =DNCTMTXAMT                                             
563.00 60602      C                   EVAL      CTNOTXN   =DNCTNOTXN                                              
564.00 60519      C                   ENDIF                                                                       
565.00 60603      C                                                                                               
566.00 60603      C*** GET IN OUT TOTAL CNY AMOUNT                                                                
567.00 60603      C     CTCIF         CHAIN     AMLDTLCNY                          35                             
568.00 80422 C8104C*                  IF        *IN45='0'                                                         
569.00 80422 C8104C                   IF        *IN35='0'                                                         
570.00 60603      C                   EVAL      CTCNYAMT  =CNYTMTXAMT                                             
571.00 60603      C*                  EVAL      CTNOTXN   =DNCTNOTXN                                              
572.00 60603      C                   ENDIF                                                                       
573.00 60603      C                                                                                               
574.00 60603      C                                                                                               
575.00 60518      C                   ENDSR                                                                       
576.00 60518      C                                                                                               
577.00 60518      C                                                                                               
578.00 60518      C                                                                                               
579.00 60518      C                                                                                               
580.00 60518      C                                                                                               
581.00 60518      C                                                                                               
582.00 60518      C                                                                                               
583.00 60518      C                                                                                               
584.00 60516      C*----------------------------------------------------------------------------------------------
585.00 60516      C* Generate Report                                                                              
586.00 60516      C*----------------------------------------------------------------------------------------------
587.00 60516      C     GENRPT        BEGSR                                                                       
588.00 60523      C                                                                                               
589.00 60523      C                   Z-ADD     39            LTLN              2 0                               
590.00 60523      C                                                                                               
591.00 60523      C                   IF        RNO='R'                                                           
592.00 60516      C*READ RETAIL CUSTOMER                                                                          
593.00 60516      C                   MOVE      *BLANK        OFFI              3                                 
594.00 60517      C                   Z-ADD     0             BRANCH            3 0                               
595.00 60516      C                   MOVE      *BLANK        TMPCIF           10                                 
596.00 60516      C                   Z-ADD     1             LINE              2 0                               
597.00 60517      C                   SETOFF                                       89                             
598.00 60602      C                   READ      TXNCTWRK1                              80                         
599.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
600.00 60517      C                   IF        *IN80='1'                                                         
601.00 60517      C                   SETON                                        89                             
602.00 60517      C                   ENDIF                                                                       
603.00 60516      C                   DOW       *IN80='0'                                                         
604.00 60516      C                   SELECT                                                                      
605.00 60517      C                   WHEN      BRANCH=0 AND OFFI=*BLANK                                          
606.00 60516      C***FIRST PAGE                                                                                  
607.00 60602      C                   WRITE     HEADERCT                                                          
608.00 60517      C                   EXSR      DTLLINE                                                           
609.00 60516      C                   WRITE     DTL1                                                              
610.00 60602      C                   WRITE     DTLCT                                                             
611.00 60519      C                   ADD       4             LINE                                                
612.00 60516      C                                                                                               
613.00 60602      C                   WHEN      BRANCH<>CTBRN OR OFFI<>CTOFF OR LINE>LTLN                         
614.00 60516      C***BREAK PAGE                                                                                  
615.00 60602      C                   IF        TMPCIF<>CTCIF                                                     
616.00 60517      C***NOT SAME CIF                                                                                
617.00 60602      C                   WRITE     DTLCT1                                                            
618.00 60517      C                   WRITE     RECLINE                                                           
619.00 60519      C                   ADD       3             LINE                                                
620.00 60519      C                   ENDIF                                                                       
621.00 60519      C                                                                                               
622.00 60623      C                   WRITE     REMARKCT                                     new                  
623.00 60519      C                   SETON                                        98                             
624.00 60602      C                   WRITE     HEADERCT                                                          
625.00 60519      C                   SETOFF                                       98                             
626.00 60519      C                   Z-ADD     1             LINE                                                
627.00 60519      C                                                                                               
628.00 60517      C                   EXSR      DTLLINE                                                           
629.00 60517      C                   WRITE     DTL1                                                              
630.00 60602      C                   WRITE     DTLCT                                                             
631.00 60519      C                   ADD       4             LINE                                                
632.00 60518      C                   WHEN      LINE<=LTLN                                                        
633.00 60516      C***WRITE CURRENT PAGE                                                                          
634.00 60602      C                   IF        TMPCIF<>CTCIF                                                     
635.00 60602      C                   WRITE     DTLCT1                                                            
636.00 60517      C                   WRITE     RECLINE                                                           
637.00 60519      C                   ADD       3             LINE                                                
638.00 60519      C                   EXSR      DTLLINE                                                           
639.00 60519      C                   WRITE     DTL1                                                              
640.00 60602      C                   WRITE     DTLCT                                                             
641.00 60519      C                   ADD       4             LINE                                                
642.00 60519      C                   ELSE                                                                        
643.00 60517      C                   EXSR      DTLLINE                                                           
644.00 60602      C                   WRITE     DTLCT                                                             
645.00 60519      C                   ADD       1             LINE                                                
646.00 60519      C                   ENDIF                                                                       
647.00 60517      C                   ENDSL                                                                       
648.00 60602      C                   EVAL      BRANCH   = CTBRN                                                  
649.00 60602      C                   EVAL      OFFI     = CTOFF                                                  
650.00 60602      C                   EVAL      TMPCIF   = CTCIF                                                  
651.00 60602      C                   EVAL      AWTLCRAMT= CTMCRAMT                                               
652.00 60602      C                   EVAL      AWTLDBAMT= CTMDRAMT                                               
653.00 60602      C                   READ      TXNCTWRK1                              80                         
654.00 60516      C                   ENDDO                                                                       
655.00 60602      C  N89              WRITE     DTLCT1                                                            
656.00 60517      C                                                                                               
657.00 60523      C                   ENDIF                                                  *END RETAIL RPT      
658.00 60523      C                                                                                               
659.00 60523      C                                                                                               
660.00 60523      C                   IF        RNO='O'                                                           
661.00 60517      C*READ CORP AND PRI CUSTOMER                                                                    
662.00 60517      C                   MOVE      *BLANK        TMPMARK           4                                 
663.00 60517      C                   MOVE      *BLANK        OFFI              3                                 
664.00 60517      C                   MOVE      *BLANK        TMPCIF           10                                 
665.00 60517      C                   Z-ADD     1             LINE              2 0                               
666.00 60517      C                   Z-ADD     0             PRETLAMT         13 2                               
667.00 60523      C                   SETOFF                                       89                             
668.00 60602      C                   READ      TXNCTWRK2                              70                         
669.00 60517      C***CHECK HAVE RECORD OR NOT                                                                    
670.00 60523      C                   IF        *IN70<>'0'                                                        
671.00 60523      C                   SETON                                        89                             
672.00 60517      C                   ENDIF                                                                       
673.00 60517      C                                                                                               
674.00 60517      C                   DOW       *IN70='0'                                                         
675.00 60517      C                   SELECT                                                                      
676.00 60517      C                   WHEN      TMPMARK=*BLANK AND OFFI=*BLANK                                    
677.00 60517      C***FIRST PAGE                                                                                  
678.00 60602      C                   WRITE     HEADERCT                                                          
679.00 60517      C                   EXSR      DTLLINE                                                           
680.00 60517      C                   WRITE     DTL1                                                              
681.00 60602      C                   WRITE     DTLCT                                                             
682.00 60519      C                   ADD       4             LINE                                                
683.00 60517      C                                                                                               
684.00 60602      C                   WHEN      TMPMARK<>CTMARK OR OFFI<>CTOFF OR LINE>LTLN                       
685.00 60517      C***BREAK PAGE                                                                                  
686.00 60602      C                   IF        TMPCIF<>CTCIF                                                     
687.00 60517      C***NOT SAME CIF                                                                                
688.00 60602      C                   WRITE     DTLCT1                                                            
689.00 60517      C                   WRITE     RECLINE                                                           
690.00 60519      C                   ENDIF                                                                       
691.00 60623      C                   WRITE     REMARKCT                                     new                  
692.00 60519      C                                                                                               
693.00 60519      C                   Z-ADD     1             LINE                                                
694.00 60517      C                   SETON                                        98                             
695.00 60602      C                   WRITE     HEADERCT                                                          
696.00 60517      C                   SETOFF                                       98                             
697.00 60517      C                   EXSR      DTLLINE                                                           
698.00 60517      C                   WRITE     DTL1                                                              
699.00 60602      C                   WRITE     DTLCT                                                             
700.00 60519      C                   ADD       4             LINE                                                
701.00 60518      C                   WHEN      LINE<=LTLN                                                        
702.00 60517      C***WRITE CURRENT PAGE                                                                          
703.00 60602      C                   IF        TMPCIF<>CTCIF                                                     
704.00 60602      C                   WRITE     DTLCT1                                                            
705.00 60517      C                   WRITE     RECLINE                                                           
706.00 60519      C                   ADD       3             LINE                                                
707.00 60517      C                   EXSR      DTLLINE                                                           
708.00 60517      C                   WRITE     DTL1                                                              
709.00 60602      C                   WRITE     DTLCT                                                             
710.00 60519      C                   ADD       4             LINE                                                
711.00 60517      C                   ELSE                                                                        
712.00 60517      C                   EXSR      DTLLINE                                                           
713.00 60602      C                   WRITE     DTLCT                                                             
714.00 60519      C                   ADD       1             LINE                                                
715.00 60517      C                   ENDIF                                                                       
716.00 60517      C                   ENDSL                                                                       
717.00 60602      C                   EVAL      TMPMARK  = CTMARK                                                 
718.00 60602      C                   EVAL      OFFI     = CTOFF                                                  
719.00 60602      C                   EVAL      TMPCIF   = CTCIF                                                  
720.00 60602      C                   EVAL      AWTLCRAMT= CTMCRAMT                                               
721.00 60602      C                   EVAL      AWTLDBAMT= CTMDRAMT                                               
722.00 60602      C                   READ      TXNCTWRK2                              70                         
723.00 60517      C                   ENDDO                                                                       
724.00 60602      C  N89              WRITE     DTLCT1                                                            
725.00 60523      C                   ENDIF                                                  *EXCLUDE RETAIL RPT  
726.00 60602      C   89              WRITE     HEADERCT                                                          
727.00 60623      C                   WRITE     REMARKCT                                                          
728.00 60602      C   89              WRITE     RNOREC                                                            
729.00 60517      C  N89              WRITE     ENDREC                                                            
730.00 60516      C                   ENDSR                                                                       
731.00 60516      C                                                                                               
732.00 60517      C                                                                                               
733.00 60517      C     DTLLINE       BEGSR                                                                       
734.00 60517      C                                                                                               
735.00 60602      C                   EVAL      AWCIF  = CTCIF                                                    
736.00 60602      C                   EVAL      AWMARK = CTMARK                                                   
737.00 60602      C                   EVAL      AWBRNO = CTBRN                                                    
738.00 60602      C                   EVAL      AWOFF  = CTOFF                                                    
739.00 60602      C                   EVAL      AWNAME = CTNAME                                                   
740.00 111019 D1315C                   EVAL      AWSCCDE = ' '                                                     
741.00 120914 D2216C                   EVAL      AWSCCDE2 = ' '                                                    
742.00 111019   |  C                   EVAL      K03CIF = AWCIF                                                    
743.00 111019   |  C     KC03          CHAIN     CUP003                                                            
744.00 111019   |  C                   IF        %FOUND(CUP003)                                                    
745.00 120914 D1315C                   EVAL      AWSCCDE = CURSPF                                                  
746.00 120914 D2216C                   EVAL      AWSCCDE2 = CUBHVF                                                 
747.00 111019 D1315C                   ENDIF                                                                       
748.00 60529      C                                                                                               
749.00 60602      C                   EVAL      AWACTYP= CTTYPE                                                   
750.00 60605      C                   EVAL      AWACCNO= CTACCNO                                                  
751.00 60617      C                   EVAL      AWREL=CTREL                                                       
752.00 60602      C                   EVAL      AWDATE = CTDATE                                                   
753.00 60620      C                                                                                               
754.00 60620      C                   IF        CTINOUT='OUT'                                                     
755.00 60620      C                   EVAL      CTMAMT=CTMAMT*-1                                                  
756.00 60615      C                   ENDIF                                                                       
757.00 60621      C                   EVAL      AWTXBRN=CTTXNBRN                                                  
758.00 60602      C                   EVAL      AWCCY  = CTCCY                                                    
759.00 60602      C                   EVAL      AWAMT  = CTMAMT                                                   
760.00 60602      C                   EVAL      AWNAR  = CTDSC                                                    
761.00 60621      C                   EVAL      AWOB   = CTOB                                                     
762.00 60517      C                   ENDSR                                                                       
763.00 60517      C                                                                                               
764.00 60517      C                                                                                               
765.00 60516      C                                                                                               
