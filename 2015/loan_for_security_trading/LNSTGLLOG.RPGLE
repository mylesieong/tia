1.00 160426      H DATEDIT(*DMY) DATFMT(*ISO) TIMFMT(*HMS)                                  
2.00 160426      A************************************************************************* 
3.00 160426      A*  Name     :  LNSTPST                                                  * 
4.00 160622      A*  Ref ID   :  CHG-200-16 (D6200)                                       * 
5.00 160426      A*  Author   :  Myles Ieong                                              * 
6.00 160426      A*  User ID  :  BI77PGM                                                  * 
7.00 160426      A*  Date     :  26-APR-2016                                              * 
8.00 160426      A*  Purpose  :  Write log of security loan product GL posting            * 
9.00 160426      A************************************************************************* 
10.00 160426      FLNSTPF    UF   E           K DISK                                         
11.00 160426      FLNSTLOG   UF A E           K DISK                                         
11.01 160721      D*******************************************************************       
11.02 160721      D*                      Variable Definition                        *       
11.03 160721      D*******************************************************************       
13.00 160426      D TODAYYMD        S              8P 0                                      
14.00 160426      D TODAYDMY        S              6P 0                                      
15.00 160426      D TTIME           S               T                                        
16.01 160721      C*******************************************************************       
16.02 160721      C*                             Key List                            *       
16.03 160721      C*******************************************************************       
17.00 160426      C     KLNP003       KLIST                                                  
18.00 160426      C                   KFLD                    KBK               3 0          
19.00 160426      C                   KFLD                    KNOTE            12 0          
20.00 160426      C                   KFLD                    KRECIND           1            
21.00 160721      C*******************************************************************       
22.00 160721      C*                           Main Routine                          *       
23.00 160721      C*******************************************************************       
23.01 160721      C*                                                                         
23.02 160721      C*    Get today from imodule                                               
23.03 160721      C*                                                                         
25.00 160426      C                   CALL      'DICBSYMD'                                   
26.00 160426      C                   PARM                    TODAYYMD                       
26.01 160721      C                                                                          
27.00 160426      C                   CALL      'DFYYTODD'                                   
28.00 160426      C                   PARM                    TODAYYMD                       
29.00 160426      C                   PARM                    TODAYDMY                       
30.00 160426      C                   PARM                    TODAYDMYY         8 0          
32.00 160721      C*                                                                         
32.01 160721      C*    Iterate master file to update GL posting log accordingly             
32.02 160721      C*                                                                         
33.00 160426      C                   READ      LNSTPF                                       
34.00 160426      C                   DOW       NOT %EOF(LNSTPF)                             
34.01 160721      C                                                                          
36.03 160810 6200BC                   IF        LNSTFPSTGL='X'                               
38.01 160721      C**                                                                        
38.02 160721      C**   Update post fee flag in lnstpf                                       
38.03 160721      C**                                                                        
38.04 160721      C                   EVAL      LNSTFPSTGL='C'                               
39.00 160426      C                   UPDATE    RLNSTPF                                      
41.00 160721      C**                                                                        
42.00 160721      C**   Write log file                                                       
42.01 160721      C**                                                                        
43.00 160721      C                   EVAL      LNLGDTE=TODAYYMD                             
44.00 160721      C                   EVAL      LNLGTIM=%CHAR(TTIME)                         
45.00 160721      C                   EVAL      LNLGLNNOTE=LNSTLNNOTE                        
46.00 160721      C                   EVAL      LNLGRWDTE=LNSTRWDTE                          
47.00 160721      C                   EVAL      LNLGACT='G'                                  
48.00 160721      C                   EVAL      LNLGLNCMCN=LNSTLNCMCN                        
50.00 160721      C                   EVAL      LNLGCHG=LNSTPNT                              
51.00 160721      C                   EVAL      LNLGSTS='P'                                  
52.00 160721      C                   WRITE     RLNSTLOG                                     
54.00 160721      C                                                                          
55.00 160426      C                   ENDIF                                                  
57.00 160426      C                                                                          
58.00 160426      C                   READ      LNSTPF                                       
59.00 160426      C                   ENDDO                                                  
59.01 160721      C                                                                          
60.00 160426      C                   SETON                                            LR    
