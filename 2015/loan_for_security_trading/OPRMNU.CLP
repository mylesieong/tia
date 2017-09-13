1.00 10524 /*  REFERENCE     :  CH062                                         */           
2.00 10524 /*  USER ID       :  B422                                          */           
3.00 10524 /*  AUTHOR        :  ANTHONY KAM                                   */           
4.00 10524 /*  Date          :  22 MAY, 2000                                  */           
5.00 10524 /*  DESP.         :  ADD UPDATE INTER BANK RATE (A07) IN MAIN      */           
6.00 10524 /*                   OPTION A00                                    */           
7.00 10524 /*-----------------------------------------------------------------*/           
8.00 10704 /*  Reference    : CHG-0083-01 (CH083)                             */           
9.00 10601 /*  Changed by   : Frank Leong                                     */           
10.00 10601 /*  Changed date : 1 June 2001                                     */           
11.00 10601 /*  Reason       : Adding the statement for calling ATM GL posting */           
12.00 10601 /*                 program.                                        */           
13.00 10601 /*-----------------------------------------------------------------*/           
14.00 10629 /*  REFERENCE     :  CH091                                         */           
15.00 10629 /*  USER ID       :  B422                                          */           
16.00 10629 /*  AUTHOR        :  ANTHONY KAM                                   */           
17.00 10629 /*  Date          :  29 JUN, 2000                                  */           
18.00 10629 /*  DESP.         :  CHANGE UPDATE INTER BANK RATE (A07) TO CALL   */           
19.00 10629 /*                   CL ZOPRLIB/UPIBCL                             */           
20.00 10629 /*-----------------------------------------------------------------*/           
21.00 10718 /*  REFERENCE     :  CH106                                         */           
22.00 10718 /*  USER ID       :  B422                                          */           
23.00 10718 /*  AUTHOR        :  ANTHONY KAM                                   */           
24.00 10718 /*  Date          :  22 MAY, 2000                                  */           
25.00 10718 /*  DESP.         :  ADD OPRTION B01 FOR STATIONARY POSTING        */           
26.00 10718 /*-----------------------------------------------------------------*/           
27.00 11115 /*  REFERENCE     :  SW042                                         */           
28.00 11115 /*  USER ID       :  B417                                          */           
29.00 11115 /*  AUTHOR        :  BILL IEONG                                    */           
30.00 11115 /*  Date          :  20 AUG, 2001                                  */           
31.00 11115 /*  DESP.         :  ADD OPTION G01 FOR TYPHOON PROCSESSING        */           
32.00 11115 /*-----------------------------------------------------------------*/           
33.00 11114 /*  REFERENCE     :  CH160                                         */           
34.00 11114 /*  USER ID       :  B168PGM                                       */           
35.00 11114 /*  AUTHOR        :  THOMAS                                        */           
36.00 11114 /*  Date          :  14 NOV, 2001                                  */           
37.00 11115 /*  DESP.         :  ADD A CALL TO FREE INT. INSTALL TXN. POSTING  */           
38.00 11115 /*                   AT OPTION C09 AND CHANGE THE ORIGINAL OPTION  */           
39.00 11115 /*                   C09 & C10 TO C10 & C11 ACCORDINGLY.           */           
40.00 11114 /*-----------------------------------------------------------------*/           
41.00 20119 /*  REFERENCE     :  C2009                                         */           
42.00 20119 /*  USER ID       :  B422                                          */           
43.00 20119 /*  AUTHOR        :  ANTHONY KAM                                   */           
44.00 20119 /*  Date          :  04 JAN, 2002                                  */           
45.00 20119 /*  DESP.         :  ADD OPTION D73 FOR SYSTEM AND IH-HOUSE        */           
46.00 20119 /*                   HISTORICAL DATA BACKUP                        */           
47.00 20119 /*-----------------------------------------------------------------*/           
48.00 20130 /*  REFERENCE     :  S2001                                         */           
49.00 20130 /*  USER ID       :  B436                                          */           
50.00 20130 /*  AUTHOR        :  OTTO                                          */           
51.00 20130 /*  Date          :  26 JAN, 2002                                  */           
52.00 20130 /*  DESP.         :  ADD AN OPTION (D06) FOR COLLATERAL POSTING    */           
53.00 20130 /*                   CHANGE ORIGINAL D06 TO D07                    */           
54.00 20130 /*-----------------------------------------------------------------*/           
55.00 20408 /*  REFERENCE     :  C2054                                         */           
56.00 20408 /*  USER ID       :  B436                                          */           
57.00 20408 /*  AUTHOR        :  OTTO                                          */           
58.00 20408 /*  Date          :  08 APR, 2002                                  */           
59.00 20408 /*  DESP.         :  ADD AN OPTION (B12) TO CALL ZSAVPLUS/INS8CL   */           
60.00 20408 /*-----------------------------------------------------------------*/           
61.00 20503 /*  REFERENCE     :  C2073                                         */           
62.00 20503 /*  USER ID       :  B436                                          */           
63.00 20503 /*  AUTHOR        :  OTTO                                          */           
64.00 20503 /*  Date          :  03 MAY, 2002                                  */           
65.00 20503 /*  DESP.         :  CHANGE OPTION (D07) TO CALL IPROD/HOLDCL      */           
66.00 20503 /*-----------------------------------------------------------------*/           
67.00 20514 /*  REFERENCE     :  C2075                                         */           
68.00 20514 /*  USER ID       :  B417                                          */           
69.00 20514 /*  AUTHOR        :  BILL                                          */           
70.00 20514 /*  Date          :  09 MAY, 2002                                  */           
71.00 20514 /*  DESP.         :  ADD OPTION B06 FOR CLEARING CHEQUE EOD        */           
72.00 20514 /*-----------------------------------------------------------------*/           
73.00 20625 /*  REFERENCE     :  C2051 (CHG-051-02)                            */           
74.00 20625 /*  USER ID       :  B168PGM                                       */           
75.00 20625 /*  AUTHOR        :  THOMAS                                        */           
76.00 20625 /*  Date          :  25 JUN, 2002                                  */           
77.00 20625 /*  DESP.         :  ADD OPTION E06 FOR CURRENT A/C LOW BALANCE    */           
78.00 20625 /*                   CHARGE                                        */           
79.00 20625 /*-----------------------------------------------------------------*/           
80.00 20828 /*  Reference     :  C2126 (CHG-126-02)                            */           
81.00 20828 /*  User ID       :  B235PGM                                       */           
82.00 20828 /*  Author        :  Frank Leong                                   */           
83.00 20828 /*  Date          :  13 August, 2002                               */           
84.00 20828 /*  Description   :  Add option A08 for utility bill payment &     */           
85.00 20828 /*                   autopay menu.                                 */           
86.00 20828 /*-----------------------------------------------------------------*/           
87.00 20829 /*  Reference     :  C2126                                         */           
88.00 20829 /*  User ID       :  B422PGM                                       */           
89.00 20829 /*  Author        :  ANTHONY KAM                                   */           
90.00 20829 /*  Date          :  27 August, 2002                               */           
91.00 20829 /*  Description   :  Add option A09 for IVR-CTI BOD PROCESSING     */           
92.00 20829 /*                              C12 FOR IVR-CTI EOD PROCESSING     */           
93.00 20829 /*-----------------------------------------------------------------*/           
94.00 20831 /*  Reference     :  C2134                                         */           
95.00 20831 /*  User ID       :  B168PGM                                       */           
96.00 20831 /*  Author        :  THOMAS                                        */           
97.00 20831 /*  Date          :  31 August, 2002                               */           
98.00 20831 /*  Description   :  Add option G11 for DSF ONE DAY SOLUTION ON    */           
99.00 20831 /*                              02-09-02                           */           
100.00 20831 /*-----------------------------------------------------------------*/           
101.00 20909 /*  Reference     :  C2126 (CHG-126-02)                            */           
102.00 20909 /*  User ID       :  B235PGM                                       */           
103.00 20909 /*  Author        :  Frank Leong                                   */           
104.00 20909 /*  Date          :  9 August, 200                                 */           
105.00 20909 /*  Description   :  Replace option C04 by new program ZPAYMENT/   */           
106.00 20909 /*                   UTEODCL.                                      */           
107.00 20909 /*-----------------------------------------------------------------*/           
108.00 21031 /*  Reference     :  C2140 (CHG-140-02)                            */           
109.00 21031 /*  User ID       :  B168PGM                                       */           
110.00 21031 /*  Author        :  THOMAS                                        */           
111.00 21031 /*  Date          :  25 OCT. 2002                                  */           
112.00 21031 /*  Description   :  Add option B13 for receiving files (free int.&*/           
113.00 21031 /*                   bonus point). Option B14 for posting free int.*/           
114.00 21031 /*                   G/L posting & bonus point merchant settlement.*/           
115.00 21031 /*-----------------------------------------------------------------*/           
116.00 21219 /*  Reference     :  C2135 (CHG-135-02)                            */           
117.00 21219 /*  User ID       :  B168PGM                                       */           
118.00 21219 /*  Author        :  THOMAS                                        */           
119.00 21219 /*  Date          :  19 DEC, 2002                                  */           
120.00 21219 /*  Description   :  Call to program ZTMLIB/FDSTMNU instead of     */           
121.00 21219 /*                   IPROD/FDSTMNU.                                */           
122.00 21219 /*-----------------------------------------------------------------*/           
123.00 30428 /*  Reference     :  C2111 (CHG-111-02)                            */           
124.00 30428 /*  User ID       :  B168PGM                                       */           
125.00 30428 /*  Author        :  THOMAS                                        */           
126.00 30428 /*  Date          :  25 APR. 2003                                  */           
127.00 30428 /*  Description   :  Add option B15 for auto capturing loan        */           
128.00 30428 /*                   repayment posting - call CL program ZNOTELIB/ */           
129.00 30428 /*                   GLNAUTOPAY.                                   */           
130.00 30428 /*-----------------------------------------------------------------*/           
131.00 30706 /*  REFERENCE     :  CHG-083-03 (C3083)                            */           
132.00 30706 /*  AUTHOR        :  ANTHONY KAM                                   */           
133.00 30706 /*  DATE          :  6 JUL 2003                                    */           
134.00 30706 /*  DESP.         :  MOVE FORM ZCTILIB TO ZCSERVICE                */           
135.00 30706 /*-----------------------------------------------------------------*/           
136.00 30713 /*  Reference     :  C3088 (CHG-088-03)                            */           
137.00 30713 /*  User ID       :  B422PGM                                       */           
138.00 30713 /*  Author        :  ANTHONY KAM                                   */           
139.00 30713 /*  Date          :  10 JUL. 2003                                  */           
140.00 30713 /*  Description   :  Add option B1A for STANING ORDER EOD          */           
141.00 30713 /*                   PROCESSING                                    */           
142.00 30713 /*                   CHANGE OPTION A09 TO CHANNEL SERVICE BOD      */           
143.00 30713 /*                   PROCESSING                                    */           
144.00 30713 /*-----------------------------------------------------------------*/           
145.00 31101 /*  Reference     :  C3158 (CHG-158-03)                            */           
146.00 31101 /*  User ID       :  B422PGM                                       */           
147.00 31101 /*  Author        :  ANTHONY KAM                                   */           
148.00 31101 /*  Date          :  30 OCT. 2003                                  */           
149.00 31101 /*  Description   :  Add option D3A for 1 % STAMP DUTY ON LOAN     */           
150.00 31101 /*                   LATE FEE                                      */           
151.00 31101 /*-----------------------------------------------------------------*/           
152.00 31124 /*  REFERENCE     :  C3142 (CHG-142-03)                            */           
153.00 31124 /*  AUTHOR        :  FRANK LEONG                                   */           
154.00 31124 /*  DATE          :  24 NOVEMBER, 2003                             */           
155.00 31124 /*  DESCRIPTION   :  AFTER INSATLLATION OF ATM ACCOUNT RECON.      */           
156.00 31124 /*                   PROCESS SERVER MODULE, THE EOD GL POSTING OF  */           
157.00 31124 /*                   ATM OB TRANSACTION IS TERMINATED. OPTION OF   */           
158.00 31124 /*                   THIS FUNCTION, I.E. C05, IS REMOVED FROM      */           
159.00 31124 /*                   OPERATOR MENU AND CL PROGRAM.                 */           
160.00 40202 /*-----------------------------------------------------------------*/           
161.00 40202 /*  Reference     :  C4010 (CHG-010-04)                            */           
162.00 40202 /*  User ID       :  B168PGM                                       */           
163.00 40202 /*  Author        :  THOMAS CHAN                                   */           
164.00 40202 /*  Date          :  02 FEB. 2004                                  */           
165.00 40202 /*  Description   : Add option B03 for current & saving low balance*/           
166.00 40202 /*                  charge. Change option E06 to perform the       */           
167.00 40202 /*                  average balance extraction.                    */           
168.00 31124 /*-----------------------------------------------------------------*/           
169.00 40420 /*  Reference     :  C4065 (CHG-065-04)                            */           
170.00 40420 /*  Author        :  Frank Leong                                   */           
171.00 40420 /*  Date          :  19 April, 2004                                */           
172.00 40420 /*  Description   :  Add option G56 for printing credit card       */           
173.00 40420 /*                   customer letter.                              */           
174.00 40420 /*                   Disable the options G02, G04, G51, G55 by     */           
175.00 40420 /*                   comment the code of these options.            */           
176.00 40420 /*-----------------------------------------------------------------*/           
177.00 41011 /*  Reference     :  C4180 (CHG-180-04)                            */           
178.00 41011 /*  User ID       :  B460PGM                                       */           
179.00 41011 /*  Changed by    :  VICKY TOU                                     */           
180.00 41011 /*  Date changed  :  05-OCT-2004                                   */           
181.00 41011 /*  Changes       :  Add option G57 for Credit Card System Purge   */           
182.00 41011 /*-----------------------------------------------------------------*/           
183.00 41217 /*  Reference     :  C4215 (CHG-215-04)                            */           
184.00 41217 /*  User ID       :  B505PGM                                       */           
185.00 41217 /*  Changed by    :  Paris Che                                     */           
186.00 41217 /*  Date changed  :  15-Dec-2004                                   */           
187.00 41217 /*  Changes       :  Add option D3B for XIRR Calculation Module    */           
188.00 41217 /*-----------------------------------------------------------------*/           
189.00 50102 /*  Reference     :  C4219 (CHG-219-04)                            */           
190.00 50102 /*  User ID       :  B422PGM                                       */           
191.00 50102 /*  Changed by    :  ANTHONY                                       */           
192.00 50102 /*  Date changed  :  2-JAN-2005                                    */           
193.00 50102 /*  Changes       :  SUSPENSE OPTION D3A FOR 1% STAMP DUTY ON LOAN */           
194.00 50102 /*                   LATE FEE                                      */           
195.00 50102 /*-----------------------------------------------------------------*/           
196.00 50110 /*  Reference     :  C5007 (CHG-007-05)                            */           
197.00 50110 /*  User ID       :  B422PGM                                       */           
198.00 50110 /*  Changed by    :  ANTHONY                                       */           
199.00 50110 /*  Date changed  :  10-Jan-2005                                   */           
200.00 50110 /*  Changes       :  Add option E07 for Dormant account listing    */           
201.00 50110 /*-----------------------------------------------------------------*/           
202.00 50513 /*  Reference     :  C5053 (CHG-053-05)                            */           
203.00 50513 /*  User ID       :  B168PGM                                       */           
204.00 50513 /*  Changed by    :  THOMAS CHAN                                   */           
205.00 50513 /*  Date changed  :  13-MAY-2005                                   */           
206.00 50513 /*  Changes       :  Add option A10 for POS MERCHANT SETTLEMENT    */           
207.00 50513 /*-----------------------------------------------------------------*/           
208.00 50531 /*  REFERENCE     :  C5073 (CHG-073-05)                            */           
209.00 50531 /*  USER ID       :  B422PGM                                       */           
210.00 50531 /*  CHANGED BY    :  ANTHONY                                       */           
211.00 50531 /*  DATE CHANGED  :  27-MAY-2005                                   */           
212.00 50531 /*  CHANGES       :  CHANGE OPTION 'B01' TO CALL ICBSTOOLS/STASEL  */           
213.00 50531 /*                   DUE TO ADD POSTING FOR MAINTANENCE AND SERV.  */           
214.00 50531 /*-----------------------------------------------------------------*/           
215.00 50727 /*  REFERENCE     :  C5110 (CHG-110-05)                            */           
216.00 50727 /*  USER ID       :  B552PGM                                       */           
217.00 50727 /*  CHANGED BY    :  CARMEN LEI                                    */           
218.00 50727 /*  DATE CHANGED  :  27-JULY-2005                                  */           
219.00 50727 /*  CHANGES       :  ADD OPTION 'G99' TO CALL IPROD/RUNAPPLIST     */           
220.00 50727 /*                   TO GET CAR LOAN APPLICANT LIST AND DL IT TO   */           
221.00 50727 /*                   PC                                            */           
222.00 50727 /*  REMARK        :  TO BE DELETED AFTER 1-OCT-2005                */           
223.00 50727 /*-----------------------------------------------------------------*/           
224.00 50809 /*  REFERENCE     :  C5125 (CHG-125-05)                            */           
225.00 50809 /*  USER ID       :  B505PGM                                       */           
226.00 50809 /*  CHANGED BY    :  PARIS CHE                                     */           
227.00 50809 /*  DATE CHANGED  :  09-AUG-2005                                   */           
228.00 50809 /*  CHANGES       :  ADD OPTION 'G80' TO CALL IPROD/AUDMNUCL       */           
229.00 50809 /*                   TO RUN AD-HOC CUSTOMER SERACH FOR INTERNAL    */           
230.00 50809 /*                   AUDIT                                         */           
231.00 50809 /*-----------------------------------------------------------------*/           
232.00 50901 /*  REFERENCE     :  C5135 (CHG-135-05)                            */           
233.00 50825 /*  USER ID       :  B505PGM                                       */           
234.00 50825 /*  CHANGED BY    :  PARIS CHE                                     */           
235.00 50825 /*  DATE CHANGED  :  25-AUG-2005                                   */           
236.00 50825 /*  CHANGES       :  ADD OPTION 'B1B' TO CALL ZSTOCK/STKMNUCL      */           
237.00 50825 /*                   TO RUN STOCK PROCESSING MENU                  */           
238.00 50825 /*-----------------------------------------------------------------*/           
239.00 60714 /*  REFERENCE     :  C6206 (CHG-206-06)                            */           
240.00 60714 /*  USER ID       :  B422PGM                                       */           
241.00 60714 /*  CHANGED BY    :  ANTHONY                                       */           
242.00 60714 /*  DATE CHANGED  :  14-JUL-2006                                   */           
243.00 60714 /*  CHANGES       :  CHANGE CL USED IN C12 FROM ZCSERVICE/CTIEODCL */           
244.00 60714 /*                   TO ZCSERVICE/CTIEODSL                         */           
245.00 60714 /*-----------------------------------------------------------------*/           
246.00 61020 /*  REFERENCE   : C6292 (CHG-292-06)                               */           
247.00 61020 /*  USER ID     : B422PGM                                          */           
248.00 61020 /*  CHANGED BY  : ANTHONY                                          */           
249.00 61020 /*  CHANGED DATE: 20-OCT-2006                                      */           
250.00 61020 /*  REASON      : SEPARATE OPTION D70 REPORTING AFTER PCOMB INTO   */           
251.00 61020 /*                TWO PART:                                        */           
252.00 61020 /*                1. ADD OPTION D69 FOR PART A WHICH RUN BEFORE    */           
253.00 61020 /*                   G/L POSTING                                   */           
254.00 61020 /*                1. CHANGE OPTION D70 TO PART B WHICH RUN AFTER   */           
255.00 61020 /*                   G/L POSTING                                   */           
256.00 61020 /*-----------------------------------------------------------------*/           
257.00 61024 /*  REFERENCE   : C6294 (CHG-294-06)                               */           
258.00 61024 /*  USER ID     : B168PGM                                          */           
259.00 61024 /*  CHANGED BY  : THOMAS CHAN                                      */           
260.00 61024 /*  CHANGED DATE: 24-OCT-2006                                      */           
261.00 61024 /*  REASON      : 1. ADD OPTION CLK TO GENERATE FILE TO CARDLINK.  */           
262.00 61024 /*                2. ADD OPTION DLK TO PROCESS RECEIVED FILES      */           
263.00 61024 /*                   FROM CARDLINK.                                */           
264.00 61024 /*-----------------------------------------------------------------*/           
265.00 61110 /*  REFERENCE   : C6278 (CHG-278-06)                               */           
266.00 61110 /*  USER ID     : B552PGM                                          */           
267.00 61110 /*  CHANGED BY  : CARMEN LEI                                       */           
268.00 61110 /*  CHANGED DATE: 10-NOV-2006                                      */           
269.00 61110 /*  REASON      : 1. DISABLE 'D02': RECEIVE XBCPNOS & XBCPCAM      */           
270.00 61110 /*                   FROM BCMSYS2                                  */           
271.00 61110 /*                2. DISABLE 'D03': SEND BCM & BCP IMMS FILES TO   */           
272.00 61110 /*                   PORTUGAL                                      */           
273.00 61110 /*-----------------------------------------------------------------*/           
274.00 70105 /*  REFERENCE   : C7004 (CHG-004-07)                               */           
275.00 70103 /*  USER ID     : B422PGM                                          */           
276.00 70103 /*  CHANGED BY  : ANTHONY                                          */           
277.00 70103 /*  CHANGED DATE: 03-JAN-2007                                      */           
278.00 70103 /*  REASON      : 1. ADD OPTION A11 FOR JETPAYMENT OF CARDLINK     */           
279.00 70103 /*                2. ADD OPTION A12 FOR MASTER CARD TXN            */           
280.00 70104 /*                3. CHANGE OPTION B11 FROM ZCARD TO ZLCCAUT       */           
281.00 70104 /*  USER ID     : B168PGM                                          */           
282.00 70104 /*  CHANGED BY  : THOMAS                                           */           
283.00 70104 /*  CHANGED DATE: 04-JAN-2007                                      */           
284.00 70105 /*  REASON      : 1. Split option DLK into DL1 & DL2.              */           
285.00 70103 /*-----------------------------------------------------------------*/           
286.00 70213 /*  REFERENCE   : C7045 (CHG-045-07)                               */           
287.00 70213 /*  USER ID     : B168PGM                                          */           
288.00 70213 /*  CHANGED BY  : THOMAS CHAN                                      */           
289.00 70213 /*  CHANGED DATE: 13-FEB-2007                                      */           
290.00 70213 /*  REASON      : 1. ADD OPTION 'G58' FOR G/L POSTING OF CREDIT    */           
291.00 70213 /*                   CARD INTEREST.                                */           
292.00 70213 /*-----------------------------------------------------------------*/           
293.00 70301 /*  REFERENCE   : C7058 (CHG-057-07)                               */           
294.00 70301 /*  USER ID     : B422PGM                                          */           
295.00 70301 /*  CHANGED BY  : ANTHONY                                          */           
296.00 70301 /*  CHANGED DATE: 28-FEB-2007                                      */           
297.00 70301 /*  REASON      : ADD OPTION 'DS1' FOR DAILY BACKUP OF BASEII      */           
298.00 70301 /*                DATA                                             */           
299.00 70301 /*-----------------------------------------------------------------*/           
300.00 70309 /*  REFERENCE   : C7052 (CHG-052-07)                               */           
301.00 70309 /*  USER ID     : B552PGM                                          */           
302.00 70309 /*  CHANGED BY  : CARMEN LEI                                       */           
303.00 70309 /*  CHANGED DATE: 21-FEB-2007                                      */           
304.00 70309 /*  REASON      : OPTION 'F01', CHANGE TO CALL PGM ZCOLIB/COEOMCL  */           
305.00 70309 /*-----------------------------------------------------------------*/           
306.00 70312 /*  REFERENCE   : C7073 (CHG-073-07)                               */           
307.00 70312 /*  USER ID     : B168PGM                                          */           
308.00 70312 /*  CHANGED BY  : THOMAS                                           */           
309.00 70312 /*  CHANGED DATE:  9-MAR-2007                                      */           
310.00 70312 /*  REASON      : Add Option 'A13' for CUP POS merchant settlement */           
311.00 70312 /*                posting.                                         */           
312.00 70312 /*                Add Option 'B0A' to generate CUP merchant setup  */           
313.00 70312 /*                file.                                            */           
314.00 70312 /*-----------------------------------------------------------------*/           
315.00 70412 /*  REFERENCE   : C7106 (CHG-106-07)                               */           
316.00 70412 /*  USER ID     : B422PGM                                          */           
317.00 70412 /*  CHANGED BY  : Anthony                                          */           
318.00 70412 /*  CHANGED DATE: 12-Apr-2007                                      */           
319.00 70412 /*  REASON      : Remove option 'C07' due to ICCS retire           */           
320.00 70412 /*-----------------------------------------------------------------*/           
321.00 70423 /*  REFERENCE   : C7111 (CHG-111-07)                               */           
322.00 70423 /*  USER ID     : B168PGM                                          */           
323.00 70423 /*  CHANGED BY  : THOMAS CHAN                                      */           
324.00 70423 /*  CHANGED DATE: 23-APR-2007                                      */           
325.00 70423 /*  REASON      : 1. ADD OPTION 'G59' FOR CREDIT CARD BONUS POINT  */           
326.00 70423 /*                   BATCH ADJUSTMENT.                             */           
327.00 70423 /*-----------------------------------------------------------------*/           
328.00 70615 /*  REFERENCE   : C7179 (CHG-179-07)                               */           
329.00 70615 /*  USER ID     : B436PGM                                          */           
330.00 70615 /*  CHANGED BY  : Otto Chao                                        */           
331.00 70615 /*  CHANGED DATE: 15-JUN-2007                                      */           
332.00 70615 /*  REASON      : Add Option 'G60' for Credit Card Contingency     */           
333.00 70615 /*                file generation.                                 */           
334.00 70615 /*-----------------------------------------------------------------*/           
335.00 70809 /*  REFERENCE   : C7215 (CHG-215-07)                               */           
336.00 70809 /*  USER ID     : B168PGM                                          */           
337.00 70809 /*  CHANGED BY  : THOMAS CHAN                                      */           
338.00 70809 /*  CHANGED DATE: 09-AUG-2007                                      */           
339.00 70809 /*  REASON      : 1. CHANGE OPTION 'A10' TO CALL ZLMERPRO/ACQPSTCL */           
340.00 70809 /*                   SO THAT NOT TO PROCESS ICCS MERCHANT TXN.     */           
341.00 70809 /*                2. REMOVE OPTION 'G57 - CREDIT CARD SYSTEM       */           
342.00 70809 /*                   PURGE MENU'.                                  */           
343.00 70809 /*-----------------------------------------------------------------*/           
344.00 70810 /*  REFERENCE   : C7227 (CHG-227-07)                               */           
345.00 70810 /*  USER ID     : B552PGM                                          */           
346.00 70810 /*  CHANGED BY  : CARMEN LEI                                       */           
347.00 70810 /*  CHANGED DATE: 06-AUG-2007                                      */           
348.00 70810 /*  REASON      : ADD OPTION 'C05' FOR TADCS EOD BEFORE PCOMB      */           
349.00 70810 /*-----------------------------------------------------------------*/           
350.00 70917 /*  REFERENCE   : C7258 (CHG-258-07)                               */           
351.00 70917 /*  USER ID     : B552PGM                                          */           
352.00 70917 /*  CHANGED BY  : CARMEN LEI                                       */           
353.00 70917 /*  CHANGED DATE: 12-SEP-2007                                      */           
354.00 70917 /*  REASON      : 1. MODIFY 'C05' TO 'C5A' FOR IN-HOUSE BEFORE     */           
355.00 70917 /*                TADCS EOD                                        */           
356.00 70917 /*                2. ADD 'C5B' FOR IN-HOUSE AFTER TADCS EOD        */           
357.00 70917 /*                3. REMOVE 'A02' EXIMBILLS EOD                   */            
358.00 70917 /*                4. REMOVE 'B09' TADCS EOD                       */            
359.00 70917 /*-----------------------------------------------------------------*/           
360.00 80115 /*  REFERENCE   : C8009 (CHG-009-08)                               */           
361.00 80115 /*  USER ID     : B168PGM                                          */           
362.00 80115 /*  CHANGED BY  : THOMAS CHAN                                      */           
363.00 80115 /*  CHANGED DATE: 07-JAN-2008                                      */           
364.00 80115 /*  REASON      : Add Option 'A14' to process credit card embossing*/           
365.00 80115 /*                and generate CCBAF.                              */           
366.00 80115 /*-----------------------------------------------------------------*/           
367.00 80304 /*  REFERENCE   : C7370 (CHG-370-07)                               */           
368.00 80304 /*  USER ID     : B810PGM                                          */           
369.00 80304 /*  CHANGED BY  : LOUIS MAK                                        */           
370.00 80304 /*  CHANGED DATE: 04-MAR-2008                                      */           
371.00 80304 /*  REASON      : Add Option 'G08' to process credit card CVM      */           
372.00 80304 /*                Statement Message File Generation.               */           
373.00 80304 /*-----------------------------------------------------------------*/           
374.00 80415 /*  REFERENCE   : C8087 (CHG-087-08)                               */           
375.00 80415 /*  USER ID     : B810PGM                                          */           
376.00 80415 /*  CHANGED BY  : Louis Mak                                        */           
377.00 80415 /*  CHANGED DATE: 15-Apr-2008                                      */           
378.00 80415 /*  REASON      : Add Option 'G09' to process credit card past due */           
379.00 80415 /*                letter printing data file generation.            */           
380.00 80415 /*-----------------------------------------------------------------*/           
381.00 80424 /*  REFERENCE   : C8048 (CHG-048-08)                               */           
382.00 80424 /*  USER ID     : B168PGM                                          */           
383.00 80424 /*  CHANGED BY  : Thomas Chan                                      */           
384.00 80424 /*  CHANGED DATE: 23-Apr-2008                                      */           
385.00 80424 /*  REASON      : For Option 'A10', also call ZLCREDIT/CRDINTGLCL  */           
386.00 80424 /*                to perform credit card interest GL posting.      */           
387.00 80513 /*                Remove option G58-Credit card interest G/L posting.*/         
388.00 80424 /*-----------------------------------------------------------------*/           
389.00 80704 /*  REFERENCE   : C8179 (CHG-179-08)                               */           
390.00 80527 /*  USER ID     : B552PGM                                          */           
391.00 80527 /*  CHANGED BY  : CARMEN LEI                                       */           
392.00 80527 /*  CHANGED DATE: 27-MAY-2008                                      */           
393.00 80527 /*  REASON      : ADD OPTION 'G04' TO DOWNLOAD DSEJ EDUCATION LOAN */           
394.00 80527 /*                LIST                                             */           
395.00 80527 /*-----------------------------------------------------------------*/           
396.00 80606 /*  REFERENCE   : C8097 (CHG-097-08)                               */           
397.00 80606 /*  USER ID     : B168PGM                                          */           
398.00 80606 /*  CHANGED BY  : THOMAS CHAN                                      */           
399.00 80606 /*  CHANGED DATE: 06-JUN-2008                                      */           
400.00 80606 /*  REASON      : ADD OPTION 'G57' TO PROCESS EXTRA BONUS POINT    */           
401.00 80606 /*                ADJUSTMENT FILE                                  */           
402.00 80606 /*-----------------------------------------------------------------*/           
403.00 80919 /*  REFERENCE   : C8210 (CHG-210-08)                               */           
404.00 80919 /*  USER ID     : B168PGM                                          */           
405.00 80919 /*  CHANGED BY  : THOMAS CHAN                                      */           
406.00 80919 /*  CHANGED DATE: 06-JUN-2008                                      */           
407.00 80919 /*  REASON      : Add option 'A15' to perform Cash-In plan txn.    */           
408.00 80919 /*                posting                                          */           
409.00 80919 /*-----------------------------------------------------------------*/           
410.00 90113 /*  REFERENCE   : C8346 (CHG-346-08)                               */           
411.00 90113 /*  USER ID     : B168PGM                                          */           
412.00 90113 /*  CHANGED BY  : THOMAS CHAN                                      */           
413.00 90113 /*  CHANGED DATE: 13-JAN-2009                                      */           
414.00 90113 /*  REASON      : Add option 'A16' to perform Cash Reward Posting. */           
415.00 90113 /*-----------------------------------------------------------------*/           
416.00 90226 /*  REFERENCE   : C9073 (CHG-073-09)                               */           
417.00 90226 /*  USER ID     : BA04PGM                                          */           
418.00 90226 /*  CHANGED BY  : WAY CHOI                                         */           
419.00 90226 /*  CHANGED DATE: 26-FEB-2009                                      */           
420.00 90226 /*  REASON      : Change option 'G80' and 'G99'. 'G80' for OMS     */           
421.00 90226 /*                mirroring monitor. 'G99' for ODS mirroring       */           
422.00 90226 /*                monitor.                                         */           
423.00 90226 /*-----------------------------------------------------------------*/           
424.00 90320 /*  REFERENCE   : C9010 (CHG-010-09)                               */           
425.00 90320 /*  USER ID     : B552PGM                                          */           
426.00 90320 /*  CHANGED BY  : CARMEN LEI                                       */           
427.00 90320 /*  CHANGED DATE: 20-MAR-2009                                      */           
428.00 90320 /*  REASON      : Add option 'E08' for Doraemon Saving Plan        */           
429.00 90320 /*-----------------------------------------------------------------*/           
430.00 90713 /*  REFERENCE   : C9231 (CHG-231-09)                               */           
431.00 90713 /*  USER ID     : B422                                             */           
432.00 90713 /*  CHANGED BY  : ANTHONY                                          */           
433.00 90713 /*  CHANGED DATE: 13-JUL-2009                                      */           
434.00 90713 /*  REASON      : CHANGE OPTION 'D70' TO SBMMIT JOB                */           
435.00 90713 /*-----------------------------------------------------------------*/           
436.00 90929 /*  REFERENCE   : C9304 (CHG-304-09)                               */           
437.00 90916 /*  USER ID     : B552                                             */           
438.00 90916 /*  CHANGED BY  : CARMEN LEI                                       */           
439.00 90916 /*  CHANGED DATE: 16-SEPT-09                                       */           
440.00 90916 /*  REASON      : ADD OPTION 'E09'                                 */           
441.00 90916 /*-----------------------------------------------------------------*/           
442.00 91112 /*  REFERENCE   : C9355 (CHG-355-09)                               */           
443.00 91009 /*  USER ID     : B552PGM                                          */           
444.00 91009 /*  CHANGED BY  : CARMEN LEI                                       */           
445.00 91009 /*  CHANGED DATE: 09-OCT-2009                                      */           
446.00 91009 /*  REASON      : 1. ADD OPTION 'A17' - IBT SETTLEMENT MENU        */           
447.00 91009 /*                2. ADD OPTION 'C09' - IBT EOD PROCESS            */           
448.00 91009 /*                3. MOVE OPTION 'C10' - ICBS ACCESS LOGGING EOD   */           
449.00 91009 /*                   TO REPORT BEFORE PCOMB                        */           
450.00 91009 /*-----------------------------------------------------------------*/           
451.00 100527 /*  REFERENCE   : C9370 (CHG-370-09)                               */           
452.00 100527 /*  USER ID     : B168PGM                                          */           
453.00 100527 /*  CHANGED BY  : THOMAS CHAN                                      */           
454.00 100527 /*  CHANGED DATE: 27-MAY-2010                                      */           
455.00 100527 /*  REASON      : ADD OPTION 'G58' - CUP DEBIT CARD CASH REBATE    */           
456.00 100527 /*                POSTING                                          */           
457.00 100527 /*-----------------------------------------------------------------*/           
458.00 100628 /*  REFERENCE   : C9370 (CHG-370-09)                               */           
459.00 100628 /*  USER ID     : B168PGM                                          */           
460.00 100628 /*  CHANGED BY  : THOMAS CHAN                                      */           
461.00 100628 /*  CHANGED DATE: 28-JUN-2010                                      */           
462.00 100628 /*  REASON      : ADD OPTION 'G02' - CUP DEBIT CARD CONVERSION     */           
463.00 100628 /*                EMBOSSING PROCESS                                */           
464.00 100628 /*-----------------------------------------------------------------*/           
465.00 100721 /*  REFERENCE   : D0180 (CHG-180-10)                               */           
466.00 100721 /*  USER ID     : BA55PGM                                          */           
467.00 100721 /*  CHANGED BY  : KARL H.JR                                        */           
468.00 100721 /*  CHANGED DATE: 21-JUL-2010                                      */           
469.00 100721 /*  REASON      : ADD OPTION 'E10' - MAXSAVE MONTHLY BONUS INTEREST*/           
470.00 100721 /*-----------------------------------------------------------------*/           
471.00 100803 /*  REFERENCE   : D0207 (CHG-207-10)                               */           
472.00 100803 /*  USER ID     : B323PGM                                          */           
473.00 100803 /*  CHANGED BY  : edward cheung                                    */           
474.00 100803 /*  CHANGED DATE: 03-aug-2010                                      */           
475.00 100803 /*  REASON      : Change option 'D07' to submit job                */           
476.00 100803 /*-----------------------------------------------------------------*/           
477.00 100917 /*  REFERENCE   : D0245 (CHG-245-10)                               */           
478.00 100917 /*  USER ID     : BB14PGM                                          */           
479.00 100917 /*  CHANGED BY  : FRANCISCO LO                                     */           
480.00 100917 /*  CHANGED DATE: 17-SEP-2010                                      */           
481.00 100917 /*  REASON      : Add function key F11 to print batch job report   */           
482.00 100917 /*-----------------------------------------------------------------*/           
483.00 110318 /*  REFERENCE   : D1084 (CHG-084-11)                               */           
484.00 110318 /*  USER ID     : BB14PGM                                          */           
485.00 110318 /*  CHANGED BY  : FRANCISCO LO                                     */           
486.00 110318 /*  CHANGED DATE: 18-MAR-2011                                      */           
487.00 110318 /*  REASON      : REMOVE FUNCTION E08                              */           
488.00 110330 /*-----------------------------------------------------------------*/           
489.00 110330 /*  REFERENCE   : D1100 (CHG-100-11)                               */           
490.00 110330 /*  USER ID     : BB14PGM                                          */           
491.00 110330 /*  CHANGED BY  : FRANCISCO LO                                     */           
492.00 110330 /*  CHANGED DATE: 30-MAR-2011                                      */           
493.00 110330 /*  REASON      : ADD FUNCTION G70 - STEP UP DEPOSIT POSTING       */           
494.00 110318 /*-----------------------------------------------------------------*/           
495.00 110525 /*  REFERENCE   : D1128 (CHG-128-11)                               */           
496.00 110525 /*  USER ID     : B168PGM                                          */           
497.00 110525 /*  CHANGED BY  : THOMAS CHAN                                      */           
498.00 110525 /*  CHANGED DATE: 25-MAY-2011                                      */           
499.00 110525 /*  REASON      : Modify function G58 for "Welcome gift BP posting"*/           
500.00 110525 /*-----------------------------------------------------------------*/           
501.00 111108 /*  REFERENCE   : D1300 (CHG-300-11)                                          */
502.00 111108 /*  USER ID     : B168PGM                                                     */
503.00 111108 /*  CHANGED BY  : THOMAS CHAN                                                 */
504.00 111108 /*  CHANGED DATE:  8-NOV-2011                                                 */
505.00 111108 /*  REASON      : Since the automatic generation of credit card past due      */
506.00 111108 /*                letters is launched, option "G09. credit card past due data */
507.00 111108 /*                file generation" will be obsolete.                          */
508.00 111108 /*----------------------------------------------------------------------------*/
509.00 111129 /*  REFERENCE   : D1339 (CHG-339-11)                                          */
510.00 111129 /*  USER ID     : B168PGM                                                     */
511.00 111129 /*  CHANGED BY  : THOMAS CHAN                                                 */
512.00 111129 /*  CHANGED DATE: 29-NOV-2011                                                 */
513.00 111129 /*  REASON      : Add an option G55 to perform credit card welcome gift cash  */
514.00 111129 /*                reward posting.                                             */
515.00 111129 /*----------------------------------------------------------------------------*/
516.00 120223 /*  REFERENCE   : D1246 (CHG-246-11)                                          */
517.00 120223 /*  USER ID     : B168PGM                                                     */
518.00 120223 /*  CHANGED BY  : THOMAS CHAN                                                 */
519.00 120223 /*  CHANGED DATE: 23-FEB-2012                                                 */
520.00 120223 /*  REASON      : Replace the option G52 to generate CardLinK ex-rate file.   */
521.00 120223 /*                The file is introdued after CUP dual ccy card project.      */
522.00 120223 /*----------------------------------------------------------------------------*/
523.00 120626 /*  REFERENCE   : D2063 (CHG-063-12)                                          */
524.00 120614 /*  USER ID     : BB16PGM                                                     */
525.00 120614 /*  CHANGED BY  : ALVIN LEI                                                   */
526.00 120614 /*  CHANGED DATE: 14-JUN-2012                                                 */
527.00 120614 /*  REASON      : ADD OPTIN E11 FOR NEW SMARTSALARY CREDIT INTEREST           */
528.00 120614 /*----------------------------------------------------------------------------*/
529.00 120914 /*  REFERENCE   : D2206 (CHG-206-12)                                          */
530.00 120914 /*  USER ID     : B168PGM                                                     */
531.00 120914 /*  CHANGED BY  : THOMAS CHAN                                                 */
532.00 120914 /*  CHANGED DATE: 14-SEP-2012                                                 */
533.00 120914 /*  REASON      : ADD option B0B for cr. card merchant monitoring reports     */
534.00 120914 /*----------------------------------------------------------------------------*/
535.00 121017 /*  REFERENCE   : D2245 (CHG-245-12)                                          */
536.00 121017 /*  USER ID     : BB14PGM                                                     */
537.00 121017 /*  CHANGED BY  : FRANCISCO LO                                                */
538.00 121017 /*  CHANGED DATE: 17-OCT-2012                                                 */
539.00 121017 /*  REASON      : ADD OPTION A18 TO GENERATE CREDIT CARD LOAN PAYMENT         */
540.00 121017 /*----------------------------------------------------------------------------*/
541.00 121127 /*  REFERENCE   : D2299 (CHG-299-12)                                          */
542.00 121127 /*  USER ID     : BB16PGM                                                     */
543.00 121127 /*  CHANGED BY  : ALVIN LEI                                                   */
544.00 121127 /*  CHANGED DATE: 27-NOV-2012                                                 */
545.00 121127 /*  REASON      : ADD OPTION E12 FOR FLEXIBLE STEP-UP DEPOSIT PROCESSING      */
546.00 121127 /*----------------------------------------------------------------------------*/
547.00 130827 /*  REFERENCE   : D3295 (CHG-295-13)                                          */
548.00 130827 /*  USER ID     : BB14PGM                                                     */
549.00 130827 /*  CHANGED BY  : FRANCISCO LO                                                */
550.00 130827 /*  CHANGED DATE: 27-AUG-2013                                                 */
551.00 130827 /*  REASON      : UPDATE FUNCTION G58 TO USE NEW PROGRAM                      */
552.00 130827 /*----------------------------------------------------------------------------*/
553.00 140117 /*  REFERENCE   : D4031 (CHG-031-14)                                          */
554.00 140117 /*  USER ID     : BG58PGM                                                     */
555.00 140117 /*  CHANGED BY  : WINE CHAN                                                   */
556.00 140117 /*  CHANGED DATE: 17-JAN-2014                                                 */
557.00 140117 /*  REASON      : ADD OPTION GZZ TO CHECK PST00101                            */
558.00 140117 /*----------------------------------------------------------------------------*/
559.00 140627 /*  REFERENCE   : D4202 (CHG-209-14)                                          */
560.00 140527 /*  USER ID     : BG09PGM                                                     */
561.00 140527 /*  CHANGED BY  : ALBERT AU                                                   */
562.00 140527 /*  CHANGED DATE: 27-MAY-2014                                                 */
563.00 140527 /*  REASON      : ADD OPTION A19 TO FSS ATM IMPORT FILE                       */
564.00 140527 /*----------------------------------------------------------------------------*/
565.00 140723 /*  REFERENCE   : D4269 (CHG-269-14)                                          */
566.00 140723 /*  USER ID     : B168PGM                                                     */
567.00 140723 /*  CHANGED BY  : THOMAS CHAN                                                 */
568.00 140723 /*  CHANGED DATE: 23-JUL-2014                                                 */
569.00 140723 /*  REASON      : ADD OPTION E13 FOR CREDIT CARD AUTOPAY FREE SPENDING LIMIT  */
570.00 140723 /*                OFFER                                                       */
571.00 140723 /*----------------------------------------------------------------------------*/
572.00 140826 /*  REFERENCE   : D4330 (CHG-330-14)                                          */
573.00 140826 /*  USER ID     : B168PGM                                                     */
574.00 140826 /*  CHANGED BY  : THOMAS CHAN                                                 */
575.00 140826 /*  CHANGED DATE: 26-AUG-2014                                                 */
576.00 140826 /*  REASON      : CHANGE OPTION G02 FOR MANUAL PROCESS DB CARD EMBOSS FILE FOR*/
577.00 140826 /*                SMS                                                         */
578.00 140826 /*----------------------------------------------------------------------------*/
579.00 140919 /*  REFERENCE   : D4344 D4374 D4223 (CHG-344-14 CHG-374-14)*/                   
580.00 140918 /*  USER ID     : BG58PGM                                                     */
581.00 140918 /*  CHANGED BY  : WINE CHAN                                                   */
582.00 140918 /*  CHANGED DATE: 18-SEP-2014                                                 */
583.00 140918 /*  REASON      : ADD OPTION E14 E15 E16 FOR EMPLOYEE , EMPLOYER AND AUTOPAY  */
584.00 140919 /*                CAMPAIGN                                                    */
585.00 140918 /*----------------------------------------------------------------------------*/
586.00 150216 /*  REFERENCE   : D5009 (CHG-009-15)                                          */
587.00 150216 /*  USER ID     : BG24PGM                                                     */
588.00 150216 /*  CHANGED BY  : ERIC WONG                                                   */
589.00 150216 /*  CHANGED DATE: 16-FEB-2015                                                 */
590.00 150216 /*  REASON      : REMOVE E16 AUTOAPY REBATE PROGRAM                           */
591.00 150216 /*----------------------------------------------------------------------------*/
592.00 150225 /*  REFERENCE   : D4449 (CHG-449-14)                                          */
593.00 150225 /*  USER ID     : B168PGM                                                     */
594.00 150225 /*  CHANGED BY  : THOMAS CHAN                                                 */
595.00 150225 /*  CHANGED DATE: 25-FEB-2015                                                 */
596.00 150225 /*  REASON      : ADD OPTION B09 TO SEND VPEP REQUEST FILE                    */
597.00 150225 /*----------------------------------------------------------------------------*/
598.00 150416 /*  REFERENCE   : D5078 (CHG-078-15)                                          */
599.00 150416 /*  USER ID     : BG40PGM                                                     */
600.00 150416 /*  CHANGED BY  : Dicky Cheong                                                */
601.00 150416 /*  CHANGED DATE: 16-Apr-2015                                                 */
602.00 150416 /*  REASON      : Add Option G05 When Received NOTRKCRD File from User        */
603.00 150416 /*----------------------------------------------------------------------------*/
604.00 150721 /*  REFERENCE   : D5237 (CHG-237-15)                                          */
605.00 150715 /*  USER ID     : BG58PGM                                                     */
606.00 150715 /*  CHANGED BY  : WINE CHAN                                                   */
607.00 150715 /*  CHANGED DATE: 15-JUL-2015                                                 */
608.00 150715 /*  REASON      : ADD E16 FOR DESJ AUTOPAY CAMPAIGN                           */
609.00 150715 /*----------------------------------------------------------------------------*/
610.00 151126 /*  REFERENCE   : D5382 (CHG-382-15)                                          */
611.00 151126 /*  USER ID     : B168PGM                                                     */
612.00 151126 /*  CHANGED BY  : THOMAS CHAN                                                 */
613.00 151126 /*  CHANGED DATE: 26-NOV-2015                                                 */
614.00 151126 /*  REASON      : ADD A20 for Macau Pass Top Up settlement posting            */
615.00 151126 /*----------------------------------------------------------------------------*/
616.00 151130 /*  REFERENCE   : D5420 (CHG-420-15)                                          */
617.00 151130 /*  USER ID     : BA55PGM                                                     */
618.00 151130 /*  CHANGED BY  : KARL                                                        */
619.00 151130 /*  CHANGED DATE: 30-NOV-2015                                                 */
620.00 151130 /*  REASON      : ADD A21 for e-Channels file exchange with DSB               */
621.00 151130 /*----------------------------------------------------------------------------*/
622.00 160106 /*  REFERENCE   : D5421 (CHG-421-15)                                          */
623.00 160106 /*  USER ID     : BG58PGM                                                     */
624.00 160106 /*  CHANGED BY  : WINE CHAN                                                   */
625.00 160106 /*  CHANGED DATE: 06-JAN-2016                                                 */
626.00 160106 /*  REASON      : ADD A22 for DOWNLOAD FILE OF DSF TAX REFUND DATA            */
627.00 160106 /*----------------------------------------------------------------------------*/
628.00 160419 /*  REFERENCE   : D6111 (CHG-111-16)                                          */
629.00 160419 /*  USER ID     : B168PGM                                                     */
630.00 160419 /*  CHANGED BY  : THOMAS CHAN                                                 */
631.00 160419 /*  CHANGED DATE: 19-APR-2016                                                 */
632.00 160513 /*  REASON      : Modify option A10 to become a menu to perform VM POS        */
633.00 160513 /*                merchant settle process.                                    */
634.00 160419 /*              - As option A10 become a menu, move the 'Credit card interest */
635.00 160419 /*                G/L posting' process from A10 to A15.                       */
636.00 160513 /*              - Modify option A13 to become a menu to perform CUP POS       */
637.00 160513 /*                merchant settle process.                                    */
638.00 160419 /*----------------------------------------------------------------------------*/
639.00 160617 /*  REFERENCE   : D6200 (CHG-200-16)                                          */
640.00 160617 /*  USER ID     : BI77PGM                                                     */
641.00 160617 /*  CHANGED BY  : MYLES IEONG                                                 */
642.00 160617 /*  CHANGED DATE: 17-JUN-2016                                                 */
643.00 160617 /*  REASON      : Add E17 to update review file of Loan Security Trading      */
644.00 160617 /*----------------------------------------------------------------------------*/
644.01 160907 /*  REFERENCE   : D6288 (CHG-288-16)                                          */
644.02 160907 /*  USER ID     : BH90PGM                                                     */
644.03 160907 /*  CHANGED BY  : TOMMY TONG                                                  */
644.04 160907 /*  CHANGED DATE: 07-SEP-2016                                                 */
644.05 160907 /*  REASON      : Terminiate F01 CO Monthly                                   */
644.06 160907 /*----------------------------------------------------------------------------*/
644.07 161110 /*  REFERENCE   : D6309 (CHG-309-16)                                          */
644.08 160921 /*  USER ID     : BG58PGM                                                     */
644.09 160921 /*  CHANGED BY  : WINE CHAN                                                   */
644.10 160921 /*  CHANGED DATE: 21-SEP-2016                                                 */
644.11 160921 /*  REASON      : ADD OPTION G61 FOR GEN CR.CARD CUSTOMER SMS OPT-OUT FILE    */
644.12 160921 /*----------------------------------------------------------------------------*/
644.13 161230 /*  REFERENCE   : D6419 (CHG-419-16)                                          */
644.14 161230 /*  USER ID     : B168PGM                                                     */
644.15 161230 /*  CHANGED BY  : THOMAS CHAN                                                 */
644.16 161230 /*  CHANGED DATE: 30-DEC-2016                                                 */
644.17 161230 /*  REASON      : ADD OPTION B16 TO PROCESS VPEP RESPONSE FILE                */
644.18 161230 /*----------------------------------------------------------------------------*/
645.00 91009              PGM        /* System Operator Menu */                              
646.00 307              DCLF       FILE(ZOPRLIB/OPRMNUD)                                   
647.00 900824              DCL        VAR(&OUTQ)  TYPE(*CHAR) LEN(10)                         
648.00 901017              DCL        VAR(&OUTQLIB)  TYPE(*CHAR) LEN(10)                      
649.00 120223 /* D1246 */  DCL        VAR(&MNUOPT) TYPE(*CHAR) LEN(5)                         
650.00 120223 /* D1246 */  DCL        VAR(&PROMPT) TYPE(*CHAR) LEN(40)                        
651.00 120223 /* D1246 */  DCL        VAR(&REPLY) TYPE(*CHAR) LEN(1)                          
652.00 150416 /* D5078 */  DCL        VAR(&PCSCMD) TYPE(*CHAR) LEN(80)                        
653.00 161110 /* D6309     MONMSG     MSGID(CPF2103 CPF2104) */                               
653.01 161110 /* D6309 */  MONMSG     MSGID(CPF2103 CPF2817 CPF2104 IWS4010)                  
654.00 941110                                                                                 
655.00 901017  INIT:       RTVJOBA    OUTQ(&OUTQ) OUTQLIB(&OUTQLIB)                           
656.00 403              ADDLIBLE   LIB(ZOPRLIB)                                            
657.00 911211              RMVMSG     PGMQ(*EXT) CLEAR(*ALL)                                  
658.00 307                                                                                 
659.00 307  /* Main Menu */                                                                
660.00 307  MAINMNU:    CHGVAR     VAR(&OPTION) VALUE('   ')                               
661.00 307              SNDRCVF    RCDFMT(OPRMNU)                                          
662.00 900824                                                                                 
663.00 140918              IF         COND(&IN05 *EQ '1') THEN(CALL PGM(WJS))                 
664.00 307              IF         COND(&IN06 *EQ '1') THEN(DSPMSG QSYSOPR)                
665.00 403              IF         COND(&IN09 *EQ '1') THEN(RUNQRY QRY(DOPRLST))           
666.00 100917 /*D0245*/    IF         COND(&IN11 *EQ '1') THEN(RUNQRY QRY(BTHLOGQRY))         
667.00 307  OPTZZZ:     IF         COND(&OPTION *EQ 'ZZZ') THEN(SIGNOFF)                   
668.00 307  OPTXXX:     IF         COND(&OPTION *EQ 'XXX') THEN(RETURN)                    
669.00 307  OPTA00:     IF         COND(&OPTION *EQ 'A00') THEN(GOTO +                     
670.00 307                           CMDLBL(MENUA))                                        
671.00 307  OPTB00:     IF         COND(&OPTION *EQ 'B00') THEN(GOTO +                     
672.00 307                           CMDLBL(MENUB))                                        
673.00 307  OPTC00:     IF         COND(&OPTION *EQ 'C00') THEN(GOTO +                     
674.00 307                           CMDLBL(MENUC))                                        
675.00 307  OPTD00:     IF         COND(&OPTION *EQ 'D00') THEN(GOTO +                     
676.00 307                           CMDLBL(MENUD))                                        
677.00 307  OPTE00:     IF         COND(&OPTION *EQ 'E00') THEN(GOTO +                     
678.00 307                           CMDLBL(MENUE))                                        
679.00 307  OPTF00:     IF         COND(&OPTION *EQ 'F00') THEN(GOTO +                     
680.00 307                           CMDLBL(MENUF))                                        
681.00 307  OPTG00:     IF         COND(&OPTION *EQ 'G00') THEN(GOTO +                     
682.00 307                           CMDLBL(MENUG))                                        
683.00 307              GOTO       CMDLBL(MAINMNU)                                         
684.00 900824                                                                                 
685.00 307  /* Menu A */                                                                   
686.00 307  MENUA:      CHGVAR     VAR(&OPTION) VALUE('  ')                                
687.00 307              SNDRCVF    RCDFMT(OPRMNUA)                                         
688.00 307                                                                                 
689.00 307              IF         COND(&IN05 *EQ '1') THEN(CALL PGM(WJS))                 
690.00 307              IF         COND(&IN06 *EQ '1') THEN(DSPMSG QSYSOPR)                
691.00 403              IF         COND(&IN09 *EQ '1') THEN(RUNQRY QRY(DOPRLST))           
692.00 100917 /*D0245*/    IF         COND(&IN11 *EQ '1') THEN(RUNQRY QRY(BTHLOGQRY))         
693.00 307              IF         COND(&OPTION *EQ 'ZZZ') THEN(SIGNOFF)                   
694.00 307              IF         COND(&OPTION *EQ 'XXX') THEN(GOTO +                     
695.00 307                           CMDLBL(MAINMNU))                                      
696.00 307  OPTA01:     IF         COND(&OPTION *EQ 'A01') THEN(CALL +                     
697.00 307                           PGM(ZAUTOPAY/PACOPMNU))                               
698.00 70917 /* OPTA02:     IF         COND(&OPTION *EQ 'A02') THEN(CALL +                   
699.00 70917                           PGM(ZEXIMICBS/TFBOD))        C7258 */                 
700.00 307  OPTA03:     IF         COND(&OPTION *EQ 'A03') THEN(CALL +                     
701.00 401                           PGM(ZOPGLIB/OGOPENCL))                                
702.00 307  OPTA04:     IF         COND(&OPTION *EQ 'A04') THEN(CALL +                     
703.00 307                           PGM(ZIMMS/IMMSBODCL))                                 
704.00 1110  OPTA06:     IF         COND(&OPTION *EQ 'A06') THEN(CALL +                     
705.00 1110                           PGM(RPTLIB/RDARSMIG))                                 
706.00 10524                                                                                 
707.00 10524 /*  REFERENCE     :  CH062                                         */           
708.00 10524 /*  DESP.         :  ADD UPDATE INTER BANK RATE (A07) IN MAIN      */           
709.00 10524 /*                   OPTION A00                                    */           
710.00 10629 /*  REFERENCE     :  CH091                                         */           
711.00 10629 /*  DESP.         :  COMMENT DUE TO PGM UPIBCL IS IN LIBRARY       */           
712.00 10629 /*                   ZOPRLIB                                       */           
713.00 10629  /* OPTA07:     IF         COND(&OPTION *EQ 'A07') THEN(CALL +                  
714.00 10629                           PGM(IPROD/UPIBCL))     */                             
715.00 10629 /*  REFERENCE     :  CH091                                         */           
716.00 10629 /*  DESP.         :  CHANGE UPDATE INTER BANK RATE (A07) TO CALL   */           
717.00 10629 /*                   CL ZOPRLIB/UPIBCL                             */           
718.00 10629  OPTA07:     IF         COND(&OPTION *EQ 'A07') THEN(CALL +                     
719.00 10629                           PGM(ZOPRLIB/UPIBCL))                                  
720.00 10524                                                                                 
721.00 20828 /* C2126  Start */                                                              
722.00 20828  OPTA08:     IF         COND(&OPTION *EQ 'A08') THEN(CALL +                     
723.00 20828                           PGM(ZPAYMENT/UTPAYMENU))                              
724.00 20828 /* C2126  End */                                                                
725.00 20829                                                                                 
726.00 20829 /*  Reference     :  C2126                                         */           
727.00 20829 /*  Description   :  Add option A09 for IVR-CTI BOD PROCESSING     */           
728.00 30706 /* C3083  OPTA09:     IF         COND(&OPTION *EQ 'A09') THEN(CALL +            
729.00 30706                           PGM(ZCTILIB/CTIBODCL))   */                           
730.00 30706 /* C3083 */                                                                     
731.00 30706  OPTA09:     IF         COND(&OPTION *EQ 'A09') THEN(CALL +                     
732.00 30706                           PGM(ZCSERVICE/CTIBODCL))                              
733.00 30706 /* C3083 */                                                                     
734.00 50513                                                                                 
735.00 50513 /* C5053 */                                                                     
736.00 70809 /* C7215     IF         COND(&OPTION *EQ 'A10') THEN(CALL +                     
737.00 70809                           PGM(ZCARD/ACQPSTCL))                    */            
738.00 80424 /* C8048     IF         COND(&OPTION *EQ 'A10') THEN(CALL +                     
739.00 80424                           PGM(ZLMERPRO/ACQPSTCL))                 */            
740.00 80424  OPTA10:     IF         COND(&OPTION *EQ 'A10') THEN(DO) /* C8048 */            
741.00 160419 /* D6111     CALL       PGM(ZLMERPRO/ACQPSTCL)              C8048 */            
742.00 160419 /* D6111     CALL       PGM(ZLCREDIT/CRDINTGLCL)            C8048 */            
743.00 160513 /* D6111 */  CALL       PGM(ZLMERPRO/VMCHPRSCL)                                 
744.00 80424              ENDDO                                       /* C8048 */            
745.00 50513 /* C5053 */                                                                     
746.00 10524                                                                                 
747.00 70105 /* C7004 */                                                                     
748.00 70103  OPTA11:     IF         COND(&OPTION *EQ 'A11') THEN(CALL +                     
749.00 70103                           PGM(ZLPOST/UTJETPCL))                                 
750.00 70103  OPTA12:     IF         COND(&OPTION *EQ 'A12') THEN(CALL +                     
751.00 70103                           PGM(ZLATMLIB/UPD9010CL))                              
752.00 70105 /* C7004 */                                                                     
753.00 70103                                                                                 
754.00 70312 /* C7073 - CUP POS merchant settlement posting */                               
755.00 160513 /* OPTA13:     IF         COND(&OPTION *EQ 'A13') THEN(CALL +                   
756.00 160513                           PGM(ZLMERPRO/CUPPSTCL))           D6111 */            
757.00 160513  OPTA13:     IF         COND(&OPTION *EQ 'A13') THEN(CALL +                     
758.00 160513                           PGM(ZLMERPRO/CMCHPRSCL))       /* D6111 */            
759.00 70312 /* C7073 */                                                                     
760.00 70312                                                                                 
761.00 80115 /* C8009 - Process credit card embossing file */                                
762.00 80115  OPTA14:     IF         COND(&OPTION *EQ 'A14') THEN(CALL +                     
763.00 80115                           PGM(ZCLNKFIL/PRSEMBCL))                               
764.00 80115 /* C8009 */                                                                     
765.00 80919                                                                                 
766.00 90113 /* C8210 - Process credit card Cash-In plan posting. */                         
767.00 160419  OPTA15: /*  IF         COND(&OPTION *EQ 'A15') THEN(CALL +                     
768.00 160419                           PGM(ZLFREEINT/GENCSHINCL))                    D6111 */
769.00 160419 /* D6111 */  IF         COND(&OPTION *EQ 'A15') THEN(DO)                        
770.00 160419 /* D6111 */  CALL       PGM(ZLCREDIT/CRDINTGLCL)                                
771.00 160419 /* D6111 */  CALL       PGM(ZLFREEINT/GENCSHINCL)                               
772.00 160419 /* D6111 */  ENDDO                                                              
773.00 80919 /* C8210 */                                                                     
774.00 90113                                                                                 
775.00 90113 /* C8346 - Process credit card Cash Reward posting. */                          
776.00 90113  OPTA16:     IF         COND(&OPTION *EQ 'A16') THEN(CALL +                     
777.00 90113                           PGM(ZLCREDIT/PSTCSHRWD))                              
778.00 90113 /* C8346 */                                                                     
779.00 80115                                                                                 
780.00 91112 /* C9355 - Process ATM IBT SETTLEMENT MENU  */                                  
781.00 91009  OPTA17:     IF         COND(&OPTION *EQ 'A17') THEN(CALL +                     
782.00 91009                           PGM(ZATMLIB/IBTMNUCL))                                
783.00 121017                                                                                 
784.00 121017 /* D2245 - Generate Credit card Loan Payment */                                 
785.00 121017  OPTA18:     IF         COND(&OPTION *EQ 'A18') THEN(CALL +                     
786.00 121018                           PGM(ZNOTELIB/CRCPINFCL))                              
787.00 140527                                                                                 
788.00 140627 /* Reference   : D4202 */                                                       
789.00 140527 /* Description : ADD OPTION A19 TO FSS ATM IMPORT FILE                        */
790.00 140527  OPTA19:     IF         COND(&OPTION *EQ 'A19') THEN(DO)                        
791.00 140527              CALL       PGM(ZPAYMENT/FSSATMCL)                                  
792.00 140527              ENDDO                                                              
793.00 151126                                                                                 
794.00 151126 /* Reference   : D5382 */                                                       
795.00 151126 /* Description : Add option A20 Macau Pass Top Up settlement posting.         */
796.00 151126  OPTA20:     IF         COND(&OPTION *EQ 'A20') THEN(DO)                        
797.00 151126              CALL       PGM(ZLCCAUT/PST_PAYCL)                                  
798.00 151126              ENDDO                                                              
799.00 151130                                                                                 
800.00 151130 /* Reference   : D5420 */                                                       
801.00 151130 /* Description : Add option A21 eChannels file exchange with DSB.             */
802.00 151130  OPTA21:     IF         COND(&OPTION *EQ 'A21') THEN(DO)                        
803.00 151130              CALL       PGM(ZCSERVICE/EBFLEXCL)                                 
804.00 151130              ENDDO                                                              
805.00 160106                                                                                 
806.00 160106 /* Reference   : D5421 */                                                       
807.00 160106 /* Description : ADD A22 FOR DOWNLOAD FILE OF DSF TAX REFUND DATA             */
808.00 160106  OPTA22:     IF         COND(&OPTION *EQ 'A22') THEN(DO)                        
809.00 160106              CALL       PGM(ZDSFTAX/DSFSDCL)                                    
810.00 160106              ENDDO                                                              
811.00 91009 /* C8346 */                                                                     
812.00 307              GOTO       CMDLBL(MENUA)                                           
813.00 941109                                                                                 
814.00 307  /* Menu B */                                                                   
815.00 307  MENUB:      CHGVAR     VAR(&OPTION) VALUE('  ')                                
816.00 307              SNDRCVF    RCDFMT(OPRMNUB)                                         
817.00 307                                                                                 
818.00 307              IF         COND(&IN05 *EQ '1') THEN(CALL PGM(WJS))                 
819.00 307              IF         COND(&IN06 *EQ '1') THEN(DSPMSG QSYSOPR)                
820.00 403              IF         COND(&IN09 *EQ '1') THEN(RUNQRY QRY(DOPRLST))           
821.00 100917 /*D0245*/    IF         COND(&IN11 *EQ '1') THEN(RUNQRY QRY(BTHLOGQRY))         
822.00 307              IF         COND(&OPTION *EQ 'ZZZ') THEN(SIGNOFF)                   
823.00 307              IF         COND(&OPTION *EQ 'XXX') THEN(GOTO +                     
824.00 307                           CMDLBL(MAINMNU))                                      
825.00 70312                                                                                 
826.00 70312 /* C7073 - CUP merchant setup. */                                               
827.00 70312  OPTB0A:     IF         COND(&OPTION *EQ 'B0A') THEN(CALL +                     
828.00 70312                           PGM(ZCLNKFIL/GENPM009CL))                             
829.00 70312 /* C7073 */                                                                     
830.00 120914                                                                                 
831.00 120914 /* D2206 - CUP merchant setup. */                                               
832.00 120914  OPTB0B:     IF         COND(&OPTION *EQ 'B0B') THEN(CALL +                     
833.00 120914                           PGM(ZLMERPRO/AMLMCHCL))                               
834.00 120914 /* D2206 */                                                                     
835.00 70312                                                                                 
836.00 10718 /*  REFERENCE     :  CH106                                         */           
837.00 10718 /*  DESP.         :  ADD OPRTION B01 FOR STATIONARY POSTING        */           
838.00 50531 /*  REFERENCE     :  C5073 (CHG-073-05)                            */           
839.00 50531 /*  CHANGES       :  CHANGE OPTION 'B01' TO CALL ICBSTOOLS/STASEL  */           
840.00 50531 /*                   DUE TO ADD POSTING FOR MAINTANENCE AND SERV.  */           
841.00 50531 /* C5073 OPTB01:     IF         COND(&OPTION *EQ 'B01') THEN(CALL +             
842.00 50531                           PGM(ICBSTOOLS/CPOSTSTA))                  */          
843.00 50531  /* C5073 */                                                                    
844.00 50531  OPTB01:     IF         COND(&OPTION *EQ 'B01') THEN(CALL +                     
845.00 50531                           PGM(ICBSTOOLS/STASEL))                                
846.00 10718                                                                                 
847.00 307  OPTB02:     IF         COND(&OPTION *EQ 'B02') THEN(CALL +                     
848.00 830                           PGM(IPROD/CHQRPTCL))                                  
849.00 40202 /*  Reference : C4010                                                  */       
850.00 40202 /*  Reason    : Add option B03 for current & saving low balance charge */       
851.00 40202  OPTB03:     IF         COND(&OPTION *EQ 'B03') THEN(CALL +                     
852.00 40202                           PGM(ZACCTAVG/PLOWBAL))                                
853.00 307  OPTB04:     IF         COND(&OPTION *EQ 'B04') THEN(CALL +                     
854.00 403                           PGM(ZAUTOPAY/ZAUTOEOD))                               
855.00 307  OPTB05:     IF         COND(&OPTION *EQ 'B05') THEN(CALL +                     
856.00 401                           PGM(ZOPGLIB/OGCLOSECL))                               
857.00 20514 /*  REFERENCE     : C2075                                          */           
858.00 20514 /*  DESP.         : ADD OPTION B06 FOR CLEARING CHEQUE END-OF-DAY  */           
859.00 20514  OPTB06:     IF         COND(&OPTION *EQ 'B06') THEN(CALL +                     
860.00 20514                           PGM(ZCHQLIB/CHQEODCL))                     /* C2075 */
861.00 307  OPTB07:     IF         COND(&OPTION *EQ 'B07') THEN(CALL +                     
862.00 307                           PGM(ZEXOD/ODCSMCL))                                   
863.00 307  OPTB08:     IF         COND(&OPTION *EQ 'B08') THEN(CALL +                     
864.00 307                           PGM(ZCARCOMM/CCEODCL))                                
865.00 70917  /* OPTB09:     IF         COND(&OPTION *EQ 'B09') THEN(CALL +                  
866.00 70917                           PGM(ZEXIMICBS/TFEOD))      C7258 */                   
867.00 150225                                                                                 
868.00 150225 /*  Reference  : D4449 (CHG-449-14)                                */           
869.00 150225 /*  Description: Add option B09 to send VPEP request file          */           
870.00 150225  OPTB09:     IF         COND(&OPTION *EQ 'B09') THEN(CALL +                     
871.00 150225                           PGM(ZLCARDPTS/PEP_SNDCL))                             
872.00 150225                                                                                 
873.00 307  OPTB10:     IF         COND(&OPTION *EQ 'B10') THEN(CALL +                     
874.00 307                           PGM(ZCSMLIB/OCSMMNU))                                 
875.00 50825                                                                                 
876.00 50901 /*  Reference     :  C5135 (CHG-135-05)                            */           
877.00 50825 /*  Description   :  Add option B1B for CALLING STOCK PROCESSING   */           
878.00 50825 /*                   MENU                                          */           
879.00 50825  OPTB1B:     IF         COND(&OPTION *EQ 'B1B') THEN(CALL +                     
880.00 50825                           PGM(ZSTOCK/STKMNUCL))                                 
881.00 50825                                                                                 
882.00 50825                                                                                 
883.00 70105 /* C7004  OPTB11:     IF         COND(&OPTION *EQ 'B11') THEN(CALL +            
884.00 70103                           PGM(ZCARD/AUTPAYCL))                   */             
885.00 70103  OPTB11:     IF         COND(&OPTION *EQ 'B11') THEN(CALL +                     
886.00 70103                           PGM(ZLCCAUT/AUTPAYCL))                                
887.00 30713                                                                                 
888.00 30713 /*  Reference     :  CXXXX (CHG-XXX-XX)                            */           
889.00 30713 /*  Description   :  Add option B1A for STANING ORDER EOD          */           
890.00 30713 /*                   PROCESSING                                    */           
891.00 30713  OPTB1A:     IF         COND(&OPTION *EQ 'B1A') THEN(CALL +                     
892.00 30713                           PGM(ZSTANDO/ITOEOD))                                  
893.00 30713                                                                                 
894.00 20408 /*  REFERENCE : C2054                                                         */
895.00 20408 /*  DESP.     : ADD OPTION B12 FOR SAVING+ 8 TO 8 INSURANCE POSTING           */
896.00 20408  OPTB12:     IF         COND(&OPTION *EQ 'B12') THEN(CALL +                     
897.00 20408                           PGM(ZSAVPLUS/INS8CL))                      /* C2054 */
898.00 21031 /*  REFERENCE : C2140                                                         */
899.00 21031 /*  DESP.     : Add option B13, B14.                                          */
900.00 21031  OPTB13:     IF         COND(&OPTION *EQ 'B13') THEN(CALL +                     
901.00 21031                           PGM(ZCARD/RCVFIL1CL))                      /* C2140 */
902.00 21031  OPTB14:     IF         COND(&OPTION *EQ 'B14') THEN(CALL +                     
903.00 70105                           PGM(ZCARD/GENFIGL))                                   
904.00 30428 /******************************************************************************/
905.00 30428 /*  Ref. : C2111                                                              */
906.00 30428 /*  Desp.: Add option B15 - Auto capturing loan repayment posting.            */
907.00 30428 /******************************************************************************/
908.00 30428  OPTB15:     IF         COND(&OPTION *EQ 'B15') THEN(CALL +                     
909.00 30428                           PGM(ZNOTELIB/GLNAUTOPAY))                  /* C2111 */
909.01 161230 /******************************************************************************/
909.02 161230 /*  Ref. : D6419                                                              */
909.03 161230 /*  Desp.: Add option B16 - To process VPEP response file from Agoda.         */
909.04 161230 /******************************************************************************/
909.05 161230  OPTB16:     IF         COND(&OPTION *EQ 'B16') THEN(CALL +                     
909.06 161230                           PGM(ZLCARDPTS/AGD_RCVCL))                  /* D6419 */
910.00 307              GOTO       CMDLBL(MENUB)                                           
911.00 307                                                                                 
912.00 307  /* Menu C */                                                                   
913.00 307  MENUC:      CHGVAR     VAR(&OPTION) VALUE('  ')                                
914.00 307              SNDRCVF    RCDFMT(OPRMNUC)                                         
915.00 307                                                                                 
916.00 307              IF         COND(&IN05 *EQ '1') THEN(CALL PGM(WJS))                 
917.00 307              IF         COND(&IN06 *EQ '1') THEN(DSPMSG QSYSOPR)                
918.00 403              IF         COND(&IN09 *EQ '1') THEN(RUNQRY QRY(DOPRLST))           
919.00 100917 /*D0245*/    IF         COND(&IN11 *EQ '1') THEN(RUNQRY QRY(BTHLOGQRY))         
920.00 307              IF         COND(&OPTION *EQ 'ZZZ') THEN(SIGNOFF)                   
921.00 307              IF         COND(&OPTION *EQ 'XXX') THEN(GOTO +                     
922.00 307                           CMDLBL(MAINMNU))                                      
923.00 61024  OPTCLK:     IF         COND(&OPTION *EQ 'CLK') THEN(CALL +                     
924.00 61024                           PGM(ZCLNKFIL/CLNKOUTCL))           /* CXXXX */        
925.00 308  OPTC02:     IF         COND(&OPTION *EQ 'C02') THEN(CALL +                     
926.00 308                           PGM(ZCARD/SNDPAYCL))                                  
927.00 308  OPTC03:     IF         COND(&OPTION *EQ 'C03') THEN(CALL +                     
928.00 307                           PGM(ZATMLIB/ATMMNU))                                  
929.00 20909 /* Ref. : CHG-126-02 */                                                         
930.00 20909 /*  OPTC04:     IF         COND(&OPTION *EQ 'C04') THEN(CALL +                  
931.00 20909                           PGM(ZATMLIB/UTYEODCL))                     */         
932.00 20909  OPTC04:     IF         COND(&OPTION *EQ 'C04') THEN(CALL +                     
933.00 20909                           PGM(ZPAYMENT/UTEODCL))             /* C2126 */        
934.00 20909                                                                                 
935.00 31124 /* REF. CHG-142-03 (C3142) */                                                   
936.00 31124 /*  OPTC05:     IF         COND(&OPTION *EQ 'C05') THEN(DO)     /* CHG083 */    
937.00 31124 /*              CALL       PGM(ZATMLIB/ATMEODCL)                /* CHG083 */    
938.00 31124 /*              ENDDO                                           /* CHG083 */    
939.00 31124                                                                                 
940.00 70810 /* REF: CHG-227-07 */                                                           
941.00 70917 /*  OPTC05:     IF         COND(&OPTION *EQ 'C05') THEN(CALL +                  
942.00 70917                           PGM(ZTADCS/TADCSEODB))               C7258 */         
943.00 70917 /* REF: CHG-258-07 */                                                           
944.00 70917  OPTC5A:     IF         COND(&OPTION *EQ 'C5A') THEN(CALL +                     
945.00 70917                           PGM(ZTADCS/TADCSEODB))                                
946.00 70917 /* REF: CHG-258-07 */                                                           
947.00 70917  OPTC5B:     IF         COND(&OPTION *EQ 'C5B') THEN(CALL +                     
948.00 70917                           PGM(ZTADCS/TADCSEODA))                                
949.00 70810                                                                                 
950.00 308  OPTC06:     IF         COND(&OPTION *EQ 'C06') THEN(CALL +                     
951.00 307                           PGM(ZIMMS/IMMSEODCL))                                 
952.00 70412 /*  REFERENCE   : C7106 (CHG-106-07)                               */           
953.00 70412 /*  CHANGED DATE: 12-Apr-2007                                      */           
954.00 70412 /*  REASON      : Remove option 'C07' due to ICCS retire           */           
955.00 70412  /* OPTC07:     IF         COND(&OPTION *EQ 'C07') THEN(CALL +                  
956.00 70412                           PGM(ZCARD/RCVPAYCL))                    */            
957.00 11115  OPTC08:     IF         COND(&OPTION *EQ 'C08') THEN(CALL +                     
958.00 11115                           PGM(ZCARD/CARDGLCL))                                  
959.00 11114  /* ----------------------------------------------------------------------- */  
960.00 11114  /* Ref. no. : CH160                                                        */  
961.00 11115  /* Add a call to free interest install TXN posting                         */  
962.00 11114  /* ----------------------------------------------------------------------- */  
963.00 21031 /*  REFERENCE : C2140                                                       */  
964.00 21031 /*  DESP.     : Option C09 replaced by B14.                                 */  
965.00 21031 /* C2140     IF         COND(&OPTION *EQ 'C09') THEN(DO)              CH160 */  
966.00 21031 /* C2140     CALL       PGM(ZCARD/GENFIGL)                            CH160 */  
967.00 21031 /* C2140     ENDDO                                                          */  
968.00 11115  /*TC09:     IF         COND(&OPTION *EQ 'C09') THEN(CALL +                     
969.00 11115                           PGM(I700BCM/ACCLOGEOD))                     CH160 */  
970.00 11115  /*TC10:     IF         COND(&OPTION *EQ 'C10') THEN(CALL +                     
971.00 11115                           PGM(ZDORMANT/DORMCL))                       CH160 */  
972.00 91009  /* OPTC10:     IF         COND(&OPTION *EQ 'C10') THEN(CALL +                  
973.00 91112                           PGM(I700BCM/ACCLOGEOD))                   C9355 */    
974.00 91009                                                                                 
975.00 91112 /* REF: CHG-355-09 */                                                           
976.00 91009  OPTC09:     IF         COND(&OPTION *EQ 'C09') THEN(CALL +                     
977.00 91009                           PGM(ZATMLIB/IBTEODCL))                                
978.00 11115  OPTC11:     IF         COND(&OPTION *EQ 'C11') THEN(CALL +                     
979.00 11115                           PGM(ZDORMANT/DORMCL))                    /* CH160 */  
980.00 20829 /*  Reference     :  C2126                                         */           
981.00 20829 /*  Description   :  Add option C12 for IVR-CTI EOD PROCESSING     */           
982.00 30706 /* C3083  OPTC12:     IF         COND(&OPTION *EQ 'C12') THEN(CALL +            
983.00 30706                           PGM(ZCTILIB/CTIEODCL))   */                           
984.00 30706 /* C3083 */                                                                     
985.00 60714  /* C6206    IF         COND(&OPTION *EQ 'C12') THEN(CALL +                     
986.00 60714                           PGM(ZCSERVICE/CTIEODCL))              */              
987.00 30706 /* C3083 */                                                                     
988.00 60714 /* C6206 */                                                                     
989.00 60714  OPTC12:     IF         COND(&OPTION *EQ 'C12') THEN(CALL +                     
990.00 60714                           PGM(ZCSERVICE/CTIEODSL))                              
991.00 60714 /* C6206 */                                                                     
992.00 20829                                                                                 
993.00 20829                                                                                 
994.00 1129  OPTC70:     IF         COND(&OPTION *EQ 'C70') THEN(CALL +                     
995.00 401                           PGM(IPROD/RPTBPCOMB))                                 
996.00 1129  OPTC71:     IF         COND(&OPTION *EQ 'C71') THEN(CALL +                     
997.00 825                           PGM(YLOGLIB/BKHSTDTA1))                               
998.00 1129  OPTC72:     IF         COND(&OPTION *EQ 'C72') THEN(CALL +                     
999.00 824                           PGM(ZOPRLIB/BEFSAVCL))                                
1000.00 831  OPTC98:     IF         COND(&OPTION *EQ 'C98') THEN(CALL +                     
1001.00 829                           PGM(BCMGPL/ICBSCTL) PARM('S'))                        
1002.00 307              GOTO       CMDLBL(MENUC)                                           
1003.00 307                                                                                 
1004.00 307  /* Menu D */                                                                   
1005.00 307  MENUD:      CHGVAR     VAR(&OPTION) VALUE('  ')                                
1006.00 307              SNDRCVF    RCDFMT(OPRMNUD)                                         
1007.00 307                                                                                 
1008.00 307              IF         COND(&IN05 *EQ '1') THEN(CALL PGM(WJS))                 
1009.00 307              IF         COND(&IN06 *EQ '1') THEN(DSPMSG QSYSOPR)                
1010.00 403              IF         COND(&IN09 *EQ '1') THEN(RUNQRY QRY(DOPRLST))           
1011.00 100917 /*D0245*/    IF         COND(&IN11 *EQ '1') THEN(RUNQRY QRY(BTHLOGQRY))         
1012.00 307              IF         COND(&OPTION *EQ 'ZZZ') THEN(SIGNOFF)                   
1013.00 307              IF         COND(&OPTION *EQ 'XXX') THEN(GOTO +                     
1014.00 307                           CMDLBL(MAINMNU))                                      
1015.00 70105  OPTDL1:     IF         COND(&OPTION *EQ 'DL1') THEN(CALL +                     
1016.00 70105                           PGM(ZCLNKFIL/CLNKIN1CL))            /* C7004 */       
1017.00 70105  OPTDL2:     IF         COND(&OPTION *EQ 'DL2') THEN(CALL +                     
1018.00 70105                           PGM(ZCLNKFIL/CLNKIN2CL))            /* C7004 */       
1019.00 401  OPTD01:     IF         COND(&OPTION *EQ 'D01') THEN(CALL +                     
1020.00 401                           PGM(ZIMMS/MAINGENFIL))                                
1021.00 61110  /*C6278 OPTD02:     IF         COND(&OPTION *EQ 'D02') THEN(CALL +             
1022.00 61110                           PGM(ZCD/RCVBCPCL))       */                           
1023.00 61110  /*C6278 OPTD03:     IF         COND(&OPTION *EQ 'D03') THEN(CALL +             
1024.00 61110                           PGM(ZCD/SNDFILCL))   */                               
1025.00 31101 /*  Reference     :  C3158 (CHG-158-03)                            */           
1026.00 31101 /*  Description   :  Add option D3A for 1 % STAMP DUTY ON LOAN     */           
1027.00 31101 /*                   LATE FEE                                      */           
1028.00 50102 /*  Reference     :  C4219 (CHG-219-04)                            */           
1029.00 50102 /*  Description   :  SUSPENSE OPTION D3A FOR YEAR 2005             */           
1030.00 50102 /*  OPTD3A:     IF         COND(&OPTION *EQ 'D3A') THEN(CALL +                  
1031.00 50102                           PGM(ZNOTELIB/PLNSDCALC))           */                 
1032.00 31101 /*  C3158 END                                                      */           
1033.00 41217                                                                                 
1034.00 70301 /*  REFERENCE   : C7058 (CHG-058-07)                               */           
1035.00 70301 /*  REASON      : ADD OPTION 'DS1' FOR DAILY BACKUP OF BASEII      */           
1036.00 70301 /*                DATA                                             */           
1037.00 70301  OPTDS1:     IF         COND(&OPTION *EQ 'DS1') THEN(CALL +                     
1038.00 70301                           PGM(ZOPRLIB/BASEIISAV))                               
1039.00 70301                                                                                 
1040.00 41217 /*  Reference     :  C4215 (CHG-215-04)                            */           
1041.00 41217 /*  Description   :  Add option D3B for XIRR Calculation Module    */           
1042.00 41217  OPTD3B:     IF         COND(&OPTION *EQ 'D3B') THEN(CALL +                     
1043.00 41217                           PGM(I700BCM/XIRRCL))                                  
1044.00 41217 /*  C4215 END                                                      */           
1045.00 41217                                                                                 
1046.00 100803  /*EDW OPTD04:     IF         COND(&OPTION *EQ 'D04') THEN(CALL +               
1047.00 100803                           PGM(ZCD/SNDBCPCL))          */                        
1048.00 401  OPTD05:     IF         COND(&OPTION *EQ 'D05') THEN(CALL +                     
1049.00 401                           PGM(ZIMMS/MAINGLPST))                                 
1050.00 20130  /*********************************************************************/        
1051.00 20503  /*S2001  Change D06 for collateral posting and the original D06 */             
1052.00 20130  /*       changed to D07 */                                                     
1053.00 20130  /* OPTD06:     IF         COND(&OPTION *EQ 'D06') THEN(CALL +                  
1054.00 20130                           PGM(ZCARD/UPCARDCL))    */                            
1055.00 20130     OPTD06:     IF         COND(&OPTION *EQ 'D06') THEN(CALL +                  
1056.00 20130                           PGM(ZCOLPOST/COLPOSTEOD))                             
1057.00 20503                                                                                 
1058.00 20503                                                                                 
1059.00 20503  /*********************************************************************/        
1060.00 20503  /*C2073  Change D07 for calling CL IPROD/HOLDCL                      */        
1061.00 20503  /* OPTD07:     IF         COND(&OPTION *EQ 'D07') THEN(CALL +        */        
1062.00 20503  /*                       PGM(ZCARD/UPCARDCL))                        */        
1063.00 100803  OPTD07:     IF         COND(&OPTION *EQ 'D07') THEN(CALL +                     
1064.00 100803                           PGM(IPROD/HOLDPRECL))                                 
1065.00 20130  /*********************************************************************/        
1066.00 61020  /* C6292 START */                                                              
1067.00 61020  OPTD69:     IF         COND(&OPTION *EQ 'D69') THEN(CALL +                     
1068.00 61020                           PGM(IPROD/RPTAPP1C))                                  
1069.00 61020  /* OPTD70:     IF         COND(&OPTION *EQ 'D70') THEN(CALL +                  
1070.00 61020                           PGM(IPROD/RPTAPCOMB))                 */              
1071.00 90713  /*C9231 OPTD70:     IF         COND(&OPTION *EQ 'D70') THEN(CALL +             
1072.00 90713                           PGM(IPROD/RPTAPP2))       */                          
1073.00 90713  OPTD70:     IF         COND(&OPTION *EQ 'D70') THEN(CALL +                     
1074.00 90713  /* C9231 */              PGM(IPROD/RPTAPP2C))                                  
1075.00 61020  /* C6292 END   */                                                              
1076.00 1129  OPTD71:     IF         COND(&OPTION *EQ 'D71') THEN(CALL +                     
1077.00 825                           PGM(YLOGLIB/BKHSTDTA2))                               
1078.00 1129  OPTD72:     IF         COND(&OPTION *EQ 'D72') THEN(CALL +                     
1079.00 824                           PGM(ZOPRLIB/AFTSAVCL))                                
1080.00 20119                                                                                 
1081.00 20119 /*  REFERENCE     :  C2009                                         */           
1082.00 20119 /*  DESP.         :  ADD OPTION D73 FOR SYSTEM AND IH-HOUSE        */           
1083.00 20119 /*                   HISTORICAL DATA BACKUP                        */           
1084.00 20119  OPTD73:     IF         COND(&OPTION *EQ 'D73') THEN(CALL +                     
1085.00 20119                           PGM(ZBACKUP/IHBCKMNU))                                
1086.00 20119                                                                                 
1087.00 20119                                                                                 
1088.00 829  OPTD98:     IF         COND(&OPTION *EQ 'D98') THEN(CALL +                     
1089.00 829                           PGM(BCMGPL/ICBSCTL) PARM('R'))                        
1090.00 824  OPTD99:     IF         COND(&OPTION *EQ 'D99') THEN(CALL +                     
1091.00 405                           PGM(ZOPRLIB/FINALEOD))                                
1092.00 307              GOTO       CMDLBL(MENUD)                                           
1093.00 307                                                                                 
1094.00 307  /* Menu E */                                                                   
1095.00 307  MENUE:      CHGVAR     VAR(&OPTION) VALUE('  ')                                
1096.00 307              SNDRCVF    RCDFMT(OPRMNUE)                                         
1097.00 307                                                                                 
1098.00 307              IF         COND(&IN05 *EQ '1') THEN(CALL PGM(WJS))                 
1099.00 307              IF         COND(&IN06 *EQ '1') THEN(DSPMSG QSYSOPR)                
1100.00 403              IF         COND(&IN09 *EQ '1') THEN(RUNQRY QRY(DOPRLST))           
1101.00 100917 /*D0245*/    IF         COND(&IN11 *EQ '1') THEN(RUNQRY QRY(BTHLOGQRY))         
1102.00 307              IF         COND(&OPTION *EQ 'ZZZ') THEN(SIGNOFF)                   
1103.00 307              IF         COND(&OPTION *EQ 'XXX') THEN(GOTO +                     
1104.00 307                           CMDLBL(MAINMNU))                                      
1105.00 307  OPTE01:     IF         COND(&OPTION *EQ 'E01') THEN(CALL +                     
1106.00 307                           PGM(IEOM/BOMCL))                                      
1107.00 21219  /* C2135    IF         COND(&OPTION *EQ 'E02') THEN(CALL +                     
1108.00 21219                           PGM(IPROD/FDSTMNU))                              */   
1109.00 21219  OPTE02:     IF         COND(&OPTION *EQ 'E02') THEN(CALL +                     
1110.00 21219                           PGM(ZTMLIB/FDSTMNU))                    /* C2135 */   
1111.00 307  OPTE03:     IF         COND(&OPTION *EQ 'E03') THEN(CALL +                     
1112.00 403                           PGM(ZSAVPLUS/FLEXCL))                                 
1113.00 403  OPTE04:     IF         COND(&OPTION *EQ 'E04') THEN(CALL +                     
1114.00 403                           PGM(ZSAVPLUS/CSMINS))                                 
1115.00 403  OPTE05:     IF         COND(&OPTION *EQ 'E05') THEN(CALL +                     
1116.00 403                           PGM(ZAMCMLIB/AMCMNU))                                 
1117.00 20625   /* ------------------------------------------------------------ */            
1118.00 20625   /* Ref. no. : C2051                                             */            
1119.00 20625   /* Add an option E06 for current A/C low balance charge         */            
1120.00 20625   /* ------------------------------------------------------------ */            
1121.00 20625  OPTE06:     IF         COND(&OPTION *EQ 'E06') THEN(CALL +                     
1122.00 40202                           PGM(ZACCTAVG/CAVGBAL))                   /* C4010 */  
1123.00 40202  /* C4010                 PGM(IPROD/CCALBAL))                         C2051 */  
1124.00 50110                                                                                 
1125.00 50110   /* ------------------------------------------------------------ */            
1126.00 50110   /* Ref. no. : C5007                                             */            
1127.00 50110   /* Add an option E07 for dormant account listing                */            
1128.00 50110   /* ------------------------------------------------------------ */            
1129.00 50110  OPTE07:     IF         COND(&OPTION *EQ 'E07') THEN(CALL +                     
1130.00 50110                           PGM(ZDORMANT/DORRPTCL))                  /* C5007 */  
1131.00 50110                                                                                 
1132.00 90320   /* ------------------------------------------------------------ */            
1133.00 90320   /* Ref. no. : C9010                                             */            
1134.00 90320   /* Add an option E08 for doraemon saving plan                   */            
1135.00 90320   /* ------------------------------------------------------------ */            
1136.00 110318  /* D1084 OPTE08:  IF         COND(&OPTION *EQ 'E08') THEN(CALL + */            
1137.00 110318  /*                      PGM(ZSAVPLAN/CARTBOMCL))                 */            
1138.00 90320                                                                                 
1139.00 90916   /* ------------------------------------------------------------ */            
1140.00 90929   /* Ref. no. : C9304                                             */            
1141.00 90916   /* Add an option E09 for teleBCM stock txn cash rebate          */            
1142.00 90916   /* ------------------------------------------------------------ */            
1143.00 90916  OPTE09:     IF         COND(&OPTION *EQ 'E09') THEN(CALL +                     
1144.00 90916                           PGM(ZISTOCK/IREBMNUCL))                               
1145.00 90916                                                                                 
1146.00 100721   /* ------------------------------------------------------------ */            
1147.00 100721   /* Ref. no. : D0180                                             */            
1148.00 100721   /* Add an option E10 for Maxsave monthly Bonus Interest         */            
1149.00 100721   /* ------------------------------------------------------------ */            
1150.00 100721  OPTE10:     IF         COND(&OPTION *EQ 'E10') THEN(CALL +                     
1151.00 100721                           PGM(ZSAVPLAN/CALPSTCL))                               
1152.00 100721                                                                                 
1153.00 120614   /* ------------------------------------------------------------ */            
1154.00 120614   /* REF. NO. : D2063                                             */            
1155.00 120614   /* ADD AN OPTION E11 FOR NEW SMARTSALAR CREDIT INTEREST         */            
1156.00 120614   /* ------------------------------------------------------------ */            
1157.00 120614  OPTE11:     IF         COND(&OPTION *EQ 'E11') THEN(CALL +                     
1158.00 120614                           PGM(ZEXOD/SMTINTCL))                                  
1159.00 120614                                                                                 
1160.00 121127  /* ------------------------------------------------------------ */             
1161.00 121127  /* REF. NO. : D2299                                             */             
1162.00 121127  /* ADD AN OPTION E12 FOR FLEXIBLE STEP-UP DEPOSIT PROCESSING    */             
1163.00 121127  /* ------------------------------------------------------------ */             
1164.00 121127 OPTE12:     IF         COND(&OPTION *EQ 'E12') THEN(CALL +                      
1165.00 121127                          PGM(ZSAVPLAN/FSDINTCL))                                
1166.00 140723                                                                                 
1167.00 140723  /* ------------------------------------------------------------------- */      
1168.00 140723  /* REF. NO. : D4269                                                    */      
1169.00 140723  /* ADD AN OPTION E13 FOR CREDIT CARD AUTOPAY FREE SPENDING LIMIT OFFER */      
1170.00 140723  /* ------------------------------------------------------------------- */      
1171.00 140723 OPTE13:     IF         COND(&OPTION *EQ 'E13') THEN(CALL +                      
1172.00 140723                          PGM(ZLCCAUT/OFR_SPNDCL))                               
1173.00 121127                                                                                 
1174.00 140918  /* ------------------------------------------------------------------- */      
1175.00 140919  /* REF. NO. : D4223                                                    */      
1176.00 140919  /* ADD AN OPTION E14 FOR EMPLOYER CAMPAIGN                             */      
1177.00 140918  /* ------------------------------------------------------------------- */      
1178.00 140918 OPTE14:     IF         COND(&OPTION *EQ 'E14') THEN(CALL +                      
1179.00 140918                          PGM(ZAUTOPAY/ACAMERMCL))                               
1180.00 307                                                                                 
1181.00 140919  /* ------------------------------------------------------------------- */      
1182.00 140919  /* REF. NO. : D4374                                                    */      
1183.00 140919  /* ADD AN OPTION E15 FOR EMPLOYEE CAMPAIGN                             */      
1184.00 140919  /* ------------------------------------------------------------------- */      
1185.00 140918 OPTE15:     IF         COND(&OPTION *EQ 'E15') THEN(CALL +                      
1186.00 140918                          PGM(ZAUTOPAY/ACAMEXTCL))                               
1187.00 140918                                                                                 
1188.00 140919  /* ------------------------------------------------------------------- */      
1189.00 140919  /* REF. NO. : D4344                                                    */      
1190.00 140919  /* ADD AN OPTION E16 FOR AUTOPAY CAMPAIGN                              */      
1191.00 140919  /* ------------------------------------------------------------------- */      
1192.00 150721  /* REF. NO. : D5237                                                    */      
1193.00 150721  /* ADD AN OPTION E16 FOR DESJ AUTOPAY CAMPAIGN                         */      
1194.00 150721  /* ------------------------------------------------------------------- */      
1195.00 150216 OPTE16:  /* IF         COND(&OPTION *EQ 'E16') THEN(CALL +                      
1196.00 150216           D5009          PGM(ZAUTOPAY/APECL))          */                       
1197.00 140918                                                                                 
1198.00 150721  /*D5237*/  IF         COND(&OPTION *EQ 'E16') THEN(CALL +                      
1199.00 150715                        PGM(ZAUTOPAY/APEDESJCL))                                 
1200.00 160617                                                                                 
1201.00 160617  /* ------------------------------------------------------------------- */      
1202.00 160617  /* REF. NO. : D6200                                                    */      
1203.00 160617  /* ADD AN OPTION E17 FOR LOAN FOR SECURITY TRADING                     */      
1204.00 160617  /* ------------------------------------------------------------------- */      
1205.00 160617 OPTE17:     IF         COND(&OPTION *EQ 'E17') THEN(CALL +                      
1206.00 160617                          PGM(ZNOTELIB/LNSTCL))                                  
1207.00 160617                                                                                 
1208.00 140918              GOTO       CMDLBL(MENUE)                                           
1209.00 140918                                                                                 
1210.00 307  /* Menu F */                                                                   
1211.00 307  MENUF:      CHGVAR     VAR(&OPTION) VALUE('  ')                                
1212.00 307              SNDRCVF    RCDFMT(OPRMNUF)                                         
1213.00 307                                                                                 
1214.00 307              IF         COND(&IN05 *EQ '1') THEN(CALL PGM(WJS))                 
1215.00 307              IF         COND(&IN06 *EQ '1') THEN(DSPMSG QSYSOPR)                
1216.00 403              IF         COND(&IN09 *EQ '1') THEN(RUNQRY QRY(DOPRLST))           
1217.00 100917 /*D0245*/    IF         COND(&IN11 *EQ '1') THEN(RUNQRY QRY(BTHLOGQRY))         
1218.00 307              IF         COND(&OPTION *EQ 'ZZZ') THEN(SIGNOFF)                   
1219.00 307              IF         COND(&OPTION *EQ 'XXX') THEN(GOTO +                     
1220.00 307                           CMDLBL(MAINMNU))                                      
1221.00 70309 /* OPTF01:     IF         COND(&OPTION *EQ 'F01') THEN(CALL +                   
1222.00 70309                           PGM(COLIB/COEOMCL))     C7052*/                       
1223.00 160907 /*D6288 OPTF01:     IF         COND(&OPTION *EQ 'F01') THEN(CALL +              
1224.00 160907                           PGM(ZCOLIB/COEOMCL)) /*C7052*/                        
1225.00 160907 /*D6288             GOTO       CMDLBL(MENUF)  */                                
1226.00 307                                                                                 
1227.00 307  /* Menu G */                                                                   
1228.00 307  MENUG:      CHGVAR     VAR(&OPTION) VALUE('  ')                                
1229.00 307              SNDRCVF    RCDFMT(OPRMNUG)                                         
1230.00 307                                                                                 
1231.00 307              IF         COND(&IN05 *EQ '1') THEN(CALL PGM(WJS))                 
1232.00 307              IF         COND(&IN06 *EQ '1') THEN(DSPMSG QSYSOPR)                
1233.00 403              IF         COND(&IN09 *EQ '1') THEN(RUNQRY QRY(DOPRLST))           
1234.00 100917 /*D0245*/    IF         COND(&IN11 *EQ '1') THEN(RUNQRY QRY(BTHLOGQRY))         
1235.00 307              IF         COND(&OPTION *EQ 'ZZZ') THEN(SIGNOFF)                   
1236.00 307              IF         COND(&OPTION *EQ 'XXX') THEN(GOTO +                     
1237.00 307                           CMDLBL(MAINMNU))                                      
1238.00 11115                                                                                 
1239.00 11115 /*  REFERENCE     :  SW042                                         */           
1240.00 11115 /*  DESP.         :  ADD OPTION G01 FOR TYPHOON PROCESSING         */           
1241.00 11115  OPTG01:     IF         COND(&OPTION *EQ 'G01') THEN(CALL +                     
1242.00 11115                           PGM(ICBSTOOLS/TYPHNCLP))                              
1243.00 40420  /* C4065    IF         COND(&OPTION *EQ 'G02') THEN(CALL +                     
1244.00 40420                           PGM(ZIASMLIB/IASMENU1))            C4065 */           
1245.00 140826  /* D4330    IF         COND(&OPTION *EQ 'G02') THEN(CALL +                     
1246.00 140826                           PGM(ZATMLIB/CUP_EMBSS))            C9370 */           
1247.00 140826  /* D4330 */ IF         COND(&OPTION *EQ 'G02') THEN(CALL +                     
1248.00 140826                           PGM(ZATMLIB/MPR_DBSMSC))                              
1249.00 307  OPTG03:     IF         COND(&OPTION *EQ 'G03') THEN(CALL +                     
1250.00 307                           PGM(ZIHMLIB/IHMNU))                                   
1251.00 40420  /* C4065    IF         COND(&OPTION *EQ 'G04') THEN(CALL +                     
1252.00 40420                           PGM(IPROD/FDSTMNU))                C4065 */           
1253.00 80704 /* Reference   : C8179         */                                               
1254.00 80527 /* Description : Add option G04 for DOWNLOAD DSEJ EDUCATION LOAN LIST     */    
1255.00 80527              IF         COND(&OPTION *EQ 'G04') THEN(CALL +                     
1256.00 80527                           PGM(ZAUTOPAY/DSEJLNCL))                               
1257.00 80527                                                                                 
1258.00 150416 /* Description : Add option G05 for NOTRKCRD Embossing file.              */    
1259.00 150422 /*D5078*/    IF         COND(&OPTION *EQ 'G05') THEN(CALL +                     
1260.00 150422 /*D5078*/                 PGM(ZCARD/GENNTCRPT))                                 
1261.00 150416                                                                                 
1262.00 824  OPTG06:     IF         COND(&OPTION *EQ 'G06') THEN(CALL +                     
1263.00 824                           PGM(ZATMLIB/ANFMNU))                                  
1264.00 824  OPTG07:     IF         COND(&OPTION *EQ 'G07') THEN(CALL +                     
1265.00 824                           PGM(ZCAREGT/OPRMNU))                                  
1266.00 80304 /* Reference   : C7370         */                                               
1267.00 80401 /* Description : Add option G08 for calling ZLCREDIT/CVMSTACL to generate     */
1268.00 80304 /*               CVM Statement Message File                                   */
1269.00 80304  OPTG08:     IF         COND(&OPTION *EQ 'G08') THEN(CALL +                     
1270.00 80401                           PGM(ZLCREDIT/CVMSTACL))         /* C7370 */           
1271.00 80415 /* Reference   : C8087         */                                               
1272.00 80415 /* Description : Add option G09 for calling ZLCREDIT/CLPDLTRCL to generate    */
1273.00 80415 /*               Credit card past due data file.                              */
1274.00 111108 /* Reference   : D1300 - Remove option G09                                    */
1275.00 111108 /* D1300     IF         COND(&OPTION *EQ 'G09') THEN(CALL +                     
1276.00 111108                           PGM(ZLCREDIT/CLPDLTRCL))      */ /* C8087 */          
1277.00 824  OPTG10:     IF         COND(&OPTION *EQ 'G10') THEN(CALL +                     
1278.00 824                           PGM(ZDSFTAX/DSFOMN))                                  
1279.00 20831                                                                                 
1280.00 20831 /*  Reference     :  C2134                                         */           
1281.00 20831 /*  Description   :  Add option G11 for DSF ONE DAY SOLUTION ON    */           
1282.00 20831 /*                              02-09-02                           */           
1283.00 21031 /*PTG11:     IF         COND(&OPTION *EQ 'G11') THEN(CALL +        */           
1284.00 21031 /*                        PGM(ZDSFTMP/DSFOMN))                     */           
1285.00 20831                                                                                 
1286.00 20831                                                                                 
1287.00 824  OPTG12:     IF         COND(&OPTION *EQ 'G12') THEN(CALL +                     
1288.00 824                           PGM(ZFECOLL/FECOMU))                                  
1289.00 40420  /* C4065    IF         COND(&OPTION *EQ 'G51') THEN(CALL +                     
1290.00 40420                           PGM(IPROD/TDREP3CL))               C4065 */           
1291.00 120223  /* OPTG52:     IF         COND(&OPTION *EQ 'G52') THEN(CALL +                  
1292.00 120223                           PGM(ZCARD/RCVCRDBAL))                         D1246 */
1293.00 120223  OPTG52:     IF         COND(&OPTION *EQ 'G52') THEN(DO)             /* D1246 */
1294.00 120223  /* D1246 */ CHGVAR     VAR(&MNUOPT) VALUE(&OPTION)                             
1295.00 120223  /* D1246 */ CHGVAR     VAR(&PROMPT) VALUE('Generate CardLinK +                 
1296.00 120223                           ex-rate file')                                        
1297.00 120223  /* D1246 */ CALL       PGM(OPTSTR) PARM(&MNUOPT &PROMPT &REPLY)                
1298.00 120223  /* D1246 */ IF         COND(&REPLY *NE 'F') THEN(CALL +                        
1299.00 120223                           PGM(ZLCREDIT/ZPEXT_CL))                               
1300.00 120223  /* D1246 */ ENDDO                                                              
1301.00 70105  /* C7004 OPTG53:     IF         COND(&OPTION *EQ 'G53') THEN(CALL +            
1302.00 70104                           PGM(ZCARD/AUTPRECL))      */                          
1303.00 70104  OPTG53:     IF         COND(&OPTION *EQ 'G53') THEN(CALL +                     
1304.00 70104                           PGM(ZLCCAUT/AUTPRECL))                                
1305.00 40420  /* C4065    IF         COND(&OPTION *EQ 'G55') THEN(CALL +                     
1306.00 40420                           PGM(ZEXIMICBS/REFSHRPT))           C4065 */           
1307.00 111129 /* Reference   : D1339                                                        */
1308.00 111129 /* Description : Add option G55 for Credit Card welcome gift cash reward post */
1309.00 111129 /* D1339 */  IF         COND(&OPTION *EQ 'G55') THEN(CALL +                     
1310.00 111129                           PGM(ZLCARDPTS/WG_CSHPGM))                             
1311.00 40420  OPTG56:     IF         COND(&OPTION *EQ 'G56') THEN(CALL +                     
1312.00 40420                           PGM(ZCHLPRT/PRTLTR))                    /* C4065 */   
1313.00 41011 /*  Reference     :  C4180                                         */           
1314.00 41011 /*  Description   :  Add option G57 for Credit Card System Purge   */           
1315.00 70809 /* C7215     IF         COND(&OPTION *EQ 'G57') THEN(CALL +                     
1316.00 70809                           PGM(ZCARD/ICCPURMN))                     */           
1317.00 80606                                                                                 
1318.00 80606 /* C8097 */  IF         COND(&OPTION *EQ 'G57') THEN(CALL +                     
1319.00 80606                           PGM(ZLCARDPTS/PRSEXTRADJ))                            
1320.00 100527                                                                                 
1321.00 110525 /* D1128 - Change option G58 for Welcome gift BP posting.                     */
1322.00 110525 /* D1128     IF         COND(&OPTION *EQ 'G58') THEN(CALL +                     
1323.00 110525                           PGM(ZATMLIB/PSTCUPCAMP))                      C9370 */
1324.00 130827 /* D3295     IF         COND(&OPTION *EQ 'G58') THEN(CALL +                     
1325.00 130827                           PGM(ZLCARDPTS/WG_BPPGM))                      D1128 */
1326.00 130827 /* D3295 */  IF         COND(&OPTION *EQ 'G58') THEN(CALL +                     
1327.00 130827                           PGM(ZLCARDPTS/WG_BPTPGM))                             
1328.00 40420                                                                                 
1329.00 70213 /* C7045 - Credit card interest G/L posting. */                                 
1330.00 80513 /* TG58:     IF         COND(&OPTION *EQ 'G58') THEN(CALL +                     
1331.00 80513                           PGM(ZLCREDIT/CRDINTGLCL))                     C8048 */
1332.00 70423                                                                                 
1333.00 70423 /* C7111 - Credit card bonus point batch adjustment. */                         
1334.00 70423  OPTG59:     IF         COND(&OPTION *EQ 'G59') THEN(CALL +                     
1335.00 70423                           PGM(ZLCARDPTS/BPSPGMCL))                              
1336.00 70213                                                                                 
1337.00 70615 /* C7179 - Credit card Contingency File Generation. */                          
1338.00 70615  OPTG60:     IF         COND(&OPTION *EQ 'G60') THEN(CALL +                     
1339.00 70615                           PGM(ZLCREDIT/GENCTNCL))                               
1340.00 70615                                                                                 
1340.01 161110 /* D6309 - Gen Cr.Card Customer SMS Opt-Out File */                             
1340.03 160921  OPTG61:     IF         COND(&OPTION *EQ 'G61') THEN(DO)                        
1340.08 161004              CHGVAR     VAR(&MNUOPT) VALUE(&OPTION)                             
1340.09 161004              CHGVAR     VAR(&PROMPT) VALUE('Gen Cr.Card +                       
1340.10 161004                         Customer SMS Opt-Out File')                             
1340.11 161004              CALL       PGM(OPTSTR) PARM(&MNUOPT &PROMPT &REPLY)                
1340.12 161004              IF         COND(&REPLY *NE 'F') THEN(DO)                           
1340.13 161004              STRPCO                                                             
1340.14 161110              STRPCCMD   PCCMD('H:\ULSOURCE\CCUPLOAD\ISMS_OPT.BAT') PAUSE(*YES)  
1340.15 161004              CALL       PGM(ZLCREDIT/ISMS_CL)                                   
1340.16 161004              ENDDO                                                              
1340.17 160921              ENDDO                                                              
1340.18 160921                                                                                 
1341.00 110330 /* Reference   : D1100         */                                               
1342.00 110330 /* Description : Add function  G70 for Step Up Deposit Posting                */
1343.00 110330  OPTG70:     IF         COND(&OPTION *EQ 'G70') THEN(CALL +                     
1344.00 110330                           PGM(ZTMLIB/SPTMMNUCL))                                
1345.00 110330                                                                                 
1346.00 90226 /* Reference   : C9073         */                                               
1347.00 90226 /* Description : Change option G99 for ODS mirroring monitor.                 */
1348.00 140114 /*  OPTG99:     IF         COND(&OPTION *EQ 'G99') THEN(DO)                   */
1349.00 140114 /*                      ADDLIBLE LIB(ODS400)                                  */
1350.00 140114 /*                      ODS400/ODSSYSSTS                                      */
1351.00 140114 /*                      RMVLIBLE LIB(ODS400)                                  */
1352.00 140114 /*           ENDDO                                                            */
1353.00 50809                                                                                 
1354.00 90226 /* Reference   : C9073         */                                               
1355.00 90226 /* Description : Change option G80 for OMS mirroring monitor.                 */
1356.00 140114 /* OPTG80:     IF         COND(&OPTION *EQ 'G80') THEN(DO)                    */
1357.00 140114 /*                      ADDLIBLE LIB(OMS400)                                  */
1358.00 140114 /*                      OMS400/OMSNETACT                                      */
1359.00 140114 /*                      RMVLIBLE LIB(OMS400)                                  */
1360.00 140114 /*           ENDDO                                                            */
1361.00 90226                                                                                 
1362.00 140117 /* Reference   : D4031         */                                               
1363.00 140117 /* Description : ADD OPTION GZZ TO CHECK PST00101                             */
1364.00 140117  OPTGZZ:     IF         COND(&OPTION *EQ 'GZZ') THEN(DO)                        
1365.00 140114              RUNQRY     QRY(ZOPRLIB/CHKPST001)                                  
1366.00 140114              ENDDO                                                              
1367.00 140527                                                                                 
1368.00 90226                                                                                 
1369.00 307              GOTO       CMDLBL(MENUG)                                           
1370.00 990329  END:        ENDPGM                                                             
