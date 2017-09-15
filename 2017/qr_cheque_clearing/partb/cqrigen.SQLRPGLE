1.00 60608      H DATFMT(*ISO) DATEDIT(*YMD) TIMFMT(*HMS)                                                      
2.00 170906      H**************************************************************************                    
3.00 170906      H* Program      : CQRIGEN                                                 *                    
4.00 170906      H* Reference    : CHG-266-17                                              *                    
5.00 170906      H* Created By   : Myles Ieong (BI77PGM)                                   *                    
6.00 170906      H* Changed Date : 17 Mar 2017                                             *                    
7.00 170906      H* Description  : Cheque QR Incoming Generate QR/NQ AMCM Format Files     *                    
8.00 170906      H*                                                                        *                    
9.00 170906      H**************************************************************************                    
10.00 170317      FCQRXPF    IF   E           K DISK                                                             
11.00 170719      FCQRIGENQ  UF A E           K DISK                                                             
12.00 170719      FCQRIGENN  UF A E           K DISK                                                             
13.00 170317      C**************************************************************************                    
14.00 170317      C*                         Main Routine                                   *                    
15.00 170317      C**************************************************************************                    
16.00 170912      C                                                                                              
17.00 170912 D7266 *    Write QR header                                                                          
18.00 170912 D7266C/EXEC SQL                                                                                     
19.00 170912 D7266C+ INSERT INTO CQRIGENQ                                                                        
20.00 170912 D7266C+ (CIQOBNK,CIQTYP,CIQCPET,CIQCHQ,CIQTC,CIQONAM,CIQOACT,CIQENV)                                
21.00 170912 D7266C+ VALUES(1, 2, 3, 4, 5, 6, 7, 8)                                                              
22.00 170912 D7266C/END-EXEC                                                                                     
23.00 170912      C                                                                                              
24.00 170719       *    Write QR record to CQRIGENQ                                                              
25.00 170317      C/EXEC SQL                                                                                     
26.00 170719      C+ INSERT INTO CQRIGENQ                                                                        
27.00 170317      C+ (CIQOBNK,CIQTYP,CIQCPET,CIQCHQ,CIQTC,CIQONAM,CIQOACT,CIQENV)                                
28.00 170719      C+ SELECT CXOBNK, CXTYP, CXCPET, CXCHQ, CXAMT, CXONAM, CXOACT, CXENV                           
29.00 170317      C+ FROM CQRXPF                                                                                 
30.00 170719      C+ WHERE CXTYP = 'CHQ'                                                                         
31.00 170719      C+       AND CXSTS = 'M'                                                                       
32.00 170317      C/END-EXEC                                                                                     
33.00 170316      C                                                                                              
34.00 170912 D7266 *    Write NQ header                                                                          
35.00 170912 D7266C/EXEC SQL                                                                                     
36.00 170912 D7266C+ INSERT INTO CQRIGENN                                                                        
37.00 170912 D7266C+ (CINOBNK, CINBNK, CINCPET, CINQTY, CINAMT)                                                  
38.00 170912 D7266C+ VALUES(1, 2, 3, 4, 5)                                                                       
39.00 170912 D7266C/END-EXEC                                                                                     
40.00 170912      C                                                                                              
41.00 170719       *    Write NQ record(summary) to CQRIGENN                                                     
42.00 170317      C/EXEC SQL                                                                                     
43.00 170719      C+ INSERT INTO CQRIGENN                                                                        
44.00 170317      C+ (CINOBNK, CINBNK, CINCPET, CINQTY, CINAMT)                                                  
45.00 170719      C+ SELECT CXOBNK, 113, CXCPET, COUNT(*), SUM(CXAMT)                                            
46.00 170317      C+ FROM CQRXPF                                                                                 
47.00 170719      C+ WHERE CXTYP <> 'CHQ'                                                                        
48.00 170719      C+       AND CXSTS = 'M'                                                                       
49.00 170317      C+ GROUP BY CXOBNK, CXCPET                                                                     
50.00 170317      C/END-EXEC                                                                                     
51.00 170317      C                                                                                              
52.00 170303      C                   SETON                                        LR                            
53.00 170303      C**                                                                                            
