1.00 160504       ************************************************************************  
2.00 160622       * REFERENCE NO. : CHG-0200-16 (D6200)                                  *  
3.00 160504       * AUTHOR        : Myles Ieong                                          *  
4.00 160504       * USER ID.      : BI77PGM                                              *  
5.00 160504       * DATE WRITTEN  : 04 May 2016                                          *  
6.00 160505       * DESCRPITION   : Update field LTRASNMN of LNSTTRAN and house-keeping  *  
7.00 160504       *                                                                      *  
8.00 160504       ************************************************************************  
9.00 160505      FTAP001B   IF   E           K DISK                                         
10.00 160504      FLNSTTRAN  UF A E           K DISK                                         
11.00 160505      D                 DS                                                       
12.00 160505      DSDSCDT                   1      8  0                                      
13.00 160505      D SDSCDTD                 1      2  0                                      
14.00 160505      D SDSCDTM                 3      4  0                                      
15.00 160505      D SDSCDTY                 5      8  0                                      
16.00 160505      D                 DS                                                       
17.00 160505      DSASNMN                   1      6  0                                      
18.00 160505      D SASNMNY                 1      4  0                                      
19.00 160505      D SASNMNM                 5      6  0                                      
20.00 160505      C     KTAP001B      KLIST                                                  
21.00 160505      C                   KFLD                    KDSBK             3 0          
22.00 160505       *******************main route*******************************************  
23.00 160505       *get year and month of last month*                                        
24.00 160505      C                   Z-ADD     0             SDSCDT                         
25.00 160505      C                   Z-ADD     0             SASNMN                         
26.00 160505      C                   MOVE      1             KDSBK                          
27.00 160505      C     KTAP001B      CHAIN     TAP001B                                      
28.00 160505      C                   IF        %FOUND(TAP001B)                              
29.00 160505      C                   EVAL      SDSCDT=DSCDT                                 
30.00 160505      C                   EVAL      SASNMNY=SDSCDTY                              
31.00 160505      C                   EVAL      SASNMNM=SDSCDTM                              
32.00 160505      C                   ENDIF                                                  
33.00 160505       *iterate lnsttran: update or delete according to LTRASNMN */              
34.00 160505      C                   READ      LNSTTRAN                                     
35.00 160505      C                   DOW       NOT %EOF(LNSTTRAN)                           
36.00 160505       *               ***update field***                                        
37.00 160510 DEV  C                   IF        LTRASNMN=0                                   
38.00 160510 DEV  C                   EVAL      LTRASNMN = SASNMN                            
39.00 160510 DEV  C                   UPDATE    RLNSTTRAN                                    
40.00 160505 DEV  C                   ENDIF                                                  
41.00 160505      C                   READ      LNSTTRAN                                     
42.00 160504      C                   ENDDO                                                  
43.00 160504      C                   SETON                                        LR        
