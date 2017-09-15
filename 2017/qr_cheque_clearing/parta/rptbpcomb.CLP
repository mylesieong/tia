1.00 991122 /*                                                                 */           
2.00 401 /*        Program ID.   : RPTBPCOMB                                */           
3.00 401 /*        Program Name  : Reporting before running PCOMBDAILY      */           
4.00 991122 /*        Functions     :                                          */           
5.00 991122 /*                                                                 */           
6.00 401 /*        Author        : Kenneth Ho                               */           
7.00 401 /*        Date written  : 2000 APR 01                              */           
8.00 10317 /*                                                                 */           
9.00 10317 /*                                                                 */           
10.00 10319 /*        Reference No. : CH027                                    */           
11.00 10317 /*        User ID       : B422                                     */           
12.00 10317 /*        User Name     : Anthony Kam                              */           
13.00 10317 /*        Changed Date  : 19-Mar-2001                              */           
14.00 10319 /*        Purpose       : For adding Marketing Saving+ Compaign    */           
15.00 10319 /*                        REPORT for Amaral open day.              */           
16.00 10319 /*                        Review and Delete outdated Saving+       */           
17.00 10319 /*                        Compaign Report                          */           
18.00 10620 /*        Changed Date  : 20-Jun-2001                              */           
19.00 10620 /*        Purpose       : Remove the program as the Campaign       */           
20.00 10620 /*                        is finished                              */           
21.00 10317 /*-----------------------------------------------------------------*/           
22.00 10420 /*        Reference No. : CH045                                    */           
23.00 10420 /*        User ID       : B435                                     */           
24.00 10420 /*        User Name     : Sam Sam                                  */           
25.00 10420 /*        Changed Date  : 20-Apr-2001                              */           
26.00 10420 /*        Purpose       : For adding Marketing Saving+ Bonus       */           
27.00 10420 /*                        Campaign report for memo no.083/2001     */           
28.00 10420 /*                                                                 */           
29.00 10504 /*-----------------------------------------------------------------*/           
30.00 10504 /*        Reference No. : CH057                                    */           
31.00 10504 /*        User ID       : B435                                     */           
32.00 10504 /*        User Name     : Sam Sam                                  */           
33.00 10504 /*        Changed Date  : 4-MAY-2001                               */           
34.00 10504 /*        Purpose       : List information of bad debt loan        */           
35.00 10504 /*                        settlement account                       */           
36.00 10504 /*                                                                 */           
37.00 991122 /*-----------------------------------------------------------------*/           
38.00 10504 /*        Reference No. : TA057                                    */           
39.00 10504 /*        User ID       : B417                                     */           
40.00 10504 /*        User Name     : Bill Ieong                               */           
41.00 10504 /*        Changed Date  : 4-MAY-2001                               */           
42.00 10504 /*        Purpose       : Report show all cheque with stop payment */           
43.00 10504 /*                        and suspects transaction from BT         */           
44.00 10504 /*                                                                 */           
45.00 10504 /*-----------------------------------------------------------------*/           
46.00 10504 /*        Reference No. : TA058                                    */           
47.00 10504 /*        User ID       : B417                                     */           
48.00 10504 /*        User Name     : Bill Ieong                               */           
49.00 10504 /*        Changed Date  : 4-MAY-2001                               */           
50.00 10504 /*        Purpose       : Report show all transaction with cheque  */           
51.00 10504 /*                        no out of range                          */           
52.00 10504 /*                                                                 */           
53.00 10516 /*-----------------------------------------------------------------*/           
54.00 10516 /*        Reference No. : TM062                                    */           
55.00 10516 /*        User ID       : B436                                     */           
56.00 10516 /*        User Name     : Otto Chao                                */           
57.00 10516 /*        Changed Date  : 16-MAY-2001                              */           
58.00 10516 /*        Purpose       : Report show Time daily transactin        */           
59.00 10516 /*                    (TC includes 50/79/82/83/86/91/92/93/96/81)  */           
60.00 10516 /*                                                                 */           
61.00 10526 /*-----------------------------------------------------------------*/           
62.00 10526 /*        Reference No. : CH077                                    */           
63.00 10526 /*        User ID       : B435                                     */           
64.00 10526 /*        User Name     : Sam Sam                                  */           
65.00 10526 /*        Changed Date  : 26-MAY-2001                              */           
66.00 10526 /*        Purpose       : Report for 5th Open Day at               */           
67.00 10526 /*                        Horta e Costa (memo 120/2001)            */           
68.00 10526 /*-----------------------------------------------------------------*/           
69.00 10615 /*        Reference No. : CH073                                    */           
70.00 10615 /*        User ID       : B435                                     */           
71.00 10615 /*        User Name     : Sam Sam                                  */           
72.00 10615 /*        Changed Date  : 11-JUNE-2001                             */           
73.00 10615 /*        Purpose       : Posting Bonus Interest to Savings+ A/Cs  */           
74.00 10615 /*                        for 4th Open Day (memo 112/2001)         */           
75.00 10620 /*        Changed Date  : 20-June-2001                             */           
76.00 10620 /*        Purpose       : Remove the program as the Campaign is    */           
77.00 10620 /*                        finished                                 */           
78.00 10615 /*-----------------------------------------------------------------*/           
79.00 10619 /*        Reference No. : CH071                                    */           
80.00 10619 /*        User ID       : B435                                     */           
81.00 10619 /*        User Name     : Sam Sam                                  */           
82.00 10619 /*        Changed Date  : 19-JUNE-2001                             */           
83.00 10619 /*        Purpose       : Posting Bonus Interest to Savings+ A/Cs  */           
84.00 10619 /*                        for Savings+ Bonus Interest Campaign 2001*/           
85.00 10619 /*                                                                 */           
86.00 10619 /*-----------------------------------------------------------------*/           
87.00 10619 /*        Reference No. : CH077                                    */           
88.00 10619 /*        User ID       : B435                                     */           
89.00 10619 /*        User Name     : Sam Sam                                  */           
90.00 10619 /*        Changed Date  : 19-JUNE-2001                             */           
91.00 10619 /*        Purpose       : Posting Bonus Interest to Savings+ A/Cs  */           
92.00 10619 /*                        for 5th Open Day (memo 120/2001)         */           
93.00 10619 /*                                                                 */           
94.00 10714 /*-----------------------------------------------------------------*/           
95.00 10714 /*        Reference No. : CH103                                    */           
96.00 10714 /*        User ID       : B417                                     */           
97.00 10714 /*        User Name     : Bill Ieong                               */           
98.00 10714 /*        Changed Date  : 14-July-2001                             */           
99.00 10714 /*        Purpose       : Time Deposit daily movement over         */           
100.00 10714 /*                        100,000 Mop report                       */           
101.00 10731 /*-----------------------------------------------------------------*/           
102.00 10731 /*        Reference No. : CH116                                    */           
103.00 10731 /*        User ID       : B168PGM                                  */           
104.00 10731 /*        User Name     : Thomas Chan                              */           
105.00 10731 /*        Changed Date  : 31-July-2001                             */           
106.00 10731 /*        Purpose       : Saving+ interest adjustment (+1%)        */           
107.00 10714 /*-----------------------------------------------------------------*/           
108.00 10823  /*-----------------------------------------------------------------*/          
109.00 10823  /*        Reference No. : CH130                                    */          
110.00 10823  /*        User ID       : B323PGM                                  */          
111.00 10823  /*        User Name     : edward cheung                            */          
112.00 10823  /*        Changed Date  : 23-aug-2001                              */          
113.00 10823  /*        Purpose       : Revise Hong Kong Cash Commission Report  */          
114.00 10823  /*                        Query Logic                              */          
115.00 10823  /*-----------------------------------------------------------------*/          
116.00 11023  /*        Reference No. : CR022                                    */          
117.00 11023  /*        User ID       : B422PGM                                  */          
118.00 11023  /*        User Name     : Antony Kam                               */          
119.00 11023  /*        Changed Date  : 23-Oct-2001                              */          
120.00 11023  /*        Purpose       : Incomplete CIF report                    */          
121.00 11023  /*-----------------------------------------------------------------*/          
122.00 11212  /*        Reference No. : CH190                                    */          
123.00 11212  /*        User ID       : B323PGM                                  */          
124.00 11212  /*        User Name     : edward cheung                            */          
125.00 11212  /*        Changed Date  : 12-Dec-2001                              */          
126.00 11212  /*        Purpose       : Eximbills Cross Currency Deal Report     */          
127.00 11212  /*-----------------------------------------------------------------*/          
128.00 20204  /*-----------------------------------------------------------------*/          
129.00 20204  /*        Reference No. : CH028                                    */          
130.00 20204  /*        User ID       : B323                                     */          
131.00 20204  /*        User Name     : edward cheung                            */          
132.00 20204  /*        Changed Date  : 1-feb-2002                               */          
133.00 20204  /*        Changes       : add loan extenstion maturity checking    */          
134.00 20204  /*                        routine                                  */          
135.00 20204  /*                                                                 */          
136.00 20204  /*-----------------------------------------------------------------*/          
137.00 20619  /*        Reference No. : C2092 (CHG-092-02)                       */          
138.00 20619  /*        User ID       : B417PGM                                  */          
139.00 20619  /*        User Name     : Bill Ieong                               */          
140.00 20619  /*        Changed Date  : 17-June-2002                             */          
141.00 20619  /*        Purpose       : generate CUP051 information before PCOMB */          
142.00 20619  /*-----------------------------------------------------------------*/          
143.00 20625  /*        Reference No. : C2051 (CHG-051-02)                       */          
144.00 20625  /*        User ID       : B168PGM                                  */          
145.00 20625  /*        User Name     : Thomas Chan                              */          
146.00 20625  /*        Changed Date  : 25-JUN-2002                              */          
147.00 20625  /*        Purpose       : Add call to print Smart Salary without   */          
148.00 20625  /*                        payroll report.                          */          
149.00 20625  /*-----------------------------------------------------------------*/          
150.00 20702  /*        Reference No. : C2098 (CHG-098-02)                       */          
151.00 20702  /*        User ID       : B461PGM                                  */          
152.00 20702  /*        User Name     : Raymond Wong                             */          
153.00 20702  /*        Changed Date  : 29-JUN-2002                              */          
154.00 20702  /*        Purpose       : Print ICBS and WorkFlow Groups and Roles */          
155.00 20702  /*                        report.                                  */          
156.00 20702  /*-----------------------------------------------------------------*/          
157.00 21218  /*        Reference No. : C2135 (CHG-135-02)                       */          
158.00 21218  /*        User ID       : B168PGM                                  */          
159.00 21218  /*        User Name     : THOMAS                                   */          
160.00 21218  /*        Changed Date  : 18-DEC-2002                              */          
161.00 21218  /*        Purpose       : Add calling to ZTMLIB/FXGCERTCL to print */          
162.00 21218  /*                        fixed rate deposit certificate.          */          
163.00 21218  /*-----------------------------------------------------------------*/          
164.00 30430  /*        Reference No. : C3057 (CHG-057-03)/ITR-082-03            */          
165.00 30430  /*        User ID       : B168PGM                                  */          
166.00 30430  /*        User Name     : THOMAS                                   */          
167.00 30430  /*        Changed Date  : 30-APR-2003                              */          
168.00 30430  /*        Purpose       : Remove calling to ZSAVPLUS/SVINTADJCL    */          
169.00 30430  /*                        because no interest adjustment for the   */          
170.00 30430  /*                        saving+ accounts for the balance < 2500  */          
171.00 30430  /*                        starting from 1st April 2003.            */          
172.00 30531  /*        Date to resume: 31-May-2003 - related ref: CH116         */          
173.00 30531  /*        Purpose       : resume the process for advancing date in */          
174.00 30531  /*                        dataarea for Saving+ Process             */          
175.00 30430  /*-----------------------------------------------------------------*/          
176.00 30703  /*        Reference No. : C3081 (CHG-081-03)                       */          
177.00 30703  /*        User ID       : B417PGM                                  */          
178.00 30703  /*        User Name     : Bill Ieong                               */          
179.00 30703  /*        Changed Date  : 03-July-2003                             */          
180.00 30703  /*        Purpose       : generate the ALL POD Txn report          */          
181.00 30703  /*-----------------------------------------------------------------*/          
182.00 30721  /*        Reference No. : C3085 (CHG-085-03)                       */          
183.00 30721  /*        User ID       : B168PGM                                  */          
184.00 30721  /*        User Name     : THOMAS                                   */          
185.00 30721  /*        Changed Date  : 21-JUL-2003                              */          
186.00 30721  /*        Purpose       : Add calling to ZTMLIB/DEPGCERTCL to print*/          
187.00 30721  /*                        FX/Equity link deposit confirmation.     */          
188.00 30721  /*-----------------------------------------------------------------*/          
189.00 40424  /*        Reference No. : C4025 (CHG-025-04)                       */          
190.00 40424  /*        User ID       : B168PGM                                  */          
191.00 40424  /*        User Name     : THOMAS                                   */          
192.00 40424  /*        Changed Date  : 24-APR-2004                              */          
193.00 40424  /*        Purpose       : Add EODPROCESS for FX loan:              */          
194.00 40424  /*                      - Daily Re-evaluation                      */          
195.00 40424  /*                      - Print FX loan & FX time deposit confirmation */      
196.00 40424  /*                      - Rate change for FX time                  */          
197.00 40424  /*-----------------------------------------------------------------*/          
198.00 50226  /*        Reference No. : C5023 (CHG-023-05)                       */          
199.00 50223  /*        User ID       : B323PGM                                  */          
200.00 50223  /*        User Name     : edward cheung                            */          
201.00 50223  /*        Changed Date  : 25-feb-2005                              */          
202.00 50223  /*        Purpose       : change running query for HK CASH report  */          
203.00 50223  /*                      - due to Chinese Statement Project         */          
204.00 50223  /*-----------------------------------------------------------------*/          
205.00 50226  /*        Reference No. : C5024 (CHG-024-05)                       */          
206.00 50226  /*        User ID       : B505PGM                                  */          
207.00 50226  /*        User Name     : Paris Che                                */          
208.00 50226  /*        Changed Date  : 25-Feb-2005                              */          
209.00 50226  /*        Purpose       : Add PCS Statement Control Reports        */          
210.00 50226  /*-----------------------------------------------------------------*/          
211.00 50617  /*        Reference No. : C5084 (CHG-084-05)                       */          
212.00 50617  /*        User ID       : B323PGM                                  */          
213.00 50617  /*        User Name     : edward cheung                            */          
214.00 50617  /*        Changed Date  : 25-Feb-2005                              */          
215.00 50617  /*        Purpose       : Add Deposit Report for other currencies  */          
216.00 50617  /*-----------------------------------------------------------------*/          
217.00 50720  /*        Reference No. : C5105 (CHG-084-05)                       */          
218.00 50720  /*        User ID       : B323PGM                                  */          
219.00 50720  /*        User Name     : edward cheung                            */          
220.00 50720  /*        Changed Date  : 20-July-2005                              */         
221.00 50720  /*        Purpose       : Add hong Kong Commission Calculation module*/        
222.00 50720  /*-----------------------------------------------------------------*/          
223.00 60106  /*-----------------------------------------------------------------*/          
224.00 60106  /*        Reference No. : C5223 (CHG-223-05)                       */          
225.00 60106  /*        User ID       : B454PGM                                  */          
226.00 60106  /*        User Name     : ARIES LUNG                               */          
227.00 60106  /*        Changed Date  : 03-JAN-2006                              */          
228.00 60111  /*        Purpose       : CONVERT QRY SEARCH TO RPGLE CODING SEARCH*/          
229.00 60106  /*                        GENERATE A REPORT THAT AGGREGATE DEPOSIT */          
230.00 60106  /*                        EXCEEDS 50000 OF ALL TRANSACTION ACCOUNTS*/          
231.00 60106  /*                        OWNED BY SAME SOLE OWNER OR A GROUP OF   */          
232.00 60106  /*                        SAME OWNERS AND CALCULATE THE COMMISSION */          
233.00 60106  /*                        ACCORDING TO THE PREVAILING RATE.        */          
234.00 60111  /*                                                                 */          
235.00 60111  /*                        MOP,HKD AND OTHER CCY DEPOSIT TO TA REPORT*/         
236.00 60111  /*                        WILL NOT DISPLAY ALL SYSTEM DEFAULT       */         
237.00 60111  /*                        DESCRIPTION TRANSACTIONS.                 */         
238.00 60111  /*                                                                  */         
239.00 60111  /*                                                                  */         
240.00 60106  /*-----------------------------------------------------------------*/          
241.00 61003  /*        Reference No. : C6270 (CHG-270-06)                       */          
242.00 61003  /*        User ID       : B657PGM  & B323PGM        */                         
243.00 61003  /*        User Name     : MATTHEW SONG & edward cheung         */              
244.00 61003  /*        Changed Date  : 03-OCT-2006                              */          
245.00 61003  /*        Purpose       : Add Branch Insured Limit Report          */          
246.00 70808  /*-----------------------------------------------------------------*/          
247.00 70808  /*        Reference No. : C7224 (CHG-224-07)                       */          
248.00 70808  /*        User ID       : B323PGM                              */              
249.00 70808  /*        User Name     : edward cheung                        */              
250.00 70808  /*        Changed Date  : 08-AUG-2007                              */          
251.00 70808  /*        Purpose       : FIX PST00101                             */          
252.00 61003  /*-----------------------------------------------------------------*/          
253.00 71108  /*        Reference No. : C7283 (CHG-283-07)                       */          
254.00 71108  /*        User ID       : B729PGM                              */              
255.00 71108  /*        User Name     : KYLIE LEONG                          */              
256.00 71108  /*        Changed Date  : 08-NOV-2007                              */          
257.00 71108  /*        Purpose       : GENERATE A FX BUY/SELL RATE IN CUREXRTE  */          
258.00 71108  /*-----------------------------------------------------------------*/          
259.00 71203  /*        REFERENCE NO. : C7352 (CHG-352-07)                       */          
260.00 71203  /*        USER ID       : B784PGM                              */              
261.00 71203  /*        USER NAME     : SUN NG                                */             
262.00 71203  /*        CHANGED DATE  : 03-DEC-2007                              */          
263.00 71203  /*        PURPOSE       : STOP GENERATE "TRANSACTION ACCOUNT INPUT  */         
264.00 71203  /*                        DESCRITPITON CONTROL REPORT"             */          
265.00 71203  /*-----------------------------------------------------------------*/          
266.00 80731  /*        REFERENCE NO. : C8173 (CHG-173-08)                       */          
267.00 80729  /*        USER ID       : B552PGM                                  */          
268.00 80729  /*        USER NAME     : CARMEN LEI                               */          
269.00 80729  /*        CHANGED DATE  : 29-JUL-2008                              */          
270.00 80729  /*        PURPOSE       : FOR VIP STATEMENT, DAILY UPDATE CUSTOMER'S */        
271.00 80729  /*                        STATEMENT CYCLE TO EOM / GEN STATEMENT   */          
272.00 80729  /*                        TODAY                                    */          
273.00 80729  /*-----------------------------------------------------------------*/          
274.00 81021 /*        Reference No. : C8276 (CHG-276-08)                       */           
275.00 81021 /*        User ID       : B729PGM                                  */           
276.00 81021 /*        User Name     : Kylie Leong                              */           
277.00 81021 /*        Changed Date  : 17 OCT 2008                              */           
278.00 81021 /*        Purpose       : ACCOUNT LEVEL DEFINED FIELD MAINTENANCE  */           
279.00 81021 /*                        REPORT                                   */           
280.00 81021 /*-----------------------------------------------------------------*/           
281.00 90107 /*        Reference No. : C9010 (CHG-010-09)                       */           
282.00 90107 /*        User ID       : B552PGM                                  */           
283.00 90107 /*        User Name     : CARMEN LEI                               */           
284.00 90107 /*        Changed Date  : 07 JAN 2009                              */           
285.00 90107 /*        Purpose       : GENERATE CARTOON A/C EOD OUTGOING FILE   */           
286.00 90107 /*-----------------------------------------------------------------*/           
287.00 90506 /*        Reference No. : C9135 (CHG-135-09)                       */           
288.00 90506 /*        User ID       : B552PGM                                  */           
289.00 90506 /*        User Name     : CARMEN LEI                               */           
290.00 90506 /*        Changed Date  : 06 MAY 2009                              */           
291.00 90506 /*        Purpose       : TIME ACCOUNT PERFORMING CHANGE BRANCH    */           
292.00 90506 /*                        FUNCTION REPORT                          */           
293.00 90506 /*-----------------------------------------------------------------*/           
294.00 90703 /*        Reference No. : C9219 (CHG-219-09)                       */           
295.00 90703 /*        User ID       : BA04PGM                                  */           
296.00 90703 /*        User Name     : WAY CHOI                                 */           
297.00 90703 /*        Changed Date  : 03 JUL 2009                              */           
298.00 90703 /*        Purpose       : UPDATE NEW INTER BANK RATE FOR NEW TIME  */           
299.00 90703 /*                        DEPOSITS                                 */           
300.00 90703 /*-----------------------------------------------------------------*/           
301.00 91112 /*        Reference No. : C39355(CHG-355-09)                       */           
302.00 91009 /*        User ID       : B552PGM                                  */           
303.00 91009 /*        User Name     : CARMEN LEI                               */           
304.00 91009 /*        Changed Date  : 10 OCT 2009                              */           
305.00 91009 /*        Purpose       : MOVE OPERATOR OPTION C10                 */           
306.00 91009 /*                        'ICBS ACCESS LOGGING EOD' TO REPORT      */           
307.00 91009 /*                        BEFORE PCOM                              */           
308.00 91009 /*-----------------------------------------------------------------*/           
309.00 91123 /*        Reference No. : C9364 (CHG-364-09)                       */           
310.00 91111 /*        User ID       : B422PGM                                  */           
311.00 91111 /*        User Name     : Anthony Kam                              */           
312.00 91111 /*        Changed Date  : 11 Nov 2009                              */           
313.00 91111 /*        Purpose       : Add new report 'VIP Customer with        */           
314.00 91111 /*                        Securities Trading Access daily          */           
315.00 91111 /*                        maintenance log'                         */           
316.00 91111 /*-----------------------------------------------------------------*/           
317.00 101021 /*        Reference No. : D0255 (CHG-255-10)                       */           
318.00 101021 /*        User ID       : BA55PGM                                  */           
319.00 101021 /*        User Name     : Karl H.JR                                */           
320.00 101021 /*        Changed Date  : 21 Oct 2010                              */           
321.00 101021 /*        Purpose       : Generate Safe Deposit Box Daily reports  */           
322.00 101021 /*-----------------------------------------------------------------*/           
323.00 110905 /*        Reference No. : D1245 (CHG-245-11)                       */           
324.00 120227 /*        User ID       : BB14PGM                                  */           
325.00 110905 /*        User Name     : Francisco Lo                             */           
326.00 110905 /*        Changed Date  : 05 SEP 2011                              */           
327.00 110905 /*        Purpose       : End of Day job for Special Time Deposit  */           
328.00 110905 /*                        application                              */           
329.00 110905 /*-----------------------------------------------------------------*/           
330.00 120712 /*        Reference No. : D2201 (CHG-201-12)                       */           
331.00 120709 /*        User ID       : BB14PGM                                  */           
332.00 120709 /*        User Name     : Francisco Lo                             */           
333.00 120709 /*        Changed Date  : 09 JUL 2012                              */           
334.00 120709 /*        Purpose       : Run Report - 'Account with incomplete    */           
335.00 120709 /*                        document status change'                  */           
336.00 120709 /*-----------------------------------------------------------------*/           
337.00 120911 /*        Reference No. : D2263 (CHG-263-12)                       */           
338.00 120911 /*        User ID       : BE95PGM                                  */           
339.00 120911 /*        User Name     : JOANNA CHONG                             */           
340.00 120911 /*        Changed Date  : 11 SEP 2012                              */           
341.00 120911 /*        Purpose       : Run Report - 'Account open with          */           
342.00 120911 /*                        incomplete document'                     */           
343.00 120911 /*-----------------------------------------------------------------*/           
344.00 121030 /*        Reference No. : D2263 (CHG-263-12)                       */           
345.00 121012 /*        User ID       : BB14PGM                                  */           
346.00 121012 /*        User Name     : Francisco Lo                             */           
347.00 121012 /*        Changed Date  : 12 OCT 2012                              */           
348.00 121012 /*        Purpose       : Modify rpt - 'Account with incomplete    */           
349.00 121012 /*                        document status change' to include       */           
350.00 121012 /*                        account change from status '7' to normal */           
351.00 121012 /*-----------------------------------------------------------------*/           
352.00 121120 /*        REFERENCE NO. : D2299 (CHG-299-12)                       */           
353.00 121120 /*        USER ID       : BB16PGM                                  */           
354.00 121120 /*        USER NAME     : ALVIN LEI                                */           
355.00 121120 /*        CHANGED DATE  : 20 NOV 2012                              */           
356.00 121120 /*        PURPOSE       : GET FLEXIBLE STEP-UP DEPOSIT START DAY   */           
357.00 121120 /*                        BAL. AND LAST STEP STARTING BAL.         */           
358.00 121120 /*-----------------------------------------------------------------*/           
359.00 131202 /*        REFERENCE NO. : D3305 (CHG-305-13)                       */           
360.00 131202 /*        USER ID       : BA55PGM                                  */           
361.00 131202 /*        USER NAME     : KARL                                     */           
362.00 131202 /*        CHANGED DATE  : 02 DEC 2013                              */           
363.00 131202 /*        PURPOSE       : PRINT OPG REMMITANCE CHARGES DAILY REPORT*/           
364.00 131202 /*-----------------------------------------------------------------*/           
365.00 140303 /*        REFERENCE NO. : D4033 (CHG-033-14)                       */           
366.00 140303 /*        USER ID       : BG40PGM                                  */           
367.00 140303 /*        USER NAME     : DICKY CHEONG                             */           
368.00 140303 /*        CHANGED DATE  : 03 MAR 2014                              */           
369.00 140303 /*        PURPOSE       : MEMO CHECKING REPORT PROGRAM             */           
370.00 140409 /*-----------------------------------------------------------------*/           
371.00 140409 /*        REFERENCE NO. : D4058 (CHG-058-14)                       */           
372.00 140409 /*        USER ID       : BG24PGM                                  */           
373.00 140409 /*        USER NAME     : ERIC WONG                                */           
374.00 140409 /*        CHANGED DATE  : 08 APR 2014                              */           
375.00 140409 /*        PURPOSE       : BACK UP RECORD AND CLR 7 DAY BERFOR DATA */           
376.00 140409 /*                        AND CALCULATE AVERAGE EXCHANGE RATE      */           
377.00 140509 /*-----------------------------------------------------------------*/           
378.00 140509 /*        REFERENCE NO. : CHG-0173-14 (D4173)                      */           
379.00 140509 /*        AUTHOR        : ALBERT AU                                */           
380.00 140509 /*        CHANGED DATE  : 29 APR 2014                              */           
381.00 140509 /*        REASON        : BCM RA QUESTION APPLICATION              */           
382.00 140509 /*                        (DELETE RECORD OVER 100 DAYS)            */           
383.00 140509 /*-----------------------------------------------------------------*/           
384.00 140707 /*        REFERENCE NO. : CHG-0222-14 (D4222)                      */           
385.00 140707 /*        AUTHOR        : ALBERT AU                                */           
386.00 140707 /*        CHANGED DATE  : 07 JUL 2014                              */           
387.00 140707 /*        REASON        : GET DAILY INFORMATION FOR                */           
388.00 140707 /*                        KAMAKURA FILE                            */           
389.00 140707 /*******************************************************************/           
390.00 140915 /*        REFERENCE NO. : CHG-0344-14 (D4344)                      */           
391.00 140915 /*        AUTHOR        : ERIC WONG                                */           
392.00 140915 /*        CHANGED DATE  : 15 SEP 2014                              */           
393.00 140915 /*        REASON        : WEEKLY CAMPAIGN AUTOPAY REPORT           */           
394.00 140915 /*******************************************************************/           
395.00 150107 /*        REFERENCE NO. : CHG-0467-14 (D4467)                      */           
396.00 150107 /*        AUTHOR        : WINE CHAN                                */           
397.00 150107 /*        CHANGED DATE  : 07 JAN 2015                              */           
398.00 150107 /*        REASON        : MONTHLY REPORT FOR CAPTURING REVOLVING   */           
399.00 150107 /*******************************************************************/           
400.00 150304 /*        REFERENCE NO. : CHG-0037-15 (D5037)                      */           
401.00 160105 /*        AUTHOR        : DICKY CHEONG                             */           
402.00 150304 /*        CHANGED DATE  : 04 MAR 2015                              */           
403.00 150304 /*        REASON        : GET STOCK CHINESE NAME                   */           
404.00 160105 /*******************************************************************/           
405.00 160323 /*        REFERENCE NO. : CHG-101-16 (D6101)                       */           
406.00 160105 /*        AUTHOR        : DICKY CHEONG                             */           
407.00 160105 /*        CHANGED DATE  : 04 MAR 2015                              */           
408.00 160105 /*        REASON        : PREFERENTIAL EDUCATION LOAN OFFER        */           
409.00 150304 /*-----------------------------------------------------------------*/           
410.00 160106 /*        REFERENCE NO. : CHG-421-15 (D5421)                       */           
411.00 160106 /*        AUTHOR        : WINE CHAN                                */           
412.00 160106 /*        CHANGED DATE  : 06 JAN 2016                              */           
413.00 160106 /*        REASON        : DSF TAX REFUND DAILY MONITORING REPORT   */           
414.00 160106 /*-----------------------------------------------------------------*/           
415.00 160229 /*        REFERENCE NO. : CHG-071-16 (D6071)                       */           
416.00 160229 /*        AUTHOR        : DICKY CHEONG                             */           
417.00 160229 /*        CHANGED DATE  : 29 Feb 2016                              */           
418.00 160229 /*        REASON        : Generate Securities Report               */           
419.00 160229 /*******************************************************************/           
420.00 160615 /*        REFERENCE NO. : CHG-196-16 (D6196)                       */           
421.00 160627 /*        AUTHOR        : ALBERT AU                                */           
422.00 160627 /*        CHANGED DATE  : 27 JUN 2016                              */           
423.00 160615 /*        REASON        : Fix IVR A/C trasnfer transactions        */           
424.00 160615 /*******************************************************************/           
425.00 161006 /*        REFERENCE NO. : CHG-247-16 (D6247)                       */           
426.00 161006 /*        AUTHOR        : TOMMY TONG                               */           
427.00 161006 /*        CHANGED DATE  : 06 OCT 2016                              */           
428.00 161006 /*        REASON        : GET ECDD DATA FROM MSSQL                 */           
429.00 161006 /*******************************************************************/           
430.00 161207 /*        REFERENCE NO. : CHG-402-16 (D6402)                       */           
431.00 161206 /*        AUTHOR        : Wine Chan                                */           
432.00 161206 /*        CHANGED DATE  : 06 DEC 2016                              */           
433.00 161206 /*        REASON        : GET DSB DT Flag File To Update For Stock */           
434.00 161206 /*                        Account Opening                          */           
435.00 161206 /*******************************************************************/           
436.00 170224 /*        REFERENCE NO. : CHG-071-17 (D7071)                       */           
437.00 170224 /*        AUTHOR        : Tommy Tong                               */           
438.00 170224 /*        CHANGED DATE  : 23 Feb 2017                              */           
439.00 170224 /*        REASON        : Add checking cheque presented status for */           
440.00 170224 /*                        Stop Cheque Function                     */           
441.00 170224 /*******************************************************************/           
442.00 170821 /*        REFERENCE NO. : CHG-266-17 (D7266)                       */           
443.00 170821 /*        AUTHOR        : MYLES LEONG                              */           
444.00 170821 /*        CHANGED DATE  : 21 AUG 2017                              */           
445.00 170821 /*        REASON        : ADD CHEQUE ISSUING GENERATION            */           
446.00 170821 /*******************************************************************/           
447.00 140409                                                                                 
448.00 401              PGM                                                                
449.00 331        /* For O P E R A T O R -- options logging */                             
450.00 1129              DCL        VAR(&OPT) TYPE(*CHAR) LEN(5) VALUE('C70')               
451.00 331              DCL        VAR(&REPLY) TYPE(*CHAR) LEN(1)                          
452.00 401              DCL        VAR(&PROMPT) TYPE(*CHAR) LEN(40) +                      
453.00 401                           VALUE('Reporting BEFORE running PCOMBDAILY')          
454.00 401                                                                                 
455.00 80729 /*C7283*/   DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE(IQRY)             
456.00 80729 /*C7283*/   DCL        VAR(&BWRKLIB) TYPE(*CHAR) LEN(3) VALUE('Y')              
457.00 80729                                                                                 
458.00 401              MONMSG     MSGID(CPF2103 CPF2104)                                  
459.00 401                                                                                 
460.00 401    /********O P E R A T O R -- OPTIONS LOGGING ('START' event)********/         
461.00 401              RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                                  
462.00 401  START:      CALL       PGM(OPTSTR) PARM(&OPT &PROMPT &REPLY)                   
463.00 401              IF         COND(&REPLY *EQ 'F') THEN(GOTO CMDLBL(END))             
464.00 417                                                                                 
465.00 417  /*Original from ZIMMS/IMMSEODCL*******************************************/    
466.00 417 /* Add the rate files generation process here (2000-04-14) */                   
467.00 417 /* and remove those in IPROD/DPRPTCL */                                         
468.00 10620                                                                                 
469.00 417             ADDLIBLE   LIB(IPROD)                                               
470.00 417             CLRPFM     FILE(ICBSRATE)                                           
471.00 417             CLRPFM     FILE(ICBSRRTE)                                           
472.00 71108                                                                                 
473.00 71108  /*C7283 ADD LIBRARY */                                                         
474.00 71108 /*C7283*/    ADDLIBLE   LIB(&WRKLIB)                                            
475.00 71108 /*C7283*/    MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&BWRKLIB) +              
476.00 71108                           VALUE('N')) /* AVOID THE LIB EXISTED +                
477.00 71108                           ALREADY  */                                           
478.00 71108 /*C7283*/   CLRPFM     FILE(CUREXRTE)                                           
479.00 71108                                                                                 
480.00 71108 /* C7283 CLEAR CURRENT EXCHANGE RATE AND DIFF FX TRANSACTION AMOUNT FILE */     
481.00 71108 /*C7283*/   CALL       PGM(IQRY/GCURFXRTE)                                      
482.00 10620                                                                                 
483.00 71108  /* C7283 REMOVE LIBRARY */                                                     
484.00 71108  /*C7283*/   IF         COND(&BWRKLIB *EQ 'Y') THEN(RMVLIBLE +                  
485.00 71108                           LIB(&WRKLIB))                                         
486.00 71108                                                                                 
487.00 71108                                                                                 
488.00 417    /* Retrieve the ICBS Rate from the file GLC002 */                            
489.00 417    /* Change Date : 1999-04-29 remain the book rate generation */               
490.00 417             CALL       PGM(GENRATE)                                             
491.00 417    /* Retrieve the ICBS Rate from the file GLC002 */                            
492.00 417    /* Change Date : 1999-04-29 , use the revaluation rate */                    
493.00 417             CALL       PGM(GENRATE1)                                            
494.00 71108                                                                                 
495.00 71108   /*C5223   RMVLIBLE   LIB(IPROD)                         */                    
496.00 71108                                                                                 
497.00 71108                                                                                 
498.00 401                                                                                 
499.00 401  /*Original from ZEXIMICBS/TFEOD *******************************************/   
500.00 50223              RUNQRY     QRY(IPROD/TAHKDWRK)                                     
501.00 60111  /*C5023*/ /*C5223  RUNQRY     QRY(IPROD/TAHKDWRKND) */                         
502.00 401          /* HANDLING THE OFFLINE CASE BY CALLING TAHKDWRK1 */                   
503.00 10823 /*CH130      RUNQRY     QRY(IPROD/TAHKDWRK1)               */                   
504.00 401                                                                                 
505.00 401              CLRPFM     FILE(IPROD/HKDCASH)                                     
506.00 60206              OVRPRTF    FILE(QPQUPRFIL) COPIES(1) +                             
507.00 401                           SAVE(*YES) USRDTA(HKDSP) +                            
508.00 401                           SPLFNAME(TAHKRPT) SECURE(*YES)                        
509.00 401              RUNQRY     QRY(IPROD/TAHKDCSH)                                     
510.00 51223 /*C5105*/ /*C5223 RUNSQLSTM  SRCFILE(IPROD/QDDSSRC) SRCMBR(HKDCOMMSQL) +*/      
511.00 51223           /*C5223         COMMIT(*NONE) */ /*C5105*/                            
512.00 10620                                                                                 
513.00 401          /* HANDLING THE OFFLINE CASE BY CALLING TAHKDCSH1 */                   
514.00 10823 /*CH130      RUNQRY     QRY(IPROD/TAHKDCSH1)               */                   
515.00 51223  /*C5223     RUNQRY     QRY(IPROD/TAHKDRPT) */                                  
516.00 51223  /*C5223*/   CLRPFM     FILE(IPROD/TAHKDPT)                                     
517.00 51223  /*C5223*/   CALL       PGM(IPROD/TAHKDPGM)                                     
518.00 50617 /*C5084*/   OVRPRTF    FILE(QPQUPRFIL) COPIES(1) +                              
519.00 50617                           SAVE(*YES) USRDTA(MOPDSP) +                           
520.00 50617                           SPLFNAME(TAMOPRPT) SECURE(*YES)                       
521.00 60109              RUNQRY     QRY(IPROD/TAMOPDSP)                                     
522.00 50617 /*C5084*/   OVRPRTF    FILE(QPQUPRFIL) COPIES(1) +                              
523.00 50617                           SAVE(*YES) USRDTA(OTHDSP) +                           
524.00 50617                           SPLFNAME(TAOTHRPT) SECURE(*YES)                       
525.00 60109              RUNQRY     QRY(IPROD/TAOTHDSP)                                     
526.00 60111  /*C5023*/ /*C5223*/ RUNQRY     QRY(IPROD/TAHKDWRKND)                           
527.00 60206  /*C5223*/   OVRPRTF    FILE(QPQUPRFIL) COPIES(1) +                             
528.00 60124                           SAVE(*YES) USRDTA(HKDSP) +                            
529.00 60124                           SPLFNAME(TAHKDSP) SECURE(*YES)                        
530.00 60206  /*C5223*/   RUNQRY     QRY(IPROD/TAHKDDSP)                                     
531.00 60124              DLTOVR     FILE(*ALL)                                              
532.00 60206   /*C5223 */  RMVLIBLE   LIB(IPROD)                                             
533.00 401                                                                                 
534.00 401     /* GENERATE REPORTS FROM PST00101 - CROSS CCY & BRANCH DETAILS */           
535.00 401              CALL       PGM(IQRY/GPSTCL)                                        
536.00 824                                                                                 
537.00 10620                                                                                 
538.00 824     /* REMOVE IT FROM THE TFEOD ON 2000-03-10 */                                
539.00 824     /* EXIMBILLS CREDIT LINE USED REPORT */                                     
540.00 824     /*       CALL       PGM(ZEXIMICBS/ECRLIMRPT)   */                           
541.00 824     /* put back the LIMUSEPF file generation on 07/07/00 */                     
542.00 828     /*       CALL       PGM(ZEXIMICBS/UPLIMUSE)  ALREADY GEN IN ZEXIMICBS EOD*/ 
543.00 401                                                                                 
544.00 10620                                                                                 
545.00 401  /*Original from ZIMMS/IMMSEODCL*******************************************/    
546.00 728  /* Print memo report  */                                                       
547.00 401              CALL       PGM(IPROD/MEMORPTCL)                                    
548.00 10620                                                                                 
549.00 728  /*  Print customer movement report */                                          
550.00 728              CALL       PGM(IPROD/CCUSTMMOV)                                    
551.00 728                                                                                 
552.00 10620  /* Auditor report */                                                           
553.00 401              CALL       PGM(IQRY/APLICTFRCL)                                    
554.00 401              CALL       PGM(IQRY/CASHINCL)                                      
555.00 401              CALL       PGM(IQRY/TELERDCRCL)                                    
556.00 401              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(LNIDXCHG)             
557.00 401              RUNQRY     QRY(IPROD/LNIDXCHG)                                     
558.00 728              DLTOVR     FILE(*ALL)                                              
559.00 401              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TAIDXCHG)             
560.00 401              RUNQRY     QRY(IPROD/TAIDXCHG)                                     
561.00 10620                                                                                 
562.00 1027  /* GIFT CHEQUE REPORT - FROM PST001L8 */                                       
563.00 1027              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(GIFTSALE)             
564.00 1027              RUNQRY     QRY(IQRY/GIFTSALE)                                      
565.00 1027              DLTOVR     FILE(*ALL)                                              
566.00 1027              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(GIFTCASH)             
567.00 1028              RUNQRY     QRY(IQRY/GIFTCASH)                                      
568.00 728              DLTOVR     FILE(*ALL)                                              
569.00 10317                                                                                 
570.00 10620 /******************************************************************/            
571.00 10319 /* Reference No. : CH027                                          */            
572.00 10319 /* Change Details: Ooudated Saving+ Compaign Report removed on    */            
573.00 10319 /*                 19/03/01                                       */            
574.00 10620 /*    SAVINGS+ CAMPAIGN REPORT GENERATION (20/11/00)              */            
575.00 10620 /* CH027     CALL       PGM(IPROD/SVCAMCL)                        */            
576.00 10620 /*    New Year CAMPAIGN REPORT GENERATION (30/12/00)              */            
577.00 10620 /* CH027     CALL       PGM(IPROD/NYCAMCL)                        */            
578.00 10620 /*                                                                */            
579.00 10620 /*                                                                */            
580.00 10319 /* Reference No. : CH027                                          */            
581.00 10319 /* Change Details: SAVING+ 4TH CAMPAIGN REPORT (19/03/01) FOR     */            
582.00 10317 /*                 OPEN DATE ON AMARAL                            */            
583.00 10620 /*    SAVINGS+ 4TH CAMPAIGN REPORT FOR AMARAL (19/03/01)          */            
584.00 10620 /* CH027     CALL       PGM(IPROD/SV4CAMCL)                       */            
585.00 10620 /******************************************************************/            
586.00 10620                                                                                 
587.00 10420 /* Reference No. : CH045                                          */            
588.00 10420 /* Change Details: SAVING+ BONUS INT CAMPAIGN REPORT (20/04/01)   */            
589.00 10420 /*                                                                */            
590.00 10420 /* CH045 */  CALL       PGM(IPROD/SVBICAMCL)                                    
591.00 991125                                                                                 
592.00 10620                                                                                 
593.00 10504 /* Reference No. : CH057                                          */            
594.00 10504 /* Change Details: Bad debt loan settlement acoount listing       */            
595.00 10504 /*                                                                */            
596.00 10504 /* CH057 */  CALL       PGM(IPROD/LNBDRPTCL)                                    
597.00 10504                                                                                 
598.00 10504                                                                                 
599.00 10504 /* Reference No. : TA057                                           */           
600.00 10504 /* Change Details: Report of all cheque with stop payments and     */           
601.00 10504 /*                 susprcts transaction from BT                    */           
602.00 10504 /* Reference No. : TA058                                           */           
603.00 10504 /* Change Details: Report of all cheque transaction with cheque    */           
604.00 10504 /*                 number out of range                             */           
605.00 10504 /* TA057 */                                                                     
606.00 10504 /* TA058 */  CALL       PGM(IPROD/TA0070IHR)                                    
607.00 10516                                                                                 
608.00 10620                                                                                 
609.00 10516 /* Reference No. : TM062                                           */           
610.00 10516 /* Change Details: New report to show daily time transaction       */           
611.00 10516 /*                                                                 */           
612.00 10516 /* TM062 */  CALL       PGM(IPROD/PTMPOSTALL)                                   
613.00 10504                                                                                 
614.00 10526 /* Reference No. : CH077                                           */           
615.00 10526 /* Change Details: Report for 5th Open Day                         */           
616.00 10526 /*                                                                 */           
617.00 10526 /* CH077 */  CALL       PGM(ZBONUSINT/SVO5CAMCL)                                
618.00 10615                                                                                 
619.00 10620                                                                                 
620.00 10620 /***************************************************************** */           
621.00 10615 /* Reference No. : CH073                                           */           
622.00 10615 /* Change Details: Posting of Bonus Interest for 4th Open Day      */           
623.00 10615 /*                                                                 */           
624.00 10620 /* CH073     CALL       PGM(ZBONUSINT/SVO4POSTCL)                  */           
625.00 10620 /*******************************************************************/           
626.00 10619                                                                                 
627.00 10619 /* Reference No. : CH071                                           */           
628.00 10619 /* Change Details: Posting of Bonus Int for Savings+ Bonus Campaign*/           
629.00 10619 /*                                                                 */           
630.00 10619 /* CH071 */  CALL       PGM(ZBONUSINT/SVBIPOSTCL)                               
631.00 10619                                                                                 
632.00 10619 /* Reference No. : CH077                                           */           
633.00 10619 /* Change Details: Posting of Bonus Interest for 5th Open Day      */           
634.00 10619 /*                                                                 */           
635.00 10619 /* CH077 */  CALL       PGM(ZBONUSINT/SVO5POSTCL)                               
636.00 10615                                                                                 
637.00 10714 /* Reference No. : CH103                                           */           
638.00 10714 /* Change Details: Time deposit daily movement over 100,000 Mop    */           
639.00 10714 /*                 Report                                          */           
640.00 10714 /* CH103 */  CALL       PGM(IPROD/TMRPTCL)                                      
641.00 10620                                                                                 
642.00 10731 /* Reference No. : CH116                                           */           
643.00 10731 /* Change Details: Saving+ interest adjustment (+1%)               */           
644.00 30531 /* CH116 */  CALL       PGM(ZSAVPLUS/SVINTADJCL)                                
645.00 10731                                                                                 
646.00 11023                                                                                 
647.00 11023  /*        Reference No. : CR022                                    */          
648.00 11023  /*        Purpose       : Incomplete CIF report                    */          
649.00 11023 /* CR022 */  CALL       PGM(I700BCM/PCU9500)                                    
650.00 11023                                                                                 
651.00 11212  /*        Reference No. : CH190                                    */          
652.00 11212  /*        Purpose       : Eximbills Cross Currency Deal Report     */          
653.00 11212 /* CR022 */  CALL       PGM(IPROD/EXIMCCYCL)                                    
654.00 10620                                                                                 
655.00 20204 /* refid CH028 userid B323 purpose: check loan maturity extension*/             
656.00 20204              CALL       PGM(ZNOTELIB/CCHKNOTE) /*CH028*/                        
657.00 20619                                                                                 
658.00 20619 /* Reference No. : C2092                                           */           
659.00 20619 /* Change Details: generate CUP051 information before PCOMB        */           
660.00 20620 /*C2092*/    RUNSQLSTM  SRCFILE(IPROD/QCRMGMT) SRCMBR(GCUP51BPB) +              
661.00 20620                         COMMIT(*NONE)                                           
662.00 20625                                                                                 
663.00 20625 /* Reference No. : C2051                                           */           
664.00 20625 /* Change Details: Print smart salary without payroll reports      */           
665.00 20625 /* C2051 */  CALL       PGM(IPROD/CSSWPRL)                                      
666.00 20204                                                                                 
667.00 20702                                                                                 
668.00 20702  /* Reference No. : C2098                                           */          
669.00 20702  /* Change Details: Print ICBS and WorkFlow roles and groups report */          
670.00 20702  /* C2098 */  CALL       PGM(IPROD/CRTGRRPT)                                    
671.00 21218                                                                                 
672.00 21218  /* Reference No. : C2135                                           */          
673.00 21218  /* Change Details: Print Fixed rate deposit certificate.           */          
674.00 21218  /* C2135 */  CALL       PGM(ZTMLIB/FXGCERTCL)                                  
675.00 30703                                                                                 
676.00 30703  /* Reference No. : C3081                                           */          
677.00 30703  /* Change Details: Print All POD Transaction report                */          
678.00 30703  /* C3081 */  CALL       PGM(IPROD/PODRPTCL)                                    
679.00 30721                                                                                 
680.00 30721  /* Reference No. : C3085                                           */          
681.00 30721  /* Change Details: Print FX/Equity link deposit confirmation.      */          
682.00 30721  /* C3085 */  CALL       PGM(ZTMLIB/DEPGCERTCL)                                 
683.00 40424                                                                                 
684.00 40424  /* Reference No. : C4025                                           */          
685.00 40424  /* Change Details: Perform FX loan EOD process.                    */          
686.00 40424  /* C4025 */  CALL       PGM(ZFXLOAN/EODPROCESS)                                
687.00 50226                                                                                 
688.00 50226  /* Reference No. : C5024                                           */          
689.00 50226  /* Detail        : Add PCS Statement Control Reports               */          
690.00 71203  /* C7352 C5024     CALL       PGM(i700BCM/PCSRPTCL)  */                        
691.00 20702                                                                                 
692.00 61003  /* C6270 */  CALL       PGM(IPROD/PTBRNLMT)                                    
693.00 70804                                                                                 
694.00 80729  /* Reference No. : C8173                                           */          
695.00 80729  /* Detail        : UDPATE VIP STATEMENT CYCLE                      */          
696.00 80729  /* C8173 */        CALL       PGM(I700BCM/UPVIPCYCCL)                          
697.00 81021                                                                                 
698.00 81021 /*        REFERENCE NO. : C8276 (CHG-276-08)                     */             
699.00 81021 /*        PURPOSE       : ACCOUNT LEVEL DEFINED FIELD MAINTENANCE */            
700.00 81021 /*                        REPORT                                  */            
701.00 81021 /*C8276*/    CALL       PGM(I700BCM/MNACFRPTCL)                                 
702.00 90107                                                                                 
703.00 90107 /*        REFERENCE NO. : C9010 (CHG-010-09)                     */             
704.00 90107 /*        PURPOSE       : GENERATE CARTOON A/C OUTGOING FILE      */            
705.00 90107 /*C9010*/    CALL       PGM(ZSAVPLAN/CARTEODCL)                                 
706.00 80729                                                                                 
707.00 90506 /*        REFERENCE NO. : C9135 (CHG-135-09)                     */             
708.00 90506 /*        PURPOSE       : TIME ACCOUNT PERFORMING CHANGE BRANCH  */             
709.00 90506 /*                        FUNCTION REPORT                        */             
710.00 90506 /*C9135*/    CALL       PGM(ZTMLIB/TMINTRPT)                                    
711.00 90506                                                                                 
712.00 90703 /*        REFERENCE NO. : C9219 (CHG-219-09)                     */             
713.00 90703 /*        PURPOSE       : UPDATE NEW INTER BANK RATE FOR NEW     */             
714.00 90703 /*                        TIME DEPOSITS                          */             
715.00 90703 /*C9219*/    CALL       PGM(IPROD/UPINTRTE)                                     
716.00 90703                                                                                 
717.00 91112 /*        REFERENCE NO. : C9355 (CHG-355-09)                     */             
718.00 91009 /*        PURPOSE       : ICBS ACCESS LOGGING EOD                */             
719.00 91112 /*C9355*/    CALL       PGM(I700BCM/ACCLOGEOD)                                  
720.00 90519                                                                                 
721.00 70804   RUNSQLSTM  SRCFILE(IPROD/QDDSSRC) SRCMBR(FIXPST001) +                         
722.00 70808                           COMMIT(*NONE) /* C7224 */                             
723.00 91111                                                                                 
724.00 91123 /*        Reference No. : C9364 (CHG-364-09)                       */           
725.00 91111 /*        Purpose       : Add new report 'VIP Customer with        */           
726.00 91111 /*                        Securities Trading Access daily          */           
727.00 91111 /*                        maintenance log'                         */           
728.00 91123 /*C9364*/    RUNQRY     QRY(ZVIPLIB/VIPMNTLOG)                                  
729.00 91123 /*C9364*/    OVRPRTF    FILE(QPQUPRFIL) OUTQ(RPTLIB/MISCOUQMIG) +               
730.00 91123                           USRDTA(IVRSECLOG)                                     
731.00 91123 /*C9364*/    RUNQRY     QRY(ZVIPLIB/VIPSECLOG)                                  
732.00 91123 /*C9364*/    DLTOVR     FILE(QPQUPRFIL)                                         
733.00 91111                                                                                 
734.00 101021 /*        REFERENCE NO. : D0255 (CHG-255-10)                     */             
735.00 101021 /*        PURPOSE       : Generate SDB Daily reports             */             
736.00 101021 /*D0255*/    CALL       PGM(ZSDBLIB/GSDBDRPT)                                   
737.00 101021                                                                                 
738.00 110905 /*        REFERENCE NO. : D1245 (CHG-245-11)                     */             
739.00 110905 /*        PURPOSE       : Run SPTM End Of Day job                */             
740.00 110905 /*D1245*/    CALL       PGM(ZTMLIB/SPTMEODCL)                                   
741.00 120227                                                                                 
742.00 120712 /*        REFERENCE NO. : D2201 (CHG-201-12)                     */             
743.00 120709 /*        PURPOSE       : Run report-Account with incomplete doc */             
744.00 121030 /*D2263*/    CLRPFM     FILE(&WRKLIB/INDOCWRK)                                  
745.00 121030 /*D2263*/    RUNSQLSTM  SRCFILE(&WRKLIB/QCLSRC) SRCMBR(INDOCSQL) +              
746.00 121012                           COMMIT(*NONE)                                         
747.00 120712 /*D2201*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(INDOCSTS)             
748.00 121105 /*D2201*/    RUNQRY     QRY(IPROD/INDOCSTS)                                     
749.00 120712 /*D2201*/    DLTOVR     FILE(*ALL)                                              
750.00 121105 /*D2263*/    CPYF       FROMFILE(CUP05101) +                                    
751.00 121105                           TOFILE(&WRKLIB/INDOC051BK) +                          
752.00 121105                           MBROPT(*REPLACE) CRTFILE(*YES) +                      
753.00 121105                           INCREL((*IF CACLS *EQ 'ACC-INCOMP') (*AND +           
754.00 121105                           CAAPP *EQ 20))                                        
755.00 120709                                                                                 
756.00 120911 /*        REFERENCE NO. : D2263 (CHG-263-12)                     */             
757.00 120911 /*        PURPOSE       : ADD report-Account opened with incomplete doc */      
758.00 120924 /*D2263*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(ACCICMEMO)            
759.00 120924 /*D2263*/    RUNQRY     QRY(IPROD/ACCICMEMO)                                    
760.00 120924 /*D2263*/    DLTOVR     FILE(*ALL)                                              
761.00 120911                                                                                 
762.00 121120 /*        REFERENCE NO. : D2299 (CHG-299-12)                     */             
763.00 121120 /*        PURPOSE       : GET FLEXIBLE DEPOSIT STARTING BALANCE  */             
764.00 121121 /*D2299*/    CALL       PGM(ZSAVPLAN/FSDBALCL)                                  
765.00 121120                                                                                 
766.00 131202 /*        REFERENCE NO. : D3305 (CHG-305-13)                     */             
767.00 131202 /*        PURPOSE       : PRINT OPG REMMITANCE CHARGES REPORT    */             
768.00 131211 /*D3305*/    CALL       PGM(ZOPGLIB/OGLOGPTCL)                                  
769.00 131202                                                                                 
770.00 140303 /*        REFERENCE NO. : D4033 (CHG-033-14)                     */             
771.00 140303 /*        PURPOSE       : MEMO CHECKING REPORT PROGRAM           */             
772.00 140505 /*D4033*/    CALL       PGM(IPROD/CCDMEMOCL)                                    
773.00 140409                                                                                 
774.00 140409 /*        REFERENCE NO. : D4058 (CHG-058-14)                     */             
775.00 140409 /*        PURPOSE       : BACK UP RECORD AND CALCUATE AVERAGE    */             
776.00 140409 /*                        EXCHAGNE RATE                          */             
777.00 140410 /*D4058*/    CALL       PGM(ZCHEXAPP/CHEXEOD)                                   
778.00 140409                                                                                 
779.00 140509 /*        REFERENCE NO. : D4173 (CHG-173-14)                     */             
780.00 140509 /*        PURPOSE       : BCM RA QUESTION APPLICATION            */             
781.00 140509 /*                        (DELETE RECORD OVER 100 DAYS)          */             
782.00 140509 /*D4173*/    CALL       PGM(IPROD/ORACL)                                        
783.00 140409                                                                                 
784.00 140707 /*        REFERENCE NO. : D4222 (CHG-222-14)                     */             
785.00 140707 /*        PURPOSE       : GET DAILY INFORMATION FOR KAMAKULA FILE*/             
786.00 140707 /*                                                               */             
787.00 140707 /*D4222*/    CALL       PGM(IPROD/KAMWRKCL)                                     
788.00 140915                                                                                 
789.00 140915 /*        REFERENCE NO. : D4344 (CHG-344-14)                     */             
790.00 140915 /*        PURPOSE       : WEEKLY CAMPAIGN REPORT                 */             
791.00 140915 /*D4344*/    CALL       PGM(ZAUTOPAY/EMPATPWRPT)                                
792.00 120911                                                                                 
793.00 150107 /*        REFERENCE NO. : D4467 (CHG-467-14)                     */             
794.00 150107 /*        PURPOSE       : MONTHLY REPORT FOR CAPTURING REVOLVING */             
795.00 150107 /*D4467*/    CALL       PGM(ZCRLINE/GCRLLNCL)                                   
796.00 150304                                                                                 
797.00 150304 /*        REFERENCE NO. : D5037 (CHG-037-15)                     */             
798.00 150304 /*        PURPOSE       : GET STOCK CHINESE NAME                 */             
799.00 150304 /*D5037*/    CALL       PGM(I700BCM/CVTSTCHCL)                                  
800.00 150107                                                                                 
801.00 160323 /*        REFERENCE NO. : D6101 (CHG-101-16)                     */             
802.00 160105 /*        PURPOSE       : EDUCATION LOAN                         */             
803.00 160105 /*D5679*/    CALL       PGM(IPROD/PEDULOANCL)                                   
804.00 160106                                                                                 
805.00 160106 /*        REFERENCE NO. : D5421 (CHG-421-15)                     */             
806.00 160106 /*        PURPOSE       : DSF TAX REFUND DAILY MONITORING REPORT */             
807.00 160106 /*D5679*/    CALL       PGM(ZDSFTAX/DSFDYRPTCL)                                 
808.00 160105                                                                                 
809.00 160229 /*        REFERENCE NO. : D6071 (CHG-071-16)                     */             
810.00 160229 /*        PURPOSE       : Generate Securities Report             */             
811.00 160229 /*D6071*/    CALL       PGM(ZISTOCK/IGENRPTCL)                                  
812.00 160229                                                                                 
813.00 160615 /*        REFERENCE NO. : D6196 (CHG-196-16)                     */             
814.00 160615 /*        PURPOSE       : Fix IVR A/C transfer transactions      */             
815.00 160627 /*D6196*/    CALL       PGM(I700BCM/MTXLCYCL)                                   
816.00 160627 /*D6196*/                                                                       
817.00 161006                                                                                 
818.00 161006 /*        REFERENCE NO. : D6247 (CHG-247-16)                     */             
819.00 161006 /*        PURPOSE       : Get ECDD Data from MSSQL               */             
820.00 161006 /*D6247*/    CALL       PGM(ZCIFLIB/ECDDDTACL)                                  
821.00 161206                                                                                 
822.00 161207 /* REFERENCE NO. : D6402 (CHG-402-16)                                       */  
823.00 161206 /* PURPOSE       : GET DSB DT Flag File To Update For Stock Account Opening */  
824.00 161207 /*D6402*/    CALL       PGM(ZISTOCK/IMGHEODCL)                                  
825.00 170224                                                                                 
826.00 170224 /*        REFERENCE NO. : D7071 (CHG-071-17)                     */             
827.00 170224 /*  PURPOSE       : Add checking cheque presented status for Stop Cheque */     
828.00 170228 /*D7071*/    RUNSQLSTM  SRCFILE(I700BCM/QDDSSRC) SRCMBR(TACHQSQL) +             
829.00 170228                         COMMIT(*NONE)                                           
830.00 170821                                                                                 
831.00 170821 /*        REFERENCE NO. : D7266 (CHG-266-17)                     */             
832.00 170821 /*  PURPOSE       : ADD CHEQUE ISSUING GENERATION                */             
833.00 170821 /*D7266*/    CALL       PGM(I700BCM/CQNCL)                                      
834.00 170821                                                                                 
835.00 70804    /********O P E R A T O R -- OPTIONS LOGGING ('END' event)*************/      
836.00 331              CALL       PGM(OPTEND) PARM(&OPT &PROMPT &REPLY)                   
837.00 161206                                                                                 
838.00 161206  END:        ENDPGM                                                             
