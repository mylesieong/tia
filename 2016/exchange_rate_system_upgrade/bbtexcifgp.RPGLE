1.00 110308      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                  
1.01 160715      C                   CALL      'GEXCIFGPCL'                                 
2.00 160610      C*******************test case 1a*******************************************
3.00 160610      C* a cif 0000308633 should be VIP                                          
5.00 160715      C*                  PARM      '0000308633'  PCIF             10            
7.00 160610      C*******************test case 1b*******************************************
8.00 160715      C* a cif 0000010936 should be RET                                          
10.00 160715      C*                  PARM      '0000010936'  PCIF             10            
12.00 160610      C*******************test case 1c*******************************************
13.00 160715      C* a cif 0000010944 should be RET (although CORP seg but not in mup030)    
15.00 160715      C*                  PARM      '0000010944'  PCIF             10            
16.01 160715      C*******************test case 1c*******************************************
16.02 160715      C* a cif 0000034630 should be CORP (active in mup030)                      
16.04 160715      C*                  PARM      '0000034630'  PCIF             10            
16.06 160715      C*******************test case 1c*******************************************
16.07 160715      C* a cif 0000062138 should be RET (inactive in mup030)                     
16.08 160715      C*                  PARM      '0000062138'  PCIF             10            
17.00 160610      C*******************test case 2a*******************************************
18.00 160610      C* a cif 0000012174 should be not found                                    
20.00 160715      C                   PARM      '0000012174'  PCIF             10            
21.00 160715      C                   PARM                    PCHANNEL          6            
22.00 160610      C                   PARM                    PGROUP            6            
23.00 160610      C                   PARM                    PSTATUS           1            
24.00 160610      C     PGROUP        DSPLY                                                  
25.00 160610      C     PSTATUS       DSPLY                                                  
26.00 160606      C                   SETON                                        LR        
