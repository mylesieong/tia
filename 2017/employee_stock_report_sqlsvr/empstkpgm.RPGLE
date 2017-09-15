1.00 160614      *************************************************************************                      
2.00 170126       * REFERENCE NO. : CHG-0048-17 (D7048)                                                         
3.00 170126       * AUTHOR        : Myles Ieong                                                                 
4.00 170126       * USER ID.      : BI77PGM                                                                     
5.00 170126       * DATE WRITTEN  : 26 JAN 2017                                                                 
6.00 170126       * DESCRPITION   : Employee Stock Tx Report Retreive SQL Svr Data                              
7.00 160614       ************************************************************************                      
8.00 160614      H DATEDIT(*YMD) DATFMT(*ISO) TIMFMT(*HMS)                                                      
9.00 0      H DFTACTGRP(*NO)                                                                               
10.00 0      H OPTION(*NODEBUGIO:*SRCSTMT)                                                                  
11.00 0      H BNDDIR('JDBC')                                                                               
12.00 160614       ************************************************************************                      
13.00 160614       * File Specification                                                                          
14.00 160614       ************************************************************************                      
15.00 160907      FRDBPARM   IF   E           K DISK                                                             
16.00 170209      FEMPSTKTX  UF   E           K DISK                                                             
17.00 160908       /copy qrpglesrc,jdbc_h                                                                        
18.00 160614      D conn            S                   like(Connection)                                         
19.00 160614      D rs              S                   like(ResultSet)                                          
20.00 170209      D prop            S                   like(Properties)                                         
21.00 160614      D prepstm         S                   like(PreparedStatement)                                  
22.00 160907      DECEXPNO          S              1S 0 INZ(1)                                                   
23.00 170126      DAppID            S              3S 0 INZ(6)                                                   
24.00 170207      DQRYSTR           S              1A   INZ('T')                                                 
25.00 160812      DOpFlag           S              1A                                                            
26.00 160830      DPARM1            S             40A   VARYING INZ                                              
27.00 160830      DPARM2            S             40A   VARYING INZ                                              
28.00 160830      DPARM3            S             40A   VARYING INZ                                              
29.00 160830      DPARM4            S             40A   VARYING INZ                                              
30.00 170126      DVCOL1            S             20A                                                            
31.00 160614       *************************************************************************                     
32.00 160614       * Main routine                                                                                
33.00 160614       *************************************************************************                     
34.00 0                                                                                                     
35.00 170126       /free                                                                                         
36.00 0          *inlr = *on;                                                                               
37.00 0                                                                                                     
38.00 170209          //Prepare the SQL Server connection param                                                  
39.00 170209          CHAIN AppID RDBPARM;                                                                       
40.00 170209          IF %FOUND(RDBPARM);                                                                        
41.00 170209            PARM1 = %TRIM(RDPARM1);                                                                  
42.00 170209            PARM2 = %TRIM(RDPARM2);                                                                  
43.00 170209            PARM3 = %TRIM(RDPARM3);                                                                  
44.00 170209            PARM4 = %TRIM(RDPARM4);                                                                  
45.00 170209          ENDIF;                                                                                     
46.00 160830                                                                                                     
47.00 170209          // Set up CLASSPATH before starting JVM                                                    
48.00 170209          prop = JDBC_Properties();                                                                  
49.00 170209          JDBC_setProp(prop: 'User': PARM1);                                                         
50.00 170209          JDBC_setProp(prop: 'Password': PARM2);                                                     
51.00 170209          JDBC_setProp(prop: 'DatabaseName': PARM3);                                                 
52.00 111230                                                                                                     
53.00 170209          conn = JDBC_ConnProp('com.microsoft.sqlserver.jdbc.SQLServerDriver'                        
54.00 160830                              : PARM4                                                                
55.00 111230                              : prop );                                                              
56.00 170209          JDBC_freeProp(prop);                                                                       
57.00 0                                                                                                     
58.00 170209          if (conn = *NULL);                                                                         
59.00 170209            return;                                                                                  
60.00 170209          endif;                                                                                     
61.00 0                                                                                                     
62.00 0          // Prepare SQL statement string to select case ID                                          
63.00 170209          prepstm = JDBC_prepStmt(conn:                                                              
64.00 170209            'select TOP 1 order_input_user'+                                                         
65.00 170209            '  from trade_bss_daily'+                                                                
66.00 170209            '  where bss_order_id = ?' +                                                             
67.00 170209            '  order by trade_date, bss_order_id');                                                  
68.00 160727                                                                                                     
69.00 170209          if (prepstm = *NULL);                                                                      
70.00 170209            jdbc_close(conn);                                                                        
71.00 170209            return;                                                                                  
72.00 170209          endif;                                                                                     
73.00 0                                                                                                     
74.00 170209          SETLL *START EMPSTKTX;                                                                     
75.00 170209          READ EMPSTKTX;                                                                             
76.00 170209          DOW NOT %EOF(EMPSTKTX);                                                                    
77.00 170209            // Set SQL parameter values                                                              
78.00 170209            JDBC_SetStringC(prepstm:1:%TRIM(ETIBSSREF):*OFF);                                        
79.00 0                                                                                                     
80.00 170209            // Query the database                                                                    
81.00 120113            rs = jdbc_ExecPrepQry(prepstm);                                                          
82.00 0                                                                                                     
83.00 170209            // Fetch result                                                                          
84.00 160614            DOW jdbc_nextRow(rs) ;                                                                   
85.00 170209              VCOL1       = jdbc_getColC(rs:1);                                                      
86.00 160614            ENDDO;                                                                                   
87.00 170209                                                                                                     
88.00 170209            IF (VCOL1 <> '');                                                                        
89.00 170209              ETINPUSR = VCOL1;                                                                      
90.00 170209              UPDATE REMPSTKTX;                                                                      
91.00 170209              VCOL1 = '';                                                                            
92.00 170209            ENDIF;                                                                                   
93.00 170209                                                                                                     
94.00 170209            READ EMPSTKTX;                                                                           
95.00 170209                                                                                                     
96.00 170209          ENDDO;                                                                                     
97.00 160728                                                                                                     
98.00 170209          JDBC_FreeResult(rs);                                                                       
99.00 170209          JDBC_FreePrepStmt(prepstm);                                                                
100.00 170209          JDBC_Close(conn);                                                                          
101.00 0                                                                                                     
102.00 0       /end-free                                                                                     
103.00 120203      C                   SETON                                            LR                        
