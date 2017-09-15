1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                  
2.00 60608      H**************************************************************************
3.00 170818      H* Program      : ULQRCFMT                                                 
4.00 170906      H* Reference    : CHG-266-17                                               
5.00 170317      H* Created By   : Myles Ieong (BI77PGM)                                    
6.00 170818      H* Changed Date : 18 Aug 2017                                              
7.00 170818      H* Description  : Upload file of QR Code Formating Program                 
8.00 160825      H*                                                                         
9.00 160825      H**************************************************************************
10.00 170818      FULCHQDTAQ UF A E           K DISK                                         
11.00 170818      FULCHQDTAQTUF A E           K DISK                                         
12.00 170317      C**************************************************************************
13.00 170317      C*                         Main Routine                                   *
14.00 170317      C**************************************************************************
15.00 170906      C     *ENTRY        PLIST                                                  
16.00 170906      C                   PARM                    PCCY              3            
17.00 170906      C                                                                          
18.00 170906       *    Polish ULCHQDTAQT format (Rmv HEX)                                   
19.00 170818      C/EXEC SQL                                                                 
20.00 170818      C+ UPDATE ULCHQDTAQT                                                       
21.00 170818      C+ SET CLTCHQ = REPLACE(CLTCHQ, X'05', ' '),                               
22.00 170818      C+     CLTAMT = REPLACE(CLTAMT, X'05', ' '),                               
23.00 170822      C+     CLTOACT = REPLACE(CLTOACT, X'05', ' '),                             
24.00 170830      C+     CLTENV = REPLACE(CLTENV, X'05', ' ')                                
25.00 170906      C+ WHERE RRN(ULCHQDTAQT) <> 1 AND CLTCPET = :PCCY                          
26.00 170818      C/END-EXEC                                                                 
27.00 170818      C                                                                          
28.00 170818       *    Write QR record to ULCHQDTAQ (w/o first row)                         
29.00 170821      C/EXEC SQL                                                                 
30.00 170821      C+ INSERT INTO ULCHQDTAQ                                                   
31.00 170821      C+     (CLQOBNK, CLQTYP, CLQCPET, CLQCHQ,                                  
32.00 170821      C+     CLQAMT, CLQONAM, CLQOACT, CLQENV)                                   
33.00 170821      C+ SELECT ZONED(CLTOBNK), CLTTYP, CLTCPET, ZONED(CLTCHQ),                  
34.00 170821      C+        ZONED(CLTAMT, 13, 2), CLTONAM, ZONED(CLTOACT), CLTENV            
35.00 170821      C+ FROM ULCHQDTAQT                                                         
36.00 170906      C+ WHERE RRN(ULCHQDTAQT) <> 1 AND CLTCPET = :PCCY                          
37.00 170906      C/END-EXEC                                                                 
38.00 170906      C                                                                          
39.00 170906       *    Delete processed record                                              
40.00 170906      C/EXEC SQL                                                                 
41.00 170906      C+ DELETE FROM ULCHQDTAQT                                                  
42.00 170906      C+ WHERE RRN(ULCHQDTAQT) <> 1 AND CLTCPET = :PCCY                          
43.00 170906      C/END-EXEC                                                                 
44.00 170906      C                   SETON                                        LR        
45.00 170303      C**                                                                        
