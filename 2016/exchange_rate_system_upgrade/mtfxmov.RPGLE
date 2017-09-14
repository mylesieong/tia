1.00 160823      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 160511       ************************************************************************  
3.00 160823       * REFERENCE NO. : CHG-0250-16 (D6250)                                  *  
4.00 160511       * AUTHOR        : Myles Ieong                                          *  
5.00 160511       * USER ID.      : BI77PGM                                              *  
6.00 160511       * DATE WRITTEN  : 11 May 2016                                          *  
7.00 160511       * DESCRPITION   : Extract currency position                            *  
8.00 160511       *                                                                      *  
9.00 160511       ************************************************************************  
10.00 160912      FMTFXTXPFL1UF A E           K DISK                                         
11.00 160909      FMTFXMOVPF UF A E           K DISK                                         
12.00 160725      C*****************************************************************         
13.00 160725      C*                        KEY DEFINE                             *         
14.00 160725      C*****************************************************************         
15.00 160909      C     KMTFXMOVPF    KLIST                                                  
16.00 160906      C                   KFLD                    MFTXDT                         
17.00 160823      C                   KFLD                    KCCY              3 0          
18.00 160906      C*                                                                         
19.00 160823      C*****************************************************************         
20.00 160823      C*                       MAIN ROUTINE                            *         
21.00 160823      C*****************************************************************         
22.00 160909      C                   READ      MTFXTXPFL1                                   
23.00 160909      C                   DOW       NOT %EOF(MTFXTXPFL1)                         
24.00 160906      C                                                                          
25.00 160909      C                   IF        MFTXFMOV = 'P'                               
26.00 160909      C                                                                          
27.00 160823       **   Update ccy movement from the FROM side                               
28.00 160823      C                   MOVE      MFTXCUR       KCCY                           
29.00 160909      C     KMTFXMOVPF    CHAIN     MTFXMOVPF                                    
30.00 160909      C                   IF        %FOUND(MTFXMOVPF)                            
31.00 160512      C                   EVAL      MFPSAMT = MFPSAMT + MFTXTC                   
32.00 160512      C                   EVAL      MFPSLCE = MFPSLCE + MFTXLCE                  
33.00 160909      C                   UPDATE    RMTFXMOVPF                                   
34.00 160511      C                   ELSE                                                   
35.00 160906      C                   EVAL      MFPSDTE = MFTXDT                             
36.00 160823      C                   EVAL      MFPSCHL = MFTXCHN                            
37.00 160512      C                   EVAL      MFPSCUR = MFTXCUR                            
38.00 160823      C                   EVAL      MFPSPET = MFTXPET                            
39.00 160823      C                   EVAL      MFPSAMT = MFTXTC                             
40.00 160823      C                   EVAL      MFPSTAMT = 0                                 
41.00 160823      C                   EVAL      MFPSLCE = MFTXLCE                            
42.00 160823      C                   EVAL      MFPSTLCE = 0                                 
43.00 160909      C                   WRITE     RMTFXMOVPF                                   
44.00 160823      C                   ENDIF                                                  
45.00 160823      C                                                                          
46.00 160823       **   Update ccy movement from TO side                                     
47.00 160823      C                   MOVE      MFTXTCUR      KCCY                           
48.00 160909      C     KMTFXMOVPF    CHAIN     MTFXMOVPF                                    
49.00 160909      C                   IF        %FOUND(MTFXMOVPF)                            
50.00 160519      C                   EVAL      MFPSTAMT = MFPSTAMT + MFTXTTC                
51.00 160512      C                   EVAL      MFPSTLCE = MFPSTLCE + MFTXTLCE               
52.00 160909      C                   UPDATE    RMTFXMOVPF                                   
53.00 160511      C                   ELSE                                                   
54.00 160906      C                   EVAL      MFPSDTE = MFTXDT                             
55.00 160823      C                   EVAL      MFPSCHL = MFTXCHN                            
56.00 160512      C                   EVAL      MFPSCUR = MFTXTCUR                           
57.00 160823      C                   EVAL      MFPSPET = MFTXTPET                           
58.00 160512      C                   EVAL      MFPSAMT = 0                                  
59.00 160512      C                   EVAL      MFPSTAMT = MFTXTTC                           
60.00 160512      C                   EVAL      MFPSLCE = 0                                  
61.00 160913      C                   EVAL      MFPSTLCE = MFTXTLCE                          
62.00 160909      C                   WRITE     RMTFXMOVPF                                   
63.00 160511      C                   ENDIF                                                  
64.00 160511      C                                                                          
65.00 160912       *    Update master file action flag                                       
66.00 160912      C                   EVAL      MFTXFMOV='C'                                 
67.00 160912      C                   UPDATE    RMTFXTXPF                                    
68.00 160912      C                                                                          
69.00 160909      C                   ENDIF                                                  
70.00 160909      C                                                                          
71.00 160909      C                   READ      MTFXTXPFL1                                   
72.00 160823      C                                                                          
73.00 160511      C                   ENDDO                                                  
74.00 160823      C                                                                          
75.00 160511      C                   SETON                                        LR        
