1.00 100805 /************************************************************************/                          
2.00 160825 /* PROGRAM ID   : ECSDAPPCL                                             */                          
3.00 160727 /* REFERENCE    : CHG-xxx-16 (D6xxx)                                    */                          
4.00 160727 /* AUTHOR       : Myles Ieong                                           */                          
5.00 160727 /* Written Date : BI77PGM                                               */                          
6.00 160825 /* DESCRIPTION  :                                                       */                          
7.00 100805 /************************************************************************/                          
8.00 160727              PGM                                                                                    
9.00 160727                                                                                                     
10.00 161101              DCL        VAR(&WRKLIB) TYPE(*CHAR) LEN(10) VALUE('YMYLES1')                           
11.00 161101              DCL        VAR(&RMVWRKLIB) TYPE(*CHAR) LEN(1) VALUE('Y')                               
12.00 160727                                                                                                     
13.00 161101              ADDLIBLE   LIB(&WRKLIB)                                                                
14.00 161101              MONMSG     MSGID(CPF2103) EXEC(CHGVAR VAR(&RMVWRKLIB) VALUE('N'))                      
15.00 160727                                                                                                     
15.01 161103              CLRPFM     FILE(GFATXML)                                                               
16.00 161101              CALL       PGM(GFATPGM)                                                                
17.00 160727                                                                                                     
18.00 161101              IF         COND(&RMVWRKLIB *EQ 'Y') THEN(RMVLIBLE LIB(&WRKLIB))                        
19.00 160727                                                                                                     
20.00 160727              ENDPGM                                                                                 
