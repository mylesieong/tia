1.00 21106  /*¬¬----------------------------------------------------------------*/         
2.00 21106  /*  REFERENCE    : CHG-0167-07 (C2167)                              */         
3.00 21106  /*  USER ID      : B422                                             */         
4.00 21106  /*  CHANGED BY   : ANTHONY KAM                                      */         
5.00 21106  /*  CHANGED DATE : 01-NOV-2002                                      */         
6.00 21106  /*  REASON       : ADD CALL TO PROGRAM FOR GENERATING COLLATERAL    */         
7.00 21106  /*                 EOM REPORT                                       */         
8.00 21106  /*¬¬----------------------------------------------------------------*/         
9.00 21219  /*  Reference     :  C2135 (CHG-135-02)                            */          
10.00 21219  /*  User ID       :  B168PGM                                       */          
11.00 21219  /*  Author        :  THOMAS                                        */          
12.00 21219  /*  Date          :  19 DEC, 2002                                  */          
13.00 21219  /*  Description   :  Move data file TIMEEOM from IPROD to ZTMLIB   */          
14.00 21219  /*-----------------------------------------------------------------*/          
15.00 40803  /*  Reference     :  C4153 (CHG-153-04)                            */          
16.00 40803  /*  Author        :  B459 Brandon Leong                            */          
17.00 40803  /*  Date          :  03/08/2004                                    */          
18.00 40803  /*  Description   :  SML semi-annual reports                       */          
19.00 40803  /*-----------------------------------------------------------------*/          
20.00 50907  /*  REFERENCE     :  C5142 (CHG-142-05)                            */          
21.00 50907  /*  AUTHOR        :  B454PGM ARIES LUNG                            */          
22.00 50907  /*  DATE          :  07/09/2005                                    */          
23.00 50907  /*  DESCRIPTION   :  DORMANCY TRANSACTION ACCOUNTS EOY REPORT      */          
24.00 50907  /*-----------------------------------------------------------------*/          
25.00 51128  /*  REFERENCE     :  C5207 (CHG-207-05)                            */          
26.00 51128  /*  AUTHOR        :  B505PGM Paris Che                             */          
27.00 51128  /*  DATE          :  28/11/2005                                    */          
28.00 51128  /*  DESCRIPTION   :  Do not Copy IPROD/ICBSDPPF to ZTMLIB/TIMEEOM  */          
29.00 51128  /*-----------------------------------------------------------------*/          
30.00 51129  /*  REFERENCE     :  C5195 (CHG-195-05)                            */          
31.00 51129  /*  AUTHOR        :  B552PGM CARMEN LEI                            */          
32.00 51129  /*  DATE          :  28/11/2005                                    */          
33.00 51129  /*  DESCRIPTION   :  1. COPY AML CUSTOMER FILE AMLCUSINFO TO IEMO  */          
34.00 51129  /*                   2. FOR EBANKING BOM DOWNLOAD                  */          
35.00 51129  /*-----------------------------------------------------------------*/          
36.00 90429  /*  REFERENCE     :  C9141 (CHG-141-09)                            */          
37.00 90429  /*  AUTHOR        :  BA04PGM WAY CHOI                              */          
38.00 90608  /*  DATE          :  28/04/2009                                    */          
39.00 90429  /*  DESCRIPTION   :  GENERATE LOAN MORTAGAGE FILES.                */          
40.00 90429  /*                                                                 */          
41.00 90429  /*-----------------------------------------------------------------*/          
42.00 90608  /*  REFERENCE     :  C9180 (CHG-180-09)                            */          
43.00 90608  /*  AUTHOR        :  BA04PGM WAY CHOI                              */          
44.00 90608  /*  DATE          :  03/06/2009                                    */          
45.00 90608  /*  DESCRIPTION   :  GENERATE REPORT OF BCM TOP 30 DEPOSITERS.     */          
46.00 90608  /*                                                                 */          
47.00 90608  /*-----------------------------------------------------------------*/          
48.00 90626  /*  REFERENCE     :  C9193 (CHG-193-09)                            */          
49.00 90626  /*  AUTHOR        :  BA04PGM WAY CHOI                              */          
50.00 90626  /*  DATE          :  22/06/2009                                    */          
51.00 90626  /*  DESCRIPTION   :  Report for Exposure Total Balance and         */          
52.00 90626  /*                   Collateral Detail Information.                */          
53.00 90626  /*-----------------------------------------------------------------*/          
54.00 90706  /*  REFERENCE     :  C9215 (CHG-215-09)                            */          
55.00 90706  /*  AUTHOR        :  BA04PGM WAY CHOI                              */          
56.00 90706  /*  DATE          :  02/07/2009                                    */          
57.00 90706  /*  DESCRIPTION   :  Remove the coding that's modified by          */          
58.00 90706  /*                   CHG-180-09 (GENERATE REPORT OF BCM            */          
59.00 90706  /*                   TOP 30 DEPOSITERS).                           */          
60.00 90706  /*-----------------------------------------------------------------*/          
61.00 91029  /*  REFERENCE     :  C9347 (CHG-347-09)                            */          
62.00 91029  /*  AUTHOR        :  B422 ANTHONY                                  */          
63.00 91029  /*  DATE          :  29/10/2009                                    */          
64.00 91029  /*  DESCRIPTION   :  COPY ZCUSPRO/SCRDPRF FOR MIS                  */          
65.00 91029  /*-----------------------------------------------------------------*/          
66.00 91207  /*  REFERENCE     :  C9374 (CHG-374-09)                            */          
67.00 91207  /*  AUTHOR        :  B323 EDWARD                                   */          
68.00 91207  /*  DATE          :  29/10/2009                                    */          
69.00 91207  /*  DESCRIPTION   :  COPY ZCRLINE/LIMUSEPF FOR MIS                 */          
70.00 91207  /*-----------------------------------------------------------------*/          
71.00 100108  /*  REFERENCE     :  C9385 (CHG-385-09)                            */          
72.00 100108  /*  AUTHOR        :  BA04 WAY                                      */          
73.00 100108  /*  DATE          :  08/01/2010                                    */          
74.00 100108  /*  DESCRIPTION   :  Generate CORP Deposit & Loan Reports          */          
75.00 100108  /*-----------------------------------------------------------------*/          
76.00 100114  /*  REFERENCE     :  C9388 (CHG-388-09)                            */          
77.00 100114  /*  AUTHOR        :  BA04 WAY                                      */          
78.00 100114  /*  DATE          :  11/01/2010                                    */          
79.00 100114  /*  DESCRIPTION   :  1. Copy I700BCM/ATURDF to IEOM                */          
80.00 100114  /*                   2. Generate SME Portfolio Report              */          
81.00 100114  /*-----------------------------------------------------------------*/          
82.00 100415  /*  REFERENCE     :  D0095 (CHG-095-10)                            */          
83.00 100415  /*  AUTHOR        :  BA55 KARL                                     */          
84.00 100415  /*  DATE          :  15/04/2010                                    */          
85.00 100415  /*  DESCRIPTION   :  COPY ZVIPLIB/HITRTD,HITCUSREF FOR MIS         */          
86.00 100415  /*-----------------------------------------------------------------*/          
87.00 100702 /*  Reference No.  : CHG-138-10 (D0138)                                      */ 
88.00 100702 /*  Program Name   : GENGPRDTA                                               */ 
89.00 100702 /*  Author         : BA56PGM  Alan Chu                                       */ 
90.00 100702 /*  Date           : 25/05/2010                                              */ 
91.00 100702 /*  Program Desc.  : ITR-0520-10 Enhancement - report to AMCM.               */ 
92.00 100702 /*                                                                           */ 
93.00 100702 /*---------------------------------------------------------------------------*/ 
94.00 110126 /*  REFERENCE NO.  : CHG-011-11 (D1011)                                      */ 
95.00 110126 /*  AUTHOR         : BB16PGM Alvin Lei                                       */ 
96.00 110126 /*  DATE           : 19/01/2011                                              */ 
97.00 110126 /*  PROGRAM DESC.  : Generate association transaction reports                */ 
98.00 110126 /*---------------------------------------------------------------------------*/ 
99.00 110926 /*  REFERENCE NO.  : CHG-211-11 (D1211)                                      */ 
100.00 110926 /*  AUTHOR         : BA55PGM KARL                                            */ 
101.00 110926 /*  DATE           : 21/09/2011                                              */ 
102.00 110926 /*  PROGRAM DESC.  : COPY FILES FOR LIQUIDITY REPORT DATA TRANSFER           */ 
103.00 110926 /*---------------------------------------------------------------------------*/ 
104.00 111027 /*  REFERENCE NO.  : CHG-316-11 (D1316)                                      */ 
105.00 111027 /*  AUTHOR         : BB88PGM HELMOND IO                                      */ 
106.00 111027 /*  DATE           : 21/09/2011                                              */ 
107.00 111027 /*  PROGRAM DESC.  : GENERATE LOAN MATURITY ANALYSIS REPORT                  */ 
108.00 111027 /*---------------------------------------------------------------------------*/ 
109.00 111212 /*  REFERENCE NO.  : CHG-382-11 (D1382)                                      */ 
110.00 111212 /*  AUTHOR         : B323PGM EDWARD CHEUNG                                   */ 
111.00 111212 /*  DATE           : 12/12/2011                                              */ 
112.00 111212 /*  PROGRAM DESC.  : GENERATE LOAN MATURITY ANALYSIS REPORT                  */ 
113.00 111212 /*---------------------------------------------------------------------------*/ 
114.00 120626 /*  REFERENCE NO.  : CHG-178-12 (D2178)                                      */ 
115.00 120626 /*  AUTHOR         : BB14PGM FRANCISCO LO                                    */ 
116.00 120626 /*  DATE           : 25/06/2012                                              */ 
117.00 120626 /*  PROGRAM DESC.  : GENERATE MONTHLY NEW SMART SALARY REPORT                */ 
118.00 120626 /*---------------------------------------------------------------------------*/ 
119.00 130226 /*  REFERENCE NO.  : CHG-013-13 (D3013)                                      */ 
120.00 130226 /*  AUTHOR         : B323PGM EDWARD CHEUNG                                   */ 
121.00 130226 /*  DATE           : 26/02/2013                                              */ 
122.00 130226 /*  PROGRAM DESC.  : ADD ZCIFLIB/CUDSMCRPT FOR SMC MAINTENANCE               */ 
123.00 130226 /*---------------------------------------------------------------------------*/ 
124.00 130322 /*  REFERENCE NO.  : CHG-110-13 (D3110)                                      */ 
125.00 130322 /*  AUTHOR         : BB14PGM FRANCISCO LO                                    */ 
126.00 130322 /*  DATE           : 22/03/2013                                              */ 
127.00 130322 /*  PROGRAM DESC.  : ADD LCR REPORT CL                                       */ 
128.00 130322 /*---------------------------------------------------------------------------*/ 
129.00 130425 /*  REFERENCE NO.  : CHG-149-13 (D3149)                                      */ 
130.00 130425 /*  AUTHOR         : BE95PGM JOANNA CHONG                                    */ 
131.00 130425 /*  DATE           : 24/04/2013                                              */ 
132.00 130425 /*  PROGRAM DESC.  : COPY ZLCCAUT/CRDATPMST TO IEOM                          */ 
133.00 130425 /*---------------------------------------------------------------------------*/ 
134.00 130519 /*  REFERENCE NO.  : CHG-173-13 (D3173)                                      */ 
135.00 130519 /*  AUTHOR         : BE95PGM JOANNA CHONG                                    */ 
136.00 130519 /*  DATE           : 15/05/2013                                              */ 
137.00 130519 /*  PROGRAM DESC.  : COPY IPROD/TATMDPTSUM TO IEOM                           */ 
138.00 130519 /*---------------------------------------------------------------------------*/ 
139.00 130801 /*  REFERENCE NO.  : CHG-228-13 (D3228)                                      */ 
140.00 130801 /*  AUTHOR         : BB16PGM ALVIN LEI                                       */ 
141.00 130801 /*  DATE           : 01/08/2013                                              */ 
142.00 130801 /*  PROGRAM DESC.  : GENERATE AMCM MAINLAND REPORT                           */ 
143.00 130801 /*---------------------------------------------------------------------------*/ 
144.00 130806 /*  REFERENCE NO. : D3269 (CHG-269-13)                             */           
145.00 130806 /*  USER ID       : BG09PGM                                        */           
146.00 130806 /*  USER NAME     : ALBERT AU                                      */           
147.00 130806 /*  CHANGED DATE  : 31 JUL 2013                                    */           
148.00 130806 /*  PURPOSE       : INWARD/OUTWARD REMITTANCE STATISTICS (MONTHLY) */           
149.00 130806 /*-----------------------------------------------------------------*/           
150.00 131030 /*  REFERENCE NO. : D3345 (CHG-345-13)                             */           
151.00 131030 /*  USER ID       : BG09PGM                                        */           
152.00 131030 /*  USER NAME     : ALBERT AU                                      */           
153.00 131030 /*  CHANGED DATE  : 21 OCT 2013                                    */           
154.00 131030 /*  PURPOSE       : NON-VIP CUSTOMER PORTFOLIO ANALYSIS (MONTHLY)  */           
155.00 131030 /*-----------------------------------------------------------------*/           
156.00 131030 /*  REFERENCE NO. : D3360 (CHG-360-13)                             */           
157.00 131030 /*  USER ID       : BG24PGM                                        */           
158.00 131030 /*  USER NAME     : ERIC WONG                                      */           
159.00 131030 /*  CHANGED DATE  : 30 OCT 2013                                    */           
160.00 131030 /*  PURPOSE       : GENERATE AMCM MATURITY MISMATCH OF DSB REPORT  */           
161.00 131030 /*-----------------------------------------------------------------*/           
162.00 131030 /*  REFERENCE NO. : D3382 (CHG-382-13)                             */           
163.00 131030 /*  USER ID       : BG24PGM                                        */           
164.00 131030 /*  USER NAME     : ERIC WONG                                      */           
165.00 131030 /*  CHANGED DATE  : 30 OCT 2013                                    */           
166.00 131030 /*  PURPOSE       : GENERATE AMCM TEN LARGEST DEPOSITORS&BORROWER  */           
167.00 131030 /*-----------------------------------------------------------------*/           
168.00 131121 /*  REFERENCE NO. : D3415 (CHG-415-13)                             */           
169.00 131121 /*  USER ID       : BG09                                           */           
170.00 131121 /*  USER NAME     : ALBERT AU                                      */           
171.00 131121 /*  CHANGED DATE  : 21 NOV 2013                                    */           
172.00 131121 /*  PURPOSE       : COPY IPROD/LNCFWPRI TO IEOM                    */           
173.00 131121 /*-----------------------------------------------------------------*/           
174.00 140701 /*  REFERENCE NO. : D4200 (CHG-200-14)                             */           
175.00 140701 /*  USER ID       : BG24                                           */           
176.00 140701 /*  USER NAME     : ERIC WONG                                      */           
177.00 140701 /*  CHANGED DATE  : 6 JUN 2014                                     */           
178.00 140701 /*  PURPOSE       : GENERATE CREDIT CARD AUTOPAY                   */           
179.00 140701 /*-----------------------------------------------------------------*/           
180.00 140730 /*  REFERENCE NO. : D4037 (CHG-037-14)                             */           
181.00 140730 /*  USER ID       : BG09                                           */           
182.00 140730 /*  USER NAME     : ALBERT AU                                      */           
183.00 140730 /*  CHANGED DATE  : 30 JUL 2014                                    */           
184.00 140730 /*  PURPOSE       : COPY DOTOACDTBK FROM ZDORMANT                  */           
185.00 140730 /*-----------------------------------------------------------------*/           
186.00 140923 /*  REFERENCE NO. : D4344 (CHG-344-14)                             */           
187.00 140923 /*  USER ID       : BG24                                           */           
188.00 140923 /*  USER NAME     : ERIC WONG                                      */           
189.00 140923 /*  CHANGED DATE  : 15 SEP 2014                                    */           
190.00 140923 /*  PURPOSE       : GENERATE AUTOPAY MONTHLY REPORT                */           
191.00 140923 /*-----------------------------------------------------------------*/           
192.00 140923 /*  REFERENCE NO. : D4345 (CHG-345-14)                             */           
193.00 140923 /*  USER ID       : BG24                                           */           
194.00 140923 /*  USER NAME     : ERIC WONG                                      */           
195.00 140923 /*  CHANGED DATE  : 15 SEP 2014                                    */           
196.00 140923 /*  PURPOSE       : GENERATE PAYROLL CAMPAIGN PORTFOLIO MTH REPORT */           
197.00 140923 /*-----------------------------------------------------------------*/           
198.00 141014 /*  REFERENCE NO. : D4374 (CHG-374-14)                             */           
199.00 141014 /*  USER ID       : BG24                                           */           
200.00 141014 /*  USER NAME     : ERIC WONG                                      */           
201.00 141014 /*  CHANGED DATE  : 14 OCT 2014                                    */           
202.00 141014 /*  PURPOSE       : MOVE D4344 AND D4345 LOGIC TO ZACCTAVG/CAVGBAL */           
203.00 141014 /*-----------------------------------------------------------------*/           
204.00 141119 /*  REFERENCE NO. : D4435 (CHG-435-14)                             */           
205.00 141119 /*  USER ID       : BG24                                           */           
206.00 141119 /*  USER NAME     : ERIC WONG                                      */           
207.00 141119 /*  CHANGED DATE  : 29 OCT 2014                                    */           
208.00 141119 /*  PURPOSE       : GENERATE TABLE FOR ACTIVE ACCOUNT AND ADD      */           
209.00 141119 /*                  COLUMN TO SHOW ACTIVE ACCOUNT IN SCC FILE      */           
210.00 141119 /*-----------------------------------------------------------------*/           
211.00 141201 /*  REFERENCE NO. : D4476 (CHG-476-14)                             */           
212.00 141201 /*  USER ID       : BG09                                           */           
213.00 141201 /*  USER NAME     : ALBERT AU                                      */           
214.00 141201 /*  CHANGED DATE  : 20 NOV 2014                                    */           
215.00 141201 /*  PURPOSE       : DEPOSIT LINKED MONTHLY REPORTPORT              */           
216.00 141201 /*                  GENERATE DATA TO DEPLNKLST PF                  */           
217.00 141201 /*-----------------------------------------------------------------*/           
218.00 141217 /*  REFERENCE NO. : D4483 (CHG-483-14)                             */           
219.00 141217 /*  USER ID       : BG24                                           */           
220.00 141217 /*  USER NAME     : ERIC WONG                                      */           
221.00 141217 /*  CHANGED DATE  : 17 DEC 2014                                    */           
222.00 141217 /*  PURPOSE       : AML STATISTICS FOR DBS AML AND RISK REPORT     */           
223.00 141217 /*-----------------------------------------------------------------*/           
224.00 150112 /*  REFERENCE NO. : D4467 (CHG-467-14)                             */           
225.00 150112 /*  USER ID       : BG58                                           */           
226.00 150112 /*  USER NAME     : WINE CHAN                                      */           
227.00 150112 /*  CHANGED DATE  : 07 JAN 2014                                    */           
228.00 150112 /*  PURPOSE       : COPY ZCRLINE/CRLLNDT TO IEOM                   */           
229.00 150112 /*-----------------------------------------------------------------*/           
230.00 150206 /*  REFERENCE NO. : D5028 (CHG-028-15)                             */           
231.00 150206 /*  USER ID       : BG24                                           */           
232.00 150206 /*  USER NAME     : ERIC WONG                                      */           
233.00 150206 /*  CHANGED DATE  : 06 FEB 2014                                    */           
234.00 150206 /*  PURPOSE       : COPY ISTKSUBACC ISTKACC ISTKINFO  TO IEOM      */           
235.00 150206 /*-----------------------------------------------------------------*/           
236.00 150226 /*  REFERENCE NO. : D5053 (CHG-053-15)                             */           
237.00 150226 /*  USER ID       : BG24                                           */           
238.00 150226 /*  USER NAME     : ERIC WONG                                      */           
239.00 150226 /*  CHANGED DATE  : 26 FEB 2014                                    */           
240.00 150226 /*  PURPOSE       : COPY CSMCRSPF TO IEOM                          */           
241.00 150226 /*-----------------------------------------------------------------*/           
242.00 150522 /* REFERENCE NO. : CHG-0356-14(D4356)                              */           
243.00 150522 /* AUTHOR        : ALBERT AU                                       */           
244.00 150522 /* USER ID.      : BG09PGM                                         */           
245.00 150522 /* DATE WRITTEN  : 20 AUG 2014                                     */           
246.00 150522 /* DESCRPITION   : IN-HOUSE HOUSEKEEPING PROGRAM                   */           
247.00 150522 /* REMARK        :                                                 */           
248.00 150522 /*-----------------------------------------------------------------*/           
249.00 150709 /* REFERENCE NO. : CHG-141-15 (D5141)                              */           
250.00 150709 /* AUTHOR        : THOMAS CHAN                                     */           
251.00 150709 /* USER ID.      : B168PGM                                         */           
252.00 150709 /* DATE WRITTEN  :  9 JUL 2015                                     */           
253.00 150709 /* DESCRPITION   : COPY 3 INSTALLMENT ORDERS DETAILS FILES FROM    */           
254.00 150709 /*                 LIBRARY ZLCREDIT                                */           
255.00 150709 /* REMARK        :                                                 */           
256.00 150709 /*-----------------------------------------------------------------*/           
257.00 150721 /*  REFERENCE NO. : D5239 (CHG-239-15)                             */           
258.00 150721 /*  USER ID       : BG58PGM                                        */           
259.00 150721 /*  USER NAME     : WINE CHAN                                      */           
260.00 150721 /*  CHANGED DATE  : 17 JUL 2015                                    */           
261.00 150721 /*  PURPOSE       : UNDRAWN OD LINE CUSTOMER DATA                  */           
262.00 150721 /*-----------------------------------------------------------------*/           
263.00 150819 /* REFERENCE NO. : CHG-0274-15 (D5274)                             */           
264.00 150819 /* AUTHOR        : ALBERT AU                                       */           
265.00 150819 /* USER ID.      : BG09PGM                                         */           
266.00 150819 /* DATE WRITTEN  : 20 JUL 2015                                     */           
267.00 150819 /* DESCRPITION   : OPG CALL-BACK CONFIRMATION MONITORING REPORT    */           
268.00 150819 /*-----------------------------------------------------------------*/           
269.00 150917 /* REFERENCE NO. : CHG-0275-15 (D5275)                             */           
270.00 150917 /* AUTHOR        : ALBERT AU                                       */           
271.00 150917 /* USER ID.      : BG09PGM                                         */           
272.00 150917 /* DATE WRITTEN  : 23 FEB 2015                                     */           
273.00 150917 /* DESCRPITION   : GET CIF POSITION DATA                           */           
274.00 150917 /*-----------------------------------------------------------------*/           
275.00 150917 /* REFERENCE NO. : CHG-0323-15 (D5323)                             */           
276.00 150917 /* AUTHOR        : WINE CHAN                                       */           
277.00 150917 /* USER ID.      : BG58PGM                                         */           
278.00 150917 /* DATE WRITTEN  : 15 SEP 2015                                     */           
279.00 150917 /* DESCRPITION   : EXTRACT NON-VIP CUSTOMER ANALYSIS DATA          */           
280.00 150917 /*-----------------------------------------------------------------*/           
281.00 160121 /* REFERENCE NO. : CHG-0467-15 (D5467)                             */           
282.00 160121 /* AUTHOR        : MYLES IEONG                                     */           
283.00 160121 /* USER ID.      : BI77PGM                                         */           
284.00 160121 /* DATE WRITTEN  : 15 JAN 2016                                     */           
285.00 160121 /* DESCRPITION   : MONTHLY STATISTIC OF REMITTANCE                 */           
286.00 160121 /*-----------------------------------------------------------------*/           
287.00 160308 /* REFERENCE NO. : CHG-0080-16 (D6080)                             */           
288.00 160308 /* AUTHOR        : BG09PGM ALBERT AU                               */           
289.00 160308 /* CHANGED DATE  : 03 MAR 2016                                     */           
290.00 160308 /* REASON        : EXTRACT CREDIT CARD REPORT                      */           
291.00 160308 /*-----------------------------------------------------------------*/           
292.00 160520 /* REFERENCE NO. : CHG-0165-16 (D6165)                             */           
293.00 160520 /* AUTHOR        : BI77PGM MYLES IEONG                             */           
294.00 160520 /* CHANGED DATE  : 19 MAY 2016                                     */           
295.00 160520 /* REASON        : COPY CUDLOG TO IEOM                             */           
296.00 160520 /*-----------------------------------------------------------------*/           
297.00 160905 /* REFERENCE NO. : CHG-0219-16 (D6219)                             */           
298.00 160905 /* AUTHOR        : BG09PGM ALBERT AU                               */           
299.00 160905 /* CHANGED DATE  : 02 JUN 2016                                     */           
300.00 160905 /* REASON        : OP OUTWARD REMITTANCE                           */           
301.00 160905 /*-----------------------------------------------------------------*/           
302.00 160919 /* REFERENCE NO. : CHG-0294-16 (D6294)                             */           
303.00 160919 /* AUTHOR        : TOMMY TONG                                      */           
304.00 160919 /* CHANGED DATE  : 07 SEP 2016                                     */           
305.00 160919 /* REASON        : MONTHLY OVERDRAFT OUTSTANDING REPORT            */           
306.00 160919 /*-----------------------------------------------------------------*/           
307.00 161107 /* REFERENCE NO. : CHG-0313-16 (D6313)                             */           
308.00 161107 /* AUTHOR        : BI77PGM MYLES IEONG                             */           
309.00 161107 /* CHANGED DATE  : 26 Sep 2016                                     */           
310.00 161107 /* REASON        : Loan Repayment Monthly Report                   */           
311.00 161107 /*-----------------------------------------------------------------*/           
312.00 161202 /* REFERENCE NO. : CHG-386-16 (D6386)                              */           
313.00 161202 /* AUTHOR        : KARL BA55                                       */           
314.00 161202 /* CHANGED DATE  : 01 DEC 2016                                     */           
315.00 161202 /* REASON        : COPY CBGRPINFO TO IEOM                          */           
316.00 161202 /*-----------------------------------------------------------------*/           
317.00 170119 /* REFERENCE NO. : CHG-028-17 (D7028)                              */           
318.00 170119 /* AUTHOR        : BI77PGM MYLES IEONG                             */           
319.00 170119 /* CHANGED DATE  : 18 JAN 2017                                     */           
320.00 170119 /* REASON        : COPY FRP00501 TO IEOM                           */           
321.00 170119 /*-----------------------------------------------------------------*/           
322.00 170220 /* REFERENCE NO. : CHG-048-17 (D7048)                              */           
323.00 170220 /* AUTHOR        : BI77PGM MYLES IEONG                             */           
324.00 170220 /* CHANGED DATE  : 10 FEB 2017                                     */           
325.00 170220 /* REASON        : COPY STOCK RELATED FILES TO IEOM                */           
326.00 170220 /*-----------------------------------------------------------------*/           
327.00 170502 /* REFERENCE NO. : CHG-151-17 (D7151)                              */           
328.00 170502 /* AUTHOR        : BI77PGM MYLES IEONG                             */           
329.00 170502 /* CHANGED DATE  : 27 Apr 2017                                     */           
330.00 170502 /* REASON        : Add DSF Tax Refund Monthly Statistic Report     */           
331.00 170502 /*-----------------------------------------------------------------*/           
332.00 170512 /* REFERENCE NO. : CHG-160-17 (D7160)                              */           
333.00 170512 /* AUTHOR        : BI77PGM MYLES IEONG                             */           
334.00 170512 /* CHANGED DATE  : 08 MAR 2017                                     */           
335.00 170512 /* REASON        : COPY GPORRST, GPORLNDTL, GPRCOLAPP FROM IPROD   */           
336.00 170512 /*-----------------------------------------------------------------*/           
337.00 170519 /* REFERENCE NO. : CHG-172-17 (D7172)                              */           
338.00 170519 /* AUTHOR        : BG09PGM ALBERT AU                               */           
339.00 170519 /* CHANGED DATE  : 18 MAY 2017                                     */           
340.00 170519 /* REASON        : COPY IPROD/PRMLYDTA FILES TO IEOM               */           
341.00 170519 /*-----------------------------------------------------------------*/           
342.00 170704 /* REFERENCE NO. : CHG-195-17 (D7195)                              */           
343.00 170704 /* AUTHOR        : BG09PGM ALBERT AU                               */           
344.00 170704 /* CHANGED DATE  : 04 JUL 2017                                     */           
345.00 170704 /* REASON        : COPY ZCIFLIB/GRMCIFPF,ZCIFLIB/GRMMSTPF,         */           
346.00 170704 /*                 COPY ZECSDLIB/ECSDPF                            */           
347.00 170704 /*-----------------------------------------------------------------*/           
347.01 170801 /* REFERENCE NO. : CHG-258-17 (D7258)                              */           
347.02 170801 /* AUTHOR        : BG09PGM ALBERT AU                               */           
347.03 170801 /* CHANGED DATE  : 31 JUL 2017                                     */           
347.04 170801 /* REASON        : COPY IMOBLIB/FAMASPF                            */           
347.05 170801 /*                 COPY IMOBLIB/FATYPPF                            */           
347.06 170801 /*-----------------------------------------------------------------*/           
348.00 524              PGM                                                                
349.00 825                                                                                 
350.00 901              DCL        VAR(&REPLY)  TYPE(*CHAR) LEN(1)                         
351.00 901              DCL        VAR(&REPLY1)  TYPE(*CHAR) LEN(1)                        
352.00 825                                                                                 
353.00 825              DCL        VAR(&SYSDATE) TYPE(*DEC) LEN(8 0)                       
354.00 825              DCL        VAR(&SYSDATES) TYPE(*CHAR) LEN(8)                       
355.00 825              DCL        VAR(&CUR) TYPE(*DEC) LEN(2 0)                           
356.00 825              DCL        VAR(&EOM) TYPE(*DEC) LEN(2 0)                           
357.00 825              DCL        VAR(&LEOM) TYPE(*DEC) LEN(2 0)                          
358.00 825              DCL        VAR(&EOMS) TYPE(*CHAR) LEN(2)                           
359.00 825              DCL        VAR(&LEOMS) TYPE(*CHAR) LEN(2)                          
360.00 825                                                                                 
361.00 825              DCL        VAR(&MNUOPT) TYPE(*CHAR) LEN(5) VALUE('E01  ')          
362.00 825              DCL        VAR(&PROMPT) TYPE(*CHAR) LEN(40)                        
363.00 825                                                                                 
364.00 825              MONMSG     MSGID(CPF2103)                                          
365.00 825                                                                                 
366.00 825              RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                                  
367.00 825                                                                                 
368.00 825 /* CONFIRMATION ASKING BEFORE SENDING */                                        
369.00 825              CHGVAR     VAR(&PROMPT) VALUE('Print Beginning-of-month +          
370.00 825                           reports.')                                            
371.00 825              RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                                  
372.00 825  MARKSTR:    CALL       PGM(OPTSTR) PARM(&MNUOPT &PROMPT &REPLY)                
373.00 825              IF         COND(&REPLY *EQ 'F') THEN(GOTO CMDLBL(EXIT))            
374.00 825                                                                                 
375.00 110601              ADDLIBLE   LIB(IEOM) POSITION(*LAST)                               
376.00 825              ADDLIBLE   LIB(IMODULE) POSITION(*LAST)                            
377.00 825  CHKDONE:    CALL       PGM(DICBSYMD) PARM(&SYSDATE)                            
378.00 825                                                                                 
379.00 825              CHGVAR     VAR(&SYSDATES) VALUE(&SYSDATE)                          
380.00 825              CHGVAR     VAR(&CUR) VALUE(%SST(&SYSDATES 5 2))                    
381.00 825              CHGVAR     VAR(&EOM) VALUE(&CUR - 1)                               
382.00 825              CHGVAR     VAR(&LEOM) VALUE(&EOM - 1)                              
383.00 825   /* ON JANUARY */                                                              
384.00 825              IF         COND(&EOM *EQ 0) THEN(DO)                               
385.00 825              CHGVAR     VAR(&EOM) VALUE(12)                                     
386.00 825              CHGVAR     VAR(&LEOM) VALUE(11)                                    
387.00 825              ENDDO                                                              
388.00 825   /* ON FEBRUARY */                                                             
389.00 825              IF         COND(&EOM *EQ 1) THEN(DO)                               
390.00 825              CHGVAR     VAR(&LEOM) VALUE(12)                                    
391.00 825              ENDDO                                                              
392.00 825                                                                                 
393.00 825              CHGVAR     VAR(&EOMS) VALUE(&EOM)                                  
394.00 825              CHGVAR     VAR(&LEOMS) VALUE(&LEOM)                                
395.00 825                                                                                 
396.00 825              RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                                  
397.00 825              SNDPGMMSG  MSG('IEOM' *CAT &LEOMS *CAT ' will be +                 
398.00 825                           created. IEOM will contain ' *CAT &EOMS +             
399.00 825                           *CAT ' data.' *CAT ' Is it correct ? +                
400.00 825                           (Y/N)') TOPGMQ(*EXT) MSGTYPE(*INQ)                    
401.00 901              RCVMSG     PGMQ(*EXT) MSGTYPE(*RPY) MSG(&REPLY1)                   
402.00 825                                                                                 
403.00 901              IF         COND((&REPLY1 *EQ 'Y') *OR (&REPLY1 *EQ 'y')) +         
404.00 825                           THEN(DO)                                              
405.00 825              CPYLIB     FROMLIB(IEOM) TOLIB('IEOM' *CAT &LEOMS) +               
406.00 825                           CRTLIB(*YES)                                          
407.00 825                                                                                 
408.00 825      /* CHECK IF THE THE IEOMXX ALREADY EXIST, IF SO , BACKUP IT FIRST */       
409.00 825              MONMSG     MSGID(CPF2358) EXEC(DO)                                 
410.00 825              RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                                  
411.00 825              SNDPGMMSG  MSG('IEOM' *CAT &LEOMS *CAT ' already +                 
412.00 825                           existed. Backup the library first !! +                
413.00 825                           Press any key to exit !!') TOPGMQ(*EXT) +             
414.00 825                           MSGTYPE(*INFO)                                        
415.00 825                                                                                 
416.00 825              GOTO       CMDLBL(EXIT)                                            
417.00 825              ENDDO                                                              
418.00 825                                                                                 
419.00 825      /* RESTORE THE AFTER PCOMB */                                              
420.00 825              CALL       PGM(IEOM/RSTEOMLIB)                                     
421.00 825      /* RESTORE THE AFTER REVALUATION */                                        
422.00 825              CALL       PGM(IEOM/RSTEOMLIB1)                                    
423.00 825      /* COPY THE KAPITI FILES */                                                
424.00 1201      /*      CPYF       FROMFILE(KFILBC1/OTPF) +                     */         
425.00 1201      /*                   TOFILE(IEOM/OTPF) MBROPT(*REPLACE)         */         
426.00 1201      /*      CPYF       FROMFILE(KFILBC1/OSPF) +                     */         
427.00 1201      /*                   TOFILE(IEOM/OSPF) MBROPT(*REPLACE)         */         
428.00 1201      /*      CPYF       FROMFILE(KFILBC1/GFPF) +                     */         
429.00 1201      /*                   TOFILE(IEOM/GFPF) MBROPT(*REPLACE)         */         
430.00 1201      /*      CPYF       FROMFILE(KFILBC1/UADET) +                    */         
431.00 1201      /*                   TOFILE(IEOM/UADET) MBROPT(*REPLACE)        */         
432.00 825      /* COPY THE EOM RATE TABLE FROM IPROD TO IEOM */                           
433.00 825              CPYF       FROMFILE(IPROD/ICBSRRTE) +                              
434.00 825                           TOFILE(IEOM/ICBSRRTE) MBROPT(*REPLACE)                
435.00 160520                                                                                 
436.00 160520    /*D6165*/ CPYF       FROMFILE(ZCIFLIB/CUDFLDPF)  +                           
437.00 160520                             TOFILE(IEOM/CUDFLDPF) MBROPT(*REPLACE)              
438.00 160520                                                                                 
439.00 170119    /*D7028*/ CPYF       FROMFILE(ICBSBCMDB1/FRP00501)  +                        
440.00 170119                             TOFILE(IEOM/FRP00501) MBROPT(*REPLACE)              
441.00 170119                                                                                 
442.00 51128      /* Reference: CHG-207-05 (C5207)                                */         
443.00 51128      /* Reason   : Do not copy IPROD/ICBSDPPF to ZTMLIB/TIMEEOM, this*/         
444.00 51128      /*            will be done when statement print                 */         
445.00 825      /* COPY THE FIXED FILE FROM IPROD TO IPROD */                              
446.00 51128  /* C5207    CPYF       FROMFILE(IPROD/ICBSDPPF) +                              
447.00 51128                           TOFILE(ZTMLIB/TIMEEOM) MBROPT(*REPLACE)       C5207 */
448.00 21219  /*                       TOFILE(IPROD/TIMEEOM) MBROPT(*REPLACE)        C2135 */
449.00 110520  /*  REFERENCE     :  C9388 (CHG-388-09)                            */          
450.00 110520  /*  DESCRIPTION   :  1. Copy I700BCM/ATURDF to IEOM                */          
451.00 110520  /*                   2. Generate SME Portfolio Report              */          
452.00 141014  /* C9388 */ /*D4374 CPYF       FROMFILE(I700BCM/ATURDF) +                      
453.00 110520                           TOFILE(IEOM/ATURDF) MBROPT(*REPLACE) +                
454.00 141014                           CRTFILE(*YES)                     */                  
455.00 110601                                                                                 
456.00 110601              ADDLIBLE   LIB(IEOM)                                               
457.00 825      /* PRINT THE "Creditos Concedidos e Caucoes" REPORT */                     
458.00 825              CALL       PGM(IEOM/CRDCAUCL)                                      
459.00 830      /* ALSO , PRINT THE "Business a/c Report" REPORT */                        
460.00 830              CALL       PGM(IQRY/BUSACCL)                                       
461.00 21106                                                                                 
462.00 21106  /*  REFERENCE    : CHG-0167-07 (C2167)                              */         
463.00 21106  /*  REASON       : ADD CALL TO PROGRAM FOR GENERATING COLLATERAL    */         
464.00 21106  /*                 EOM REPORT                                       */         
465.00 21106  /* C2167 */ CALL       PGM(IEOM/COLALLCL)                                      
466.00 21106                                                                                 
467.00 40803  /* C4153 Reason  : GENERATE SML REPORTS */                                     
468.00 40803  /* C4153 */ CALL       PGM(IEOM/PSMLRPT)                                       
469.00 50907                                                                                 
470.00 50907                                                                                 
471.00 50907  /* C5142 REASON : GENERATE DORMANCY TRANSACTION ACCOUNT EOY REPORT  */         
472.00 50910  /* C5142 */ CALL       PGM(ZDORMANT/DORMANCYCL)                                
473.00 40803                                                                                 
474.00 51129  /* C5195 REASON : COPY AMLCUSINFO FROM IPROD TO IEOM */                        
475.00 51129  /* C5195 */ CPYF       FROMFILE(IPROD/AMLCUSINFO) +                            
476.00 51129                           TOFILE(IEOM/AMLCUSINFO) MBROPT(*REPLACE) +            
477.00 51129                           CRTFILE(*YES)                                         
478.00 51129                                                                                 
479.00 51129  /* C5195 REASON : FOR EBANKING BOM DOWNLOAD */                                 
480.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP001) +                            
481.00 51129                           TOFILE(IEOM/LGP001) MBROPT(*REPLACE) +                
482.00 51129                           CRTFILE(*YES)                                         
483.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP003) +                            
484.00 51129                           TOFILE(IEOM/LGP003) MBROPT(*REPLACE) +                
485.00 51129                           CRTFILE(*YES)                                         
486.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP004) +                            
487.00 51129                           TOFILE(IEOM/LGP004) MBROPT(*REPLACE) +                
488.00 51129                           CRTFILE(*YES)                                         
489.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP005) +                            
490.00 51129                           TOFILE(IEOM/LGP005) MBROPT(*REPLACE) +                
491.00 51129                           CRTFILE(*YES)                                         
492.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP006) +                            
493.00 51129                           TOFILE(IEOM/LGP006) MBROPT(*REPLACE) +                
494.00 51129                           CRTFILE(*YES)                                         
495.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP007) +                            
496.00 51129                           TOFILE(IEOM/LGP007) MBROPT(*REPLACE) +                
497.00 51129                           CRTFILE(*YES)                                         
498.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP008) +                            
499.00 51129                           TOFILE(IEOM/LGP008) MBROPT(*REPLACE) +                
500.00 51129                           CRTFILE(*YES)                                         
501.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP009) +                            
502.00 51129                           TOFILE(IEOM/LGP009) MBROPT(*REPLACE) +                
503.00 51129                           CRTFILE(*YES)                                         
504.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP018) +                            
505.00 51129                           TOFILE(IEOM/LGP018) MBROPT(*REPLACE) +                
506.00 51129                           CRTFILE(*YES)                                         
507.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP019) +                            
508.00 51129                           TOFILE(IEOM/LGP019) MBROPT(*REPLACE) +                
509.00 51129                           CRTFILE(*YES)                                         
510.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP050) +                            
511.00 51129                           TOFILE(IEOM/LGP050) MBROPT(*REPLACE) +                
512.00 51129                           CRTFILE(*YES)                                         
513.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP051) +                            
514.00 51129                           TOFILE(IEOM/LGP051) MBROPT(*REPLACE) +                
515.00 51129                           CRTFILE(*YES)                                         
516.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP052) +                            
517.00 51129                           TOFILE(IEOM/LGP052) MBROPT(*REPLACE) +                
518.00 51129                           CRTFILE(*YES)                                         
519.00 51129  /* C5195 */ CPYF       FROMFILE(ZCSERVICE/LGP106) +                            
520.00 51129                           TOFILE(IEOM/LGP106) MBROPT(*REPLACE) +                
521.00 51129                           CRTFILE(*YES)                                         
522.00 51129                                                                                 
523.00 110710              ADDLIBLE   LIB(IEOM)                                               
524.00 90429  /* C9141    Generate Loan Mortagage Files */                                   
525.00 90429              CALL         PGM(IEOM/GLNMORTCL)                                   
526.00 90429                                                                                 
527.00 90706  /* C9215    Remove CHG-180-09 Coding                 */                        
528.00 90608  /* C9180    Generate Report of BCM Top 30 Depositers */                        
529.00 90706  /* C9215    CALL         PGM(IEOM/GENDPSTDTA)        */                        
530.00 90706  /* C9215    Remove CHG-180-09 Coding                 */                        
531.00 90608                                                                                 
532.00 90626  /* C9193    Report for Exposure Total Balance and    */                        
533.00 90626  /* C9193    Collateral Detail Information            */                        
534.00 90626              CALL         PGM(IEOM/GENCRDTA)                                    
535.00 90626                                                                                 
536.00 91029  /*  REFERENCE     :  C9347 (CHG-347-09)                            */          
537.00 91029  /*  DESCRIPTION   :  COPY ZCUSPRO/SCRDPRF FOR MIS                  */          
538.00 91029  /* C9347 */ CPYF       FROMFILE(ZCUSPRO/SCRDPRF) +                             
539.00 91029                           TOFILE(IEOM/SCRDPRF) MBROPT(*REPLACE) +               
540.00 91029                           CRTFILE(*YES)                                         
541.00 91029                                                                                 
542.00 91207  /*  REFERENCE     :  C9347 (CHG-347-09)                            */          
543.00 91207  /*  DESCRIPTION   :  COPY ZCRLINE/LIMUSEPF FOR MIS                 */          
544.00 91207  /* C9347 */ CPYF       FROMFILE(ZCRLINE/LIMUSEPF) +                            
545.00 91207                           TOFILE(IEOM/LIMUSEPF) MBROPT(*REPLACE) +              
546.00 91207                           CRTFILE(*YES)                                         
547.00 100108                                                                                 
548.00 100108  /*  REFERENCE     :  C9385 (CHG-385-09)                            */          
549.00 100108  /*  DESCRIPTION   :  Generate CORP Deposit & Loan Reports          */          
550.00 100108              CALL         PGM(IEOM/GCORPRPT)                                    
551.00 100108                                                                                 
552.00 100114  /* C9388 */ CALL         PGM(IEOM/GSMERPT)                                     
553.00 100114                                                                                 
554.00 170512  /* D7160 D0138  CALL         PGM(IEOM/GENGPRDTA)       */                      
555.00 100702                                                                                 
556.00 100415  /*  REFERENCE     :  D0095 (CHG-095-10)                            */          
557.00 100415  /*  DESCRIPTION   :  COPY ZVIPLIB/HITRTD,HITCUSREF TO IEOM FOR MIS */          
558.00 100415  /* D0095 */ CPYF       FROMFILE(ZVIPLIB/HITRTD) +                              
559.00 100506                           TOFILE(IEOM/HITRTD) MBROPT(*REPLACE) +                
560.00 100415                           CRTFILE(*YES)                                         
561.00 100415              CPYF       FROMFILE(ZVIPLIB/HITCUSREF) +                           
562.00 100415                           TOFILE(IEOM/HITCUSREF) MBROPT(*REPLACE) +             
563.00 100415                           CRTFILE(*YES)                                         
564.00 110126                                                                                 
565.00 110126  /*  REFERENCE     :  D1011 (CHG-011-11)                            */          
566.00 110126  /*  DESCRIPTION   :  Generate association transaction reports      */          
567.00 110126  /* D1011 */ CPYF       FROMFILE(ZOPGLIB/OGOPMAS) +                             
568.00 110126                           TOFILE(IEOM/OGOPMAS) MBROPT(*REPLACE) +               
569.00 110126                           CRTFILE(*YES)                                         
570.00 110126  /* D1011 */ CPYF       FROMFILE(ZCCOLLIB/CCOLMAS) +                            
571.00 110126                           TOFILE(IEOM/CCOLMAS) MBROPT(*REPLACE) +               
572.00 110126                           CRTFILE(*YES)                                         
573.00 160905                                                                                 
574.00 160905                                                                                 
575.00 110201  /* D1011 */ CLRPFM     FILE(IEOM/ASSOCIF)                                      
576.00 110201  /* D1011 */ CLRPFM     FILE(IEOM/ASSOOPG)                                      
577.00 110201  /* D1011 */ CLRPFM     FILE(IEOM/ASSOCCOL)                                     
578.00 110201  /* D1011 */ CALL       PGM(IEOM/GASSOTX)                                       
579.00 111027  /* D1316 */ CALL       PGM(IEOM/MALRPTCL)                                      
580.00 110126                                                                                 
581.00 110926  /*  REFERENCE     :  D1211 (CHG-211-11)                            */          
582.00 110926  /*  DESCRIPTION   :  COPY FILES FOR LIQIDITY REPORT DATA TRANSFER  */          
583.00 110926  /* D1211 */ CPYF       FROMFILE(IPROD/LQWKCCYPF) +                             
584.00 110926                           TOFILE(IEOM/LQWKCCYPF) MBROPT(*REPLACE) +             
585.00 110926                           CRTFILE(*YES)                                         
586.00 110926  /* D1211 */ CPYF       FROMFILE(IPROD/LQLNMTDAT) +                             
587.00 110926                           TOFILE(IEOM/LQLNMTDAT) MBROPT(*REPLACE) +             
588.00 110926                           CRTFILE(*YES)                                         
589.00 110926  /* D1211 */ CPYF       FROMFILE(IPROD/LQTMMTDAT) +                             
590.00 111004                           TOFILE(IEOM/LQTMMTDAT) MBROPT(*REPLACE) +             
591.00 110926                           CRTFILE(*YES)                                         
592.00 110926  /* D1211 */ CPYF       FROMFILE(IPROD/LQMNPF) +                                
593.00 110926                           TOFILE(IEOM/LQMNPF) MBROPT(*REPLACE) +                
594.00 110926                           CRTFILE(*YES)                                         
595.00 110926  /* D1211 */ CPYF       FROMFILE(IPROD/LQPRDPARM) +                             
596.00 110926                           TOFILE(IEOM/LQPRDPARM) MBROPT(*REPLACE) +             
597.00 110926                           CRTFILE(*YES)                                         
598.00 110926  /* D1211 */ CPYF       FROMFILE(IPROD/LQTMPGDAT) +                             
599.00 110926                           TOFILE(IEOM/LQTMPGDAT) MBROPT(*REPLACE) +             
600.00 110926                           CRTFILE(*YES)                                         
601.00 110926  /* D1211 */ CPYF       FROMFILE(IPROD/LQTMRPT1) +                              
602.00 110926                           TOFILE(IEOM/LQTMRPT1) MBROPT(*REPLACE) +              
603.00 110926                           CRTFILE(*YES)                                         
604.00 110926  /* D1211 */ CPYF       FROMFILE(IPROD/TMCFWPRI) +                              
605.00 110926                           TOFILE(IEOM/TMCFWPRI) MBROPT(*REPLACE) +              
606.00 110926                           CRTFILE(*YES)                                         
607.00 111212  /* D1382 */ CPYF       FROMFILE(ZAUTOPAY/ACADBDTL)  +                          
608.00 111212                           TOFILE(IEOM/ACADBDTL) MBROPT(*REPLACE) +              
609.00 111212                           CRTFILE(*YES)                                         
610.00 110126                                                                                 
611.00 120626  /*  REFERENCE     :  D2178 (CHG-178-12)                            */          
612.00 120626  /*  DESCRIPTION   :  GENERATE MONTHLY NEW SMART SALARY REPORT      */          
613.00 120626  /* D2178 */ CALL       PGM(IEOM/GMSMTCL)                                       
614.00 120626                                                                                 
615.00 130226  /* D3013 */ CPYF       FROMFILE(ZCIFLIB/CUDSMCRPT)  +                          
616.00 130226                           TOFILE(IEOM/CUDSMCRPT) MBROPT(*REPLACE) +             
617.00 130226                           CRTFILE(*YES)                                         
618.00 130226                                                                                 
619.00 131126  /*  DESCRIPTION   :  LCR REPORT*/                                              
620.00 131126  /*  D3360 CHANGE TO RUN AT DAILY BASIS*/                                       
621.00 131126  /* D3110 */ /*D3360 CPYF       FROMFILE(IPROD/PFEXRATE) +                      
622.00 131126                           TOFILE(IEOM/PFEXRATE) MBROPT(*REPLACE)    */          
623.00 131126  /* D3110 */ /*D3360 CALL       PGM(IEOM/PFLCRCL)                   */          
624.00 130322                                                                                 
625.00 130425  /*  REFERENCE     :  D3149 (CHG-149-13)                            */          
626.00 130425  /*  DESCRIPTION   :  COPY ZLCCAUT/CRDATPMST TO IEOM                */          
627.00 130425                                                                                 
628.00 130425  /* D3149 */ CPYF       FROMFILE(ZLCCAUT/CRDATPMST) +                           
629.00 130425                           TOFILE(IEOM/CRDATPMST) MBROPT(*REPLACE) +             
630.00 130425                           CRTFILE(*YES)                                         
631.00 130425                                                                                 
632.00 130519  /*  DESCRIPTION   :  COPY IPROD/TATMDPTSUM TO IEOM                 */          
633.00 130519  /* D3173 */ CPYF       FROMFILE(IPROD/TATMDPTSUM) +                            
634.00 130519                           TOFILE(IEOM/TATMDPTSUM) MBROPT(*REPLACE) +            
635.00 130519                           CRTFILE(*YES)                                         
636.00 130801                                                                                 
637.00 130801  /*  REFERENCE     :  D3228 (CHG-228-13)                            */          
638.00 130801  /*  DESCRIPTION   :  GENERATE AMCM MAINLAND REPORT                 */          
639.00 130801  /* D3228 */ CALL       PGM(IEOM/AMCMMCL)                                       
640.00 130801                                                                                 
641.00 130806  /*  DESCRIPTION   :  COPY IPROD/RMTSTSPF TO IEOM                 */            
642.00 130806  /* D3173 */ CPYF       FROMFILE(IPROD/RMTSTSPF) +                              
643.00 130806                          TOFILE(IEOM/RMTSTSPF) MBROPT(*REPLACE) +               
644.00 130806                          CRTFILE(*YES)                                          
645.00 131030                                                                                 
646.00 131030  /*  DESCRIPTION   :  COPY IPROD/NVCIFLIST TO IEOM                 */           
647.00 131030  /* D3345 */ CPYF       FROMFILE(IPROD/NVCIFLIST) +                             
648.00 131030                          TOFILE(IEOM/NVCIFLIST) MBROPT(*REPLACE) +              
649.00 131030                          CRTFILE(*YES)                                          
650.00 130806                                                                                 
651.00 131030  /*  DESCRIPTION   :  COPY ZCLNKFIL/ZPDCRCDC TO IEOM                */          
652.00 131030  /* D3360 */ CPYF       FROMFILE(ZCLNKFIL/ZPDCRCDC) +                           
653.00 131030                           TOFILE(IEOM/ZPDCRCDC) MBROPT(*REPLACE) +              
654.00 131030                           CRTFILE(*YES)                                         
655.00 131030                                                                                 
656.00 131030  /*  DESCRIPTION   :  COPY ZCLNKFIL/ZPDCRCUC TO IEOM                */          
657.00 131030  /* D3360 */ CPYF       FROMFILE(ZCLNKFIL/ZPDCRCUC) +                           
658.00 131030                           TOFILE(IEOM/ZPDCRCUC) MBROPT(*REPLACE) +              
659.00 131030                           CRTFILE(*YES)                                         
660.00 131030                                                                                 
661.00 131126  /*  DESCRIPTION   :  COPY IPROD/LQLNPERTT   TO IEOM                */          
662.00 131126  /* D3360 */ CPYF       FROMFILE(IPROD/LQLNPERTT) +                             
663.00 131126                           TOFILE(IEOM/LQLNPERTT) MBROPT(*REPLACE) +             
664.00 131126                           CRTFILE(*YES)                                         
665.00 131126                                                                                 
666.00 131030  /*  REFERENCE     :  D3360 (CHG-360-13)                            */          
667.00 131030  /*  DESCRIPTION   :  GENERATE AMCM MATURITY MISMATCH OF DSB REPORT */          
668.00 131030  /* D3360 */ CALL       PGM(IEOM/MTMRPT)                                        
669.00 131030                                                                                 
670.00 131030  /*  REFERENCE     :  D3360 (CHG-382-13)                            */          
671.00 131030  /*  DESCRIPTION   :  GENERATE AMCM TEN LARGEST DEPOSITORS&BORROWER*/           
672.00 131126  /* D3382 */ /*D3416 CALL       PGM(IEOM/MTLRPT)                    */          
673.00 131121                                                                                 
674.00 131121  /*  REFERENCE     :  D3415 (CHG-415-13)                            */          
675.00 131121  /*  DESCRIPTION   :  COPY IPROD/LNCFWPRI TO IEOM                   */          
676.00 131121  /* D3415 */ CPYF       FROMFILE(IPROD/LNCFWPRI) +                              
677.00 131121                           TOFILE(IEOM/LNCFWPRI) MBROPT(*REPLACE) +              
678.00 131121                           CRTFILE(*YES)                                         
679.00 131209  /* D3415 */ CPYF       FROMFILE(IPROD/NVCIFLIST) +                             
680.00 131209                           TOFILE(IEOM/NVCIFLIST) MBROPT(*REPLACE) +             
681.00 131209                           CRTFILE(*YES)                                         
682.00 131030                                                                                 
683.00 140701  /*  REFERENCE     :  D4200 (CHG-200-14)                            */          
684.00 140701  /*  DESCRIPTION   :  GENERATE CREDIT CARD AUTOPAY INSTRUCTION FILE*/           
685.00 140701  /* D4200*/          CALL       PGM(IEOM/CACRDTACL)                             
686.00 140701                                                                                 
687.00 140730                                                                                 
688.00 140730  /* D4037 */ CPYF       FROMFILE(ZDORMANT/DOTOACDTBK) +                         
689.00 140730                           TOFILE(IEOM/DOTOACDTBK) MBROPT(*REPLACE) +            
690.00 140730                           CRTFILE(*YES)                                         
691.00 140730                                                                                 
692.00 141014  /*D4344     CPYF       FROMFILE(ZAUTOPAY/ACPTYDTLM) +                          
693.00 141014    D4374                  TOFILE(IEOM/ACPTYDTL) MBROPT(*REPLACE) +              
694.00 141014                           CRTFILE(*YES)                             */          
695.00 140923                                                                                 
696.00 141014  /*D4344     CPYF       FROMFILE(ZAUTOPAY/ACADBDTLM) +                          
697.00 141014    D4374                  TOFILE(IEOM/ACADBDTL) MBROPT(*REPLACE) +              
698.00 141014                           CRTFILE(*YES)                             */          
699.00 140923                                                                                 
700.00 150112 /*D4467*/   CPYF       FROMFILE(ZCRLINE/CRLLNDT) +                              
701.00 150112                          TOFILE(IEOM/CRLLNDT) MBROPT(*REPLACE) +                
702.00 150112                          CRTFILE(*YES)                                          
703.00 150206                                                                                 
704.00 150206 /*D5028*/   CPYF       FROMFILE(ZISTOCK/ISTKSUBACC) +                           
705.00 150206                          TOFILE(IEOM/ISTKSUBACC) MBROPT(*REPLACE) +             
706.00 150206                          CRTFILE(*YES)                                          
707.00 150206                                                                                 
708.00 150206 /*D5028*/   CPYF       FROMFILE(ZISTOCK/ISTKACC) +                              
709.00 150206                          TOFILE(IEOM/ISTKACC) MBROPT(*REPLACE) +                
710.00 150206                          CRTFILE(*YES)                                          
711.00 150206                                                                                 
712.00 150206 /*D5028*/   CPYF       FROMFILE(ZISTOCK/ISTKINFO) +                             
713.00 150206                          TOFILE(IEOM/ISTKINFO) MBROPT(*REPLACE) +               
714.00 150206                          CRTFILE(*YES)                                          
715.00 150226                                                                                 
716.00 150226 /*D5053*/   CPYF       FROMFILE(IPROD/CSMCRSPF) +                               
717.00 150226                          TOFILE(IEOM/CSMCRSPF) MBROPT(*REPLACE) +               
718.00 150226                          CRTFILE(*YES)                                          
719.00 150112                                                                                 
720.00 150721 /*D5239*/   CPYF       FROMFILE(IPROD/UDNODPF) +                                
721.00 150721                          TOFILE(IEOM/UDNODPF) MBROPT(*REPLACE) +                
722.00 150721                          CRTFILE(*YES)                                          
723.00 150721                                                                                 
724.00 140923  /*  REFERENCE     :  D4344 (CHG-345-14)                            */          
725.00 140923  /*  DESCRIPTION   :  GENERATE AUTOPAY MONTHLY REPORT               */          
726.00 141014  /* D4344D4374       CALL       PGM(IEOM/EMPATPMCL)                 */          
727.00 140923                                                                                 
728.00 140923  /*  REFERENCE     :  D4345 (CHG-345-14)                            */          
729.00 140923  /*  DESCRIPTION   :  GENERATE PAYROLL CAMPAIGN PORTFOLIO MONTH REPORT */       
730.00 141014  /* D4345D4374       CALL       PGM(IEOM/EMPATPCMPM)                */          
731.00 141119                                                                                 
732.00 141119  /*  REFERENCE     :  D4435 (CHG-435-14)                            */          
733.00 141119  /*  DESCRIPTION   :  GENERATE TABLE FOR ACTIVE ACCOUNT AND ADD     */          
734.00 141119  /*                   COLUMN TO SHOW ACTIVE ACCOUNT IN SCC FILE     */          
735.00 141119  /* D4435*/          CALL       PGM(IEOM/PATVACCCL)                             
736.00 141119  /* D4435*/          CALL       PGM(IEOM/SCCLSTCL)                              
737.00 141121  /* D4435*/          CALL       PGM(IEOM/PUPDRSKRPT)                            
738.00 141201                                                                                 
739.00 141201  /*  REFERENCE     :  D4476 (CHG-476-14)                            */          
740.00 141201  /*  DESCRIPTION   :  DEPOSIT LINKED MONTHLY REPORT                 */          
741.00 141202  /* D4476 */          CALL      PGM(IEOM/DEPLNKRPT )                            
742.00 141217                                                                                 
743.00 141217  /*  REFERENCE     :  D4483 (CHG-483-14)                            */          
744.00 141217  /*  DESCRIPTION   :  AML STATISTICS RISK REPORT                    */          
745.00 141217  /* D4483 */          CALL      PGM(IEOM/AMLSCCL)                               
746.00 150522                                                                                 
747.00 150522  /*  REFERENCE     :  D4356 (CHG-356-14)                            */          
748.00 150522  /*  DESCRIPTION   :  IN-HOUSE HOUSEKEEPING PROGRAM                 */          
749.00 150522  /* D4356 */          SBMJOB     CMD(CALL PGM(IEOM/HKEJOBCL)) +                 
750.00 150522  /* D4356 */                         JOB(HKEJOBCL) JOBQ(QBATCH)                 
751.00 141217                                                                                 
752.00 150709 /*D5141*/    CPYF       FROMFILE(ZLCREDIT/FINT1) +                              
753.00 150709                          TOFILE(IEOM/FINT1) MBROPT(*REPLACE) +                  
754.00 150709                          CRTFILE(*YES)                                          
755.00 150709 /*D5141*/    CPYF       FROMFILE(ZLCREDIT/FINT2) +                              
756.00 150709                          TOFILE(IEOM/FINT2) MBROPT(*REPLACE) +                  
757.00 150709                          CRTFILE(*YES)                                          
758.00 150709 /*D5141*/    CPYF       FROMFILE(ZLCREDIT/FINT3) +                              
759.00 150709                          TOFILE(IEOM/FINT3) MBROPT(*REPLACE) +                  
760.00 150709                          CRTFILE(*YES)                                          
761.00 150819                                                                                 
762.00 150819 /*  REFERENCE     :  D5274 (CHG-274-15)                            */           
763.00 150819 /*  DESCRIPTION   :  OPG CALL-BACK CONFIRMATION MONITORING REPORT  */           
764.00 150819 /* D5274 */  CPYF       FROMFILE(ZOPGLIB/OGCBPF) +                              
765.00 150819                          TOFILE(IEOM/OGCBPF) MBROPT(*REPLACE) +                 
766.00 150819                          CRTFILE(*YES)                                          
766.01 170801 /* D7258 */  MONMSG     MSGID( CPF2817)                                         
767.00 150819                                                                                 
768.00 150917 /*  REFERENCE     :  D5275 (CHG-275-15)                            */           
769.00 150917 /*  DESCRIPTION   :  GET CIF POSITION DATA                         */           
770.00 150917 /* D5275 */ CPYF       FROMFILE(IPROD/PFOCIFPF)+                                
771.00 150917 /* D5275 */             TOFILE(IEOM/PFOCIFPF) MBROPT(*REPLACE) +                
772.00 150917 /* D5275 */             CRTFILE(*YES)                                           
773.00 150917 /* D5275 */ CPYF       FROMFILE(IPROD/PFOVIPRUPF)+                              
774.00 150917 /* D5275 */             TOFILE(IEOM/PFOVIPRUPF) MBROPT(*REPLACE) +              
775.00 150917 /* D5275 */             CRTFILE(*YES)                                           
776.00 150917                                                                                 
777.00 150917 /*  REFERENCE     :  D5323 (CHG-323-15)                            */           
778.00 150917 /*  DESCRIPTION   :  EXTRACT NON-VIP CUSTOMER ANALYSIS DATA        */           
779.00 150922 /* D5323 */  CPYF       FROMFILE(IPROD/NVCUSASPF) +                             
780.00 150922                          TOFILE(IEOM/NVCUSASPF) MBROPT(*REPLACE) +              
781.00 150917                          CRTFILE(*YES)                                          
782.00 150917                                                                                 
783.00 160121 /*  REFERENCE     :  D5467 (CHG-467-15)                            */           
784.00 160121 /*  DESCRIPTION   :  MONTHLY STATISTIC OF REMITTANCES              */           
785.00 160121 /* D5467 */  CPYF       FROMFILE(IPROD/GRMSTAPF) +                              
786.00 160121                          TOFILE(IEOM/GRMSTAPF) MBROPT(*REPLACE) +               
787.00 160121                          CRTFILE(*YES)                                          
788.00 160121                                                                                 
789.00 160308 /*        REFERENCE NO. : D6080 (CHG-080-16)                            */      
790.00 160308 /*        PURPOSE       : EXTRACT CREDIT CARD REPORT                    */      
791.00 160308 /*D6080*/    CALL       PGM(IEOM/EXCRDCL)                                       
792.00 160909                                                                                 
793.00 160909 /*        REFERENCE NO. : D6219 (CHG-219-16)                            */      
794.00 160909  /* D6219 */ CPYF       FROMFILE(ZOTRMAPP/OMOPMAS) +                            
795.00 160909                           TOFILE(IEOM/OMOPMAS) MBROPT(*REPLACE) +               
796.00 160909                           CRTFILE(*YES)                                         
797.00 160909                                                                                 
798.00 160909  /* D6219 */ CPYF       FROMFILE(ZOTRMAPP/OMOPSWIFT) +                          
799.00 160909                           TOFILE(IEOM/OMOPSWIFT) MBROPT(*REPLACE) +             
800.00 160909                           CRTFILE(*YES)                                         
801.00 160919                                                                                 
802.00 160919  /*        REFERENCE NO. : D6294 (CHG-294-16)                            */     
803.00 160919  /*        PURPOSE       : MONTHLY OVERDRAFT OUTSTANDING REPORT          */     
804.00 160919  /*D6294*/   CALL       PGM(IEOM/ODOUTSTCL)                                     
805.00 161107                                                                                 
806.00 161107 /*        REFERENCE NO. : D6313 (CHG-313-16)                            */      
807.00 161107 /*        PURPOSE       : Loan Repayment Monthly Report                 */      
808.00 161107 /*D6313*/    CALL       PGM(IEOM/LPSCL)                                         
809.00 161107                                                                                 
810.00 161202 /*        REFERENCE NO. : D6386 (CHG-386-16)                            */      
811.00 161202  /* D6386 */ CPYF       FROMFILE(I700BCM/CBGRPINFO) +                           
812.00 161202                           TOFILE(IEOM/CBGRPINFO) MBROPT(*REPLACE) +             
813.00 161202                           CRTFILE(*YES)                                         
814.00 170220                                                                                 
815.00 170220  /*        REFERENCE NO. : D7048 (CHG-048-17)                            */     
816.00 170220  /*        PURPOSE       : COPY STOCK RELATED FILES TO IEOM              */     
817.00 170220  /* D7048 */ CPYF       FROMFILE(ZISTOCK/ICUSTSTK) +                            
818.00 170220                           TOFILE(IEOM/ICUSTSTK) MBROPT(*REPLACE) +              
819.00 170220                           CRTFILE(*YES)                                         
820.00 170220  /* D7048 */ CPYF       FROMFILE(ZISTOCK/IMTRANSB) +                            
821.00 170220                           TOFILE(IEOM/IMTRANSB) MBROPT(*REPLACE) +              
822.00 170220                           CRTFILE(*YES)                                         
823.00 170220  /* D7048 */ CPYF       FROMFILE(IPROD/EMPSTKACC) +                             
824.00 170220                           TOFILE(IEOM/EMPSTKACC) MBROPT(*REPLACE) +             
825.00 170220                           CRTFILE(*YES)                                         
826.00 170220  /* D7048 */ CPYF       FROMFILE(IPROD/EMPSTKPRF) +                             
827.00 170220                           TOFILE(IEOM/EMPSTKPRF) MBROPT(*REPLACE) +             
828.00 170220                           CRTFILE(*YES)                                         
829.00 170220  /* D7048 */ CPYF       FROMFILE(IPROD/EMPSTKTX) +                              
830.00 170220                           TOFILE(IEOM/EMPSTKTX) MBROPT(*REPLACE) +              
831.00 170220                           CRTFILE(*YES)                                         
832.00 170502                                                                                 
833.00 170502 /*        REFERENCE NO. : D7151 (CHG-151-17)                            */      
834.00 170502 /*        PURPOSE       : DSF Tax Refund Monthly Statistic Report       */      
835.00 170502 /*D7151*/    CALL       PGM(IEOM/DSFSTTCL)                                      
836.00 170512                                                                                 
837.00 170512 /*        REFERENCE NO. : D7160 (CHG-160-17)                            */      
838.00 170512 /*        PURPOSE       : COPY STOCK RELATED FILES TO IEOM              */      
839.00 170512 /* D7160 */  CPYF       FROMFILE(IPROD/GPORRST) +                               
840.00 170512                           TOFILE(IEOM/GPORRST) MBROPT(*REPLACE) +               
841.00 170512                           CRTFILE(*YES)                                         
842.00 170512 /* D7160 */  CPYF       FROMFILE(IPROD/GPORLNDTL) +                             
843.00 170512                           TOFILE(IEOM/GPORLNDTL) MBROPT(*REPLACE) +             
844.00 170512                           CRTFILE(*YES)                                         
845.00 170512 /* D7160 */  CPYF       FROMFILE(IPROD/GPRCOLAPP) +                             
846.00 170512                           TOFILE(IEOM/GPRCOLAPP) MBROPT(*REPLACE) +             
847.00 170512                           CRTFILE(*YES)                                         
848.00 170512                                                                                 
849.00 170519  /*        REFERENCE NO. : D7172 (CHG-172-17)                            */     
850.00 170519  /*        PURPOSE       : COPY IPROD/PRMLYDTA FILES TO IEOM             */     
851.00 170605  /* D7172 D7172 CPYF       FROMFILE(IPROD/PRMLYDTA) +                    */     
852.00 170605  /* D7172                 TOFILE(IEOM/PRMLYDTA) MBROPT(*REPLACE) +       */     
853.00 170605  /* D7172                 CRTFILE(*YES)                                  */     
854.00 170605  /* D7172 */ CALL       PGM(IEOM/PRMLYCL)                                       
855.00 170704                                                                                 
856.00 170704  /*        REFERENCE NO. : D7195 (CHG-195-17)                            */     
857.00 170704  /* D7195 */ CPYF       FROMFILE(ZCIFLIB/GRMCIFPF  ) +                          
858.00 170704                           TOFILE(IEOM/GRMCIFPF ) MBROPT(*REPLACE) +             
859.00 170704                           CRTFILE(*YES)                                         
860.00 170704                                                                                 
861.00 170704  /* D7195 */ CPYF       FROMFILE(ZCIFLIB/GRMMSTPF  ) +                          
862.00 170704                           TOFILE(IEOM/GRMMSTPF ) MBROPT(*REPLACE) +             
863.00 170704                           CRTFILE(*YES)                                         
864.00 170704                                                                                 
865.00 170704  /* D7195 */ CPYF       FROMFILE(ZECSDLIB/ECSDPF   ) +                          
866.00 170704                           TOFILE(IEOM/ECSDPF   ) MBROPT(*REPLACE) +             
867.00 170704                           CRTFILE(*YES)                                         
868.00 170704                                                                                 
868.01 170801  /*        REFERENCE NO. : D7258 (CHG-258-17)                            */     
868.02 170801  /* D7258 */ CPYF       FROMFILE(IMOBLIB/FAMASPF   ) +                          
868.03 170801                           TOFILE(IEOM/FAMASPF  ) MBROPT(*REPLACE) +             
868.04 170801                           CRTFILE(*YES)                                         
868.05 170801                                                                                 
868.06 170801  /* D7258 */ CPYF       FROMFILE(IMOBLIB/FATYPPF   ) +                          
868.07 170801                           TOFILE(IEOM/FATYPPF  ) MBROPT(*REPLACE) +             
868.08 170801                           CRTFILE(*YES)                                         
868.09 170801                                                                                 
869.00 825              ENDDO                                                              
870.00 825                                                                                 
871.00 825  MARKEND:    CALL       PGM(OPTEND) PARM(&MNUOPT &PROMPT &REPLY)                
872.00 825                                                                                 
873.00 825              RMVLIBLE   LIB(IMODULE)                                            
874.00 110601              RMVLIBLE   LIB(IEOM)                                               
875.00 825                                                                                 
876.00 825  EXIT:       ENDPGM                                                             
