1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                                      
2.00 60608      H**********************************************************************************************
3.00 170706      H* Program      : CQRXEXTSYS                                                                   
4.00 170906      H* Reference    : CHG-266-17                                                                   
5.00 170706      H* Created By   : Myles Ieong (BI77PGM)                                                        
6.00 170706      H* Changed Date : 06 Jul 2017                                                                  
7.00 170706      H* Description  : Extract data from PST00101 to CQRXSYS by branch                              
8.00 60608      H**********************************************************************************************
9.00 170706      F**********************************************************************                        
10.00 170706      F*                         File Specification                         *                        
11.00 170706      F**********************************************************************                        
12.00 170706      FCQRXSYS   UF A E           K DISK                                                             
13.00 170706      FPST00101  IF   E           K DISK                                                             
14.00 170706      F*                                                                                             
15.00 170706      C**********************************************************************                        
16.00 170706      C*                         Parameter List                             *                        
17.00 170706      C**********************************************************************                        
18.00 60517      C     *ENTRY        PLIST                                                                      
19.00 170706      C                   PARM                    PBRN              5 0                              
20.00 170706      C**********************************************************************                        
21.00 170706      C*                         Main Routine                               *                        
22.00 170706      C**********************************************************************                        
23.00 170706       *    Extract QR Cheque posting record to CQRXSYS                                              
24.00 170706      C/EXEC SQL                                                                                     
25.00 170706      C+ INSERT INTO CQRXSYS (CXSTLTTIM, CXSTLTBRN, CXSTLTCUR, CXSTLTTC,                             
26.00 170706      C+     CXSTLTAL1, CXSTLTUSR, CXSTLTWS, CXSTLTAPP, CXSTLTACT,                                   
27.00 170706      C+     CXSTLTTIL, CXSTLTSSN, CXSTLTNBR, CXSTLTBSQ, CXSTLTCOR,                                  
28.00 170906      C+     CXSTLTCSQ, CXSTLTCD)                                                                    
29.00 170706      C+ SELECT TLTTIM, TLTBRN, TLTCUR, TLTTC,                                                       
30.00 170706      C+     TLTAL1, TLTUSR, TLTWS, TLTAPP, TLTACT,                                                  
31.00 170706      C+     TLTTIL, TLTSSN, TLTNBR, TLTBSQ, TLTCOR,                                                 
32.00 170906      C+     TLTCSQ, TLTCD                                                                           
33.00 170906      C+ FROM PST00101                                                                               
34.00 170706      C+ WHERE TLTPST = 'P' AND substr(tltal1,4,1) = '-'                                             
35.00 170706      C+     AND substr(tltal1,1,3) in (                                                             
36.00 170911 D7266C+         SELECT DIGITS(TBNKCOD) FROM TBANK                                                   
37.00 170706      C+     )                                                                                       
38.00 170706      C+     AND TLTCOR = ' ' AND TLTCSQ = 0 AND tltal1 like '%#Q%'                                  
39.00 170706      C+     AND (                                                                                   
40.00 170706      C+         (TLTAPP IN ('20','26')                                                              
41.00 170706      C+         AND tltam2+tltam3+tltam4+tltam5 <> 0)                                               
42.00 170706      C+         OR                                                                                  
43.00 170706      C+         (TLTAPP = '40'                                                                      
44.00 170706      C+         AND TLTTC <> 0                                                                      
45.00 170706      C+         AND TLTACT IN (                                                                     
46.00 170706      C+             SELECT CXGACC FROM CQRXGL                                                       
47.00 170706      C+         )                                                                                   
48.00 170706      C+         AND TLTRCR IN ('0','1','2','3','4','5')                                             
49.00 170706      C+         )                                                                                   
50.00 170706      C+     )                                                                                       
51.00 170706      C+     AND TLTBRN = :PBRN                                                                      
52.00 170706      C/END-EXEC                                                                                     
53.00 170706      C                                                                                              
54.00 170706       *     Extract Non-QR Cheque posting record to CQRXSYS                                         
55.00 170706      C/EXEC SQL                                                                                     
56.00 170706      C+ INSERT INTO CQRXSYS (CXSTLTTIM, CXSTLTBRN, CXSTLTCUR, CXSTLTTC,                             
57.00 170706      C+     CXSTLTAL1, CXSTLTUSR, CXSTLTWS, CXSTLTAPP, CXSTLTACT,                                   
58.00 170706      C+     CXSTLTTIL, CXSTLTSSN, CXSTLTNBR, CXSTLTBSQ, CXSTLTCOR,                                  
59.00 170906      C+     CXSTLTCSQ, CXSTLTCD)                                                                    
60.00 170706      C+ SELECT TLTTIM, TLTBRN, TLTCUR, TLTTC,                                                       
61.00 170706      C+     TLTAL1, TLTUSR, TLTWS, TLTAPP, TLTACT,                                                  
62.00 170706      C+     TLTTIL, TLTSSN, TLTNBR, TLTBSQ, TLTCOR,                                                 
63.00 170906      C+     TLTCSQ, TLTCD                                                                           
64.00 170906      C+ FROM PST00101                                                                               
65.00 170706      C+ WHERE TLTPST = 'P' AND substr(tltal1,4,1) = '-'                                             
66.00 170706      C+     AND substr(tltal1,1,3) in (                                                             
67.00 170911 D7266C+         SELECT DIGITS(TBNKCOD) FROM TBANK                                                   
68.00 170706      C+     )                                                                                       
69.00 170706      C+     AND TLTCOR = ' ' AND TLTCSQ = 0 AND tltal1 not like '%#Q%'                              
70.00 170706      C+     AND (                                                                                   
71.00 170706      C+         (TLTAPP IN ('20','26')                                                              
72.00 170706      C+         AND tltam2+tltam3+tltam4+tltam5 <> 0)                                               
73.00 170706      C+         OR                                                                                  
74.00 170706      C+         (TLTAPP = '40'                                                                      
75.00 170706      C+         AND TLTTC <> 0                                                                      
76.00 170706      C+         AND TLTACT IN (                                                                     
77.00 170706      C+             SELECT CXGACC FROM CQRXGL                                                       
78.00 170706      C+         )                                                                                   
79.00 170706      C+         AND TLTRCR IN ('0','1','2','3','4','5')                                             
80.00 170706      C+         )                                                                                   
81.00 170706      C+     )                                                                                       
82.00 170706      C+     AND TLTBRN = :PBRN                                                                      
83.00 170706      C/END-EXEC                                                                                     
84.00 170706      C                                                                                              
85.00 170706      C                   SETON                                        LR                            
86.00 170706       **                                                                                            
