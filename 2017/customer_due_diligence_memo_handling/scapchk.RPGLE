1.00 140604      /*************************************************************/                                
2.00 160318      /*   FILE      : SCAPCHK                                     */                                
3.00 160401      /*   REFERENCE : CHG-069-16                                  */                                
4.00 140604      /*   USER      : BG58 Wine Chan                              */                                
5.00 160318      /*   DATE      : 18 Mar 2016                                 */                                
6.00 160318      /*   PURPOSE   : Security Check On Application PGM           */                                
8.00 140604      /*************************************************************/                                
9.00 140604      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                      
10.00 140604       **************************************************************************                    
11.00 140604       * File Specification                                                     *                    
12.00 140604       **************************************************************************                    
13.00 160318      FSCAPGRP   IF   E           K DISK                                                             
15.00 160318      FSCAPPARM  IF   E           K DISK                                                             
17.00 140604       **************************************************************************                    
18.00 140604       * DEFINE VARIABLE                                                        *                    
19.00 140604       **************************************************************************                    
23.01 140604      D FLAG            S              1A                                                            
23.02 160318      D KUSERID         S             10A                                                            
23.03 160331      D KOPT            S             10A                                                            
23.04 160318      D KACT            S              3A                                                            
23.05 140827      D KAPRTY          S              4S 0                                                          
23.06 150616      D KBANK           S              3S 0 INZ(1)                                                   
23.07 150618      D KACCT           S             10  0                                                          
26.07 140605       *                                                                                             
28.00 140604       **************************************************************************                    
28.01 140604       * KEY DEFINE                                                             *                    
28.02 140604       **************************************************************************                    
28.03 160318       * Key of SCAPGRP                                                                              
28.04 160318      C     KSCAPGRP      KLIST                                                                      
28.05 160318      C                   KFLD                    KUSERID                                            
28.07 150616      C                                                                                              
28.08 160318       * Key of SCAPPARM                                                                             
28.09 160318      C     KSCAPPARM     KLIST                                                                      
28.11 160318      C                   KFLD                    KUSERID                                            
28.12 160331      C                   KFLD                    KOPT                                               
28.13 160318      C                   KFLD                    KACT                                               
28.14 160318      C                                                                                              
28.15 140604       **************************************************************************                    
28.16 140604       * MAIN ROUTINE                                                           *                    
28.17 140604       **************************************************************************                    
28.18 160318      C                                                                                              
28.19 160318      C     *ENTRY        PLIST                                                                      
28.20 160318      C                   PARM                    iUSERID          10                                
28.21 160318      C                   PARM                    iAPP             10                                
28.22 160318      C                   PARM                    iOPT             10                                
28.23 160318      C                   PARM                    iACT              3                                
28.24 160318      C                   PARM                    iBRN              5                                
28.25 160318      C                   PARM                    oRTN              1                                
28.26 160318      C                                                                                              
28.27 160318      C                   EVAL      oRTN = 'N'                                                       
28.28 160318      C                   EVAL      FLAG = 'N'                                                       
28.29 160318      C                   EVAL      KUSERID = iUSERID                                                
28.30 160331      C                   EVAL      KOPT = iOPT                                                      
28.31 160318      C                   EVAL      KACT = iACT                                                      
28.32 160318      C     KSCAPPARM     CHAIN     SCAPPARM                                                         
28.33 160318      C                   IF        %FOUND(SCAPPARM)                                                 
28.34 160318      C                   EVAL      oRTN = 'Y'                                                       
28.35 160318      C                   ENDIF                                                                      
28.36 140730      C                                                                                              
28.37 160318      C                   IF        oRTN = 'N'                                                       
28.38 160321      C     KSCAPGRP      CHAIN     SCAPGRP                                                          
28.39 160321      C                   IF        %FOUND(SCAPGRP)                                                  
28.40 160318      C                   EVAL      FLAG = 'Y'                                                       
28.41 160321      C                   EVAL      KUSERID = *BLANK                                                 
28.42 160321      C                   MOVEL     SGGRP         KUSERID                                            
28.43 160318      C                   ENDIF                                                                      
28.44 160318      C                   ENDIF                                                                      
28.45 160318      C                                                                                              
28.46 160318      C                   IF        FLAG = 'Y'                                                       
28.47 160318      C     KSCAPPARM     CHAIN     SCAPPARM                                                         
28.48 160318      C                   IF        %FOUND(SCAPPARM)                                                 
28.49 160318      C                   EVAL      oRTN = 'Y'                                                       
29.00 160318      C                   ENDIF                                                                      
29.01 160321      C                   ENDIF                                                                      
60.00 160331      C                                                                                              
61.00 140605      C                   SETON                                        LR                            
