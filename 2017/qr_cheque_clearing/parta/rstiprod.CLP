1.00 40602 /*-------------------------------------------------------------------------*/   
2.00 40602 /* IMPORTANT NOTE: (2-JUN-2004)                                            */   
3.00 40602 /* The restore sequence of each file MUST be in ASCENDING ORDER.           */   
4.00 40602 /*-------------------------------------------------------------------------*/   
5.00 130114 /*-----------------------------------------------------------------*/           
6.00 130610 /*        REFERENCE NO. : CHG-206-13                               */           
7.00 130611 /*        USER ID       : BA55PGM                                  */           
8.00 130611 /*        USER NAME     : KARL HUANG                               */           
9.00 130611 /*        CHANGED DATE  : 10-JUN-2013                              */           
10.00 130327 /*        PURPOSE       : INHOUSE LIBRARY RESTORE                  */           
11.00 130206 /*-----------------------------------------------------------------*/           
12.00 130702 /*        REFERENCE NO. : CHG-211-13 (D3211)                       */           
13.00 130702 /*        USER ID       : BA55PGM                                  */           
14.00 130702 /*        USER NAME     : KARL HUANG                               */           
15.00 130702 /*        CHANGED DATE  : 19-JUN-2013                              */           
16.00 130702 /*        PURPOSE       : RESTORE PYRLINFO IN LIB: IPROD           */           
17.00 130702 /*-----------------------------------------------------------------*/           
18.00 130717 /*        REFERENCE NO. : CHG-211-13 (D3238)                       */           
19.00 130717 /*        USER ID       : BA55PGM                                  */           
20.00 130717 /*        USER NAME     : KARL HUANG                               */           
21.00 130717 /*        CHANGED DATE  : 17-JUL-2013                              */           
22.00 130717 /*        PURPOSE       : RESTORE EBKMBL IN LIB: ZCSERVICE         */           
23.00 130717 /*-----------------------------------------------------------------*/           
24.00 130725 /*        REFERENCE NO. : CHG-245-13 (D3245)                       */           
25.00 130725 /*        USER ID       : BB16PGM                                  */           
26.00 130725 /*        USER NAME     : ALVIN LEI                                */           
27.00 130725 /*        CHANGED DATE  : 25-JUL-2013                              */           
28.00 130725 /*        PURPOSE       : RESTORE TOPDPTPF IN LIB: IPROD           */           
29.00 130725 /*-----------------------------------------------------------------*/           
30.00 131023 /*        REFERENCE NO. : CHG-0358-13 (D3358)                      */           
31.00 131023 /*        USER ID       : BG09                                     */           
32.00 131023 /*        USER NAME     : ALBERT AU                                */           
33.00 131023 /*        CHANGED DATE  : 22-OCT-2013                              */           
34.00 131023 /*        PURPOSE       : RESTORE CDBLST IN LIB: IPROD             */           
35.00 131023 /*-----------------------------------------------------------------*/           
36.00 131023 /*        REFERENCE NO. : CHG-0370-13 (D3370)                      */           
37.00 131023 /*        USER ID       : BG24                                     */           
38.00 131023 /*        USER NAME     : ERIC WONG                                */           
39.00 131023 /*        CHANGED DATE  : 22-OCT-2013                              */           
40.00 131023 /*        PURPOSE       : RESTORE HITCPIA IN LIB: ZVIPLIB          */           
41.00 131023 /*-----------------------------------------------------------------*/           
42.00 131024 /*        REFERENCE NO. : CHG-0355-13 (D3355)                      */           
43.00 131024 /*        USER ID       : B422                                     */           
44.00 131024 /*        USER NAME     : ANTHONY KAM                              */           
45.00 131024 /*        CHANGED DATE  : 24-OCT-2013                              */           
46.00 131024 /*        PURPOSE       : RESTORE IRBDTXNW, IRBDTXNM IN ZISTOCK    */           
47.00 131024 /*-----------------------------------------------------------------*/           
48.00 131028 /*        REFERENCE NO. : CHG-0353-13 (D3353)                      */           
49.00 131028 /*        USER ID       : B168                                     */           
50.00 131028 /*        USER NAME     : THOMAS CHAN                              */           
51.00 131028 /*        CHANGED DATE  : 28-OCT-2013                              */           
52.00 131028 /*        PURPOSE       : RESTORE MCH_PRCDT IN ZLMERPRO            */           
53.00 131028 /*-----------------------------------------------------------------*/           
54.00 131126 /*        REFERENCE NO. : CHG-0416-13 (D3416) (D3360)              */           
55.00 131126 /*        USER ID       : BG24                                     */           
56.00 140320 /*        USER NAME     : ERIC WONG                                */           
57.00 131126 /*        CHANGED DATE  : 25-NOV-2013                              */           
58.00 131126 /*        PURPOSE       : RESTORE MTLTOPDPT MTLLOAN PFRPT2 FROM    */           
59.00 131126 /*                        IPROD                                    */           
60.00 131126 /*-----------------------------------------------------------------*/           
61.00 140320 /*        REFERENCE NO. : CHG-0086-14 (D4086)                      */           
62.00 140320 /*        USER ID       : BG58                                     */           
63.00 140320 /*        USER NAME     : WINE                                     */           
64.00 140320 /*        CHANGED DATE  : 20-MAR-2014                              */           
65.00 140320 /*        PURPOSE       : RESTORE LNBDLTRPF FROM IPROD             */           
66.00 140320 /*-----------------------------------------------------------------*/           
67.00 140401 /*        REFERENCE NO. : CHG-0086-14 (D4086)                      */           
68.00 140401 /*        USER ID       : BG24                                     */           
69.00 140401 /*        USER NAME     : ERIC WONG                                */           
70.00 140401 /*        CHANGED DATE  : 01-APR-2014                              */           
71.00 140401 /*        PURPOSE       : RESTORE TDEXTDT   FROM IPROD             */           
72.00 140401 /*-----------------------------------------------------------------*/           
73.00 140416 /*        REFERENCE NO. : CHG-101-14  (D4101)                      */           
74.00 140416 /*        USER ID       : B168PGM                                  */           
75.00 140416 /*        USER NAME     : THOMAS CHAN                              */           
76.00 140416 /*        CHANGED DATE  : 16-APR-2014                              */           
77.00 140416 /*        PURPOSE       : RESTORE BIRTHO01  FROM ZLCREDIT          */           
78.00 140416 /*-----------------------------------------------------------------*/           
79.00 140417 /*        REFERENCE NO. : CHG-101-14  (D4058)                      */           
80.00 140417 /*        USER ID       : BG24                                     */           
81.00 140417 /*        USER NAME     : ERIC WONG                                */           
82.00 140417 /*        CHANGED DATE  : 16-APR-2014                              */           
83.00 140417 /*        PURPOSE       : RESTORE RTTXEXTAVG AND RTTXEXTDTA        */           
84.00 140417 /*-----------------------------------------------------------------*/           
85.00 140429 /*        REFERENCE NO. : CHG-161-14  (D4058)                      */           
86.00 140429 /*        USER ID       : BG58                                     */           
87.00 140429 /*        USER NAME     : WINE CHAN                                */           
88.00 140429 /*        CHANGED DATE  : 31-APR-2014                              */           
89.00 140429 /*        PURPOSE       : RESTORE P0FRPT  AT IQRY                  */           
90.00 140429 /*-----------------------------------------------------------------*/           
91.00 140505 /*        REFERENCE NO. : CHG-033-14 (D4033)                       */           
92.00 140505 /*        USER ID       : BG40PGM                                  */           
93.00 140505 /*        USER NAME     : DICKY CHEONG                             */           
94.00 140505 /*        CHANGED DATE  : 11-MAR-2014                              */           
95.00 140505 /*        PURPOSE       : MEMO CHECKING PROCESS                    */           
96.00 140505 /*-----------------------------------------------------------------*/           
97.00 140505 /*        REFERENCE NO. : CHG-156-14 (D4156)                       */           
98.00 140505 /*        USER ID       : BG40PGM                                  */           
99.00 140505 /*        USER NAME     : DICKY CHEONG                             */           
100.00 140505 /*        CHANGED DATE  : 30-APR-2014                              */           
101.00 140505 /*        PURPOSE       : VIP SECURITY TRADING OFFER               */           
102.00 140505 /*-----------------------------------------------------------------*/           
103.00 140613 /*        REFERENCE NO. : CHG-0222-14 (D4222)                      */           
104.00 140613 /*        AUTHOR        : ALBERT AU                                */           
105.00 140613 /*        CHANGED DATE  : 04 JUN 2014                              */           
106.00 140613 /*        REASON        : GET DAILY INFORMATION FOR                */           
107.00 140613 /*                        KAMAKULA FILE                            */           
108.00 140613 /*-----------------------------------------------------------------*/           
109.00 140613 /*        REFERENCE NO. : CHG-0232-14 (D4222)                      */           
110.00 140613 /*        AUTHOR        : WINE CHAN                                */           
111.00 140613 /*        CHANGED DATE  : 04 JUN 2014                              */           
112.00 140613 /*        REASON        : RESTORE CORRESPONDING BANK NAME FILE     */           
113.00 140613 /*                        FOR SCANNING                             */           
114.00 140613 /*-----------------------------------------------------------------*/           
115.00 140729 /*        REFERENCE NO. : CHG-0269-14 (D4269)                      */           
116.00 140729 /*        AUTHOR        : THOMAS CHAN                              */           
117.00 140729 /*        CHANGED DATE  : 29 JUL 2014                              */           
118.00 140729 /*        REASON        : RESTORE AUTOPAY REPORT FILE FOR JOIN     */           
119.00 140729 /*                        AUTOPAY AFTER 23/06/2014                 */           
120.00 140729 /*-----------------------------------------------------------------*/           
121.00 140911 /*        REFERENCE NO. : CHG-0269-14 (D4367)                      */           
122.00 140911 /*        AUTHOR        : ERIC WONG                                */           
123.00 140911 /*        CHANGED DATE  : 10 SEP 2014                              */           
124.00 140911 /*        REASON        : RESTORE LOAN DATA FOR BDD                */           
125.00 140911 /*-----------------------------------------------------------------*/           
126.00 140923 /*        REFERENCE NO. : CHG-0344-14 (D4344)                      */           
127.00 140915 /*        AUTHOR        : ERIC WONG                                */           
128.00 140915 /*        CHANGED DATE  : 10 SEP 2014                              */           
129.00 140915 /*        REASON        : RESTORE CAMPAIGN PAYROLL AND AUTOPAY FILE*/           
130.00 140915 /*-----------------------------------------------------------------*/           
131.00 140918 /*        REFERENCE NO. : CHG-0269-14 (D4382)                      */           
132.00 140918 /*        AUTHOR        : ERIC WONG                                */           
133.00 140918 /*        CHANGED DATE  : 10 SEP 2014                              */           
134.00 140918 /*        REASON        : RESTORE GOVERNMENT CAMPAIGN LOGFILE      */           
135.00 140918 /*-----------------------------------------------------------------*/           
136.00 141118 /*        REFERENCE NO. : CHG-363-14 (D4363)                       */           
137.00 141118 /*        USER ID       : Karl BA55PGM                             */           
138.00 141118 /*        CHANGED DATE  : 10-Nov-2014                              */           
139.00 141118 /*        PURPOSE       : Restore ZCSERVICE/EBBENEPF for BCMNet    */           
140.00 141118 /*                        revamp project                           */           
141.00 141118 /*-----------------------------------------------------------------*/           
142.00 141212 /*        REFERENCE NO. : CHG-487-14 (D4487)                       */           
143.00 141212 /*        USER ID       : ERIC BG24PGM                             */           
144.00 141212 /*        CHANGED DATE  : 09-DEC-2014                              */           
145.00 141212 /*        PURPOSE       : RESTORE ZCIFLIB/SCCRVWPF TO ZUSRLIB      */           
146.00 141212 /*                        FOR THE SCC REVIEW REPORT                */           
147.00 141212 /*-----------------------------------------------------------------*/           
148.00 150116 /*        REFERENCE NO. : CHG-496-14 (D4496)                       */           
149.00 150116 /*        USER ID       : DICKY BG40PGM                            */           
150.00 150116 /*        CHANGED DATE  : 23-DEC-2014                              */           
151.00 150116 /*        PURPOSE       : RESTORE ZISTOCK/IGENSTKDLY AND           */           
152.00 150116 /*                        ZISTOCK/IGENSTKMON FOR MARKETING DATA    */           
153.00 150116 /*                        EXTRACTION                               */           
154.00 150116 /*-----------------------------------------------------------------*/           
155.00 150302 /*        REFERENCE NO. : CHG-449-14 (D4449)                       */           
156.00 150302 /*        USER ID       : THOMAS CHAN                              */           
157.00 150302 /*        CHANGED DATE  :  2-MAR-2015                              */           
158.00 150302 /*        PURPOSE       : RESTORE ZLCARDPTS/PEP_INVLS FOR VPEP     */           
159.00 150302 /*                        PROGRAM                                  */           
160.00 150302 /*-----------------------------------------------------------------*/           
161.00 150507 /*        REFERENCE NO. : CHG-0040-15 (D5040)                      */           
162.00 150507 /*        AUTHOR        : ALBERT AU                                */           
163.00 150507 /*        CHANGED DATE  : 09 DEC 2015                              */           
164.00 150507 /*        REASON        : GET DAILY INFORMATION FOR                */           
165.00 150507 /*                        SAS FILE (AML)                           */           
166.00 150507 /*-----------------------------------------------------------------*/           
167.00 150507 /*        REFERENCE NO. : CHG-363-14 (D4363)                       */           
168.00 150507 /*        USER ID       : Karl BA55PGM                             */           
169.00 150507 /*        CHANGED DATE  : 07-MAY-2015                              */           
170.00 150507 /*        PURPOSE       : Restore IPROD/RMTCNTDAT                  */           
171.00 150507 /*-----------------------------------------------------------------*/           
172.00 150610 /*        REFERENCE NO. : CHG-391-14 (D4391)                       */           
173.00 150610 /*        USER ID       : ALBERT AU BG09PGM                        */           
174.00 150610 /*        CHANGED DATE  : 09-JUN-2015                              */           
175.00 150610 /*        PURPOSE       : MONITOR FATCA REFERENCE LOG              */           
176.00 150610 /*-----------------------------------------------------------------*/           
177.00 150709 /*        REFERENCE NO. : CHG-141-15 (D5141)                       */           
178.00 150709 /*        USER ID       : THOMAS CHAN B168PGM                      */           
179.00 150709 /*        CHANGED DATE  : 09-JUL-2015                              */           
180.00 150709 /*        PURPOSE       : Restore ZLCREDIT/FINT1, FINT2, FINT3.    */           
181.00 150709 /*-----------------------------------------------------------------*/           
182.00 150721 /*        REFERENCE NO. : CHG-0239-15 (D5239)                      */           
183.00 150721 /*        AUTHOR        : WINE CHAN                                */           
184.00 150721 /*        CHANGED DATE  : 17 JUL 2015                              */           
185.00 150721 /*        REASON        : RESTORE UNDRAWN OD LINE REPORT FILE      */           
186.00 150721 /*-----------------------------------------------------------------*/           
187.00 150922 /*        REFERENCE NO. : CHG-0333-15 (D5333)                      */           
188.00 150922 /*        AUTHOR        : TOMMY TONG                               */           
189.00 150922 /*        CHANGED DATE  : 22 SEP 2015                              */           
190.00 150922 /*        REASON        : RESTORE ZACPAY/INVITMALL                 */           
191.00 150922 /*-----------------------------------------------------------------*/           
192.00 151006 /*        REFERENCE NO. : CHG-345-15 (D5345)                       */           
193.00 151006 /*        USER ID       : Karl BA55                                */           
194.00 151006 /*        CHANGED DATE  : 05-Oct-2015                              */           
195.00 151006 /*        PURPOSE       : Restore ZCSERVICE/INEWEBPF               */           
196.00 151006 /*-----------------------------------------------------------------*/           
197.00 151015 /*        REFERENCE NO. : CHG-0369-15 (D5369)                      */           
198.00 151015 /*        AUTHOR        : ALBERT AU (BG09)                         */           
199.00 151015 /*        CHANGED DATE  : 12 OCT 2015                              */           
200.00 151015 /*        PURPOSE       : RESTOREE IPROD/BDRTLNPF                  */           
201.00 151015 /*-----------------------------------------------------------------*/           
202.00 151211 /*        REFERENCE NO. : CHG-0382-15 (D5382)                      */           
203.00 151211 /*        AUTHOR        : THOMAS CHAN (B168PGM)                    */           
204.00 151211 /*        CHANGED DATE  : 11 DEC 2015                              */           
205.00 151211 /*        PURPOSE       : RESTOREE ZLCCAUT/DBFULL)                 */           
206.00 151211 /*-----------------------------------------------------------------*/           
207.00 151216 /*        REFERENCE NO  : CHG-449-15 (D5449)                       */           
208.00 151216 /*        AUTHOR        : ALBERT AU                                */           
209.00 151216 /*        USER ID       : BG09PGM                                  */           
210.00 151216 /*        CHANGE DATE   : 15 DEC 2015                              */           
211.00 151216 /*        REASON        : MODIFY LNCFWPRI FROM MONTHLY BASIS       */           
212.00 151216 /*                        TO DAILY BASIS                           */           
213.00 151216 /*                        RESTOREE IPROD/LNCFWINT,LNCFWPRI         */           
214.00 151216 /* ----------------------------------------------------------------*/           
215.00 151217 /*        REFERENCE NO. : CHG-445-15 (D5445)                       */           
216.00 151217 /*        USER ID       : Dicky BG40                                */          
217.00 151217 /*        CHANGED DATE  : 14-Dec-2015                              */           
218.00 151217 /*        PURPOSE       : Call CUSEM_CL to get customer registered */           
219.00 151217 /*                        email address                            */           
220.00 151217 /*-----------------------------------------------------------------*/           
221.00 160107 /*        REFERENCE NO. : CHG-0466-15 (D5466)                      */           
222.00 160107 /*        AUTHOR        : BG09PGM ALBERT AU                        */           
223.00 160107 /*        CHANGED DATE  : 11 AUG 2015                              */           
224.00 160107 /*        REASON        : GENERATE SECURITIES SERVICE, LONA, VIP   */           
225.00 160107 /*                        CUSTOMER AND CREDIT CARDS ON WEEKLY BASIS*/           
226.00 160107 /*        REMARK        :                                          */           
227.00 160107 /*-----------------------------------------------------------------*/           
228.00 160108 /*        REFERENCE NO. : CHG-237-15 (D5237)                       */           
229.00 160108 /*        USER ID       : DICKY BG40                                */          
230.00 160108 /*        CHANGED DATE  : 08-JAN-2016                              */           
231.00 160108 /*        PURPOSE       : ADD LOGIC TO RESTORE IPROD/PEDUTXN       */           
232.00 160108 /*-----------------------------------------------------------------*/           
233.00 160115 /*        REFERENCE NO. : CHG-461-15 (D5461)                       */           
234.00 160115 /*        USER ID       : THOMAS (B168PGM)                          */          
235.00 160115 /*        CHANGED DATE  : 15 JAN 2016                              */           
236.00 160115 /*        PURPOSE       : ADD LOGIC TO RESTORE ZLCREDIT/PPOV_SUMDW */           
237.00 160115 /*-----------------------------------------------------------------*/           
238.00 160127 /*        REFERENCE NO. : CHG-033-16 (D6033)                       */           
239.00 160127 /*        USER ID       : MYLVES (BI77PGM)                          */          
240.00 160127 /*        CHANGED DATE  : 15 JAN 2016                              */           
241.00 160127 /*        PURPOSE       : Restore DSF file transaction log         */           
242.00 160127 /*-----------------------------------------------------------------*/           
243.00 160204 /*  REFERENCE     : CHG-025-16 (D6025)                               */         
244.00 160204 /*  AUTHOR        : DICKY CHEONG (BG40PGM)                           */         
245.00 160204 /*  DATE WRITTEN  : 26-JAN-2016                                      */         
246.00 160204 /*  REASON        : VIP SECURITY TRADING DATA FILE UPLOAD            */         
247.00 160204 /*-------------------------------------------------------------------*/         
248.00 160308 /*  REFERENCE     : CHG-421-15 (D5421)                               */         
249.00 160308 /*  AUTHOR        : WINE CHAN (BG58PGM)                              */         
250.00 160308 /*  DATE WRITTEN  : 08-MAR-2016                                      */         
251.00 160308 /*  REASON        : RESTORE DSF MASTER FILE                          */         
252.00 160308 /*-------------------------------------------------------------------*/         
253.00 160308 /*  REFERENCE     : CHG-025-16 (D6078)                               */         
254.00 160308 /*  AUTHOR        : MYLES IEONG (BI77PGM)                            */         
255.00 160308 /*  DATE WRITTEN  : 03-MAR-2016                                      */         
256.00 160308 /*  REASON        : EXTRACT LOAN                                     */         
257.00 160308 /*-------------------------------------------------------------------*/         
258.00 160317 /*  REFERENCE     : CHG-025-16 (D6071)                               */         
259.00 160317 /*  AUTHOR        : DICKY CHEONG (BG40PGM)                           */         
260.00 160317 /*  DATE WRITTEN  : 26-MAR-2016                                      */         
261.00 160317 /*  REASON        : SECURITY TRADING WEEKLY AND MONTHL REPORT       */          
262.00 160317 /*-------------------------------------------------------------------*/         
263.00 160317 /*  REFERENCE     : CHG-420-15 (D5420)                               */         
264.00 160317 /*  AUTHOR        : THOMAS CHAN (B168PGM)                            */         
265.00 160317 /*  DATE WRITTEN  : 17-MAR-2016                                      */         
266.00 160317 /*  REASON        : RESTORE CR CARD CUSTOMER SUB FILE 1              */         
267.00 160317 /*-------------------------------------------------------------------*/         
268.00 160420 /*  REFERENCE     : CHG-082-16 (D6082)                               */         
269.00 160420 /*  AUTHOR        : THOMAS CHAN (B168PGM)                            */         
270.00 160420 /*  DATE WRITTEN  : 20-APR-2016                                      */         
271.00 160420 /*  REASON        : RESTORE CR CARD E-STMT EXCEPTION REPORT FILE     */         
272.00 160420 /*-------------------------------------------------------------------*/         
273.00 160520 /*  REFERENCE     : CHG-164-16 (D6164)                               */         
274.00 160520 /*  AUTHOR        : MYLES IEONG (BI77PGM)                            */         
275.00 160520 /*  DATE WRITTEN  : 19-MAY-2016                                      */         
276.00 160520 /*  REASON        : RESTORE USER DEFINED FIELD LOG                   */         
277.00 160520 /*-------------------------------------------------------------------*/         
278.00 160603 /*  REFERENCE     : CHG-173-16 (D6173)                               */         
279.00 160603 /*  AUTHOR        : Edward Cheung (B323)                             */         
280.00 160603 /*  DATE WRITTEN  : 03-JUN-2016                                      */         
281.00 160603 /*  REASON        : Restore MAGPF for credit facility monitoring     */         
282.00 160603 /*-------------------------------------------------------------------*/         
283.00 160718 /*  REFERENCE     : CHG-204-16 (D6204)                               */         
284.00 160718 /*  AUTHOR        : Myles Ieong (BI77)                               */         
285.00 160718 /*  DATE WRITTEN  : 13-JUL-2016                                      */         
286.00 160718 /*  REASON        : Restore SCP001 for file transfer request         */         
287.00 160718 /*-------------------------------------------------------------------*/         
288.00 160810 /*  REFERENCE     : CHG-264-16 (D6264)                               */         
289.00 160810 /*  AUTHOR        : Tommy Tong (BH90)                                */         
290.00 160810 /*  DATE WRITTEN  : 10-Aug-2016                                      */         
291.00 160810 /*  REASON        : Restore ICISACCF, ICISCIFF,ICISACCC              */         
292.00 160810 /*-------------------------------------------------------------------*/         
293.00 161122 /*  REFERENCE     : CHG-380-16 (D6380)                               */         
294.00 161122 /*  AUTHOR        : Myles Ieong (BI77)                               */         
295.00 161122 /*  DATE WRITTEN  : 22-Nov-2016                                      */         
296.00 161122 /*  REASON        : Restore BUSUTPF , BUSUTAC                        */         
297.00 161122 /*-------------------------------------------------------------------*/         
298.00 161125 /*  REFERENCE     : CHG-386-16 (D6386)                               */         
299.00 161125 /*  AUTHOR        : KARL BA55                                        */         
300.00 161125 /*  DATE WRITTEN  : 25-NOV-2016                                      */         
301.00 161125 /*  REASON        : RESTORE ECORP GROUP INFO FILE (CBGRPINFO)        */         
302.00 161125 /*-------------------------------------------------------------------*/         
303.00 161205 /*  REFERENCE     : CHG-344-16 (D6344)                               */         
304.00 161205 /*  AUTHOR        : Tommy Tong (BH90)                                */         
305.00 161205 /*  DATE WRITTEN  : 05-Dec-2016                                      */         
306.00 161205 /*  REASON        : Restore TBRSUM                                   */         
307.00 161205 /*-------------------------------------------------------------------*/         
308.00 170221 /*  REFERENCE     : CHG-397-16 (D6397)                               */         
309.00 170221 /*  AUTHOR        : ALBERT AU  (BG09)                                */         
310.00 170221 /*  DATE WRITTEN  : 21-FEB-2017                                      */         
311.00 170221 /*  REASON        : RESTORE BDPCCPF,BDPLNPF,BDPTAPF,BDPTADQS,        */         
312.00 170221 /*                  BDPDYFRQA,BDPDYMA,BDPPAY, AND BDPLKG             */         
313.00 170221 /*-------------------------------------------------------------------*/         
314.00 170403 /*  REFERENCE     : CHG-111-17 (D7111)                               */         
315.00 170403 /*  AUTHOR        : THOMAS CHAN (B168PGM)                            */         
316.00 170403 /*  DATE WRITTEN  :  3-APR-2017                                      */         
317.00 170403 /*  REASON        : RESTORE ZLCARDPTS/BP_STATLST                     */         
318.00 170403 /*-------------------------------------------------------------------*/         
319.00 170406 /*  REFERENCE     : CHG-120-17 (D7120)                               */         
320.00 170406 /*  AUTHOR        : KARL BA55                                        */         
321.00 170406 /*  DATE WRITTEN  : 05-APR-2017                                      */         
322.00 170406 /*  REASON        : RESTORE ZCSERVICE/ACTRFOUT                       */         
323.00 170406 /*-------------------------------------------------------------------*/         
324.00 170627 /*  REFERENCE     : CHG-150-17 (D7150)                               */         
325.00 170627 /*  AUTHOR        : THOMAS CHAN (B168PGM)                            */         
326.00 170627 /*  DATE WRITTEN  : 27-JUN-2017                                      */         
327.00 170627 /*  REASON        : RESTORE ZATMLIB/CIFNBRCH                         */         
328.00 170627 /*-------------------------------------------------------------------*/         
329.00 170705 /*  REFERENCE     : CHG-195-17 (D7195)                               */         
330.00 170705 /*  AUTHOR        : ALBERT AU (BG09PGM)                              */         
331.00 170705 /*  DATE WRITTEN  : 04-JUL-2017                                      */         
332.00 170705 /*  REASON        : RESTORE ZCIFLIB/GRMCIFPF, ZCIFLIB/GRMMSTPF       */         
333.00 170705 /*-------------------------------------------------------------------*/         
334.00 170705 /*  REFERENCE     : CHG-100-17 (D7100)                               */         
335.00 170705 /*  AUTHOR        : ALBERT AU (BG09PGM)                              */         
336.00 170705 /*  DATE WRITTEN  : 04-JUL-2017                                      */         
337.00 170705 /*  REASON        : RESTORE ZECSDLIB/ECSDPF                          */         
338.00 170705 /*-------------------------------------------------------------------*/         
339.00 170802 /* REFERENCE NO. : CHG-258-17 (D7258)                                */         
340.00 170802 /* AUTHOR        : BG09PGM ALBERT AU                                 */         
341.00 170802 /* CHANGED DATE  : 31 JUL 2017                                       */         
342.00 170802 /* REASON        : RESTORE ZOTRMAPP/OMOPAMS, OMOPSWIFT               */         
343.00 170802 /*                                                                   */         
344.00 170802 /*-------------------------------------------------------------------*/         
345.00 170821 /* REFERENCE NO. : CHG-266-17 (D7266)                                */         
346.00 170821 /* AUTHOR        : BI77PGM MYLES IEONG                               */         
347.00 170821 /* CHANGED DATE  : 21 AUG 2017                                       */         
348.00 170821 /* REASON        : RESTORE I700BCM/CQNOUT                            */         
349.00 170821 /*                                                                   */         
350.00 170821 /*-------------------------------------------------------------------*/         
351.00 141212                                                                                 
352.00 990405              DCL        VAR(&REPLY) TYPE(*CHAR) LEN(1)                          
353.00 961213                                                                                 
354.00 130426              DCL        VAR(&LIB) TYPE(*CHAR) LEN(10) +                         
355.00 130614                           VALUE('ZUSRLIB')                                      
356.00 130326              DCL        VAR(&PGMLIB) TYPE(*CHAR) LEN(10) +                      
357.00 70801                           VALUE('ZOPRCRD')                                      
358.00 130510              DCL        VAR(&TAPDEV) TYPE(*CHAR) LEN(10) VALUE('TAP02')         
359.00 990810                                                                                 
360.00 10425              MONMSG     MSGID(CPF2103 CPF2104 CPF4174 CPF3142 +                 
361.00 10425                           CPF4520 CPF0864 CPF4174 CPF3773)                      
362.00 11017  RSTOBJ:                                                                        
363.00 130326                                                                                 
364.00 130510              RSTOBJ     OBJ(NDMACOD1 NDMACOP1 NDMHOUT) SAVLIB(DMLIB) +          
365.00 130510                           DEV(&TAPDEV)  ENDOPT(*LEAVE) +                        
366.00 130510                           MBROPT(*ALL) ALWOBJDIF(*ALL) RSTLIB(&LIB)             
367.00 130326                                                                                 
368.00 161125 /*D6386      RSTOBJ     OBJ(ATURDF LNEIRMAS GLTAPF) SAVLIB(I700BCM) + */        
369.00 170821 /*D6386*/    RSTOBJ     OBJ(ATURDF LNEIRMAS GLTAPF CBGRPINFO CQNOUT) +          
370.00 170821 /*D7266*/                 SAVLIB(I700BCM) +                                     
371.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
372.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
373.00 130326                                                                                 
374.00 130510              RSTOBJ     OBJ(FAMASPF FATYPPF) SAVLIB(IMOBLIB) +                  
375.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
376.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
377.00 130510                                                                                 
378.00 130510              RSTOBJ     OBJ(AMORTMST) SAVLIB(IMODULE) DEV(&TAPDEV) +            
379.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
380.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
381.00 130510                                                                                 
382.00 130510              RSTOBJ     OBJ(INTPLAN CRRPT04F CRRPT05F CRRPT06F +                
383.00 130510                           CRRPT06CRP CRRPT06RET CRRPT20* TCUWRKF +              
384.00 130510                           TCUWRKLF APRES2800 APRES5800 APHIST +                 
385.00 130510                           BTOVRFLE BTTXFLE ICBSRRTE CRRPT13F +                  
386.00 130510                           FXTXNPF MONTXNPF RMBTXNPF RMBSUMPF +                  
387.00 130510                           NPERSICPF CRMRPT03F CRMRPT05F CRMRPT06F +             
388.00 130510                           TRJEMSG DCONTLOG RSLNXPDF REBMTHLOG +                 
389.00 130510                           CRRPT06RSL TDREP3F TDREPCORPF RCDWNLD +               
390.00 130510                           LNSMASPF LNSMASLF1 LNSMASLF2 PDLOANDTA +              
391.00 130510                           PDOLOAND OVRDFTDTA CRDDATA TMDEPOSIT +                
392.00 130510                           LNREPAY LNINVEST AMLSCANMF AMLSCANTOR +               
393.00 130510                           DLYTXNWKF DLYTXNWKF1 TXNCTWRK1 TXNCTWRK2 +            
394.00 130510                           TXNRCDWRK1 TXNRCDWRK2 TXNTDWRK1 TXNTDWRK2 +           
395.00 130510                           WLYTXNF WLYTXNF1 TXNWCDWRK1 TXNWCDWRK2 +              
396.00 130510                           CRDTX1 CRDTX2 AML003P1PF BCPTAINFOA +                 
397.00 130510                           BCPTMINFOA BCPHLDA BCPCHQDLTA MCCOUNT +               
398.00 130510                           TATMDPTSUM CUINFPF CRRPT10QT CRRPT10SA +              
399.00 130510                           CRRPT10AN PSTD PSTWOUT PSTMOUT TMCCYTBL +             
400.00 130510                           TDREP7F CUSTINFO CUSTAO PINFO NPINFO +                
401.00 130510                           EBINFO EBINFOCO PRERMINFO CRINFO +                    
402.00 130510                           SSDNLNRPT SSDPMTRPT MATPLNPF BUSPF +                  
403.00 130510                           BUSLNPD ACNOIMG RMTRPTIM RMTRPTIQ +                   
404.00 130510                           RMTRPTIH RMTRPTOM RMTRPTOQ RMTRPTOH +                 
405.00 130510                           TXNRPTNPSL TXNRPTPSL HRISKCIFF DAUTOINFO +            
406.00 130510                           MRVDWF MRVMWF MRVSTMTWF MRVCHQWF +                    
407.00 130510                           MRVCHQWFB MRVMINVPF MRVMNFEE MRVSTMTWF +              
408.00 130510                           MRVVDWF MRVVMWF MRVSTMTP MRVMWFB MRVVMWFB +           
409.00 130510                           CBCIFRPT DMWCUSPF ICACTINFO DBGINFO +                 
410.00 130510                           DEXPNG DEXPPF DINPIC DINPLC DEXPDA +                  
411.00 130510                           DEXPDAFP DEXPLT DEXPLA CBPYRLPTY CBPYRLPF +           
412.00 130510                           T940MSG CBCRCDPF CBMRCHPF LNPDLTRPF +                 
413.00 130510                           CRLMCIFO GPRCOLAPP GPORLNDTL GPORRST TSTD +           
414.00 131023 /*D3211*/ /*D3245*/       TSTWOUT TSTMOUT GINDPF PYRLINFO TOPDPTPF  +           
415.00 140401 /*D3358*/ /*D3360*/       CDBLST MTLTOPDPT MTLLOAN PFRPT2 LNBDLTRPF   +         
416.00 140618 /*D4129*/ /*D4033 D4222*/ TDEXTDT MEMO_OUT TXTINTCPY                  +         
417.00 140613 /*D4222*/                 TXTBAL2GL TXTCDTYP TXTCFP001 TXTCFP2101     +         
418.00 140613 /*D4222*/                 TXTCFP3101 TXTCFP5031 TXTCOP231 TXTCUP1301  +         
419.00 140613 /*D4222*/                 TXTCUP2001 TXTCUP2701 TXTCUP301 TXTCUP4001  +         
420.00 140613 /*D4222*/                 TXTCUP4101 TXTCUP601 TXTCUP901 TXTFRPPARM   +         
421.00 140613 /*D4222*/                 TXTGLP301 TXTICBSRTE TXTINDEX TXTKVALTX     +         
422.00 140613 /*D4222*/                 TXTLNACC TXTLNP301 TXTLNP505 TXTLNP506      +         
423.00 140613 /*D4222*/                 TXTLNP701 TXTMINT2GL TXTSCRDPRF TXTTACRINP  +         
424.00 140613 /*D4222*/                 TXTTAP1401 TXTTAP201 TXTTMOPT TXTTMP003     +         
425.00 140911 /*D4222*/ /*D4232*/       TXTTMRATE TXTTMRTPN TXTTMSVPN AMLSCANCF     +         
426.00 150507 /*D5040*/                 TMSACCBRG TMSACCFGE  TMSACTSTG  TMSASSSTG   +         
427.00 150507 /*D5040*/                 TMSBKSTG  TMSBRNSTG  TMSCSHBKSG TMSCSHSTG   +         
428.00 150507 /*D5040*/                 TMSCTLFLE TMSEXTPASG TMSFXSTG   TMSHOUHLS   +         
429.00 150507 /*D5040*/                 TMSHOUPTB TMSPTYSTG  TMSTRASTG  RMTCNTDAT   +         
430.00 160308 /*D5369     D6078         BDRTLNPF                             */     +         
431.00 160127 /*D5449*/ /*D6033*/       LNCFWINT LNCFWPRI  DDSFINFO                 +         
432.00 160308 /*D5466*/ /*D6078*/       BRNINCCRD BRNINCLN BRNINCVIP EXLNPF         +         
433.00 160603 /*D4367*/ /*D5239*/       BCARLNDTA GWPLOGPF UDNODPF  PEDUTXN         +         
434.00 170221 /*D6397*/                 BDPCCPF   BDPLNPF  BDPTAPF  BDPTADQS        +         
435.00 170221 /*D6397*/                 BDPDYFRQA BDPDYMA  BDPPAY   BDPLKG          +         
436.00 161122 /*D6173*/ /*D6380*/       MAGPF BUSUTPF BUSUTAC )                     +         
437.00 140320 /*D3211*/ /*D4086*/       SAVLIB(IPROD) +                                       
438.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) RSTLIB(&LIB)              
439.00 130702 /*D3211                   TSTWOUT TSTMOUT GINDPF) SAVLIB(IPROD) +   */          
440.00 130510                                                                                 
441.00 140429 /*D4161*/  RSTOBJ     OBJ(CASHINOUT P0FRPT) SAVLIB(IQRY) DEV(&TAPDEV) +         
442.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
443.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
444.00 130510                                                                                 
445.00 150922 /*D5333*/    RSTOBJ     OBJ(INVITMALL) SAVLIB(ZACPAY)                 +         
446.00 150922                           MBROPT(*ALL) ALWOBJDIF(*ALL) OBJTYPE(*FILE) +         
447.00 150922                           DEV(&TAPDEV) ENDOPT(*LEAVE) RSTLIB(&LIB)              
448.00 150922                                                                                 
449.00 170627 /* D7150     RSTOBJ     OBJ(ATMNETPF CUP_DWLOAD CUPINFO) +             */       
450.00 170627 /* D7150 */  RSTOBJ     OBJ(ATMNETPF CUP_DWLOAD CUPINFO CIFNBRCH) +             
451.00 130510                           SAVLIB(ZATMLIB) DEV(&TAPDEV) +                        
452.00 130510                           OBJTYPE(*FILE) ENDOPT(*LEAVE) +                       
453.00 130510                           MBROPT(*ALL) ALWOBJDIF(*ALL) RSTLIB(&LIB)             
454.00 130510                                                                                 
455.00 141008  /*D4344*/   RSTOBJ     OBJ(ACADBDTL EMPNATPWF EMPFPRPT) +                      
456.00 140923                           SAVLIB(ZAUTOPAY) DEV(&TAPDEV) +                       
457.00 140923                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
458.00 140923                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
459.00 130510                                                                                 
460.00 130510              RSTOBJ     OBJ(BGMST BGAPRS) SAVLIB(ZBGLIB) +                      
461.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
462.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
463.00 130510                                                                                 
464.00 130510              RSTOBJ     OBJ(CCWRKPF) SAVLIB(ZCARCOMM) DEV(&TAPDEV) +            
465.00 130510                           ENDOPT(*LEAVE) RSTLIB(&LIB)                           
466.00 130510                                                                                 
467.00 130510              RSTOBJ     OBJ(CCOLMAS) SAVLIB(ZCCOLLIB) DEV(&TAPDEV) +            
468.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
469.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
470.00 130510                                                                                 
471.00 130510              RSTOBJ     OBJ(CHQDTLBK CHQHDRBK) SAVLIB(ZCHQLIB) +                
472.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
473.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
474.00 130510                                                                                 
475.00 150611 /*D4487*/    RSTOBJ     OBJ(CRDAPPM PIEXPPF CUDFLDPF CUDSMCRPT SCCRVWPF +       
476.00 160520 /*D4391*/                 FARFPF FATCPF MONFCRLOG    +                          
477.00 170705 /*D7195*/                 GRMMSTPF GRMCIFPF          +                          
478.00 160810 /*D6164* D6264*/          CUDLOG ICISCIFF ICISACCC ICISACCF) +                  
479.00 130510                           SAVLIB(ZCIFLIB) DEV(&TAPDEV) +                        
480.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
481.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
482.00 130510                                                                                 
483.00 160317 /* D5420     RSTOBJ     OBJ(VPDCRTDC ZPDCRCUC ZPDCRCDC) +            */         
484.00 160317 /* D5420 */  RSTOBJ     OBJ(VPDCRTDC ZPDCRCUC ZPDCRCDC ZPDCRCUCS1) +            
485.00 130510                           SAVLIB(ZCLNKFIL) DEV(&TAPDEV) +                       
486.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
487.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
488.00 130510                                                                                 
489.00 130510              RSTOBJ     OBJ(MACOMAS) SAVLIB(ZCOLIB) DEV(&TAPDEV) +              
490.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
491.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
492.00 130510                                                                                 
493.00 130510              RSTOBJ     OBJ(LIMUSEPF CRLDLDET CRLACDT) +                        
494.00 130510                           SAVLIB(ZCRLINE) DEV(&TAPDEV) +                        
495.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
496.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
497.00 130510                                                                                 
498.00 130510              RSTOBJ     OBJ(TCGNRSLT) SAVLIB(ZCRSLOG) DEV(&TAPDEV) +            
499.00 130510                           MBROPT(*ALL) ALWOBJDIF(*ALL) RSTLIB(&LIB)             
500.00 130510                                                                                 
501.00 130510              RSTOBJ     OBJ(SPCIFPF PININ1F PININ2F IPNETRPTPF +                
502.00 151006 /*D5345*/                 IIVRSTS PINSTKF LGP008 EBKMBL EBBENEPF   +            
503.00 170406 /*D7120*/                 INEWEBPF ACTRFOUT)                       +            
504.00 130717 /*D3238*/                 SAVLIB(ZCSERVICE) +                                   
505.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
506.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
507.00 130717 /*D3238                   IIVRSTS PINSTKF LGP008) SAVLIB(ZCSERVICE) + */        
508.00 141118 /*D3238  D4363            IIVRSTS PINSTKF LGP008 EBKMBL) +            */        
509.00 151006 /*D4363 D5345             IIVRSTS PINSTKF LGP008 EBKMBL EBBENEPF) +   */        
510.00 170406 /*D7120 D5345             INEWEBPF)                                +  */        
511.00 130510                                                                                 
512.00 130510              RSTOBJ     OBJ(SCRDPRF) SAVLIB(ZCUSPRO) DEV(&TAPDEV) +             
513.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
514.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
515.00 130510                                                                                 
516.00 130510              RSTOBJ     OBJ(DSNEDRGOF) SAVLIB(ZDSNTEDRG) +                      
517.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
518.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
519.00 130510                                                                                 
520.00 130510              RSTOBJ     OBJ(DSNTEOTF) SAVLIB(ZDSNTELIB) DEV(&TAPDEV) +          
521.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
522.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
523.00 130510                                                                                 
524.00 160308  /*D5421*/   RSTOBJ     OBJ(DSFTFRPF) SAVLIB(ZDSFTAX) DEV(&TAPDEV) +            
525.00 160308  /*D5421*/                ENDOPT(*LEAVE) MBROPT(*ALL) +                         
526.00 160308  /*D5421*/                ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
527.00 160308                                                                                 
528.00 130510              RSTOBJ     OBJ(FUDTX) SAVLIB(ZFILIB) DEV(&TAPDEV) +                
529.00 130510                           ENDOPT(*LEAVE) RSTLIB(&LIB)                           
530.00 130510                                                                                 
531.00 130510              RSTOBJ     OBJ(XBCMNOS XBCMCAM) SAVLIB(ZIMMS) DEV(&TAPDEV) +       
532.00 130510                           ENDOPT(*LEAVE) RSTLIB(&LIB)                           
533.00 130510                                                                                 
534.00 130510              RSTOBJ     OBJ(ICUSTSTK ISTKACC ISTKSUBACC +                       
535.00 131024 /*D3335*/               IRBDTXNM IRBDTXNW +                                     
536.00 130510                         IRPT001F IRPT002F IRPT003F IRPT004F +                   
537.00 130510                         IRPT005F ISECACC ISECSEC ISECENV ISCPNMST +             
538.00 150303 /*D4496 */              ISTKACDAYF ISTKACMONF +                                 
539.00 160204 /*D6025 */              IVIPTXNWRS IVIPTXNMRS +                                 
540.00 160317 /*D6071 */              ISECRPTW ISECRPTM +                                     
541.00 160204 /*D4156 */              STKMKTPF VIPOFFER1 VIPOFFER2) +                         
542.00 130510                         SAVLIB(ZISTOCK) DEV(&TAPDEV) +                          
543.00 130510                         ENDOPT(*LEAVE) MBROPT(*ALL) +                           
544.00 130510                         ALWOBJDIF(*ALL) RSTLIB(&LIB)                            
545.00 150302                                                                                 
546.00 170403 /* D7111     RSTOBJ     OBJ(PEP_INVLS) SAVLIB(ZLCARDPTS) +              D4449 */
547.00 170403 /* D7111 */  RSTOBJ     OBJ(PEP_INVLS BP_STATLST) SAVLIB(ZLCARDPTS) +           
548.00 150302                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
549.00 150302                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
550.00 130510                                                                                 
551.00 140729 /* D4269     RSTOBJ     OBJ(CRDATPMST) SAVLIB(ZLCCAUT) +                      */
552.00 151211 /* D5382     RSTOBJ     OBJ(CRDATPMST CRDATPRPT) SAVLIB(ZLCCAUT) +            */
553.00 151211 /* D5382 */  RSTOBJ     OBJ(CRDATPMST CRDATPRPT DBFULL) SAVLIB(ZLCCAUT) +       
554.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
555.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
556.00 130510                                                                                 
557.00 140416 /* D4101     RSTOBJ     OBJ(MMISTYPPF FREEACCDTA LOUNGETX DWCARD +            */
558.00 150709 /* D5141     RSTOBJ     OBJ(MMISTYPPF FREEACCDTA LOUNGETX DWCARD BIRTHO01 +     
559.00 150709                           DWCUS DWTXN RESULT_BAL MCUP_REV OVACLIST) +         */
560.00 160115 /* D5461     RSTOBJ     OBJ(MMISTYPPF FREEACCDTA LOUNGETX DWCARD BIRTHO01 +     
561.00 160115                           DWCUS DWTXN RESULT_BAL MCUP_REV OVACLIST            */
562.00 160420 /* D6082     RSTOBJ     OBJ(MMISTYPPF FREEACCDTA LOUNGETX DWCARD BIRTHO01 +     
563.00 160115                           DWCUS DWTXN RESULT_BAL MCUP_REV OVACLIST PPOV_SUMDW + 
564.00 160420                           FINT1 FINT2 FINT3) +                                */
565.00 160420 /* D6082 */  RSTOBJ     OBJ(MMISTYPPF FREEACCDTA LOUNGETX DWCARD BIRTHO01 +     
566.00 160420                           DWCUS DWTXN RESULT_BAL MCUP_REV OVACLIST PPOV_SUMDW + 
567.00 160420                           FINT1 FINT2 FINT3 NOPHST_CIF) +                       
568.00 130510                           SAVLIB(ZLCREDIT) DEV(&TAPDEV) +                       
569.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
570.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
571.00 130510                                                                                 
572.00 130510              RSTOBJ     OBJ(FSCUSREQ CSHINMST) SAVLIB(ZLFREEINT) +              
573.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
574.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
575.00 130510                                                                                 
576.00 131028 /* D3353     RSTOBJ     OBJ(MCH_MFIL) SAVLIB(ZLMERPRO) DEV(&TAPDEV) +         */
577.00 131028 /* D3353 */  RSTOBJ     OBJ(MCH_MFIL MCH_PRCDT) SAVLIB(ZLMERPRO) DEV(&TAPDEV) + 
578.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
579.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
580.00 130510                                                                                 
581.00 130510              RSTOBJ     OBJ(OGOPMAS) SAVLIB(ZOPGLIB) DEV(&TAPDEV) +             
582.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
583.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
584.00 130510                                                                                 
585.00 130510              RSTOBJ     OBJ(PNSDTLPF) SAVLIB(ZPNSLIB) DEV(&TAPDEV) +            
586.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
587.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
588.00 130510                                                                                 
589.00 130510              RSTOBJ     OBJ(CARTEMBO SIGNGIFT WELGIFT FSDMST TMSAVIF +          
590.00 130510                           LNKLNPF LNKPRD) SAVLIB(ZSAVPLAN) +                    
591.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
592.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
593.00 130510                                                                                 
594.00 130510              RSTOBJ     OBJ(SDBOUT SDBFOCDTA SDBTKTPF) +                        
595.00 130510                           SAVLIB(ZSDBLIB) DEV(&TAPDEV) +                        
596.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
597.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
598.00 130510                                                                                 
599.00 130510              RSTOBJ     OBJ(CUSTSTK) SAVLIB(ZSTOCK) DEV(&TAPDEV) +              
600.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
601.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
602.00 130510                                                                                 
603.00 161205              RSTOBJ     OBJ(CCRDMAS CDBILTYP CDSETTYP CDPYMPARM TBRSUM) +       
604.00 130510                           SAVLIB(ZTADCS) DEV(&TAPDEV) +                         
605.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
606.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
607.00 130510                                                                                 
608.00 130510              RSTOBJ     OBJ(FIXTAACT DEPTAACT DCTMAINTF) +                      
609.00 130510                           SAVLIB(ZTMLIB) DEV(&TAPDEV) +                         
610.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
611.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
612.00 130510                                                                                 
613.00 131023 /*D3370*/    RSTOBJ     OBJ(HITRTD HITCUSREF VIPMAST VCUSNBAL HITCPIA) +        
614.00 130510                           SAVLIB(ZVIPLIB) DEV(&TAPDEV) +                        
615.00 130510                           ENDOPT(*LEAVE) MBROPT(*ALL) +                         
616.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
617.00 130510                                                                                 
618.00 130510              RSTOBJ     OBJ(PST00101B PSP00202) SAVLIB(ICBSBCMDB0) +            
619.00 130510                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
620.00 130510                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
621.00 130510                                                                                 
622.00 151217 /* D5445     RSTOBJ     OBJ(EFT91001) SAVLIB(ICBSBCMDB2) +                      
623.00 140417                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
624.00 151217                           ALWOBJDIF(*ALL) RSTLIB(&LIB)               */         
625.00 151217 /* D5445 */  RSTOBJ     OBJ(EFP00401 EFT91001) SAVLIB(ICBSBCMDB2) +             
626.00 151217                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
627.00 151217                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
628.00 130510                                                                                 
629.00 140417 /*D4058*/    RSTOBJ     OBJ(RTTXEXTAVG RTTXEXTDTA) SAVLIB(ZCHEXAPP) +           
630.00 160718                           DEV(&TAPDEV) ENDOPT(*LEAVE) MBROPT(*ALL) +            
631.00 140417                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
632.00 140417                                                                                 
633.00 160718 /*D6204*/    RSTOBJ     OBJ(SCP001) SAVLIB(I700SMS) +                           
634.00 170706 /*D7100*/                 DEV(&TAPDEV) ENDOPT(*LEAVE ) MBROPT(*ALL) +           
635.00 170706                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
636.00 170706 /*D7100                   DEV(&TAPDEV) ENDOPT(*UNLOAD) MBROPT(*ALL) +           
637.00 170706                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                */        
638.00 160718                                                                                 
639.00 170802 /*D7258*/    RSTOBJ     OBJ(OMOPMAS OMOPSWIFT) SAVLIB(ZOTRMAPP) +               
640.00 170802                           DEV(&TAPDEV) ENDOPT(*LEAVE ) MBROPT(*ALL) +           
641.00 170802                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
642.00 170802                                                                                 
643.00 170706 /*D7100*/    RSTOBJ     OBJ(ECSDPF) SAVLIB(ZECSDLIB) +                          
644.00 170706                           DEV(&TAPDEV) ENDOPT(*UNLOAD) MBROPT(*ALL) +           
645.00 170706                           ALWOBJDIF(*ALL) RSTLIB(&LIB)                          
646.00 170706                                                                                 
647.00 130326              CRTPF      FILE(&LIB/CRDAPPMCHR) +                                 
648.00 130326                           SRCFILE(&PGMLIB/QDDSSRC) SRCMBR(CRDAPPMCHR) +         
649.00 130326                           SIZE(*NOMAX)                                          
650.00 130326                                                                                 
651.00 130326              CPYF       FROMFILE(&PGMLIB/BCPTAINFOB) +                          
652.00 130326                           TOFILE(&LIB/BCPTAINFOB) MBROPT(*REPLACE) +            
653.00 130326                           CRTFILE(*YES)                                         
654.00 130326                                                                                 
655.00 130326              CPYF       FROMFILE(&PGMLIB/BCPHLDB) +                             
656.00 130326                           TOFILE(&LIB/BCPHLDB) MBROPT(*REPLACE) +               
657.00 130326                           CRTFILE(*YES)                                         
658.00 130326                                                                                 
659.00 130326              CPYF       FROMFILE(&PGMLIB/BCPTMINFOB) +                          
660.00 130326                           TOFILE(&LIB/BCPTMINFOB) MBROPT(*REPLACE) +            
661.00 130326                           CRTFILE(*YES)                                         
662.00 130326                                                                                 
663.00 130326              CPYF       FROMFILE(&PGMLIB/BCPCHQDLTB) +                          
664.00 130326                           TOFILE(&LIB/BCPCHQDLTB) MBROPT(*REPLACE) +            
665.00 130326                           CRTFILE(*YES)                                         
666.00 130326                                                                                 
667.00 130326              CPYF       FROMFILE(&PGMLIB/BCPTACNT) +                            
668.00 130326                           TOFILE(&LIB/BCPTACNT) MBROPT(*REPLACE) +              
669.00 130326                           CRTFILE(*YES)                                         
670.00 11019                                                                                 
671.00 130326              CPYF       FROMFILE(&LIB/CRDAPPM) +                                
672.00 130326                           TOFILE(&LIB/CRDAPPMCHR) MBROPT(*ADD) +                
673.00 130326                           FMTOPT(*NOCHK)                                        
674.00 130326                                                                                 
675.00 130510              CALL       PGM(&PGMLIB/STOCKDLCL)                                  
676.00 130326                                                                                 
677.00 130326              RUNQRY     QRY(&PGMLIB/CRRPT06CIF)                                 
678.00 151217                                                                                 
679.00 151217  /*D5445*/   CALL       PGM(&PGMLIB/CUSEM_CL)                                   
680.00 160127                                                                                 
681.00 990810  EXIT:       ENDPGM                                                             
