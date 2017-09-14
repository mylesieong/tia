1.00 100805 /************************************************************************/                          
2.00 161020 /* PROGRAM ID   : ECSDPGMCL                                             */                          
3.00 160727 /* REFERENCE    : CHG-xxx-16 (D6xxx)                                    */                          
4.00 160727 /* AUTHOR       : Myles Ieong                                           */                          
5.00 160727 /* Written Date : BI77PGM                                               */                          
6.00 170112 /* DESCRIPTION  : Unit test for ECSDACT in TDD                          */                          
7.00 100805 /************************************************************************/                          
8.00 161020              PGM                                                                                    
9.00 160727                                                                                                     
10.00 170112  /*tst-inq1: inq a record #record exist/non-exist */                                                
11.00 170112              CALL       PGM(BBTACTINQ1)                                                             
12.00 170112                                                                                                     
13.00 170112  /*tst-upd1: upd an acc from Y to B #record e/non-e +                                               
14.00 170113                                     #vip cons flag Y/N      */                                      
15.00 170113              CALL       PGM(BBTACTUPD1)                                                             
16.00 170112                                                                                                     
17.00 170112  /*tst-upd2: upd an acc from B to Y #record e/non-e +                                               
18.00 170113                                    #vip cons flag Y/N      */                                       
19.00 170113              CALL       PGM(BBTACTUPD2)                                                             
20.00 170112                                                                                                     
21.00 170113  /*tst-upd3: upd an vip from Y to B and B to Y #record e/non-e +                                    
22.00 170113                                     #vip cons flag Y/N      */                                      
23.00 170113              CALL       PGM(BBTACTUPD3)                                                             
24.00 170112                                                                                                     
25.00 170112  /*tst-crt1: crt an acc  #record e/non-e +                                                          
26.00 170116                          #acc (in)dependent to vip */                                               
27.00 170113              CALL       PGM(BBTACTCRT1)                                                             
28.00 170112                                                                                                     
29.00 170116  /*tst-crt2: crt an vip  #record e/non-e */                                                         
30.00 170116              CALL       PGM(BBTACTCRT2)                                                             
31.00 170112                                                                                                     
32.00 170112  /*tst-dlt1: dlt an acc  #record e/non-e +                                                          
33.00 170112                          #vip is active/inactive +                                                  
34.00 170112                          #ebank is on/off */                                                        
35.00 170116              CALL       PGM(BBTACTDLT1)                                                             
36.00 170112                                                                                                     
37.00 170112  /*tst-dlt2: dlt an vip  #record e/non-e +                                                          
38.00 170112                          #vip is active/inactive +                                                  
39.00 170112                          #ebank is on/off */                                                        
40.00 170116              CALL       PGM(BBTACTDLT2)                                                             
41.00 160727                                                                                                     
42.00 161025              ENDPGM                                                                                 
