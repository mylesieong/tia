1.00 61019 /*-----------------------------------------------------------------*/           
2.00 61019 /*                                                                 */           
3.00 61019 /*        Program ID.   : RPTAPCOMB                                */           
4.00 61019 /*        Program Name  : Reporting after running PCOMBDAILY       */           
5.00 61019 /*        Parameter     :                                          */           
6.00 61019 /*                                                                 */           
7.00 61019 /*        Functions     :                                          */           
8.00 61019 /*                                                                 */           
9.00 61019 /*        Author        : KENENTH HO                               */           
10.00 61019 /*        Date written  : 2000 APR 01                              */           
11.00 61019 /*                                                                 */           
12.00 61019 /*-----------------------------------------------------------------*/           
13.00 61019 /*-----------------------------------------------------------------*/           
14.00 61019 /*    Modification                                                 */           
15.00 61019 /*    Ref. Number : IH016                                          */           
16.00 61019 /*    User ID     : B168PGM                                        */           
17.00 61019 /*    User Name   : Thomas Chan                                    */           
18.00 61019 /*    Date        : 12, March 2001                                 */           
19.00 61019 /*    Changed     : ICBS V7 Migration                              */           
20.00 10312 /* --------------------------------------------------------------- */           
21.00 10508 /*        Reference No. : CH060                                    */           
22.00 10508 /*        User ID       : B323                                     */           
23.00 10508 /*        User Name     : EDWARD CHEONG                            */           
24.00 10508 /*        Changed Date  : 8-MAY-2001                               */           
25.00 10508 /*        Purpose       : NEW REPORT TO SHOW DAILY NEW TIME        */           
26.00 10508 /*                        DEPOSIT ACCOUNT WITH CIF NUMBER          */           
27.00 10508 /*                        MOVE FORM REPORT BEFORE PCOMB DUE TO     */           
28.00 10508 /*                        CHANGE OF REQUIRMENT BY CCIU             */           
29.00 10508 /*                                                                 */           
30.00 10508 /*-----------------------------------------------------------------*/           
31.00 10529 /*        Reference No. : CH062                                    */           
32.00 10529 /*        User ID       : B422                                     */           
33.00 10529 /*        User Name     : ANTHONY KAM                              */           
34.00 10529 /*        Changed Date  : 25-MAY-2001                              */           
35.00 10529 /*        Purpose       : NEW REPORT TO SHOW DAILY ERROR OF        */           
36.00 10529 /*                        UPDATING INTER BANK RATE                 */           
37.00 961213 /*                                                                 */           
38.00 10825 /*-----------------------------------------------------------------*/           
39.00 10825 /*        Reference No. : CH122                                    */           
40.00 10825 /*        User ID       : B168PGM                                  */           
41.00 10825 /*        User Name     : THOMAS CHAN                              */           
42.00 10825 /*        Changed Date  : 25-AUG-2001                              */           
43.00 10825 /*        Purpose       : ADD CALLING TO PGM:ZSAVPLUS/UPDPBKCL FOR */           
44.00 10825 /*                        PASSBOOK BALANCE UPDATE                  */           
45.00 11020 /*-----------------------------------------------------------------*/           
46.00 11020 /*        Reference No. : CH164 (CHG-0164-01)                      */           
47.00 11020 /*        User ID       : B417PGM                                  */           
48.00 11020 /*        User Name     : BILL IEONG                               */           
49.00 11020 /*        Changed Date  : 19-OCT-2001                              */           
50.00 11020 /*        Purpose       : ADD CALLING TO PGM:IPROD/CUSTRPT FOR     */           
51.00 11020 /*                        GENERATE THE CUSTOMER INFORMATION        */           
52.00 10825 /*-----------------------------------------------------------------*/           
53.00 20104 /*        Reference No. : C2002 (CHG-002-02)                       */           
54.00 20104 /*        User ID       : B436PGM                                  */           
55.00 20104 /*        User Name     : OTTO CHAO                                */           
56.00 20104 /*        Changed Date  : 04-JAN-2002                              */           
57.00 20104 /*        Purpose       : ADD CALLING TO CL:IPROD/RETCRRPTCL FOR   */           
58.00 20104 /*                        GENERATE THE RETAIL CREDIT REPORT        */           
59.00 20104 /*-----------------------------------------------------------------*/           
60.00 20128 /*        Reference No. : C2019 (CHG-019-02)                       */           
61.00 20128 /*        User ID       : B459PGM,B422PGM                          */           
62.00 20128 /*        User Name     : BRANDON LEONG,ANTHON KAM                 */           
63.00 20128 /*        Changed Date  : 28-JAN-2002                              */           
64.00 20128 /*        Purpose       : ADD CALLING TO CL:IPROD/GENSIRRPT FOR TA */           
65.00 20128 /*                        ACCOUNT WITH SPECIAL RATE REPORT         */           
66.00 20128 /*-----------------------------------------------------------------*/           
67.00 20206 /*        Reference No. : C2031 (CHG-031-02)                       */           
68.00 20206 /*        User ID       : B422PGM,                                 */           
69.00 20206 /*        User Name     : ANTHONY KAM                              */           
70.00 20206 /*        Changed Date  : 06-FEB-2002                              */           
71.00 20206 /*        Purpose       : ADD CALLING TO CL:ZCRSLOG/CRSMEMOEOD FOR */           
72.00 20206 /*                        CRS ALERT MEMO EOD PROCESS               */           
73.00 20206 /*-----------------------------------------------------------------*/           
74.00 20319 /*        Reference No. : C2047 (CHG-047-02)                       */           
75.00 20319 /*        User ID       : B436PGM                                  */           
76.00 20319 /*        User Name     : OTTO CHAO                                */           
77.00 20319 /*        Changed Date  : 16-MAR-2002                              */           
78.00 20319 /*        Purpose       : ADD CALLING TO CL:IPROD/OVLNCL FOR       */           
79.00 20319 /*                        GENERATE THE OVERDUE LOANS AND CREDIT    */           
80.00 20319 /*                        CARDS REPORT                             */           
81.00 20319 /*-----------------------------------------------------------------*/           
82.00 20415 /*        Reference No. : C2048 (CHG-048-02)                       */           
83.00 20415 /*        User ID       : B436PGM                                  */           
84.00 20415 /*        User Name     : OTTO CHAO                                */           
85.00 20415 /*        Changed Date  : 19-APR-2002                              */           
86.00 20415 /*        Purpose       : ADD CALLING TO CL:IPROD/APICBSCL FOR     */           
87.00 20415 /*                        GENERATE ACQUIRING PROGRAM DATABASE.     */           
88.00 20415 /*-----------------------------------------------------------------*/           
89.00 20515 /*        Reference No. : C2067 (CHG-067-02)                       */           
90.00 20515 /*        User ID       : B422PGM                                  */           
91.00 20515 /*        User Name     : ANTHONY KAM                              */           
92.00 20515 /*        Changed Date  : 15-MAY-2002                              */           
93.00 20515 /*        Purpose       : ADD CALLING TO CL:IPROD/CFORMRJE FOR     */           
94.00 20515 /*                        GENERATE SWIFT STATEMENT                 */           
95.00 20515 /*-----------------------------------------------------------------*/           
96.00 20730 /*        Reference No. : C2082                                    */           
97.00 20525 /*        User ID       : B422PGM                                  */           
98.00 20525 /*        User Name     : ANTHONY KAM                              */           
99.00 20525 /*        Changed Date  : 25-MAY-2002                              */           
100.00 20525 /*        Purpose       : CHANGE CALL CRS MEMO EOD TO SUBMIT JOB   */           
101.00 20525 /*                        TO QBATCH                                */           
102.00 20525 /*-----------------------------------------------------------------*/           
103.00 20730 /*        Reference No. : C2090                                    */           
104.00 20612 /*        User ID       : B417PGM                                  */           
105.00 20612 /*        User Name     : Bill Ieong                               */           
106.00 20612 /*        Changed Date  : 12-Jun-2002                              */           
107.00 20612 /*        Purpose       : Credit Management Reports                */           
108.00 20612 /*-----------------------------------------------------------------*/           
109.00 20730 /*        Reference No. : C2118 (CHG-118-02)                       */           
110.00 20730 /*        User ID       : B460PGM                                  */           
111.00 20730 /*        User Name     : VICKY TOU                                */           
112.00 20730 /*        Changed Date  : 29-JULY-2002                             */           
113.00 20730 /*        Purpose       : GENERATE REPORT FOR LOAN INTEREST REBATE */           
114.00 20730 /*                        ON MATURITY                              */           
115.00 20730 /*-----------------------------------------------------------------*/           
116.00 20730 /*        Reference No. : C2119 (CHG-119-02)                       */           
117.00 20730 /*        User ID       : B460PGM                                  */           
118.00 20730 /*        User Name     : VICKY TOU                                */           
119.00 20730 /*        Changed Date  : 30-JULY-2002                             */           
120.00 20730 /*        Purpose       : GENERATE REPORT FOR RESTRUCTURED LOANS   */           
121.00 20730 /*                        (NO PAST DUE INSTALLMENT)                */           
122.00 20730 /*-----------------------------------------------------------------*/           
123.00 21115 /*        Reference No. : C2165 (CHG-165-02)                       */           
124.00 21115 /*        User ID       : B417PGM                                  */           
125.00 21115 /*        User Name     : BILL IEONG                               */           
126.00 21115 /*        Changed Date  : 15-NOV-2002                              */           
127.00 21115 /*        Purpose       : Generate the beginning GL balance for    */           
128.00 21115 /*                        Online Currency Position Display         */           
129.00 21115 /*-----------------------------------------------------------------*/           
130.00 21204 /*        Reference No. : C2189 (CHG-189-02)                       */           
131.00 21204 /*        User ID       : B460PGM                                  */           
132.00 21204 /*        User Name     : VICKY TOU                                */           
133.00 21204 /*        Changed Date  : 02-DEC-2002                              */           
134.00 21204 /*        Purpose       : Generate LOANS WITH PREMIUM INTEREST     */           
135.00 21204 /*                        RATE-WITHOUT PAYROLL/HOUSING LOAN REPORT */           
136.00 21204 /*                        and SALARY TRANSFER EXPIRATION REPORT    */           
137.00 21204 /*-----------------------------------------------------------------*/           
138.00 21218 /*        Reference No. : C2135 (CHG-135-02)                       */           
139.00 21218 /*        User ID       : B168PGM                                  */           
140.00 21218 /*        User Name     : THOMAS CHAN                              */           
141.00 21218 /*        Changed Date  : 18-DEC-2002                              */           
142.00 21218 /*        Purpose       : TMP009LM move from I700BCM to ZIHD.      */           
143.00 21218 /*-----------------------------------------------------------------*/           
144.00 30122 /*        Reference No. : C3011 (CHG-011-03)                       */           
145.00 30122 /*        User ID       : B417PGM                                  */           
146.00 30122 /*        User Name     : BILL IEONG                               */           
147.00 30122 /*        Changed Date  : 21-JAN-2003                              */           
148.00 30122 /*        Purpose       : Smart Salary Overdraft Review date report*/           
149.00 30122 /*-----------------------------------------------------------------*/           
150.00 30502 /*        Reference No. : C3056 (CHG-056-03)                       */           
151.00 30502 /*        User ID       : B460PGM                                  */           
152.00 30502 /*        User Name     : VICKY TOU                                */           
153.00 30502 /*        Changed Date  : 30-APRIL-2003                            */           
154.00 30502 /*        Purpose       : GENERATE REPORT AND PERFORM POSTING FOR  */           
155.00 30502 /*                        LOAN INTEREST REBATE ON EACH LOAN YEAR   */           
156.00 30502 /*-----------------------------------------------------------------*/           
157.00 30612 /*        Reference No. : C3073 (CHG-073-03)                       */           
158.00 30612 /*        User ID       : B417PGM                                  */           
159.00 61019 /*        User Name     : Bill Ieong                               */           
160.00 61019 /*        Changed Date  : 10-June-2003                             */           
161.00 61019 /*        Purpose       : add a same query of IPROD/TDREP3 for     */           
162.00 61019 /*                        generate the output file                 */           
163.00 61019 /*-----------------------------------------------------------------*/           
164.00 61019 /*        Reference No. : C3084 (CHG-084-03)                       */           
165.00 61019 /*        User ID       : B417PGM                                  */           
166.00 61019 /*        User Name     : Bill Ieong                               */           
167.00 61019 /*        Changed Date  : 10-July-2003                             */           
168.00 61019 /*        Purpose       : reset the data area for Monitoring Time  */           
169.00 61019 /*                        Deposit on-lne scrren                    */           
170.00 61019 /*-----------------------------------------------------------------*/           
171.00 61019 /*        Reference No. : C3086 (CHG-086-03)                       */           
172.00 61019 /*        User ID       : B417PGM                                  */           
173.00 61019 /*        User Name     : Bill Ieong                               */           
174.00 61019 /*        Changed Date  : 10-July-2003                             */           
175.00 61019 /*        Purpose       : add a same query of IPROD/TDREPCOPR for  */           
176.00 61019 /*                        generate the output file                 */           
177.00 61019 /*-----------------------------------------------------------------*/           
178.00 61019 /*        Reference No. : C3139 (CHG-139-03)                       */           
179.00 61019 /*        User ID       : B460PGM                                  */           
180.00 61019 /*        User Name     : Vicky Tou                                */           
181.00 61019 /*        Changed Date  : 10-Oct-2003                              */           
182.00 61019 /*        Purpose       : Add Change of Customer Information       */           
183.00 61019 /*                        Journal Reports for Internet users and   */           
184.00 61019 /*                        All users                                */           
185.00 61019 /*-----------------------------------------------------------------*/           
186.00 61019 /*        Reference No. : C3195 (CHG-195-03)                       */           
187.00 61019 /*        User ID       : B422PGM                                  */           
188.00 61019 /*        User Name     : ANTHONY KAM                              */           
189.00 61019 /*        Changed Date  : 22-DEC-2003                              */           
190.00 61019 /*        Purpose       : ADD GENERATION OF MONTHLY LOAN INCREASE  */           
191.00 61019 /*                        PRINCIPAL REPORT                         */           
192.00 61019 /*-----------------------------------------------------------------*/           
193.00 61019 /*        Reference No. : C4042 (CHG-042-04)                       */           
194.00 61019 /*        User ID       : B459PGM                                  */           
195.00 61019 /*        User Name     : Brandon Leong                            */           
196.00 61019 /*        Changed Date  : 19-Mar-2004                              */           
197.00 61019 /*        Purpose       : add report and advice printing for       */           
198.00 61019 /*                        fixed rate loans                         */           
199.00 61019 /*-----------------------------------------------------------------*/           
200.00 61019 /*        REFERENCE NO. : C4067 (CHG-067-04)                       */           
201.00 61019 /*        USER ID       : B505PGM                                  */           
202.00 61019 /*        USER NAME     : PARIS CHE                                */           
203.00 61019 /*        CHANGED DATE  : 14-APR-2004                              */           
204.00 61019 /*        PURPOSE       : GENERATE MINOR A/C REPORT FOR EACH       */           
205.00 61019 /*                        BRANCH                                   */           
206.00 61019 /*-----------------------------------------------------------------*/           
207.00 61019 /*        Reference No. : C4138 (CHG-138-04)                       */           
208.00 61019 /*        User ID       : B505PGM                                  */           
209.00 61019 /*        User Name     : Paris Che                                */           
210.00 61019 /*        Changed Date  : 20-JUL-2004                              */           
211.00 61019 /*        Purpose       : Generate Loan Upfront Payment Report:    */           
212.00 61019 /*                        All Installments Settled Report          */           
213.00 61019 /*-----------------------------------------------------------------*/           
214.00 61019 /*        Reference No. : C4162 (CHG-162-04)                       */           
215.00 61019 /*        User ID       : B460PGM                                  */           
216.00 61019 /*        User Name     : Vicky Tou                                */           
217.00 61019 /*        Changed Date  : 31-AUG-2004                              */           
218.00 61019 /*        Purpose       : Generate Savings Account Item            */           
219.00 61019 /*                        Consolidation Advice                     */           
220.00 61019 /*-----------------------------------------------------------------*/           
221.00 61019 /*        Reference No. : C4214 (CHG-214-04)                       */           
222.00 61019 /*        User ID       : B422PGM                                  */           
223.00 61019 /*        User Name     : ANTHONY KAM                              */           
224.00 61019 /*        Changed Date  : 14 DEC 2004                              */           
225.00 61019 /*        Purpose       : ADD CALLING TO ANTI-MONEY LAUNDERING     */           
226.00 61019 /*                        DATABASE EXTRACTION AND RMB PROCESSING   */           
227.00 61019 /*-----------------------------------------------------------------*/           
228.00 61019 /*        Reference No. : C4184 (CHG-184-04)                       */           
229.00 61019 /*        User ID       : B459PGM                                  */           
230.00 61019 /*        User Name     : BRANDON LEONG                            */           
231.00 61019 /*        Changed Date  : 10 JAN 2005                              */           
232.00 61019 /*        Purpose       : Generate risk control reports            */           
233.00 61019 /*-----------------------------------------------------------------*/           
234.00 61019 /*        Reference No. : C5033 (CHG-033-05)                       */           
235.00 61019 /*        User ID       : B422PGM                                  */           
236.00 61019 /*        User Name     : ANTHONY KAM                              */           
237.00 61019 /*        Changed Date  : 14 MAR 2005                              */           
238.00 61019 /*        Purpose       : ADD AML REPORT PRINTING                  */           
239.00 61019 /*-----------------------------------------------------------------*/           
240.00 61019 /*        Reference No. : C5035 (CHG-035-05)                       */           
241.00 61019 /*        User ID       : B422PGM                                  */           
242.00 61019 /*        User Name     : ANTHONY KAM                              */           
243.00 61019 /*        Changed Date  : 17 MAR 2005                              */           
244.00 61019 /*        Purpose       : ADD CD DAILY TXN REPORT                  */           
245.00 61019 /*-----------------------------------------------------------------*/           
246.00 61019 /*        REFERENCE NO. : C5051 (CHG-051-05)                       */           
247.00 61019 /*        USER ID       : B323PGM                                  */           
248.00 61019 /*        USER NAME     : EDWARD CHEUNG                            */           
249.00 61019 /*        CHANGED DATE  : 03 MAY 2005                              */           
250.00 61019 /*        PURPOSE       : (TEMPORARY) TAKE 3 RPTS GENERATION OUT   */           
251.00 61019 /*                        TO CHINESE STATEMENT PRINTING AND        */           
252.00 61019 /*                        WILL BE RESUMED ON NEXT DAY              */           
253.00 61019 /*-----------------------------------------------------------------*/           
254.00 61019 /*        Reference No. : C5065 (CHG-065-05)                       */           
255.00 61019 /*        User ID       : B505PGM                                  */           
256.00 61019 /*        User Name     : Paris Che                                */           
257.00 61019 /*        Changed Date  : 10 May 2005                              */           
258.00 61019 /*        Purpose       : Add calling Loan Stimulation Campaign    */           
259.00 61019 /*                        PF001                                    */           
260.00 61019 /*-----------------------------------------------------------------*/           
261.00 61019 /*        Reference No. : C5083 (CHG-083-05)                       */           
262.00 61019 /*        User ID       : B422PGM                                  */           
263.00 61019 /*        User Name     : ANTHONY                                  */           
264.00 61019 /*        Changed Date  : 14 JUN 2005                              */           
265.00 61019 /*        Purpose       : Add calling TO DORMANT REMINDER ADVANCE  */           
266.00 61019 /*-----------------------------------------------------------------*/           
267.00 61019 /*        Reference No. : C5096 (CHG-096-05)                       */           
268.00 61019 /*        User ID       : B552PGM                                  */           
269.00 61019 /*        User Name     : CARMEN                                   */           
270.00 61019 /*        Changed Date  : 19 JULY 2005                             */           
271.00 61019 /*        Purpose       : Add calling TO PAST DUE LOAN REPORT      */           
272.00 61019 /*-----------------------------------------------------------------*/           
273.00 61019 /*        REFERENCE NO. : C6010 (CHG-010-06)                       */           
274.00 61019 /*        USER ID       : B552PGM                                  */           
275.00 61019 /*        USER NAME     : CARMEN                                   */           
276.00 61019 /*        CHANGED DATE  : 16 JAN 2006                              */           
277.00 61019 /*        PURPOSE       : ADD CALLING TO ACC. DEPT REPORT          */           
278.00 61019 /*-----------------------------------------------------------------*/           
279.00 61019 /*        REFERENCE NO. : C6023 (CHG-023-06)                       */           
280.00 61019 /*        USER ID       : B454PGM                                  */           
281.00 61019 /*        USER NAME     : ARIES LUNG                               */           
282.00 61019 /*        CHANGED DATE  : 27 JAN 2006                              */           
283.00 61019 /*        PURPOSE       : ADD CALLING TO LOAN WITH ZERO PRINCIPAL  */           
284.00 61019 /*                        BAL HAVING ACTIVE STATUS                 */           
285.00 61019 /*-----------------------------------------------------------------*/           
286.00 61019 /*        REFERENCE NO. : C6068 (CHG-068-06)                       */           
287.00 61019 /*        USER ID       : B422PGM                                  */           
288.00 61019 /*        USER NAME     : ANTHONY                                  */           
289.00 61019 /*        CHANGED DATE  : 28 FEB 2006                              */           
290.00 61019 /*        PURPOSE       : REMOVE CALLING TO REPORT:                */           
291.00 61019 /*                        DAILY REPORT FOR LONA INTEREST REBATE ON */           
292.00 61019 /*                        MATURITY                                 */           
293.00 61019 /*-----------------------------------------------------------------*/           
294.00 61019 /*        REFERENCE NO. : C6148 (CHG-148-06)                       */           
295.00 61019 /*        USER ID       : B552PGM                                  */           
296.00 61019 /*        USER NAME     : CARMEN                                   */           
297.00 61019 /*        CHANGED DATE  : 19 MAY 2006                              */           
298.00 61019 /*        PURPOSE       : ADD CALLING TO REPORT:                   */           
299.00 61019 /*                        1) EXIMBILLS CREDIT LINE RUNNING IN EXCESS  */        
300.00 61019 /*                        2) EXIMBILLS NOT LINKED TO ICBS CREDIT LINE */        
301.00 61019 /*-----------------------------------------------------------------*/           
302.00 61019 /*        REFERENCE NO. : C6161 (CHG-161-06)                       */           
303.00 61019 /*        USER ID       : B322PGM                                  */           
304.00 61019 /*        USER NAME     : EDWARD CHEUNG                            */           
305.00 61019 /*        CHANGED DATE  : 2 JUNE 2006                              */           
306.00 61019 /*        PURPOSE       : ADD REPORT FOR NEW OPEN TIME DEPOSIT    */            
307.00 61019 /*                        THROUGH OTHER THAN BRANCHES              */           
308.00 61019 /*-----------------------------------------------------------------*/           
309.00 61019 /*        Reference No. : C6179 (CHG-179-06)                       */           
310.00 61019 /*        User ID       : B422PGM                                  */           
311.00 61019 /*        User Name     : Anthony                                  */           
312.00 61019 /*        Changed Date  : 30 May 2006                              */           
313.00 61019 /*        Purpose       : Add calling to ZTMLIB/UPINTPYDT          */           
314.00 61019 /*                        For advance Time deposit interest payment   */        
315.00 61019 /*                        date to next working date if it fall on SAT */        
316.00 61019 /*-----------------------------------------------------------------*/           
317.00 61019 /*        Reference No. : C6166 (CHG-166-06)                       */           
318.00 61019 /*        User ID       : B422PGM                                  */           
319.00 61019 /*        User Name     : Anthony                                  */           
320.00 61019 /*        Changed Date  : 09 Sep 2006                              */           
321.00 61019 /*        Purpose       : Add calling to IPROD/AMLGENCL            */           
322.00 61019 /*                        For new AML report designed by compliance*/           
323.00 61019 /*                        office                                   */           
324.00 61019 /*-----------------------------------------------------------------*/           
325.00 61019 /*        Reference No. : C6270 (CHG-270-06)                       */           
326.00 61019 /*        User ID       : B657PGM & B323PGM                        */           
327.00 61019 /*        User Name     : Matthew Song & edward cheung             */           
328.00 61019 /*        Changed Date  : 3 Oct 2006                               */           
329.00 61019 /*        Purpose       : Add Branch Insured Limit Report          */           
330.00 61019 /*-----------------------------------------------------------------*/           
331.00 61020 /*        Reference No. : C6292 (CHG-292-06)                       */           
332.00 61019 /*        User ID       : B422                                     */           
333.00 61019 /*        User Name     : Anthony                                  */           
334.00 61019 /*        Changed Date  : 19 Oct 2006                              */           
335.00 61019 /*        Purpose       : Separate original reporting after PCOMB  */           
336.00 61019 /*                        job into 2 parts                         */           
337.00 61019 /*                        1. Reporting before G/L posting          */           
338.00 61019 /*                        2. Reporting after G/L positng           */           
339.00 61019 /*                        This program is for reporting before     */           
340.00 61019 /*                        G/L posting                              */           
341.00 61019 /*-----------------------------------------------------------------*/           
342.00 61108 /*        Reference No. : C6312 (CHG-312-06)                       */           
343.00 61108 /*        User ID       : B552PGM                                  */           
344.00 61108 /*        User Name     : Carmen Lei                               */           
345.00 61108 /*        Changed Date  : 8 Nov 2006                               */           
346.00 61108 /*        Purpose       : Move Report PTBRNLMT to after PCOM       */           
347.00 61108 /*                        (RPTAPP2)                                */           
348.00 71002 /*-----------------------------------------------------------------*/           
349.00 71002 /*        Reference No. : C7240 (CHG-240-07)                       */           
350.00 71002 /*        User ID       : B729PGM                                  */           
351.00 71002 /*        User Name     : Kylie Leong                              */           
352.00 71002 /*        Changed Date  : 2 Oct 2007                               */           
353.00 71002 /*        Purpose       : Generate the time deposit campaign report*/           
354.00 61108 /*-----------------------------------------------------------------*/           
355.00 71108 /*        Reference No. : C7283 (CHG-283-07)                       */           
356.00 71108 /*        User ID       : B729PGM                                  */           
357.00 71108 /*        User Name     : Kylie Leong                              */           
358.00 71108 /*        Changed Date  : 8 NOV 2007                               */           
359.00 71108 /*        Purpose       : Generate the FX TRANSACTION DIFF EXCHANGE*/           
360.00 71108 /*                        RATE REPORT                              */           
361.00 71108 /*-----------------------------------------------------------------*/           
362.00 80118 /*        Reference No. : C7368 (CHG-368-07)                       */           
363.00 71214 /*        User ID       : B784PGM                                  */           
364.00 71214 /*        User Name     : SUN NG                                   */           
365.00 71214 /*        Changed Date  : 14 DEC 2007                               */          
366.00 71214 /*        Purpose       : Generate MONTHLY AND WEEKLY TXN AND TELLER */         
367.00 71214 /*                        STATISTIC REPORT                         */           
368.00 71214 /*-----------------------------------------------------------------*/           
369.00 80114 /*        Reference No. : C7307 (CHG-307-07)                       */           
370.00 80114 /*        User ID       : B729PGM                                  */           
371.00 80114 /*        User Name     : Kylie Leong                              */           
372.00 80114 /*        Changed Date  : 14 Jan 2008                              */           
373.00 80114 /*        Purpose       : MKT070/07 loan interest rebate           */           
374.00 80114 /*-----------------------------------------------------------------*/           
375.00 80214 /*        Reference No. : C8047 (CHG-047-08)                       */           
376.00 80214 /*        User ID       : B784PGM                                  */           
377.00 80214 /*        User Name     : SUN NG                                   */           
378.00 80214 /*        Changed Date  : 14 FEB 2008                              */           
379.00 80214 /*        Purpose       : GENERATE DORMMANT A/C REPORT             */           
380.00 80214 /*-----------------------------------------------------------------*/           
381.00 80422 /*        Reference No. : C8102 (CHG-102-08)                       */           
382.00 80422 /*        User ID       : B784PGM                                  */           
383.00 80422 /*        User Name     : SUN NG                                   */           
384.00 80422 /*        Changed Date  : 22 APR 2008                              */           
385.00 80422 /*        Purpose       : GENERATE MRV REPORT                      */           
386.00 80422 /*-----------------------------------------------------------------*/           
387.00 80528 /*        Reference No. : C8148 (CHG-148-08)                       */           
388.00 80528 /*        User ID       : B552PGM                                  */           
389.00 80528 /*        User Name     : CARMEN LEI                               */           
390.00 80528 /*        Changed Date  : 28 MAY 2008                              */           
391.00 80528 /*        Purpose       : GENERATE SCEQ DONATION TXN REPORT        */           
392.00 80528 /*-----------------------------------------------------------------*/           
393.00 80612 /*        Reference No. : C8166 (CHG-166-08)                       */           
394.00 80612 /*        User ID       : B784PGM                                  */           
395.00 80612 /*        User Name     : SUN NG                                   */           
396.00 80612 /*        Changed Date  : 12 JUN 2008                              */           
397.00 80612 /*        Purpose       : CHANGE AGING REPORT FROM MONTHLY TO DAILY*/           
398.00 80612 /*-----------------------------------------------------------------*/           
399.00 80730 /*        Reference No. : C8173 (CHG-173-08)                       */           
400.00 80730 /*        User ID       : B729PGM                                  */           
401.00 80730 /*        User Name     : KYLIE LEONG                              */           
402.00 80730 /*        Changed Date  : 29 JUL 2008                              */           
403.00 80730 /*        Purpose       : ADD VIP BANKING REPORT                   */           
404.00 80730 /*-----------------------------------------------------------------*/           
405.00 80804 /*        Reference No. : C8208 (CHG-208-08)                       */           
406.00 80804 /*        User ID       : B784PGM                                  */           
407.00 80804 /*        User Name     : SUN NG                                   */           
408.00 80804 /*        Changed Date  : 04 AUG 2008                              */           
409.00 80804 /*        Purpose       : ADD DAILY MATURED T/DS WEEKLY REPORT     */           
410.00 80804 /*-----------------------------------------------------------------*/           
411.00 80815 /*        Reference No. : C8217 (CHG-217-08)                       */           
412.00 80815 /*        User ID       : B784PGM                                  */           
413.00 80815 /*        User Name     : SUN NG                                   */           
414.00 80815 /*        Changed Date  : 15 AUG 2008                              */           
415.00 80815 /*        Purpose       : ADD SIGNATURE CAPTURE EXCEPTION REPORT   */           
416.00 80815 /*-----------------------------------------------------------------*/           
417.00 80903 /*        Reference No. : C8224 (CHG-224-08)                       */           
418.00 80903 /*        User ID       : B784PGM                                  */           
419.00 80903 /*        User Name     : SUN NG                                   */           
420.00 80903 /*        Changed Date  : 03 SEP 2008                              */           
421.00 80903 /*        Purpose       : CUSTOMER STATUS 'R' REPORT               */           
422.00 80903 /*-----------------------------------------------------------------*/           
423.00 81216 /*        Reference No. : C8335 (CHG-335-08)                       */           
424.00 81216 /*        User ID       : BA04PGM                                  */           
425.00 81216 /*        User Name     : WAY CHOI                                 */           
426.00 81216 /*        Changed Date  : 16 DEC 2008                              */           
427.00 81216 /*        Purpose       : CALL IPROD/GENEAUDGL TO GENERATE EXTERNAL*/           
428.00 81216 /*                        AUDITOR G/L                              */           
429.00 81216 /*-----------------------------------------------------------------*/           
430.00 90119 /*        Reference No. : C9027 (CHG-027-09)                       */           
431.00 90119 /*        User ID       : B729PGM                                  */           
432.00 90119 /*        User Name     : Kylie Leong                              */           
433.00 90119 /*        Changed Date  : 19 Jan 2009                              */           
434.00 90119 /*        Purpose       : Generate the Signature Review Monitoring */           
435.00 90119 /*                        Report                                   */           
436.00 90119 /*-----------------------------------------------------------------*/           
437.00 90202 /*        Reference No. : C8337 (CHG-337-08)                       */           
438.00 90202 /*        User ID       : B729PGM                                  */           
439.00 90202 /*        User Name     : Kylie Leong                              */           
440.00 90202 /*        Changed Date  : 02 Feb 2009                              */           
441.00 90202 /*        Purpose       : Loan Cash Flow Report                    */           
442.00 90202 /*-----------------------------------------------------------------*/           
443.00 90219 /*        Reference No. : C9065 (CHG-065-09)                       */           
444.00 90219 /*        User ID       : B552PGM                                  */           
445.00 90219 /*        User Name     : CARMEN LEI                               */           
446.00 90219 /*        Changed Date  : 19 Feb 2009                              */           
447.00 90219 /*        Purpose       : ADD DSEJ PROCESS TO GET BILLED INTEREST  */           
448.00 90219 /*-----------------------------------------------------------------*/           
449.00 90513 /*        Reference No. : C9160 (CHG-160-09)                       */           
450.00 90513 /*        User ID       : BA04PGM                                  */           
451.00 90513 /*        User Name     : WAY CHOI                                 */           
452.00 90513 /*        Changed Date  : 13 May 2009                              */           
453.00 90513 /*        Purpose       : Generate BG data with Fixed Deposit at   */           
454.00 90513 /*                        beginning of month.                      */           
455.00 90513 /*-----------------------------------------------------------------*/           
456.00 90526 /*        Reference No. : C9169 (CHG-169-09)                       */           
457.00 90526 /*        User ID       : B552PGM                                  */           
458.00 90526 /*        User Name     : CARMEN LEI                               */           
459.00 90526 /*        Changed Date  : 26 May 2009                              */           
460.00 90526 /*        Purpose       : Generate RPT OF BCM NET                  */           
461.00 90526 /*                        SIGN ON IN DIFFERENT LOCATION ON SAME DAY*/           
462.00 90526 /*-----------------------------------------------------------------*/           
463.00 90605 /*        REFERENCE NO. : C9164 (CHG-164-09)                       */           
464.00 90605 /*        USER ID       : B552PGM                                  */           
465.00 90605 /*        USER NAME     : CARMEN LEI                               */           
466.00 90605 /*        CHANGED DATE  : 19 MAY 2009                              */           
467.00 90605 /*        PURPOSE       : GENERATE GEN TRADE FINANCE USED LIMIT    */           
468.00 90605 /*                        EXCEPTION REPORT                         */           
469.00 90605 /*-----------------------------------------------------------------*/           
470.00 90623 /*        REFERENCE NO. : C9206 (CHG-206-09)                       */           
471.00 90623 /*        USER ID       : BA04PGM                                  */           
472.00 90623 /*        USER NAME     : WAY CHOI                                 */           
473.00 90623 /*        CHANGED DATE  : 23 JUN 2009                              */           
474.00 90623 /*        PURPOSE       : Daily Report for New Loans Granted       */           
475.00 90623 /*                        (for Retail Segment)                     */           
476.00 90623 /*-----------------------------------------------------------------*/           
477.00 90630 /*        REFERENCE NO. : C9213 (CHG-213-09)                       */           
478.00 90630 /*        USER ID       : BA04PGM                                  */           
479.00 90630 /*        USER NAME     : WAY CHOI                                 */           
480.00 90630 /*        CHANGED DATE  : 30 JUN 2009                              */           
481.00 90630 /*        PURPOSE       : Backup and Delete PSP80101 and PSP80003  */           
482.00 90630 /*                        Data                                     */           
483.00 90630 /*-----------------------------------------------------------------*/           
484.00 90702 /*        REFERENCE NO. : C9215 (CHG-215-09)                       */           
485.00 90702 /*        USER ID       : BA04PGM                                  */           
486.00 90702 /*        USER NAME     : WAY CHOI                                 */           
487.00 90702 /*        CHANGED DATE  : 02 JUL 2009                              */           
488.00 90702 /*        PURPOSE       : Generate Report of BCM Top 30 Depositers */           
489.00 90702 /*                                                                 */           
490.00 90702 /*-----------------------------------------------------------------*/           
491.00 90722 /*        REFERENCE NO. : C9244 (CHG-244-09)                       */           
492.00 90722 /*        USER ID       : BA04PGM                                  */           
493.00 90722 /*        USER NAME     : WAY CHOI                                 */           
494.00 90722 /*        CHANGED DATE  : 22 JUL 2009                              */           
495.00 90722 /*        PURPOSE       : Generate Documentor Information          */           
496.00 90722 /*                                                                 */           
497.00 90722 /*-----------------------------------------------------------------*/           
498.00 91201 /*        REFERENCE NO. : C9328 (CHG-328-09)                       */           
499.00 91201 /*        USER ID       : BA04PGM                                  */           
500.00 91201 /*        USER NAME     : WAY CHOI                                 */           
501.00 91201 /*        CHANGED DATE  : 26 NOV 2009                              */           
502.00 91201 /*        PURPOSE       : Generate AMCM Monthly Report             */           
503.00 91201 /*                                                                 */           
504.00 91201 /*-----------------------------------------------------------------*/           
505.00 100407 /*        REFERENCE NO. : D0062 (CHG-062-10)                       */           
506.00 100407 /*        USER ID       : BA55PGM                                  */           
507.00 100407 /*        USER NAME     : KARL HUANG                               */           
508.00 100407 /*        CHANGED DATE  : 07 APR 2010                              */           
509.00 100407 /*        PURPOSE       : Generate Personal Loan data and report   */           
510.00 100407 /*                        through the criteria                     */           
511.00 100407 /*-----------------------------------------------------------------*/           
512.00 100507 /*        REFERENCE NO. : D0114 (CHG-114-10)                       */           
513.00 100507 /*        USER ID       : BA56PGM                                  */           
514.00 100507 /*        USER NAME     : Alan Chu                                 */           
515.00 100507 /*        CHANGED DATE  : 07 MAY 2010                              */           
516.00 100507 /*        PURPOSE       : GENERATE DATA FILES FOR BUSINESS         */           
517.00 100507 /*                        DEVELOPMENT UNIT                         */           
518.00 100507 /*-----------------------------------------------------------------*/           
519.00 100531 /*        REFERENCE NO. : D0124 (CHG-124-10)                       */           
520.00 100531 /*        USER ID       : BA04PGM                                  */           
521.00 100531 /*        USER NAME     : Way Choi                                 */           
522.00 100531 /*        CHANGED DATE  : 31 MAY 2010                              */           
523.00 100531 /*        PURPOSE       : Daily Update Passbook Balance            */           
524.00 100531 /*                                                                 */           
525.00 100531 /*-----------------------------------------------------------------*/           
526.00 100628 /*        REFERENCE NO. : D0163 (CHG-163-10)                       */           
527.00 100628 /*        USER ID       : BA56PGM                                  */           
528.00 100628 /*        USER NAME     : Alan Chu                                 */           
529.00 100628 /*        CHANGED DATE  : 28 JUN 2010                              */           
530.00 100628 /*        PURPOSE       : GENERATE CUSTOMER ID/PASSPORT SEARCH     */           
531.00 100628 /*                        REPORT                                   */           
532.00 100628 /*-----------------------------------------------------------------*/           
533.00 100721 /*        REFERENCE NO. : D0180 (CHG-180-10)                       */           
534.00 100721 /*        USER ID       : BA55PGM                                  */           
535.00 100721 /*        USER NAME     : Karl H.JR                                */           
536.00 100721 /*        CHANGED DATE  : 21 JUl 2010                              */           
537.00 100721 /*        PURPOSE       : MAXSAVE - Generate Interest Rate and Past*/           
538.00 100721 /*                        Due records                              */           
539.00 100721 /*-----------------------------------------------------------------*/           
540.00 100917 /*        REFERENCE NO. : D0245 (CHG-245-10)                       */           
541.00 100917 /*        USER ID       : BB14PGM                                  */           
542.00 100917 /*        USER NAME     : Francisco Lo                             */           
543.00 100917 /*        CHANGED DATE  : 17 SEP 2010                              */           
544.00 100927 /*        PURPOSE       : Change call statement of AOFCL, RCMAIN,  */           
545.00 100927 /*                        UNACCRPT and PSTXSTATIC to submit job    */           
546.00 100927 /*                        batch. Remove submitting job             */           
547.00 100927 /*                        ZSAVPLUS/UPDPBKCL                        */           
548.00 100917 /*-----------------------------------------------------------------*/           
549.00 100917 /*        REFERENCE NO. : D0246 (CHG-246-10)                       */           
550.00 100917 /*        USER ID       : BB16PGM                                  */           
551.00 100917 /*        USER NAME     : ALVIN LEI                                */           
552.00 100917 /*        CHANGED DATE  : 17 SEP 2010                              */           
553.00 100920 /*        PURPOSE       : Provide Regularly Updated iSecurities    */           
554.00 100920 /*                        Customer data file                       */           
555.00 100917 /*-----------------------------------------------------------------*/           
556.00 101018 /*        REFERENCE NO. : D0255 (CHG-255-10)                       */           
557.00 101018 /*        USER ID       : BA55PGM                                  */           
558.00 101018 /*        USER NAME     : KARL H.JR                                */           
559.00 101018 /*        CHANGED DATE  : 18 OCT 2010                              */           
560.00 101018 /*        PURPOSE       : EOD Job of Safe Deposit Box              */           
561.00 101018 /*-----------------------------------------------------------------*/           
562.00 101130 /*        REFERENCE NO. : D0286 (CHG-286-10)                       */           
563.00 101130 /*        USER ID       : BA55PGM                                  */           
564.00 101130 /*        USER NAME     : KARL H.JR                                */           
565.00 101130 /*        CHANGED DATE  : 30 NOV 2010                              */           
566.00 101130 /*        PURPOSE       : EOD Job of Generate Past Due SMS         */           
567.00 101130 /*-----------------------------------------------------------------*/           
568.00 101213 /*        REFERENCE NO. : D0322 (CHG-322-10)                       */           
569.00 101213 /*        USER ID       : BB16PGM                                  */           
570.00 101213 /*        USER NAME     : ALVIN LEI                                */           
571.00 101213 /*        CHANGED DATE  : 13 DEC 2010                              */           
572.00 101214 /*        PURPOSE       : Add more information into OnDemand report*/           
573.00 101214 /*                        "Account opened without image",and change*/           
574.00 101214 /*                        the job to batch job.                    */           
575.00 101213 /*-----------------------------------------------------------------*/           
576.00 110113 /*        REFERENCE NO. : D0340 (CHG-340-10)                       */           
577.00 110103 /*        USER ID       : BB16PGM                                  */           
578.00 110103 /*        USER NAME     : ALVIN LEI                                */           
579.00 110103 /*        CHANGED DATE  : 29 DEC 2010                              */           
580.00 110104 /*        PURPOSE       : Generate high risk customer report       */           
581.00 110128 /*-----------------------------------------------------------------*/           
582.00 110128 /*        REFERENCE NO. : D1033 (CHG-033-11)                       */           
583.00 110128 /*        USER ID       : BB14PGM                                  */           
584.00 110128 /*        USER NAME     : FRANCISCO LO                             */           
585.00 110128 /*        CHANGED DATE  : 28 JAN 2011                              */           
586.00 110201 /*        PURPOSE       : Add customer maintenance log             */           
587.00 110103 /*-----------------------------------------------------------------*/           
588.00 110324 /*        REFERENCE NO. : D1090 (CHG-090-11)                       */           
589.00 110324 /*        USER ID       : BB16PGM                                  */           
590.00 110324 /*        USER NAME     : ALVIN LEI                                */           
591.00 110324 /*        CHANGED DATE  : 24 MAR 2011                              */           
592.00 110324 /*        PURPOSE       : Generate a new query TDREPOFF (original: */           
593.00 110324 /*                        TDREP) that is sorted by officer         */           
594.00 110324 /*-----------------------------------------------------------------*/           
595.00 110325 /*        REFERENCE NO. : D1086 (CHG-086-11)                       */           
596.00 110325 /*        USER ID       : BB16PGM                                  */           
597.00 110325 /*        USER NAME     : ALVIN LEI                                */           
598.00 110325 /*        CHANGED DATE  : 25 MAR 2011                              */           
599.00 110325 /*        PURPOSE       : Remove link                              */           
600.00 110325 /*-----------------------------------------------------------------*/           
601.00 110404 /*        REFERENCE NO. : D1024 (CHG-024-11)                       */           
602.00 110404 /*        USER ID       : BB16PGM                                  */           
603.00 110404 /*        USER NAME     : ALVIN LEI                                */           
604.00 110404 /*        CHANGED DATE  : 04 APR 2011                              */           
605.00 110419 /*        PURPOSE       : Generate Customer SCC Review Report      */           
606.00 110404 /*-----------------------------------------------------------------*/           
607.00 110427 /*        REFERENCE NO. : D1112 (CHG-112-11)                       */           
608.00 110427 /*        USER ID       : BB14PGM                                  */           
609.00 110427 /*        USER NAME     : FRANCISCO LO                             */           
610.00 110427 /*        CHANGED DATE  : 27 APR 2011                              */           
611.00 110427 /*        PURPOSE       : Move calling to OVLNCL (OVER LIMIT LOANS */           
612.00 110427 /*                        REPORT) to RPTAPP2                       */           
613.00 110427 /*-----------------------------------------------------------------*/           
614.00 110509 /*        Reference No. : D1024 (CHG-024-11)                       */           
615.00 110509 /*        User ID       : BA55PGM                                  */           
616.00 110509 /*        User Name     : KARL                                     */           
617.00 110509 /*        Changed Date  : 09 MAY 2011                              */           
618.00 110509 /*        Purpose       : Update A/C define field value of MCC &   */           
619.00 110509 /*                        NFF account                              */           
620.00 110509 /*-----------------------------------------------------------------*/           
621.00 110920 /*        Reference No. : D1274 (CHG-274-11)                       */           
622.00 110920 /*        User ID       : BB14PGM                                  */           
623.00 110920 /*        User Name     : FRANCISCO LO                             */           
624.00 110920 /*        Changed Date  : 20 SEP 2011                              */           
625.00 110920 /*        Purpose       : VIP-STOCK CROSS CHECK REPORT             */           
626.00 110920 /*-----------------------------------------------------------------*/           
627.00 110920 /*        Reference No. : D1249 (CHG-249-11)                       */           
628.00 110920 /*        User ID       : BA55PGM                                  */           
629.00 110920 /*        User Name     : KARL                                     */           
630.00 110920 /*        Changed Date  : 20 SEP 2011                              */           
631.00 110920 /*        Purpose       : SUBMIT JOB TO UPDATE PURGED DATA         */           
632.00 110920 /*-----------------------------------------------------------------*/           
633.00 110923 /*        REFERENCE NO. : D1266 (CHG-266-11)                       */           
634.00 110923 /*        USER ID       : BB16PGM                                  */           
635.00 110923 /*        USER NAME     : ALVIN LEI                                */           
636.00 110923 /*        CHANGED DATE  : 23 SEP 2011                              */           
637.00 110923 /*        PURPOSE       : GENERATE CORRESPONDENT BANK REPORTS      */           
638.00 110923 /*-----------------------------------------------------------------*/           
639.00 111019 /*        REFERENCE NO. : D1303 (CHG-303-11)                       */           
640.00 111019 /*        USER ID       : BB88PGM                                  */           
641.00 111019 /*        USER NAME     : HELMOND IO                               */           
642.00 111019 /*        CHANGED DATE  : 19 OCT 2011                              */           
643.00 111019 /*        PURPOSE       : Customer Information Update - Deliverable*/           
644.00 111019 /*-----------------------------------------------------------------*/           
645.00 120103 /*        REFERENCE NO. : CHG-385-11                               */           
646.00 120103 /*        USER ID       : BA55PGM                                  */           
647.00 120103 /*        USER NAME     : KARL                                     */           
648.00 120103 /*        CHANGED DATE  : 03 JAN 2012                              */           
649.00 120103 /*        PURPOSE       : GENERATE CORRESPONDENT BANK SME REPORT   */           
650.00 120103 /*-----------------------------------------------------------------*/           
651.00 120105 /*        REFERENCE NO. : CHG-396-11 (D1396)                       */           
652.00 120105 /*        USER ID       : BB16PGM                                  */           
653.00 120105 /*        USER NAME     : ALVIN LEI                                */           
654.00 120105 /*        CHANGED DATE  : 05 JAN 2012                              */           
655.00 120105 /*        PURPOSE       : GENERATE DIRECT MAILING CAMPAIGN FOR     */           
656.00 120105 /*                        WEALTH MANAGEMENT CUSTOMERS              */           
657.00 120105 /*-----------------------------------------------------------------*/           
658.00 120206 /*        Reference No. : D1312 (CHG-312-11)                       */           
659.00 120206 /*        User ID       : BB14PGM                                  */           
660.00 120206 /*        User Name     : FRANCISCO LO                             */           
661.00 120206 /*        Changed Date  : 06 FEB 2012                              */           
662.00 120206 /*        Purpose       : REMOVE VIP CROSS CHECK REPORT            */           
663.00 120206 /*-----------------------------------------------------------------*/           
664.00 120220 /*        REFERENCE NO. : D2022 (CHG-022-12)                       */           
665.00 120220 /*        USER ID       : BA55PGM                                  */           
666.00 120220 /*        USER NAME     : KARL                                     */           
667.00 120220 /*        CHANGED DATE  : 20 FEB 2012                              */           
668.00 120220 /*        PURPOSE       : Generate Customer review report          */           
669.00 120220 /*-----------------------------------------------------------------*/           
670.00 120412 /*        REFERENCE NO. : D2112 (CHG-112-12)                       */           
671.00 120412 /*        USER ID       : BA55PGM                                  */           
672.00 120412 /*        USER NAME     : KARL                                     */           
673.00 120412 /*        CHANGED DATE  : 12 APR 2012                              */           
674.00 120412 /*        PURPOSE       : Generate past due loan letter details    */           
675.00 120412 /*-----------------------------------------------------------------*/           
676.00 120618 /*        REFERENCE NO. : D2063 (CHG-063-12)                       */           
677.00 120614 /*        USER ID       : BB16PGM                                  */           
678.00 120614 /*        USER NAME     : ALVIN LEI                                */           
679.00 120614 /*        CHANGED DATE  : 14 JUN 2012                              */           
680.00 120614 /*        PURPOSE       : GENERATE NEW SMARTSALARY REPORTS         */           
681.00 120614 /*-----------------------------------------------------------------*/           
682.00 120907 /*        REFERENCE NO. : D2262 (CHG-262-12)                       */           
683.00 120907 /*        USER ID       : BA55PGM                                  */           
684.00 120907 /*        USER NAME     : KARL                                     */           
685.00 120907 /*        CHANGED DATE  : 07 SEP 2012                              */           
686.00 120907 /*        PURPOSE       : Generate incomplete info of A/C opening  */           
687.00 120907 /*-----------------------------------------------------------------*/           
688.00 120920 /*        REFERENCE NO. : D2280 (CHG-280-12)                       */           
689.00 120920 /*        USER ID       : BE95PGM                                  */           
690.00 120920 /*        USER NAME     : JOANNA CHONG                             */           
691.00 120920 /*        CHANGED DATE  : 20 SEP 2012                              */           
692.00 120920 /*        PURPOSE       : Generate credit card limit report        */           
693.00 120920 /*-----------------------------------------------------------------*/           
694.00 121005 /*        REFERENCE NO. : D2299 (CHG-299-12)                       */           
695.00 121005 /*        USER ID       : BB16PGM                                  */           
696.00 121005 /*        USER NAME     : ALVIN LEI                                */           
697.00 121005 /*        CHANGED DATE  : 05 OCT 2012                              */           
698.00 121120 /*        PURPOSE       : ADJUST FLEXIBLE STEP-UP DEPOSIT START    */           
699.00 121120 /*                        DAY BAL. AND LAST STEP STARTING BAL.     */           
700.00 121005 /*-----------------------------------------------------------------*/           
701.00 121029 /*        REFERENCE NO. : D2331 (CHG-331-12)                       */           
702.00 121029 /*        USER ID       : BE95PGM                                  */           
703.00 121029 /*        USER NAME     : JOANNA CHONG                             */           
704.00 121029 /*        CHANGED DATE  : 29 OCT 2012                              */           
705.00 121029 /*        PURPOSE       : Generate Group Outstanding Detail        */           
706.00 121029 /*                                                                 */           
707.00 121029 /*-----------------------------------------------------------------*/           
708.00 121105 /*        REFERENCE NO. : D2061 (CHG-061-12)                       */           
709.00 121105 /*        USER ID       : BB16PGM                                  */           
710.00 121105 /*        USER NAME     : ALVIN LEI                                */           
711.00 121105 /*        CHANGED DATE  : 05 NOV 2012                              */           
712.00 121115 /*        PURPOSE       : GENERATE PI EXPIRED RECORDS AND          */           
713.00 121115 /*                        USER-DEFINED FIELD MODIFICATION REPORT   */           
714.00 121105 /*-----------------------------------------------------------------*/           
715.00 121126 /*        REFERENCE NO. : D2355 (CHG-355-12)                       */           
716.00 121126 /*        USER ID       : BE95PGM                                  */           
717.00 121126 /*        USER NAME     : JOANNA CHONG                             */           
718.00 121126 /*        CHANGED DATE  : 26 NOV 2012                              */           
719.00 121126 /*        PURPOSE       : Generate Lunar Year Note Exchange        */           
720.00 121126 /*                        Outgoing Report                          */           
721.00 121126 /*-----------------------------------------------------------------*/           
722.00 130118 /*        REFERENCE NO. : D3017 (CHG-017-13)                       */           
723.00 130118 /*        USER ID       : BA55PGM                                  */           
724.00 130118 /*        USER NAME     : KARL                                     */           
725.00 130118 /*        CHANGED DATE  : 18 JAN 2013                              */           
726.00 130118 /*        PURPOSE       : Generate T/D mature in next 8-15 day RPT */           
727.00 130118 /*-----------------------------------------------------------------*/           
728.00 130129 /*        REFERENCE NO. : D3013 (CHG-013-13)                       */           
729.00 130129 /*        USER ID       : BE95PGM                                  */           
730.00 130129 /*        USER NAME     : JOANNA CHONG                             */           
731.00 130129 /*        CHANGED DATE  : 29 JAN 2013                              */           
732.00 130129 /*        PURPOSE       : Generate SMC Customers Monthly Report    */           
733.00 130129 /*-----------------------------------------------------------------*/           
734.00 130304 /*        REFERENCE NO. : D3012 (CHG-012-13)                       */           
735.00 130219 /*        USER ID       : BE95PGM                                  */           
736.00 130219 /*        USER NAME     : JOANNA CHONG                             */           
737.00 130219 /*        CHANGED DATE  : 19 FEB 2013                              */           
738.00 130219 /*        PURPOSE       : Generate Lunar Year Note Exchange        */           
739.00 130219 /*                        Outgoing Report (ZDSNTELIB)              */           
740.00 130219 /*-----------------------------------------------------------------*/           
741.00 130304 /*        REFERENCE NO. : D3066 (CHG-066-13)                       */           
742.00 130304 /*        USER ID       : BE95PGM                                  */           
743.00 130304 /*        USER NAME     : JOANNA CHONG                             */           
744.00 130304 /*        CHANGED DATE  : 20 MAR 2013                              */           
745.00 130304 /*        PURPOSE       : Generate monthly report when             */           
746.00 130304 /*                        'UNDELIVERED MAILS' is inputted in the   */           
747.00 130304 /*                        field of CIF/AC address                  */           
748.00 130304 /*-----------------------------------------------------------------*/           
749.00 130312 /*        REFERENCE NO. : D2364 (CHG-364-12)                       */           
750.00 130312 /*        USER ID       : BA55PGM                                  */           
751.00 130312 /*        USER NAME     : KARL                                     */           
752.00 130312 /*        CHANGED DATE  : 08 MAR 2013                              */           
753.00 130312 /*        PURPOSE       : ADD SWIFT INWARD MESSAGE EOD PROCESS CL  */           
754.00 130312 /*-----------------------------------------------------------------*/           
755.00 130322 /*        REFERENCE NO. : D3083 (CHG-083-13)                       */           
756.00 130322 /*        USER ID       : BA55PGM                                  */           
757.00 130322 /*        USER NAME     : KARL                                     */           
758.00 130322 /*        CHANGED DATE  : 22 MAR 2013                              */           
759.00 130322 /*        PURPOSE       : ADD REPORT OF CLPGI PRODUCT              */           
760.00 130322 /*-----------------------------------------------------------------*/           
761.00 130326 /*        REFERENCE NO. : D3095 (CHG-095-13)                       */           
762.00 130326 /*        USER ID       : BE95PGM                                  */           
763.00 130326 /*        USER NAME     : JOANNA CHONG                             */           
764.00 130326 /*        CHANGED DATE  : 25 MAR 2013                              */           
765.00 130326 /*        PURPOSE       : Generate Lunar Year Note Exchange        */           
766.00 130326 /*                        Outgoing Report (Dragon2012)(ZDSNTEDRG)  */           
767.00 130326 /*-----------------------------------------------------------------*/           
768.00 130506 /*        REFERENCE NO. : D3073 (CHG-073-13)                       */           
769.00 130506 /*        USER ID       : BB16PGM                                  */           
770.00 130506 /*        USER NAME     : ALVIN LEI                                */           
771.00 130506 /*        CHANGED DATE  : 06 MAY 2013                              */           
772.00 130506 /*        PURPOSE       : GENERATE ELI TIME DEPOSIT REPORT         */           
773.00 130506 /*-----------------------------------------------------------------*/           
774.00 130514 /*        REFERENCE NO. : D3160 (CHG-160-13)                       */           
775.00 130514 /*        USER ID       : BE95PGM                                  */           
776.00 130514 /*        USER NAME     : JOANNA CHONG                             */           
777.00 130514 /*        CHANGED DATE  : 14 MAY 2013                              */           
778.00 130514 /*        PURPOSE       : GENERATE INDIRECT LIABILITIES REPORT     */           
779.00 130514 /*-----------------------------------------------------------------*/           
780.00 130619 /*        REFERENCE NO. : D3211 (CHG-211-13)                       */           
781.00 130619 /*        USER ID       : BA55PGM                                  */           
782.00 130619 /*        USER NAME     : KARL HUANG                               */           
783.00 130619 /*        CHANGED DATE  : 19 JUN 2013                              */           
784.00 130619 /*        PURPOSE       : EXTRACT PAYROLL A/C INFO FOR MID         */           
785.00 130619 /*-----------------------------------------------------------------*/           
786.00 130731 /*        REFERENCE NO. : D3269 (CHG-269-13)                       */           
787.00 130731 /*        USER ID       : BG09PGM                                  */           
788.00 130731 /*        USER NAME     : ALBERT AU                                */           
789.00 130731 /*        CHANGED DATE  : 31 JUL 2013                              */           
790.00 130731 /*        PURPOSE       : INWARD/OUTWARD REMITTANCE ON MONTHLY     */           
791.00 130731 /*-----------------------------------------------------------------*/           
792.00 130819 /*        REFERENCE NO. : D3290 (CHG-290-13)                       */           
793.00 130819 /*        USER ID       : BG09PGM                                  */           
794.00 130819 /*        USER NAME     : ALBERT AU                                */           
795.00 130819 /*        CHANGED DATE  : 19 AUG 2013                              */           
796.00 130819 /*        PURPOSE       : GOVERNMENT WEALTH PARTAKING SCHEME 2013  */           
797.00 130819 /*-----------------------------------------------------------------*/           
798.00 131024 /*        REFERENCE NO. : D3360 (CHG-360-13)                       */           
799.00 131004 /*        USER ID       : BG24PGM                                  */           
800.00 131004 /*        USER NAME     : ERIC WONG                                */           
801.00 131004 /*        CHANGED DATE  : 04 OCT 2013                              */           
802.00 131024 /*        PURPOSE       : CL TO RUN LCR REPORT                     */           
803.00 131004 /*-----------------------------------------------------------------*/           
804.00 131021 /*        REFERENCE NO. : D3345 (CHG-0345-13)                      */           
805.00 131021 /*        USER ID       : BG09PGM                                  */           
806.00 131021 /*        USER NAME     : ALBERT AU                                */           
807.00 131021 /*        CHANGED DATE  : 04 OCT 2013                              */           
808.00 131021 /*        PURPOSE       : CREATE DATA FILE FOR NON-VIP CUSTOMER    */           
809.00 131021 /*                        PORTFOLIIO ANALYSIS                      */           
810.00 131021 /*-----------------------------------------------------------------*/           
811.00 140318 /*        REFERENCE NO. : D4083 (CHG-0083-14)                      */           
812.00 140318 /*        USER ID       : BG58PGM                                  */           
813.00 140318 /*        USER NAME     : WINE CHAN                                */           
814.00 140318 /*        CHANGED DATE  : 18 MAR 2014                              */           
815.00 140318 /*        PURPOSE       : REPORT FOR THE EARLY/PARTIAL LOAN        */           
816.00 140318 /*-----------------------------------------------------------------*/           
817.00 140318 /*        REFERENCE NO. : D4107 (CHG-0107-14)                      */           
818.00 140318 /*        USER ID       : BG58PGM                                  */           
819.00 140318 /*        USER NAME     : WINE CHAN                                */           
820.00 140318 /*        CHANGED DATE  : 18 MAR 2014                              */           
821.00 140318 /*        PURPOSE       : MAIL MERGE OF THE BAD DEBT LOAN REPORT   */           
822.00 140318 /*-----------------------------------------------------------------*/           
823.00 140402 /*        REFERENCE NO. : D4129 (CHG-0129-14)                      */           
824.00 140402 /*        USER ID       : BG24PGM                                  */           
825.00 140402 /*        USER NAME     : ERIC WONG                                */           
826.00 140402 /*        CHANGED DATE  : 01 APR 2014                              */           
827.00 140402 /*        PURPOSE       : ADD DESPOSIT RPT FOR MORE INSURE BUSINESS*/           
828.00 140402 /*-----------------------------------------------------------------*/           
829.00 140415 /*        REFERENCE NO. : D4142 (CHG-0142-14)                      */           
830.00 140411 /*        USER ID       : BG24PGM                                  */           
831.00 140411 /*        USER NAME     : ERIC WONG                                */           
832.00 140411 /*        CHANGED DATE  : 11 APR 2014                              */           
833.00 140411 /*        PURPOSE       : PLEDGED FIXED DEPOSITS WITH SINGLE       */           
834.00 140411 /*                        MATURITY 7 DAY PRIOR                     */           
835.00 140411 /*-----------------------------------------------------------------*/           
836.00 140613 /*        REFERENCE NO. : D4232 (CHG-0232-14)                      */           
837.00 140613 /*        USER ID       : BG58PGM                                  */           
838.00 140613 /*        USER NAME     : WINE CHAN                                */           
839.00 140613 /*        CHANGED DATE  : 13 JUN 2014                              */           
840.00 140613 /*        PURPOSE       : CONVERT THE FILE OF BCM CORB AML         */           
841.00 140613 /*-----------------------------------------------------------------*/           
842.00 140710 /*        REFERENCE NO. : CHG-0223-14 (D4223)                      */           
843.00 140710 /*        AUTHOR        : WINE CHAN                                */           
844.00 140710 /*        CHANGED DATE  : 10 JUL 2014                              */           
845.00 140710 /*        REASON        : GET ACAM EMPLOYER DAILY BALANCE          */           
846.00 140710 /*                                                                 */           
847.00 140710 /*-----------------------------------------------------------------*/           
848.00 140910 /*        REFERENCE NO. : CHG-0367-14 (D4367)                      */           
849.00 140910 /*        AUTHOR        : ERIC WONG                                */           
850.00 140910 /*        CHANGED DATE  : 10 SEP 2014                              */           
851.00 140910 /*        REASON        : ADD COLUMN TO SHOW THE CREDIT CARD STATUS*/           
852.00 140910 /*-----------------------------------------------------------------*/           
853.00 140912 /*        REFERENCE NO. : CHG-0344-14 (D4344)                      */           
854.00 140912 /*        AUTHOR        : ERIC WONG                                */           
855.00 140912 /*        CHANGED DATE  : 10 SEP 2014                              */           
856.00 140912 /*        REASON        : RETRIVE AUTOPAY REBATE REPORT            */           
857.00 140912 /*-----------------------------------------------------------------*/           
858.00 150305 /*        REFERENCE NO. : CHG-064-15 (D5064)                       */           
859.00 150305 /*        AUTHOR        : Karl BA55                                */           
860.00 150305 /*        CHANGED DATE  : 05 Mar 2015                              */           
861.00 150305 /*        REASON        : Update credit card statement cycle info  */           
862.00 150305 /*-----------------------------------------------------------------*/           
863.00 150506 /*        REFERENCE NO. : CHG-0040-15 (D5040)                      */           
864.00 150506 /*        AUTHOR        : ALBERT AU                                */           
865.00 150506 /*        CHANGED DATE  : 09 APR 2015                              */           
866.00 150506 /*        REASON        : GET DAILY INFORMATION FOR                */           
867.00 150506 /*                        SAS FILE (AML)                           */           
868.00 150506 /*-----------------------------------------------------------------*/           
869.00 150709 /*        REFERENCE NO. : CHG-0221-15 (D5221)                      */           
870.00 150709 /*        AUTHOR        : TOMMY TONG                               */           
871.00 150709 /*        CHANGED DATE  : 09 JUL 2015                              */           
872.00 150709 /*        REASON        : CDD MEMO DAILY REPORT                    */           
873.00 150709 /*-----------------------------------------------------------------*/           
874.00 150717 /*        REFERENCE NO. : CHG-0239-15 (D5239)                      */           
875.00 150717 /*        AUTHOR        : WINE CHAN                                */           
876.00 150717 /*        CHANGED DATE  : 17 JUL 2015                              */           
877.00 150717 /*        REASON        : UNDRAWN OD LINE CUSTOMER DATA            */           
878.00 150717 /*-----------------------------------------------------------------*/           
879.00 150805 /*        REFERENCE NO. : CHG-0267-15 (D5267)                      */           
880.00 150805 /*        AUTHOR        : TOMMY TONG                               */           
881.00 150805 /*        CHANGED DATE  : 05 AUG 2015                              */           
882.00 150805 /*        REASON        : LOAN MATURING WITHIN 180 DAYS REPORT     */           
883.00 150805 /*                        (OVER MOP 1M)                            */           
884.00 150805 /*-----------------------------------------------------------------*/           
885.00 150805 /*        REFERENCE NO. : CHG-0268-15 (D5268)                      */           
886.00 150805 /*        AUTHOR        : WINE CHAN                                */           
887.00 150805 /*        CHANGED DATE  : 05 AUG 2015                              */           
888.00 150805 /*        REASON        : LEVEL-UP POSTING RECORD TO IPROD/TMCWRK  */           
889.00 150805 /*-----------------------------------------------------------------*/           
890.00 150819 /*        REFERENCE NO. : CHG-0274-15 (D5274)                      */           
891.00 150819 /*        AUTHOR        : BG09PGM ALBERT AU                        */           
892.00 150819 /*        CHANGED DATE  : 11 AUG 2015                              */           
893.00 150819 /*        REASON        : CALL-BACK CONFIRMATION MONITORING CONTROL*/           
894.00 150819 /*                        REPORT                                   */           
895.00 150819 /*        REMARK        :                                          */           
896.00 150819 /*-----------------------------------------------------------------*/           
897.00 150910 /*        REFERENCE NO. : CHG-0275-15 (D5275)                      */           
898.00 150910 /*        AUTHOR        : ALBERT AU                                */           
899.00 150910 /*        USER ID.      : BG09PGM                                  */           
900.00 150910 /*        DATE WRITTEN  : 23 FEB 2015                              */           
901.00 150910 /*        DESCRPITION   : GET CIF POSITION DATA                    */           
902.00 150910 /*-----------------------------------------------------------------*/           
903.00 150916 /*        REFERENCE NO. : CHG-0323-15 (D5323)                      */           
904.00 150916 /*        AUTHOR        : WINE CHAN                                */           
905.00 150916 /*        USER ID.      : BG58PGM                                  */           
906.00 150916 /*        DATE WRITTEN  : 16 SEP 2015                              */           
907.00 150916 /*        DESCRPITION   : DISABLED TO GET THE OBSOLETE NON-VIP     */           
908.00 150916 /*                        CUSTOMER DATA                            */           
909.00 150916 /*-----------------------------------------------------------------*/           
910.00 150922 /*        REFERENCE NO. : CHG-0333-15 (D5333)                      */           
911.00 150922 /*        AUTHOR        : TOMMY TONG                               */           
912.00 150922 /*        DATE WRITTEN  : 22 SEP 2015                              */           
913.00 150922 /*        REASON        : Export the data of supplier transaction  */           
914.00 150922 /*-----------------------------------------------------------------*/           
915.00 151012 /*        REFERENCE NO. : CHG-0369-15 (D5369)                      */           
916.00 151012 /*        AUTHOR        : ALBERT AU                                */           
917.00 151012 /*        DATE WRITTEN  : 12 OCT 2015                              */           
918.00 151012 /*        REASON        : BadDebtRstLoans Report                   */           
919.00 151012 /*-----------------------------------------------------------------*/           
920.00 160104 /*        REFERENCE NO. : CHG-0466-15 (D5466)                      */           
921.00 160104 /*        AUTHOR        : BG09PGM ALBERT AU                        */           
922.00 160104 /*        CHANGED DATE  : 11 AUG 2015                              */           
923.00 160104 /*        REASON        : Generate Securities Service, Lona, VIP   */           
924.00 160104 /*                        Customer and Credit Cards on weekly basis*/           
925.00 160104 /*        REMARK        :                                          */           
926.00 160104 /*-----------------------------------------------------------------*/           
927.00 160115 /*        REFERENCE NO. : CHG-0467-15 (D5467)                      */           
928.00 160115 /*        AUTHOR        : BI77PGM MYLES IEONG                      */           
929.00 160115 /*        CHANGED DATE  : 15 JAN 2016                              */           
930.00 160115 /*        REASON        : Monthly statistic for remittances        */           
931.00 160115 /*        REMARK        :                                          */           
932.00 160115 /*-----------------------------------------------------------------*/           
933.00 160205 /*        REFERENCE NO. : CHG-0040-16 (D6040)                      */           
934.00 160205 /*        AUTHOR        : BG58PGM WINE CHAN                        */           
935.00 160205 /*        CHANGED DATE  : 05 FEB 2016                              */           
936.00 160205 /*        REASON        : Customer System Transaction Monitoring   */           
937.00 160205 /*                        Report                                   */           
938.00 160303 /*-----------------------------------------------------------------*/           
939.00 160303 /*        REFERENCE NO. : CHG-0078-16 (D6078)                      */           
940.00 160303 /*        AUTHOR        : BI77PGM MYLES IEONG                      */           
941.00 160303 /*        CHANGED DATE  : 03 MAR 2016                              */           
942.00 160303 /*        REASON        : Extract loan                             */           
943.00 160303 /*-----------------------------------------------------------------*/           
944.00 160408 /*        REFERENCE NO. : CHG-068-16 (D6068)                       */           
945.00 160408 /*        AUTHOR        : TOMMY TONG                               */           
946.00 160408 /*        CHANGED DATE  : 22 MAR 2016                              */           
947.00 160408 /*        REASON        : Hitrust Auto Posting                     */           
948.00 160408 /*-----------------------------------------------------------------*/           
949.00 160414 /*        REFERENCE NO. : CHG-089-16 (D6089)                       */           
950.00 160414 /*        AUTHOR        : MYLES IEONG                              */           
951.00 160414 /*        CHANGED DATE  : 12 APR 2016                              */           
952.00 160414 /*        REASON        : Staff time deosit maturing report        */           
953.00 160414 /*-----------------------------------------------------------------*/           
954.00 160810 /*        REFERENCE NO. : CHG-264-16 (D6264)                       */           
955.00 160810 /*        AUTHOR        : TOMMY TONG                               */           
956.00 160810 /*        CHANGED DATE  : 10 AUG 2016                              */           
957.00 160810 /*        REASON        : CIU REPORT                               */           
958.00 160810 /*-----------------------------------------------------------------*/           
959.00 160919 /*        REFERENCE NO. : CHG-250-16 (D6250)                       */           
960.00 160919 /*        AUTHOR        : Myles Ieong                              */           
961.00 160919 /*        CHANGED DATE  : 19 Sep 2016                              */           
962.00 160919 /*        REASON        : Exchange Rate Monitoring                 */           
963.00 160919 /*-----------------------------------------------------------------*/           
964.00 161202 /*        REFERENCE NO. : CHG-397-16 (D6397)                       */           
965.00 161202 /*        AUTHOR        : Tommy Tong                               */           
966.00 161202 /*        CHANGED DATE  : 02 Dec 2016                              */           
967.00 161202 /*        REASON        : IFRS9 TA Deliquence                      */           
968.00 161202 /*-----------------------------------------------------------------*/           
969.00 170126 /*        REFERENCE NO. : CHG-397-16 (D6397)                       */           
970.00 170126 /*        AUTHOR        : Albert Au                                */           
971.00 170126 /*        CHANGED DATE  : 26 Jan 2017                              */           
972.00 170126 /*        REASON        : Generate IFRS9 Data                      */           
973.00 170126 /*-----------------------------------------------------------------*/           
974.00 170518 /*        REFERENCE NO. : CHG-172-17 (D7172)                       */           
975.00 170518 /*        AUTHOR        : Albert Au                                */           
976.00 170518 /*        CHANGED DATE  : 18 May 2017                              */           
977.00 170518 /*        REASON        : Generate PRMLYDTA - Payroll A/C Data     */           
978.00 170518 /*-----------------------------------------------------------------*/           
979.00 170622 /*        REFERENCE NO. : CHG-213-17 (D7213)                       */           
980.00 170622 /*        AUTHOR        : Myles Ieong                              */           
981.00 170622 /*        CHANGED DATE  : 22 Jun 2017                              */           
982.00 170622 /*        REASON        : Indirect Liabilities(col 70 & 71) Report */           
983.00 170622 /*-----------------------------------------------------------------*/           
984.00 131004                                                                                 
985.00 61019              PGM      /* call by operator option D70 */                         
986.00 61019              DCL        VAR(&WSID) TYPE(*CHAR) LEN(10)                          
987.00 61019              DCL        VAR(&USRID) TYPE(*CHAR) LEN(10)                         
988.00 61019              DCL        VAR(&WSID2) TYPE(*CHAR) LEN(4)                          
989.00 61019              DCL        VAR(&USRID2) TYPE(*CHAR) LEN(8)                         
990.00 61019              DCL        VAR(&BLIB) TYPE(*CHAR) LEN(10) VALUE('IQRY')            
991.00 61019                                                                                 
992.00 61019  /* Ref. no. : IH016                                            */              
993.00 61019  /* - Change library & outq name to I700BCM/I700OUTQ.           */              
994.00 61019  /* C2135 : Library for TMP009LM changed from I700BCM to ZIHD.  */              
995.00 61019  /*         I700OUTQ no use any more.                           */              
996.00 61019              DCL        VAR(&LIBNAM) TYPE(*CHAR) LEN(10) +                      
997.00 61019  /* C2135 */              VALUE('ZIHD')                                         
998.00 61019  /* C2135                 VALUE('I700BCM')                      */              
999.00 61019  /* IH016                 VALUE('I9701BCM')                     */              
1000.00 61019  /* C2135    DCL        VAR(&OUTQNAM) TYPE(*CHAR) LEN(10) +                     
1001.00 61019                           VALUE('I700OUTQ')                     */              
1002.00 61019  /* IH016                 VALUE('I9701OUTQ')                    */              
1003.00 61019              DCL        VAR(&OUTQ)  TYPE(*CHAR) LEN(10)                         
1004.00 61019              DCL        VAR(&OUTQLIB)  TYPE(*CHAR) LEN(10)                      
1005.00 61019        /* For O P E R A T O R -- options logging */                             
1006.00 61019              DCL        VAR(&OPT) TYPE(*CHAR) LEN(5) VALUE('D69')               
1007.00 61019              DCL        VAR(&REPLY) TYPE(*CHAR) LEN(1)                          
1008.00 61019              DCL        VAR(&PROMPT) TYPE(*CHAR) LEN(40) +                      
1009.00 61019                           VALUE('Reporting before G/L Posting')                 
1010.00 61020              DCL        VAR(&OPTMSG) TYPE(*CHAR) LEN(40)                        
1011.00 61020              DCL        VAR(&OVERIDE) TYPE(*CHAR) LEN(1)                        
1012.00 61020              DCL        VAR(&EVNMSG) TYPE(*CHAR) LEN(50)                        
1013.00 61020              DCL        VAR(&USER) TYPE(*CHAR) LEN(10)                          
1014.00 61020              DCL        VAR(&REMARK) TYPE(*CHAR) LEN(80)                        
1015.00 61019                                                                                 
1016.00 61019              MONMSG     MSGID(CPF2103 CPF2104 CPF4174 CPF3142 +                 
1017.00 61019                           CPF4520 CPF0864 CPF4174)                              
1018.00 61019                                                                                 
1019.00 61019  INIT:       RTVJOBA    OUTQ(&OUTQ) OUTQLIB(&OUTQLIB)                           
1020.00 61020              ADDLIBLE   LIB(BCMGPL)                                             
1021.00 61020              ADDLIBLE   LIB(ZIHD)                                               
1022.00 61020              ADDLIBLE   LIB(I700SMS)                                            
1023.00 61020              ADDLIBLE   LIB(I700BS)                                             
1024.00 61020              ADDLIBLE   LIB(I700FX)                                             
1025.00 61020              ADDLIBLE   LIB(I700BCM)                                            
1026.00 61020              ADDLIBLE   LIB(ICBSBCMDB2)                                         
1027.00 61020              ADDLIBLE   LIB(ICBSBCMDB1)                                         
1028.00 61020              ADDLIBLE   LIB(ICBSBCMDB0)                                         
1029.00 61019              ADDLIBLE   LIB(&BLIB)                                              
1030.00 61019              ADDLIBLE   LIB(IPROD)                                              
1031.00 61019              ADDLIBLE   LIB(IMODULE) POSITION(*LAST)                            
1032.00 61019              DLTOVR     FILE(*ALL)                                              
1033.00 61019                                                                                 
1034.00 61019    /********O P E R A T O R -- OPTIONS LOGGING ('START' event)********/         
1035.00 61019              RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                                  
1036.00 61020              CHGJOB     OUTQ(ICBSBCMDB1/PCOMBOUTQ)                              
1037.00 61020  /* MODIBY LOCAL DATA AREA FOR POSTING */                                       
1038.00 61020              CHGDTAARA  DTAARA(*LDA (1 3)) VALUE('001')                         
1039.00 61020              CHGDTAARA  DTAARA(*LDA (252 4)) VALUE('0019')                      
1040.00 61019                                                                                 
1041.00 61019 /*        Reference No. : C2031                                    */           
1042.00 61019 /*        Purpose       : ADD CALLING TO CL:ZCRSLOG/CRSMEMOEOD FOR */           
1043.00 61019 /*                        CRS ALERT MEMO EOD PROCESS               */           
1044.00 61019 /* C2031 */  SNDPGMMSG  MSG('RPTAPCOMB: CRS Alert Memo EOD +                    
1045.00 61019                           processing') TOMSGQ(*SYSOPR)                          
1046.00 61019 /* C2031     CALL       PGM(ZCRSLOG/CRSMEMOEOD)  */                             
1047.00 61019 /* C2031 */  SBMJOB     CMD(CALL PGM(ZCRSLOG/CRSMEMOEOD)) JOBQ(QBATCH)          
1048.00 80730                                                                                 
1049.00 80730 /* C8173   ADD VIP BANKING REPORT */                                            
1050.00 80730 /* C8173 */  SBMJOB     CMD(CALL PGM(ZVIPLIB/VBMRPTCL)) JOBQ(QBATCH)            
1051.00 80730 /* C8173 */  SBMJOB     CMD(CALL PGM(ZVIPLIB/VMNRPTCL)) JOBQ(QBATCH)            
1052.00 100507 /* D0114 */  SBMJOB     CMD(CALL PGM(IPROD/BUSCL)) JOBQ(QBATCH)                 
1053.00 90205                                                                                 
1054.00 90205 /*        REFERENCE NO. : C8337 (CHG-337-08)                     */             
1055.00 90205 /*        PURPOSE       : Loan Cash Flow Report                  */             
1056.00 90205 /*C8337*/    SBMJOB     CMD(CALL PGM(IPROD/LNCFLWCL)) JOBQ(QBATCH)              
1057.00 61019                                                                                 
1058.00 90630 /*        REFERENCE NO. : C9213 (CHG-213-09)                     */             
1059.00 90630 /*        PURPOSE       : Backup and Delete PSP80101 and         */             
1060.00 90630 /*                        PSP80003 Data                          */             
1061.00 90703 /*C9213*/    SBMJOB     CMD(RUNSQLSTM SRCFILE(QDDSSRC) +                        
1062.00 90703 /*C9213*/                 SRCMBR(BKSIGNRCD) COMMIT(*NONE)) +                    
1063.00 90703 /*C9213*/                 JOB(BKSIGNRCD)                                        
1064.00 90630                                                                                 
1065.00 100531 /*        REFERENCE NO. : D0124 (CHG-124-10)                     */             
1066.00 100531 /*        PURPOSE       : Daily Update Passbook Balance          */             
1067.00 100531 /*D0124*/    SBMJOB     CMD(CALL PGM(I700BCM/UPPBBALCL)) JOBQ(QBATCH)           
1068.00 100531                                                                                 
1069.00 100628 /*        REFERENCE NO. : D0163 (CHG-163-10)                     */             
1070.00 100628 /*        PURPOSE       : Customer ID/Passport Search Report     */             
1071.00 100628 /*D0163*/    SBMJOB     CMD(CALL PGM(IPROD/SRCHIDCL)) JOBQ(QBATCH)              
1072.00 100628                                                                                 
1073.00 100917 /*        REFERENCE NO. : D0245 (CHG-245-10)                     */             
1074.00 100917 /*        PURPOSE       : Change from interactive job to batch   */             
1075.00 100927 /*D0245*/    SBMJOB     CMD(CALL PGM(IPROD/AOFCL)) JOB(AOFCL) +                 
1076.00 100927                           JOBQ(QBATCH)                                          
1077.00 100927 /*D0245*/    SBMJOB     CMD(CALL PGM(IPROD/RCMAIN)) JOB(RCMAIN) +               
1078.00 100927                           JOBQ(QBATCH)                                          
1079.00 100927 /*D0245*/    SBMJOB     CMD(CALL PGM(IPROD/RUNACCRPT)) +                        
1080.00 100927                           JOB(RUNACCRPT) JOBQ(QBATCH)                           
1081.00 100927 /*D0245*/    SBMJOB     CMD(CALL PGM(IPROD/PSTXSTATIC)) +                       
1082.00 100927                           JOB(PSTXSTATIC) JOBQ(QBATCH)                          
1083.00 101213                                                                                 
1084.00 150910 /*        REFERENCE NO. : D5275 (CHG-0275-15)                        */         
1085.00 150910 /*        PURPOSE       : GET CIF POSITION DATA                      */         
1086.00 150910 /*D5275*/    SBMJOB     CMD(CALL PGM(IPROD/PFOGETCL)) +                         
1087.00 150910 /*D5275*/                   JOB(PFOGETCL) JOBQ(QBATCH)                          
1088.00 150910                                                                                 
1089.00 61019  /* 2000-04-13 update matrix rate history */                                    
1090.00 61019  /* modified by edward cheung */                                                
1091.00 61019  MATRIX:     CPYF       FROMFILE(YLOGLIB/LGT001LF) +                            
1092.00 61019                           TOFILE(YLOGLIB/MATRIX) MBROPT(*ADD) +                 
1093.00 61019                           INCREL((*IF JOENTT *NE 'DL')) FMTOPT(*NOCHK)          
1094.00 61019                                                                                 
1095.00 61019  FX:         CALL       PGM(&BLIB/P0FRPTS)                                      
1096.00 61019                                                                                 
1097.00 61019              OVRPRTF    FILE(QPQUPRFIL) COPIES(1) SAVE(*YES) +                  
1098.00 61019                           USRDTA(QPSTRPT) SPLFNAME(QPSTRPT) +                   
1099.00 61019                           SECURE(*YES)                                          
1100.00 61019              RUNQRY     QRY(&BLIB/QPSTRPT)                                      
1101.00 61019              DLTOVR     FILE(*ALL)                                              
1102.00 61019                                                                                 
1103.00 61019  CONFIRM:    CALL       PGM(ZTMLIB/TMCNFALLCL)             /* C2135 */          
1104.00 61019  /* C2135    CALL       PGM(TMCNFALLCL)                             */          
1105.00 61019  /* 2000-04-13 print rate different report */                                   
1106.00 61019  /* modified by thomas chan */                                                  
1107.00 61019  /* C2135 : Library for TMP009LM is now in ZIHD instead of I700BCM. */          
1108.00 61019              CRTLF      FILE(&LIBNAM/TMP009LM) +                                
1109.00 61019  /* C2135 */              SRCFILE(&LIBNAM/QDDSSRC)                              
1110.00 61019  /* C2135                 SRCFILE(&LIBNAM/TMDOCSRC)                 */          
1111.00 61019              CALL       PGM(IPROD/MRTDIFCL)                                     
1112.00 61019              DLTF       FILE(&LIBNAM/TMP009LM)                                  
1113.00 61019                                                                                 
1114.00 61019 /*        Reference No. : C6179 (CHG-179-06)                       */           
1115.00 61019 /*        Purpose       : Add calling to ZTMLIB/UPINTPYDT          */           
1116.00 61019 /*                        For advance Time deposit interest payment   */        
1117.00 61019 /*                        date to next working date if it fall on SAT */        
1118.00 61019              CALL       PGM(ZTMLIB/PUPINTPYDT)                                  
1119.00 61019                                                                                 
1120.00 61019  LOANRPT:    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(OVERDUE)              
1121.00 61019              RUNQRY     QRY(IPROD/OVERDUE)                                      
1122.00 61019              DLTOVR     FILE(QPQUPRFIL)                                         
1123.00 61019                                                                                 
1124.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(OVERDUE)              
1125.00 61019              RUNQRY     QRY(IPROD/OVERDUE1)                                     
1126.00 61019              DLTOVR     FILE(QPQUPRFIL)                                         
1127.00 61019                                                                                 
1128.00 61019  TIMERPT:    CALL       PGM(IPROD/DPRPTCL)                                      
1129.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(LNMATOD)              
1130.00 61019              RUNQRY     QRY(IPROD/LNMATOD)                                      
1131.00 61019              DLTOVR     FILE(QPQUPRFIL)                                         
1132.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(NEWTDLST)             
1133.00 61019              RUNQRY     QRY(IPROD/NEWTDLST)                                     
1134.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(NEWTDLST1)            
1135.00 61019              RUNQRY     QRY(IPROD/NEWTDLST1)                                    
1136.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TDREP)                
1137.00 61019              RUNQRY     QRY(IPROD/TDREP)                                        
1138.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TDREP1)               
1139.00 61019              RUNQRY     QRY(IPROD/TDREP1)                                       
1140.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TDREP3)               
1141.00 61019              RUNQRY     QRY(IPROD/TDREP3)                                       
1142.00 61019 /*C3073 to generate the output file same as the report generated from TDREP3*/  
1143.00 61019 /*C3073*/    RUNQRY     QRY(IPROD/TDREP3F)                                      
1144.00 110324 /*D1090*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TDREPOFF)             
1145.00 110324 /*D1090*/    RUNQRY     QRY(IPROD/TDREPOFF)                                     
1146.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TDACCREP)             
1147.00 61019              RUNQRY     QRY(IPROD/TDACCREP)                                     
1148.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TMMATSAT)             
1149.00 61019              RUNQRY     QRY(IPROD/TMMATSAT)                                     
1150.00 130118 /*D3017 to generate the output file same as the report generated from TDREP3*/  
1151.00 130118 /*D3017*/    RUNQRY     QRY(IPROD/TDREPNXWF)                                    
1152.00 130118 /*D3017*/    RUNSQLSTM  SRCFILE(IPROD/QCLSRC) SRCMBR(UTMREPINF) +               
1153.00 130118                           COMMIT(*NONE)                                         
1154.00 130118 /*D3017*/    OVRPRTF    FILE(QPQUPRFIL) OUTQ(RPTLIB/MISCOUQMIG) +               
1155.00 130118                           SAVE(*YES) USRDTA(TDREPNXWP)                          
1156.00 130118 /*D3017*/    RUNQRY     QRY(IPROD/TDREPNXWP)                                    
1157.00 61019                                                                                 
1158.00 61019 /**** UPDATE NEXT TICKLER DATE ****/                                            
1159.00 61019  TKDATE:     DLTOVR     FILE(*ALL)                                              
1160.00 61019              CALL       PGM(IPROD/NXTKDATECL)                                   
1161.00 61019                                                                                 
1162.00 61019 /**** GEN PRIVATE BAMNKING REPORTS ****/                                        
1163.00 100917 /*C5051*//* D0245  CALL       PGM(IPROD/AOFCL)   */                             
1164.00 61019                                                                                 
1165.00 61019 /**** PRINT THE REPORT OF TXS WITH BACKVALUE DATE BEFORE 19990401 ****/         
1166.00 61019              CALL       PGM(IPROD/ERRVALCL)                                     
1167.00 61019              CLRPFM     FILE(IMODULE/ERRLOG)                                    
1168.00 61019                                                                                 
1169.00 61019 /**** GENERATE THE INTEREST PLAN FILE FROM THE FLAG FILE CFP001 ****/           
1170.00 61019              CALL       PGM(IPROD/GENIPLAN)                                     
1171.00 61019 /* NEW CUSTOMER REPORT TO PRIVATE BANKING */                                    
1172.00 61019 /*13/12/00 REFER TO GUR-0280-00*/                                               
1173.00 61019                                                                                 
1174.00 61019 /*           OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(NEWCUSTYP) */         
1175.00 61019 /*           RUNQRY     QRY(IPROD/NEWCUSTYP)                         */         
1176.00 61019 /*           DLTOVR     FILE(*ALL)                                   */         
1177.00 61019                                                                                 
1178.00 61019 /* CREDIT CARD LOAN PASTDUE REPORT */                                           
1179.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(LNCARDOD)             
1180.00 61019              RUNQRY     QRY(&BLIB/LNCARDOD)                                     
1181.00 61019              DLTOVR     FILE(*ALL)                                              
1182.00 61019 /** NEW FX REPORT **/                                                           
1183.00 61019 /*           CALL       PGM(KUSRBCM/NFXCCYPCL)    */                            
1184.00 61019 /* Total Time Deposit by Branch List  */                                        
1185.00 61019              CALL       PGM(IPROD/TDALL)                                        
1186.00 61019 /* 03/07/00 - ADDING THE CREDIT CONTROL REPORTS */                              
1187.00 61019  /*C5051*/   CALL       PGM(IPROD/CCRCTLRPT)                                    
1188.00 61019 /* 22/09/00 - "PRIVATE BANKING CUSTOMER WITH OTHER BRANCH TM" */                
1189.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(PRIRPT1)              
1190.00 61019              RUNQRY     QRY(IPROD/PRIRPT1)                                      
1191.00 61019              DLTOVR     FILE(*ALL)                                              
1192.00 61019                                                                                 
1193.00 61019 /* NEW TA RETAIL ACCOUNT LIST */                                                
1194.00 61019              CALL       PGM(IPROD/NTARETRPT)                                    
1195.00 61019                                                                                 
1196.00 61019              OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TDREPCORP)            
1197.00 61019              RUNQRY     QRY(IPROD/TDREPCORP)                                    
1198.00 61019              DLTOVR     FILE(*ALL)                                              
1199.00 61019                                                                                 
1200.00 61019 /* Reference No. : C3086                                           */           
1201.00 61019 /* Purpose       : add a same query as IPROD/TDREPCORP to generate */           
1202.00 61019 /*                 output file                                     */           
1203.00 61019              RUNQRY     QRY(IPROD/TDREPCORPF)                                   
1204.00 61019                                                                                 
1205.00 61019 /* Reference No. : CH060                                           */           
1206.00 61019 /* Change Details: New report to show daily new time deposit       */           
1207.00 61019 /*                 account with CIF number                         */           
1208.00 61019 /*                 MOVE FROM REPORT BEFORE PCOMB DUE TO            */           
1209.00 61019 /*                 CHANGE OF REQUIRMENT BY CCIU                    */           
1210.00 61019 /* CH060 */  OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TMNEWCIF)             
1211.00 61019 /* CH060 */  RUNQRY     QRY(IPROD/TMNEWCIF)                                     
1212.00 61019 /* C2002 */  DLTOVR     FILE(*ALL)                                              
1213.00 61019                                                                                 
1214.00 61019 /*        Reference No. : CH062                                    */           
1215.00 61019 /*        Purpose       : NEW REPORT TO SHOW DAILY ERROR OF        */           
1216.00 61019 /*                        UPDATING INTER BANK RATE                 */           
1217.00 61019 /* CH062 */  CALL       PGM(IPROD/PIBLOG)                                       
1218.00 61019                                                                                 
1219.00 61019 /*        Reference No. : CH122                                    */           
1220.00 61019 /*        Purpose       : FOR PASSBOOK BALANCE UPDATE (1% INT. ADJ)*/           
1221.00 100917 /* CH122 *//*  D0245  CALL       PGM(ZSAVPLUS/UPDPBKCL)            */           
1222.00 61019                                                                                 
1223.00 61019 /*        Reference No. : CH164                                    */           
1224.00 61019 /*        Purpose       : FOR GENERATE THE CUSTOMER INFORMATION    */           
1225.00 61019 /* CH164 */  CALL       PGM(IPROD/CUSTRPT)                                      
1226.00 61019                                                                                 
1227.00 61019  /*        Reference No. : CH002                                    */          
1228.00 61019  /*        Purpose       : FOR GENERATE THE RETAIL CREDIT REPORT    */          
1229.00 61019  /* C2002 */  CALL       PGM(IPROD/RETCRRPTCL)                                  
1230.00 61019                                                                                 
1231.00 61019 /*        Reference No. : C2019 (CHG-019-02)                       */           
1232.00 61019 /*        Purpose       : ADD CALLING TO CL:IPROD/GENSIRRPT FOR TA */           
1233.00 61019 /*                        ACCOUNT WITH SPECIAL RATE REPORT         */           
1234.00 61019 /* C2019 */  CALL       PGM(IPROD/GENRPTSIR)                                    
1235.00 61019                                                                                 
1236.00 61019                                                                                 
1237.00 61019                                                                                 
1238.00 61019 /*        Reference No. : CHG-047-02                                     */     
1239.00 61019 /*        Purpose       : FOR GENERATE OVER DUE LOANS AND CREDIT CARDS   */     
1240.00 61019 /*                        REPORT                                         */     
1241.00 110427 /* D1112 C2047   CALL       PGM(IPROD/OVLNCL)                            */     
1242.00 61019                                                                                 
1243.00 61019 /*        Reference No. : CHG-118-02                                     */     
1244.00 61019 /*        Purpose       : GENERATE REPORT FOR LOAN INTEREST REBATE       */     
1245.00 61019 /*                        ON MATURITY                                    */     
1246.00 61019 /* C6068 C2118   CALL       PGM(IPROD/INTRBMTCL)                         */     
1247.00 61019                                                                                 
1248.00 61019 /*        Reference No. : CHG-119-02                                     */     
1249.00 61019 /*        Purpose       : GENERATE REPORT FOR RESTRUCTURED LOANS         */     
1250.00 61019 /*                        (NO PAST DUE INSTALLMENT)                      */     
1251.00 61019 /* C2119 */  CALL       PGM(IPROD/GRSLNCL)                                      
1252.00 61019                                                                                 
1253.00 61019 /*        Reference No. : CHG-011-03                                     */     
1254.00 61019 /*        Purpose       : Smart Salary Overdraft Review date report      */     
1255.00 61019 /*C3011*/    CALL       PGM(IPROD/SMTRPTCL)                                     
1256.00 61019                                                                                 
1257.00 61019 /*        Reference No. : CHG-139-03                                     */     
1258.00 61019 /*        Purpose       : Change of Customer Information Journal Reports */     
1259.00 61019 /*                        for Internet users and All users               */     
1260.00 101213                                                                                 
1261.00 101213 /*        REFERENCE NO. : D0322 (CHG-322-10)                       */           
1262.00 101214 /*        PURPOSE       : Add more information into OnDemand report*/           
1263.00 101214 /*                        "Account opened without image",and change*/           
1264.00 101214 /*                        the job to batch job.                    */           
1265.00 101213 /*C3139*/  /*CALL       PGM(IPROD/JCUINFCL)                   D0322*/           
1266.00 101214 /*D0322*/    SBMJOB     CMD(CALL PGM(IPROD/JCUINFCL)) +                         
1267.00 101214                           JOB(JCUINFCL) JOBQ(QBATCH)                            
1268.00 111019                                                                                 
1269.00 111019 /*        REFERENCE NO. : D1303 (CHG-303-11)                       */           
1270.00 111019 /*        PURPOSE       : Customer Information Update - Deliverable*/           
1271.00 111019 /*D1303*/    SBMJOB     CMD(CALL PGM(IPROD/ICINFCL)) +                          
1272.00 111019                           JOB(ICINFCL) JOBQ(QBATCH)                             
1273.00 61019                                                                                 
1274.00 61019 /*        Reference No. : C3195 (CHG-195-03)                       */           
1275.00 61019 /*        Purpose       : ADD GENERATION OF MONTHLY LOAN INCREASE  */           
1276.00 61019 /*                        PRINCIPAL REPORT                         */           
1277.00 61019 /*C3195*/    CALL       PGM(IPROD/GLNINCPRN)                                    
1278.00 61019                                                                                 
1279.00 61019 /*        REFERENCE NO. : CHG-067-04                                     */     
1280.00 61019 /*        PURPOSE       : GENERATE MINOR A/C REPORT FOR EACH BRANCH      */     
1281.00 61019 /* C4067 */  CALL       PGM(IPROD/PRTMINACCL)                                   
1282.00 61019                                                                                 
1283.00 61019                                                                                 
1284.00 61019 /*        Reference No. : CHG-138-04                                     */     
1285.00 61019 /*        Purpose       : Generate Loan Upfront Payment Report:          */     
1286.00 61019 /*                        All Installment Settled Report                 */     
1287.00 61019 /* C4138 */  OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(UGSTLRPT)             
1288.00 61019 /* C4138 */  RUNQRY     QRY(ZNOTELIB/UGSTLRPT)                                  
1289.00 61019 /* C4138 */  DLTOVR     FILE(*ALL)                                              
1290.00 61019                                                                                 
1291.00 61019 /*        Reference No. : CHG-184-04                                     */     
1292.00 61019 /*        Purpose       : Generate risk control reports                  */     
1293.00 100917 /* C4184 */ /*C5051 *//* D0245 CALL       PGM(IPROD/RCMAIN)              */     
1294.00 61019                                                                                 
1295.00 61019 /*        REFERENCE NO. : CHG-035-05 (C5035)                             */     
1296.00 61019 /*        PURPOSE       : ADD CD TXN DAILY REPORT                        */     
1297.00 61019 /* C5033 */  OVRPRTF    FILE(QPQUPRFIL) OUTQ(RPTLIB/TIMEOUQMIG) +               
1298.00 61019                           USRDTA('GENCDTXN')                                    
1299.00 61019 /* C5033 */  RUNQRY     QRY(IPROD/GENCDTXN)                                     
1300.00 61019 /* C5033 */  DLTOVR     FILE(QPQUPRFIL)                                         
1301.00 61019                                                                                 
1302.00 61019 /*        Reference No. : C5096 (CHG-096-05)                     */             
1303.00 61019 /*        Purpose       : Add calling to Past Due Loan Report    */             
1304.00 61019 /* C5096 */  CALL       PGM(IPROD/RUNPRVRPT)                                    
1305.00 61019                                                                                 
1306.00 61019 /*        REFERENCE NO. : C6010 (CHG-010-06)                     */             
1307.00 61019 /*        PURPOSE       : ADD CALLING TO ACC DEPT REPORT         */             
1308.00 100917 /* C6010 *//* D0245 CALL       PGM(IPROD/RUNACCRPT)              */             
1309.00 61019                                                                                 
1310.00 61019 /*        REFERENCE NO. : C6023 (CHG-023-06)                     */             
1311.00 61019 /*        PURPOSE       : ADD CALLING TO LOAN WITH ZERO PRINCIPAL*/             
1312.00 61019 /*                        BALANCE HAVING ACTIVE STATUS REPORT    */             
1313.00 61019 /*C6023*/  OVRPRTF    FILE(QPQUPRFIL) COPIES(1) +                               
1314.00 61019 /*C6023*/              SAVE(*YES) USRDTA(LNZOPN) +                              
1315.00 61019 /*C6023*/              SPLFNAME(LNZEROOPN) SECURE(*YES)                         
1316.00 61019 /*C6023*/  RUNQRY     QRY(IPROD/LNZEROOPN)                                      
1317.00 61019 /*C6023*/  DLTOVR     FILE(*ALL)                                                
1318.00 61019                                                                                 
1319.00 61019 /*        REFERENCE NO. : C6148 (CHG-148-06)                     */             
1320.00 61019 /*        PURPOSE       : ADD CALLING TO CREDIT ADMIN REPORT     */             
1321.00 61019 /* C6148 */  CALL       PGM(ZCRLINE/OVRMISRPT)                                  
1322.00 61019                                                                                 
1323.00 61019 /*        REFERENCE NO. : C6161 (CHG-161-06)                     */             
1324.00 61019 /*C6023*/  OVRPRTF    FILE(QPQUPRFIL) COPIES(1) +                               
1325.00 61019 /*C6023*/              SAVE(*YES) USRDTA(TMOPNCHAN) +                           
1326.00 61019 /*C6023*/              SPLFNAME(TMOPNCHAN) SECURE(*YES)                         
1327.00 61019 /*C6023*/  RUNQRY     QRY(IPROD/TMOPNCHAN)                                      
1328.00 61019 /*C6023*/  DLTOVR     FILE(*ALL)                                                
1329.00 61019                                                                                 
1330.00 61108 /* C6312 C6270    CALL       PGM(IPROD/PTBRNLMT)     */                         
1331.00 71002 /*C7240*/    CALL       PGM(IPROD/TMCPCL)                                       
1332.00 71108 /*C7283*/    CALL       PGM(IQRY/FXTRNDFCL)                                     
1333.00 61019                                                                                 
1334.00 80118 /*        REFERENCE NO. : C7368 (CHG-368-07)                     */             
1335.00 71214 /*        PURPOSE       : GENERATE MONTHLY ,WEEKLY TXN AND TELLER */            
1336.00 71214 /*                        STATISTIC REPORT                        */            
1337.00 100927 /* C7368 *//* D0245 CALL       PGM(IPROD/PSTXSTATIC) */                         
1338.00 80114                                                                                 
1339.00 80114 /*        REFERENCE NO. : C7307 (CHG-307-07)                     */             
1340.00 80114 /*        PURPOSE       : MKT070/07 loan interest rebate         */             
1341.00 80114 /*C7307*/    CALL       PGM(IPROD/LNRBPSTCL)                                    
1342.00 80214                                                                                 
1343.00 80214 /*        REFERENCE NO. : C8047 (CHG-047-08)                     */             
1344.00 80214 /*        PURPOSE       : GENERATE DORMMANT A/C REPORT           */             
1345.00 80214 /*C8047*/    CALL       PGM(DMLIB/NDMRPT)                                       
1346.00 80422                                                                                 
1347.00 80422 /*        REFERENCE NO. : C8102 (CHG-102-08)                     */             
1348.00 80422 /*        PURPOSE       : GENERATE MRV REPORT                    */             
1349.00 80422 /*C8102*/    CALL       PGM(IPROD/MRVDCL)                                       
1350.00 80528                                                                                 
1351.00 80528 /*        REFERENCE NO. : C8148 (CHG-148-08)                     */             
1352.00 80528 /*        PURPOSE       : GENERATE SCEQ TXN RPT                  */             
1353.00 80528 /*C8148*/    CALL       PGM(IPROD/SCEQCL)                                       
1354.00 80528                                                                                 
1355.00 80612 /*        REFERENCE NO. : C8166 (CHG-166-08)                     */             
1356.00 80612 /*        PURPOSE       : CHANGE AGING REPORT FROM MONTHLY TO    */             
1357.00 80612 /*                        DAILY                                  */             
1358.00 80612 /*C8166*/    CALL       PGM(IPROD/AGINGRPT)                                     
1359.00 80804                                                                                 
1360.00 80804 /*        REFERENCE NO. : C8208 (CHG-208-08)                     */             
1361.00 80804 /*        PURPOSE       : ADD DAILY MATURED T/DS WEEKLY REPORT   */             
1362.00 80804 /*C8208*/    RUNQRY     QRY(IPROD/TDREP7F)                                      
1363.00 80612                                                                                 
1364.00 80815 /*        REFERENCE NO. : C8217 (CHG-217-08)                     */             
1365.00 80815 /*        PURPOSE       : ADD SIGNATURE CAPTURE EXCEPTION REPORT */             
1366.00 80815 /*C8217*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(SIGEXCEPT)            
1367.00 80815 /*C8217*/    RUNQRY     QRY(IPROD/SIGEXCEPT)                                    
1368.00 80815 /*C8217*/    DLTOVR     FILE(QPQUPRFIL)                                         
1369.00 80815                                                                                 
1370.00 80903 /*        REFERENCE NO. : C8224 (CHG-224-08)                     */             
1371.00 80903 /*        PURPOSE       : CUSTOMER STATUS 'R' REPORT             */             
1372.00 80903 /*C8224*/    CALL       PGM(I700BCM/CUSSTSCL)                                   
1373.00 80815                                                                                 
1374.00 81216 /*        REFERENCE NO. : C8335 (CHG-335-08)                     */             
1375.00 81216 /*        PURPOSE       : CALL IPROD/GENEAUDGL TO GENERATE       */             
1376.00 81216 /*                        EXTERNAL AUDITOR G/L                   */             
1377.00 81216 /*C8335*/    CALL       PGM(IPROD/GENEAUDGL)                                    
1378.00 90119                                                                                 
1379.00 90119 /*        REFERENCE NO. : C9027 (CHG-027-09)                     */             
1380.00 90119 /*        PURPOSE       : CALL IPROD/SIGMONCL TO GENERATE        */             
1381.00 90119 /*                        SIGNATURE REVIEW MONITORING REPORT     */             
1382.00 90119 /*C9027*/    CALL       PGM(IPROD/SIGMONCL)                                     
1383.00 90202                                                                                 
1384.00 90219 /* C9065 GET DSEJ LOAN BILLED INTEREST */                                       
1385.00 90219 /* C9065 */  CALL       PGM(ZAUTOPAY/DSEJUPD)                                   
1386.00 90513                                                                                 
1387.00 90513 /* C9160 Generate BG data with Fixed Deposit. */                                
1388.00 90518 /* C9160 */  CALL       PGM(IEOM/BGFCPYF)                                       
1389.00 90518 /* C9160 */  CALL       PGM(IEOM/GENBGFDTA)                                     
1390.00 90219                                                                                 
1391.00 90526 /* C9169 GEN BCMNET SIGN ON IN DIFFERENT LOCATION ON SAME DAY RPT */            
1392.00 90526 /* C9169 */  CALL       PGM(ZCSERVICE/GENDLCIF)                                 
1393.00 90526                                                                                 
1394.00 90605 /*        REFERENCE NO. : C9164 (CHG-164-09)                     */             
1395.00 90605 /*        PURPOSE       : GEN TRADE FINANCE LIMIT EXPORT REPORT  */             
1396.00 90605 /*C9164*/    CALL       PGM(IPROD/LMTEXPCL)                                     
1397.00 90605                                                                                 
1398.00 90623 /*        REFERENCE NO. : C9206 (CHG-206-09)                     */             
1399.00 90623 /*C9206*/  OVRPRTF    FILE(QPQUPRFIL) COPIES(1) +                               
1400.00 90623 /*C9206*/              SAVE(*YES) USRDTA(DRETLNOPN) +                           
1401.00 90623 /*C9206*/              SPLFNAME(DRETLNOPN) SECURE(*YES)                         
1402.00 90623 /*C9206*/  RUNQRY     QRY(IPROD/DRETLNOPN)                                      
1403.00 90623 /*C9206*/  DLTOVR     FILE(*ALL)                                                
1404.00 90623                                                                                 
1405.00 90702 /*        REFERENCE NO. : C9215 (CHG-215-09)                     */             
1406.00 90702 /*        PURPOSE       : Generate Report of BCM Top 30          */             
1407.00 90702 /*                        Depositers.                            */             
1408.00 90702 /*C9215*/    CALL       PGM(IPROD/GENDPSTDTA)                                   
1409.00 90702                                                                                 
1410.00 90722 /*        REFERENCE NO. : C9244 (CHG-244-09)                     */             
1411.00 90722 /*        PURPOSE       : Generate Documentor Information        */             
1412.00 90722 /*C9244*/    CALL       PGM(IPROD/GENDOCMDTA)                                   
1413.00 90722                                                                                 
1414.00 91201 /*        REFERENCE NO. : C9328 (CHG-328-09)                     */             
1415.00 91201 /*        PURPOSE       : Generate AMCM Monthly Report           */             
1416.00 91201 /*C9328*/    CALL       PGM(IPROD/SSDRPTCL)                                     
1417.00 91201                                                                                 
1418.00 100407 /*        REFERENCE NO. : D0062 (CHG-062-10)                     */             
1419.00 100407 /*        PURPOSE       : Generate Personal Loan Data and Report */             
1420.00 100407 /*D0062*/    CALL       PGM(IPROD/CLCUSPFM)                                     
1421.00 100407                                                                                 
1422.00 100721 /*        REFERENCE NO. : D0180 (CHG-180-10)                     */             
1423.00 100721 /*        PURPOSE       : MAXSAVE/Get Interest Rate & Past Due Rec. */          
1424.00 100728 /*D0180*/    CALL       PGM(ZSAVPLAN/CALEODCL)                                  
1425.00 100721                                                                                 
1426.00 100917                                                                                 
1427.00 100920 /*        REFERENCE NO. : D0246 (CHG-0246-10)                       */          
1428.00 100921 /*        PURPOSE       : Provide ISecurities Customer File          */         
1429.00 100917 /*D0246*/    CALL       PGM(ZISTOCK/STKMKTCL)                                   
1430.00 100917                                                                                 
1431.00 101018 /*        REFERENCE NO. : D0255 (CHG-0255-10)                       */          
1432.00 101018 /*        PURPOSE       : EOD job of safe deposit box               */          
1433.00 101018 /*D0255*/    CALL       PGM(ZSDBLIB/SDBEODCL)                                   
1434.00 101018                                                                                 
1435.00 101130 /*        REFERENCE NO. : D0286 (CHG-0286-10)                       */          
1436.00 101130 /*        PURPOSE       : EOD job of Generate Past Due SMS          */          
1437.00 101130 /*D0286*/    CALL       PGM(IPROD/PDSMSCL)                                      
1438.00 101130                                                                                 
1439.00 110113 /*        REFERENCE NO. : D0340 (CHG-0340-10)                       */          
1440.00 110103 /*        PURPOSE       : Generate high risk country CIF report     */          
1441.00 110113 /*D0340*/    CALL       PGM(IPROD/HRISKRPTCL)                                   
1442.00 100917                                                                                 
1443.00 110128 /*        REFERENCE NO. : D1033 (CHG-033-11)                        */          
1444.00 110128 /*        PURPOSE       : Generate customer maintance log           */          
1445.00 110202 /*D1033*/    CALL       PGM(I700BCM/CUMNTLGCL)                                  
1446.00 110325                                                                                 
1447.00 110325 /*        REFERENCE NO. : D1086 (CHG-086-11)                        */          
1448.00 110325 /*        PURPOSE       : Remove link                               */          
1449.00 110325 /*D1086*/    SBMJOB     CMD(CALL PGM(ZOPRLIB/UPDLNKCL)) JOBQ(QBATCH)            
1450.00 110325                                                                                 
1451.00 110404 /*        REFERENCE NO. : D1024 (CHG-024-11)                        */          
1452.00 110419 /*        PURPOSE       : Generate Customer SCC Review Report       */          
1453.00 110404 /*D1024*/    CALL       PGM(ZCIFLIB/SCCRPTCL)                                   
1454.00 110509 /*D1024*/    CALL       PGM(ZCIFLIB/UACLVLCL)                                   
1455.00 110404                                                                                 
1456.00 120206 /*        REFERENCE NO. : D1274 (CHG-274-11)                        */          
1457.00 120206 /*        PURPOSE       : VIP-Stock Fee Class Cross Check Report    */          
1458.00 120206 /*D1312     D1274 CALL       PGM(ZVIPLIB/VIPSTKCL)                  */          
1459.00 110404                                                                                 
1460.00 110920 /*        REFERENCE NO. : D1249 (CHG-249-11)                        */          
1461.00 110920 /*        PURPOSE       : SUBMIT JOB TO UPDATE PURGED DATA          */          
1462.00 110920 /*D1249*/    SBMJOB     CMD(CALL PGM(ICBSPURGE/RELPCIFCL)) +                    
1463.00 110920                           JOB(RELPCIFCL) JOBQ(QBATCH)                           
1464.00 110923                                                                                 
1465.00 110923 /*        REFERENCE NO. : D1266 (CHG-266-11)                        */          
1466.00 110923 /*        PURPOSE       : GENERATE CORRESPONDENT BANK REPORTS       */          
1467.00 110923 /*D1266*/    CALL       PGM(IPROD/GCORRPT)                                      
1468.00 110920                                                                                 
1469.00 120103 /*        REFERENCE NO. : D1385 (CHG-385-11)                        */          
1470.00 120103 /*        PURPOSE       : GENERATE CORRESPONDENT BANK SME REPORT    */          
1471.00 120103 /*D1385*/    CALL       PGM(IPROD/GCBRPTCL)                                     
1472.00 120105                                                                                 
1473.00 120105 /*        REFERENCE NO. : D1396 (CHG-396-11)                        */          
1474.00 120105 /*        PURPOSE       : GENERATE DIRECT MAILING CAMPAIGN FOR      */          
1475.00 120105 /*                        WEALTH MANAGEMENT CUSTOMERS               */          
1476.00 120109 /*D1396*/    SBMJOB     CMD(CALL PGM(IPROD/DMWCL)) +                            
1477.00 120109                           JOB(DMWCL) JOBQ(QBATCH)                               
1478.00 120116                                                                                 
1479.00 120220 /*        REFERENCE NO. : D2022 (CHG-022-12)                       */           
1480.00 120220 /*        PURPOSE       : Generate Customer review report          */           
1481.00 120220 /*D2022*/    SBMJOB     CMD(CALL PGM(IPROD/ICCIFRPCL)) +                        
1482.00 120220                           JOB(ICINFCL) JOBQ(QBATCH)                             
1483.00 120220                                                                                 
1484.00 120412 /*        REFERENCE NO. : D2112 (CHG-112-12)                        */          
1485.00 120412 /*        PURPOSE       : Generate past due loan letter details     */          
1486.00 120412 /*D2112*/    CALL       PGM(IPROD/GPDLNLTCL)                                    
1487.00 120412                                                                                 
1488.00 120614 /*        REFERENCE NO. : D2063 (CHG-063-12)                        */          
1489.00 120614 /*        PURPOSE       : GENERATE NEW SMARTSALARY REPORTS          */          
1490.00 120614 /*D2063*/    CALL       PGM(ZEXOD/SMTRPTCL)                                     
1491.00 120614                                                                                 
1492.00 120907 /*        REFERENCE NO. : D2262 (CHG-262-12)                        */          
1493.00 120907 /*        PURPOSE       : Generate incomplete info of A/C opening   */          
1494.00 120907 /*D2262*/    CALL       PGM(IPROD/PACCINCOM)                                    
1495.00 120907                                                                                 
1496.00 120920 /*        REFERENCE NO. : D2280 (CHG-280-12)                        */          
1497.00 120920 /*        PURPOSE       : Generate credit card limit report         */          
1498.00 120920 /*D2280*/    CALL       PGM(IPROD/CRLMCL)                                       
1499.00 121005                                                                                 
1500.00 121005 /*        REFERENCE NO. : D2299 (CHG-299-12)                        */          
1501.00 121120 /*        PURPOSE       : ADJUST FLEXIBLE DEPOSIT BALANCE           */          
1502.00 121120 /*D2299*/    CALL       PGM(ZSAVPLAN/FSDADJCL)                                  
1503.00 121005                                                                                 
1504.00 121029 /*        REFERENCE NO. : D2331 (CHG-331-09)                     */             
1505.00 121029 /*        PURPOSE       : Generate Group Outstanding Detail      */             
1506.00 121029 /*D2331*/    SBMJOB     CMD(RUNSQLSTM SRCFILE(GPORSRC) +                        
1507.00 121029 /*D2331*/                 SRCMBR(GENGPRDTA) COMMIT(*NONE)) +                    
1508.00 121029 /*D2331*/                 JOB(GENGPRDTA)                                        
1509.00 121126                                                                                 
1510.00 121105 /*        REFERENCE NO. : D2061 (CHG-061-12)                        */          
1511.00 121115 /*        PURPOSE       : GENERATE PI EXPIRED RECORDS AND           */          
1512.00 121115 /*                        USER-DEFINED FIELD MODIFICATION REPORT    */          
1513.00 121105 /*D2061*/    CALL       PGM(ZCIFLIB/PIRPTCL)                                    
1514.00 121115 /*D2061*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(CUDRPT)               
1515.00 121115 /*D2061*/    RUNQRY     QRY(ZCIFLIB/CUDRPT)                                     
1516.00 121115 /*D2061*/    DLTOVR     FILE(*ALL)                                              
1517.00 121105                                                                                 
1518.00 121127 /*        REFERENCE NO. : D2355 (CHG-355-12)                         */         
1519.00 121127 /*        PURPOSE       : Generate Lunar Year Note Exchange outgoing */         
1520.00 121127 /*                        Report                                     */         
1521.00 130219 /*D3012      CALL       PGM(I700BCM/DSNTEEDCL)                       */         
1522.00 130129                                                                                 
1523.00 130129 /*        REFERENCE NO. : D3013 (CHG-013-13)                         */         
1524.00 130129 /*        PURPOSE       : Generate SMC Customers Monthly Report      */         
1525.00 130129 /*D3013*/    CALL       PGM(ZCIFLIB/CUDSMCCLP)                                  
1526.00 121127                                                                                 
1527.00 130219 /*        REFERENCE NO. : D3012 (CHG-012-13)                         */         
1528.00 130219 /*        PURPOSE       : Generate Lunar Year Note Exchange outgoing */         
1529.00 130219 /*                        Report (ZDSNTELIB)                         */         
1530.00 130304 /*D3012*/    CALL       PGM(ZDSNTELIB/DSNTEEDCL)                                
1531.00 130219                                                                                 
1532.00 130304 /*        REFERENCE NO. : D3066 (CHG-066-13)                         */         
1533.00 130304 /*        PURPOSE       : Generate report for "UNDELIVERED MAIL"     */         
1534.00 130304 /*                        Report (IPROD/UNDMCL)                      */         
1535.00 130304 /*D3066*/    CALL       PGM(IPROD/UNDMCL)                                       
1536.00 130312                                                                                 
1537.00 130312 /*        Reference No. : D2364 (CHG-364-12)                       */           
1538.00 130312 /*        PURPOSE       : SWIFT INWARD MESSAGE EOD PROCESS CL      */           
1539.00 130312 /* D2086 */  CALL       PGM(ZSWIFT/SWINEODCL)                                   
1540.00 130322                                                                                 
1541.00 130322 /*        REFERENCE NO. : D3083 (CHG-083-13)                       */           
1542.00 130322 /*        PURPOSE       : REPORT OF CLPGI PRODUCT                  */           
1543.00 130322 /* D3083 */  CALL       PGM(IPROD/CLPGIRPT)                                     
1544.00 130304                                                                                 
1545.00 130326 /*        REFERENCE NO. : D3095 (CHG-095-13)                         */         
1546.00 130326 /*        PURPOSE       : Generate Lunar Year Note Exchange outgoing */         
1547.00 130326 /*                        Report (Dragon2012)(ZDSNTEDRG)             */         
1548.00 130326 /*D3095*/    CALL       PGM(ZDSNTEDRG/DSNTEEDCL)                                
1549.00 130326                                                                                 
1550.00 130506 /*        REFERENCE NO. : D3073 (CHG-073-13)                         */         
1551.00 130506 /*        PURPOSE       : GENERATE NEW ELI TIME DEPOSIT REPORT       */         
1552.00 130506 /*D3073*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(ELINEW)               
1553.00 130506 /*D3073*/    RUNQRY     QRY(IPROD/ELINEW)                                       
1554.00 130506 /*D3073*/    DLTOVR     FILE(QPQUPRFIL)                                         
1555.00 130506                                                                                 
1556.00 130514 /*        REFERENCE NO. : D3160 (CHG-160-13)                         */         
1557.00 130514 /*        PURPOSE       : GENERATE INDIRECT LIABILITIES REPORT       */         
1558.00 130514 /*D3160*/    CALL       PGM(IPROD/GINDCL)                                       
1559.00 130514                                                                                 
1560.00 130619 /*        REFERENCE NO. : D3211 (CHG-211-13)                         */         
1561.00 130619 /*        PURPOSE       : EXTRACT PAYROLL A/C INFO FOR MID           */         
1562.00 130619 /*D3211*/    CALL       PGM(IPROD/MKTPRLCL)                                     
1563.00 130619                                                                                 
1564.00 130731 /*        REFERENCE NO. : D3269 (CHG-269-13)                         */         
1565.00 130731 /*        PURPOSE       : INWARD/OUTWARD REMITTANCE ON MONTHLY       */         
1566.00 130731 /*D3269*/    CALL       PGM(IPROD/RMTSTSCL)                                     
1567.00 130819                                                                                 
1568.00 130819 /*        REFERENCE NO. : D3290 (CHG-290-13)                         */         
1569.00 130819 /*        PURPOSE       : GOVERNMENT WEALTH PARTAKING SCHEME 2013    */         
1570.00 131021 /*D3269*/    CALL       PGM(IPROD/GWPSRPTCL)                                    
1571.00 130819                                                                                 
1572.00 131021 /*        REFERENCE NO. : D3345 (CHG-0345-13)                           */      
1573.00 131021 /*        PURPOSE       : NON-VIP CUSTOMER PORTFOLIO ANALYSIS (MONTHLY) */      
1574.00 150916 /*        REFERENCE NO. : D5323 (CHG-0323-15)                                */ 
1575.00 150916 /*        PURPOSE       : DISABLED TO GET THE OBSOLETE NON-VIP CUSTOMER DATA */ 
1576.00 150916 /*D3345 D5323     SBMJOB     CMD(CALL PGM(QNVIPSRC/NVCIFCL)) +  */              
1577.00 150916 /*D5323                      JOB(NVCIFCL) JOBQ(QBATCH)          */              
1578.00 130819                                                                                 
1579.00 131204 /*D3416   REFERENCE NO. : ERIC  (CHG-416-13)                         */         
1580.00 131204 /*D3416   PURPOSE       : RUN TOP TEN DEPOSITORS REPORT              */         
1581.00 131204 /*D3416*/    CALL       PGM(IPROD/MTLRPT)                                       
1582.00 131204                                                                                 
1583.00 131204 /*D3360   REFERENCE NO. : ERIC  (CHG-360-13)                         */         
1584.00 131204 /*D3360   PURPOSE       : RUN LCR REPORT                             */         
1585.00 131204 /*D3360*/    CALL       PGM(IEOM/PFLCRCL)                                       
1586.00 131204                                                                                 
1587.00 131204                                                                                 
1588.00 140318 /*D4083   REFERENCE NO. : WINE  (CHG-083-14)                         */         
1589.00 140318 /*D4083   PURPOSE       : REPORT FOR THE EARLY/PARTIAL LOAN          */         
1590.00 140318 /*D4083*/    CALL       PGM(IPROD/GERLNTXCL)                                    
1591.00 131204                                                                                 
1592.00 140318 /*D4107   REFERENCE NO. : WINE  (CHG-107-14)                         */         
1593.00 140318 /*D4107   PURPOSE       : MAIL MERGE OF THE BAD DEBT LOAN REPORT     */         
1594.00 140318 /*D4107*/    CALL       PGM(IPROD/GBDMLDATCL)                                   
1595.00 140402                                                                                 
1596.00 140402 /*D4129   REFERENCE NO. : ERIC  (CHG-129-14)                         */         
1597.00 140402 /*D4129   PURPOSE       : ADD DESPOSIT REPORT FOR MORE INSURE BUSINES*/         
1598.00 140402 /*D4129*/    CALL       PGM(IPROD/TDEXTCL)                                      
1599.00 140402                                                                                 
1600.00 140411 /*        REFERENCE NO. : D4142 (CHG-142-13)                         */         
1601.00 140411 /*        PURPOSE       : PLEDGED FIXED DEPOSITS WITH SINGLE MATURITY*/         
1602.00 140411 /*                        7 DAYS PRIOR                               */         
1603.00 140411 /*D4142*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TDMAT7DP)             
1604.00 140411 /*D4142*/    RUNQRY     QRY(IPROD/TDMAT7DP)                                     
1605.00 140411 /*D4142*/    DLTOVR     FILE(QPQUPRFIL)                                         
1606.00 140411                                                                                 
1607.00 140613 /*D4232   REFERENCE NO. : WINE  (CHG-232-14)                         */         
1608.00 140613 /*D4232   PURPOSE       : CONVERT THE FILE OF BCM CORB AML           */         
1609.00 140613 /*D4232*/    CALL       PGM(IPROD/GETCBNMCL)                                    
1610.00 140710                                                                                 
1611.00 140710 /*        REFERENCE NO. : D4223 (CHG-0223-14)                        */         
1612.00 140710 /*        PURPOSE       : GET ACAM EMPLOYER DAILY BALANCE            */         
1613.00 140710 /*D4223*/    SBMJOB     CMD(CALL PGM(ZAUTOPAY/ACAMERCL)) +                      
1614.00 140710                             JOB(ACAMERCL) JOBQ(QBATCH)                          
1615.00 140910                                                                                 
1616.00 140910 /*        REFERENCE NO. : D4367 (CHG-0367-14)                        */         
1617.00 140910 /*        PURPOSE       : ADD COLOMN TO SHOW CREDIT CARD STATUS      */         
1618.00 140912 /*D4367*/    CALL       PGM(IPROD/BUSCL)                                        
1619.00 140910                                                                                 
1620.00 140912 /*        REFERENCE NO. : D4344 (CHG-0344-14)                        */         
1621.00 140912 /*        PURPOSE       : AUTOPAY REPORT                             */         
1622.00 140912 /*D4344*/    CALL       PGM(IPROD/EMPATPWRPT)                                   
1623.00 140912                                                                                 
1624.00 150305 /*        REFERENCE NO. : D5064 (CHG-064-15)                         */         
1625.00 150305 /*        PURPOSE       : UPDATE CC STATEMENT CYCLE                  */         
1626.00 150305 /*D5064*/    CALL       PGM(IMODCLNK/UPSTMDTCL)                                 
1627.00 140912                                                                                 
1628.00 150506 /*        REFERENCE NO. : D5040 (CHG-0040-15)                        */         
1629.00 150506 /*        PURPOSE       : GET DAILY INFORMATION FOR SAS FILE (AML)   */         
1630.00 150506 /*D5040*/    SBMJOB     CMD(CALL PGM(IPROD/TMSEXTCL)) +                         
1631.00 150506 /*D5040*/                   JOB(TMSEXTCL) JOBQ(QBATCH)                          
1632.00 150506                                                                                 
1633.00 150709 /*        REFERENCE NO. : D5221 (CHG-221-15)                         */         
1634.00 150709 /*        PURPOSE       : CDD MEMO DAILY REPORT                      */         
1635.00 150709 /*D5221*/    CALL       PGM(I700BCM/CDMRPTCL)                                   
1636.00 150717                                                                                 
1637.00 150717 /*        REFERENCE NO. : D5239 (CHG-239-15)                         */         
1638.00 150717 /*        PURPOSE       : UNDRAWN OD LINE CUSTOMER DATA              */         
1639.00 150717 /*D5239*/    CALL       PGM(IPROD/UDNODCL)                                      
1640.00 150805                                                                                 
1641.00 150805 /*        REFERENCE NO. : D5267 (CHG-267-15)                         */         
1642.00 150805 /*        PURPOSE       : LOAN MATURING WITHIN 180 DAYS REPORT       */         
1643.00 150805 /*                        (OVER MOP 1M)                              */         
1644.00 150805 /*D5267*/ OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(LQLNMAT)                 
1645.00 150805 /*D5267*/ RUNQRY     QRY(IQRY/LQLNMAT)                                          
1646.00 150805 /*D5267*/ DLTOVR     FILE(QPQUPRFIL)                                            
1647.00 150805                                                                                 
1648.00 150805 /*        REFERENCE NO. : D5268 (CHG-268-15)                         */         
1649.00 150805 /*        PURPOSE       : LEVEL-UP POSTING TO IPROD/TMCWRK           */         
1650.00 150805 /*D5239*/    CALL       PGM(ZTMLIB/ITRLUPCL)                                    
1651.00 150805                                                                                 
1652.00 150819 /*        REFERENCE NO. : D5274 (CHG-274-15)                           */       
1653.00 150819 /*        PURPOSE       : OPG CALL-BACK CONFIRMATION MONITORING REPORT */       
1654.00 150819 /*D5274*/    CALL       PGM(ZOPGLIB/OGCBRPTCL)                                  
1655.00 150819                                                                                 
1656.00 150922 /*        REFERENCE NO. : D5333 (CHG-333-15)                           */       
1657.00 150922 /*        PURPOSE       : Export the data of supplier transaction */            
1658.00 150922 /*D5333*/    CALL       PGM(ZACPAY/INVITMCL)                                    
1659.00 151012                                                                                 
1660.00 151012 /*        REFERENCE NO. : D5369 (CHG-369-15)                           */       
1661.00 151012 /*        PURPOSE       : BadDebtRstLoans Report                       */       
1662.00 160303 /*D5369  D6078    CALL       PGM(IPROD/BDRTLNCL)                       */       
1663.00 151012                                                                                 
1664.00 160104 /*        REFERENCE NO. : D5369 (CHG-466-15)                           */       
1665.00 160104 /*        PURPOSE       : Generate Securities Service, Lona, VIP       */       
1666.00 160104 /*                        Customer and Credit Cards on weekly basis    */       
1667.00 160111 /*D5466*/    CALL       PGM(IPROD/GBRNINCCL)                                    
1668.00 160115                                                                                 
1669.00 160115 /*        REFERENCE NO. : D5467 (CHG-467-15)                           */       
1670.00 160115 /*        PURPOSE       : Monthly statistic of remittances             */       
1671.00 160115 /*D5467*/    CALL       PGM(IPROD/GRMSTACL)                                     
1672.00 160104                                                                                 
1673.00 160205 /*        REFERENCE NO. : D6040 (CHG-040-16)                            */      
1674.00 160205 /*        PURPOSE       : Customer System Transaction Monitoring Report */      
1675.00 160205 /*D6040*/    CALL       PGM(IPROD/CSTMRPTCL)                                    
1676.00 160205                                                                                 
1677.00 160303 /*        REFERENCE NO. : D6078 (CHG-078-16)                            */      
1678.00 160303 /*        PURPOSE       : Extract loan                                  */      
1679.00 160303 /*D6078*/    CALL       PGM(IPROD/EXLNCL)                                       
1680.00 160303                                                                                 
1681.00 160408 /*        REFERENCE NO. : D6068 (CHG-068-16)                            */      
1682.00 160408 /*        PURPOSE       : Hitrust Auto Posting                          */      
1683.00 160408 /*D6068*/    CALL       PGM(ZVIPLIB/HTPFOMTCL)                                  
1684.00 160411                                                                                 
1685.00 160414 /*D6089   REFERENCE No. : D6089 (CHG-089-16)                            */      
1686.00 160414 /*D6089   PURPOSE       : Staff Time Deposit Maturing Report            */      
1687.00 160414 /*D6089*/    OVRPRTF    FILE(QPQUPRFIL) SAVE(*YES) USRDTA(TDSTAFF)              
1688.00 160414 /*D6089*/    RUNQRY     QRY(IPROD/TDSTAFF)                                      
1689.00 160414 /*D6089*/    DLTOVR     FILE(*ALL)                                              
1690.00 160810                                                                                 
1691.00 160810 /*        REFERENCE NO. : D6264 (CHG-264-16)                            */      
1692.00 160810 /*        PURPOSE       : CIU REPORT                                    */      
1693.00 160810 /*D6264*/    CALL       PGM(ZCIFLIB/ICISRPT)                                    
1694.00 160919                                                                                 
1695.00 160919 /*        REFERENCE NO. : D6250 (CHG-250-16)                            */      
1696.00 160919 /*        PURPOSE       : Exchange Rate Monitoring                      */      
1697.00 160919 /*D6250*/    CALL       PGM(I700BCM/MTFXBEG)                                    
1698.00 160411                                                                                 
1699.00 161202 /*        REFERENCE NO. : D6397 (CHG-397-16)                            */      
1700.00 161202 /*        PURPOSE       : IFRS9 TA Deliquence                           */      
1701.00 161202 /*D6397*/    CALL       PGM(IPROD/BDPTADQCL)                                    
1702.00 170126                                                                                 
1703.00 170126 /*        REFERENCE NO. : D6397 (CHG-397-16) (Albert)                   */      
1704.00 170126 /*        PURPOSE       : Generate IFRS9 Data                           */      
1705.00 170126 /*D6397*/    SBMJOB     CMD(CALL PGM(IPROD/BDPCL)) +                            
1706.00 170221 /*D6397*/                   JOB(BDPCL) JOBQ(QBATCH)                             
1707.00 170120                                                                                 
1708.00 170518 /*        REFERENCE NO. : D7172 (CHG-172-17) (Albert)                   */      
1709.00 170518 /*        PURPOSE       : Generate PRMLYDTA - Payroll A/C Data          */      
1710.00 170606 /*D7172 D7172 CALL       PGM(IPROD/PRMLYCL)                             */      
1711.00 170518 /*D7172*/                                                                       
1712.00 170518                                                                                 
1713.00 170622 /*        REFERENCE NO. : D7213 (CHG-213-17) (Myles)                    */      
1714.00 170622 /*        PURPOSE       : Indirect Liabilities(col 70 & 71) Report      */      
1715.00 170622 /*D7172*/     CALL       PGM(I700BCM/ILFRPTCL)                                  
1716.00 170622                                                                                 
1717.00 61019    /********O P E R A T O R -- OPTIONS LOGGING ('END' event)*************/      
1718.00 61019                                                                                 
1719.00 61020              RTVJOBA    USER(&USER)                                             
1720.00 61020              CHGVAR     VAR(&EVNMSG) VALUE('END ' *CAT &PROMPT)                 
1721.00 61020              CALL       PGM(WRIOPRLOG) PARM(&OPT &OVERIDE &PROMPT +             
1722.00 61020                           &USER &REMARK)                                        
1723.00 61019                                                                                 
1724.00 61019  EXIT:       DLTOVR     FILE(*ALL)                                              
1725.00 61019              RMVLIBLE   LIB(IMODULE)                                            
1726.00 61019              RMVLIBLE   LIB(&BLIB)                                              
1727.00 61019              RMVLIBLE   LIB(IPROD)                                              
1728.00 61019   /*         CHGJOB     OUTQ(&OUTQLIB/&OUTQ)         */ /* NO USE */            
1729.00 61019              ENDPGM                                                             
