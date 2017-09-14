1.00 160823      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 160511       ************************************************************************  
3.00 160906       * REFERENCE NO. : CHG-0250-16 (D6250)                                  *  
4.00 160511       * AUTHOR        : Myles Ieong                                          *  
5.00 160511       * USER ID.      : BI77PGM                                              *  
6.00 160511       * DATE WRITTEN  : 11 May 2016                                          *  
7.00 160725       * DESCRPITION   : Extract ccy summary from master file                 *  
8.00 160511       *                                                                      *  
9.00 160511       ************************************************************************  
10.00 160912      FMTFXTXPFL1UF A E           K DISK                                         
11.00 160909      FMTFXCCYPF UF A E           K DISK                                         
12.00 160906      C*****************************************************************         
13.00 160531      C*                        KEY DEFINE                             *         
14.00 160531      C*****************************************************************         
15.00 160909      C     KMTFXCCYPF    KLIST                                                  
16.00 160906      C                   KFLD                    MFTXDT                         
17.00 160512      C                   KFLD                    MFTXCUR                        
18.00 160512      C                   KFLD                    MFTXTCUR                       
19.00 160906      C*                                                                         
20.00 160823      C*****************************************************************         
21.00 160531      C*                       MAIN ROUTINE                            *         
22.00 160531      C*****************************************************************         
23.00 160909      C                   READ      MTFXTXPFL1                                   
24.00 160906      C                                                                          
25.00 160909      C                   DOW       NOT %EOF(MTFXTXPFL1)                         
26.00 160614      C                                                                          
27.00 160909      C                   IF        MFTXFCCY = 'P'                               
28.00 160909      C                                                                          
29.00 160909      C                   IF        MFTXCUR <> MFTXTCUR                          
30.00 160909      C                                                                          
31.00 160909      C     KMTFXCCYPF    CHAIN     MTFXCCYPF                                    
32.00 160909      C                   IF        %FOUND(MTFXCCYPF)                            
33.00 160512      C                   EVAL      MFCYAMT = MFCYAMT + MFTXTC                   
34.00 160512      C                   EVAL      MFCYTAMT = MFCYTAMT + MFTXTTC                
35.00 160614      C                   EVAL      MFCYLCYE = MFCYLCYE + MFTXLCE                
36.00 160906      C                   EVAL      MFCYFRT = MFCYAMT/MFCYTAMT                   
37.00 160909      C                   UPDATE    RMTFXCCYPF                                   
38.00 160621      C                   ELSE                                                   
39.00 160906       *    If new, chk criteria n create new pair                               
40.00 160906      C                   EVAL      MFCYDTE = MFTXDT                             
41.00 160512      C                   EVAL      MFCYCUR = MFTXCUR                            
42.00 160823      C                   EVAL      MFCYPET = MFTXPET                            
43.00 160512      C                   EVAL      MFCYTCUR = MFTXTCUR                          
44.00 160823      C                   EVAL      MFCYTPET = MFTXTPET                          
45.00 160512      C                   EVAL      MFCYAMT = MFTXTC                             
46.00 160512      C                   EVAL      MFCYTAMT = MFTXTTC                           
47.00 160614      C                   EVAL      MFCYLCYE = MFTXLCE                           
48.00 160906      C                   EVAL      MFCYFRT = MFCYAMT/MFCYTAMT                   
49.00 160909      C                   WRITE     RMTFXCCYPF                                   
50.00 160511      C                   ENDIF                                                  
51.00 160511      C                                                                          
52.00 160909       *    Update master file process flag                                      
53.00 160909      C                   EVAL      MFTXFCCY = 'C'                               
54.00 160909      C                   UPDATE    RMTFXTXPF                                    
55.00 160909      C                                                                          
56.00 160913      C                   ELSE                                                   
57.00 160913      C                                                                          
58.00 160913       *    Update master file process flag                                      
59.00 160913      C                   EVAL      MFTXFCCY = 'N'                               
60.00 160913      C                   UPDATE    RMTFXTXPF                                    
61.00 160913      C                                                                          
62.00 160913      C                   ENDIF                                                  
63.00 160823      C                                                                          
64.00 160909      C                   ENDIF                                                  
65.00 160909      C                                                                          
66.00 160909      C                   READ      MTFXTXPFL1                                   
67.00 160823      C                                                                          
68.00 160511      C                   ENDDO                                                  
69.00 160906      C                                                                          
70.00 160511      C                   SETON                                        LR        
