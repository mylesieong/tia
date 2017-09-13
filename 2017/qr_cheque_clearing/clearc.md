# INDEX

AMCM published a standardization format for E-Cheque and it provides a C++ Printer API to generate and print QRCODE. AMCM also provided a android apk file for phone to read and decode the cheque QRCode. My job is to draft a what-to-do-list for teh team.

## Project Object Model

### CHG PART A 
__Requisition part__
{
    cl:     qclsrc/cqncl NEW (I700BCM/QCLSRC)
    pf/lf:  qddssrc/cqnaccpf NEW
            qddssrc/cqnaccl1 NEW
            qddssrc/cqnout NEW
    rpg:    qrpgsrc/cqnaccm NEW    
            qrpgsrc/cqnext NEW
    qry:    -/cqnrpt NEW
    pf/lf:  tasorc/TAP033L2 NEW
    scrn:   tasorc/ta0601 MOD
            tasorc/ta0601FM MOD
            tasorc/ta0602FM MOD
            tasorc/ta0603 MOD
            tasorc/ta0603FM MOD

    IPROD/QCLSRC(RPTBPCOMB)
    ZOPRCRD/QCLSRC(RSTIPROD)

    # ICBS Transaction Subsystem/ Work with Cheque Book Order aks 204480 is the entrance of project 
    # ? For other screens(Modified TA0603FM but not in CHG), the wording/format for collect branch and logo are not applicable anymore, should update?
}

### CHG PART B
__qrc-decoder__

__Incoming Screen chqeuq part__
{
    src:    ZCHQLIB/QCQRSRC
    cl:     CQRIAPPCL NEW
    rpg:    CQRIAPP NEW
    dds:    CQRIAPPD NEW 
    * Plus we can the java desktop application 
}

__eXtraction part__
{
    src:ZCHQLIB/ QCQRSRC
    cl: CQRXCL NEW
    rpg:CQRXEXTS NEW
        CQRXEXTC NEW
        CQRXEXT NEW
    pf: CQRXBRN NEW * Cheque QR Extraction Branch Status Parameter Table            
        CQRXGL NEW * Cheque QR Extraction GL Account Parameter Table
        CQRXIN NEW * Cheque QR Extraction Input Txt                 
        CQRXCHQ NEW * Cheque QR Extraction Data From Cheque          
        CQRXSYS NEW * Cheque QR Extraction Data From System          
        CQRXPF NEW * Cheque QR Extraction PF                        
        CQRXENV NEW * Masterfile of envelope number
        OKFLAG NEW
    dtaara: CQRXLCK NEW
}

__Print Report Part__
{
    src: ZCHQLIB/ QCQRSRC
    cl:  CQRIRPTCL
    rpg: CQRIRPT
    prtf:CQRIRPTF
}

__Generate File Part__
{
    src: ZCHQLIB/ QCQRSRC
    cl:  CQRIGENCL NEW
    rpg: CQRIGEN NEW
    pf:  CQRIGENN NEW
         CQRIGENQ NEW
}

### CHG PART C
__Incoming: day end sweeping and update envelope part__
{
    src: ZCHQLIB/ QCQRSRC
    cl:  CQRCL NEW
         CQRXENVCL NEW
    rpg: CQRXENVU NEW
    pf:  CQRXENV REF
}

__Nextday cheque input part (cheque issued by BCM)__
{
    src:    ZCHQLIB/QSCHQSRC
    rpg:    SGENCHGDT MOD       * Add ULCHQDTAQ to process/ Writ amount from ULCHQDTAQ to SCHQWRK
            SCBATALL MOD        * Move amt from SCHQWRK to CHQHDR/CHQDTL 
            SGENBTH MOD         * Work amount from SCHQWRK to SCHQLOG
            ULQRCFMT NEW        * Format ULCHQDTAQT to ULCHQDTAQ
    pf:     SCHQWKR MOD         * Add amount field
            SCHQLOG MOD         * Add amount field
            ULCHQDTAQ NEW
            ULCHQDTAQT NEW
}

> Reference knowledge:
* Reference query: IPROD/CHQWRK- we might use query for rec matching#
* Reference query: IPROD/CHQRPT- preview query result w/ F5#
* For pf member manipulation, refers to zautopay/acpayhd# 
* Related CL Operation:
    1. `OVRDBF FILE(OVLNDATA) TOFILE(*LIBL/OVLNDATA) MBR(OVLNDATA1)   ` 
    2. ADDPFM FILE(ZCHQLIB/CQRXIN) MBR(M008) TEXT('Kin Wa Branch') #
* Use SQL to search at a temp manner:
    1. create alias myalias1 for zchqlib.cqrxin(m001) > Alias MYALIAS1 created in ZCHQLIB.                  
    2. select * from myalias1 > SELECT statement run complete.  #                       
* ftp> cd ZCHQLIB  
  ftp> put {local_file_name} CQRXIN.M003 //this code will replace #
* TLTRCR: 4 only has frmo account, is store money, 0 only has from account, is withdraw money, 6 unknown#
* 20 - current, 26 - saving#

> Latest format to vendor updated at 2017-06-09
Field Name			銀欄位		銀格式	　
1. Bank code 				銀銀行代號	3位數目字	"113"
1. Cheque type 				支票類別	3位英文字	CHQ
1. Currency Type			貨幣類別	3位英文字	　
1. Account number			户口號碼	12位數目字	　
1. Cheque number			支票號碼	7位數目字	　
1. Account name 			户口名稱	90位英文字或數字 或
										30位中文字或數字		上下两行，每行45 字數連隔位。英文字母及或數字
1. Cheque Branch			分行代號 (支票列印)	40位英文及數目字	　
1. Collection Branch		分行代號 (支票派送)	40位英文及數目字	　
1. Number of Cheque Book	支票簿數量(本)	3位數目字	
1. Number of Cheques		支票數量(每本)	3位數目字	25/50
1. Logo						Logo 代號	2位英文字或數字	置在支票右上方
“00”-nothing

## Cheque Requisition Testing Case for Milanda
...
3400457       4004590
3400457       4004590
3387356       8000001
3387356       8000002
...
3393070       8100099
3393070       8100100
3385550       8120000
3385550       8120001
...

Part I:
Case A: For sole currrent account 3398955
1. Create new cheque range from 8,100,101-8,100,125(1 x 25), expect success
1. Create new cheque range from 8,100,121-8,100,170(1 x 50), expect failure (duplicate acct chq)
1. Create new cheque range from 8,119,976-8,120,025(1 x 50), expect failure (duplicate other acct chq)
1. Delete cheque order 8,100,101-8,100,125, expect success
1. Create new cheque range from 8,100,101-8,100,150(2 x 25), expect success

Case B: For joint currrent account 3130793
1. Create new cheque range from 4,005,001-4,005,025(1 x 25), expect success
1. Create new cheque range from 4,005,021-4,005,070(1 x 50), expect failure (duplicate acct chq)
1. Create new cheque range from 7,999,976-8,000,025(1 x 50), expect failure (duplicate other acct chq)
1. Delete cheque order 4,005,001-4,005,025, expect success
1. Create new cheque range from 4,005,001-4,005,050(2 x 25), expect success

Part II:
1. Draw Report and output file

## Branch UAT Samples
* M001-M261 + M601-M840 MOP x QR
* M901-M1001 MOP x NQ
* Z001-Z123 HKD x QR
* Z201-Z220 HKD x NQ
* Distribute to:
      br mop/qr     mop/nq     hkd/qr     hkd/nq 
    * 01 M001-M006/ M901-M904/ Z001-Z006/ Z201-Z202
    * 03 M051-M056/ M905-M908/ Z007-Z012/ Z203-Z204
    * 05 M101-M106/ M909-M912/ Z013-Z018/ Z205-Z206
    * 06 M151-M156/ M913-M916/ Z019-Z024/ Z207-Z208
    * 08 M201-M206/ M917-M920/ Z025-Z030/ Z209-Z210
    * 12 M251-M256/ M921-M924/ Z031-Z036/ Z211-Z212
    * 16 M601-M606/ M925-M928/ Z037-Z042/ Z213
    * 22 M651-M656/ M929-M932/ Z043-Z048/ Z214
    * 23 M701-M706/ M933-M936/ Z049-Z054/ Z215
    * 25 M751-M756/ M937-M940/ Z055-Z060/ Z216
    * 26 M801-M806/ M941-M944/ Z061-Z066/ Z217
    * 28 M811-M816/ M945-M948/ Z067-Z072/ Z218
    * 32 M821-M826/ M949-M952/ Z073-Z078/ Z219
    * 33 M831-M836/ M953-M956/ Z079-Z084/ Z220

## Working Log
> 2016-01-25

1. Install visual studio 2012 express and install trial key generate with my personal hotmail account. Can run the project without building error starting with the \*.sln file.

1. The correct step to print the BCM cheque with QR code:
	a.  Control Panel>hardware and Sound> Devices and Printers>[Select Printer]>(menu bar)Printer>Properties>General>Preference>Page Setup (tab)>Customer Paper Size>

> 2016-12-13

1. The "Cheque Clearing Automation System" is hosted by AMCM and info package is release with password: XQ2zL(Y@

1. Document explained the new system (not just an application, but a whole set of procedure)

1. OPG enter cheque into system and we can search on BT, the description in that record will start with bank code initial and hypthen and cheque number (e.g. 110-5538492)

1. New info + software package released by AMCM (on 2016-12-15), link to download:
    https://ftp.amcm.gov.mo/?ShareToken=0C9E68430244D7A978627C915C8980F273E9A14E
	pwd for download:e9:G\3n@
	pwd for unzipped:XQ2zL(Y@
    
> 2017-02-13

1. New folder of project resource is created:
    i) ITSHARE> ITD> Banking Team> eCheque
    ii) Alliant> eCheque
    
1. We use ImageMagick's command line support to convert pdf to image, note that I use ImageMagick portable but still need to install ghostscript for pdf parsing(if convert non-pdf, wont need the ghostscript), simply type $convert a.pdf b.jpg

> 2017-05-24

1. We build the java desktop application for branch that:
    * Convert the pdf of scanned qrcode cheque to image/ use cmd line tool ImageMagick: convert.exe
    * parse the qrcode/ use a command line tool parseQRC (C#) which I develop follow the logic of decode.exe released by AMCM
    * output the csv/txt
    * Upload the csv/txt to AS400
    * _detail of the qrc-decoder java project refers to the project readme_

1. Note that for ImageMagick: convert.exe, we need to set density to 240 and enough quality otherwise the parseQRC.exe cannot read the data. Observe:
`/path/to/convert -verbose -density 240 -quality 80 -trim {target}.pdf {target}.jpg`

1. We found that the encryption for csv (AMCM) is actually base64 encoding. Simply use: `base64 -d {target}.csv` to decode

> 2017-05-29

1. User token of branches' BT server
Use VNC viewer and connect to host: b001-svr01 (for branch x, use b00x) and password: keeper01 (for branch x, use keeper0x). Then the image and the AMCM app will be on desktop, as well as the scan tool of the scanner.

1. User token of OPG to AMCM portal
Use 3/F OPG or 7/F PC to connect to AMCM private netowrk (these 2 PCs is not pingable). Login in as BCM with password AMCMAMCM. Enter the system and browse to 192.168.xxx.xxxx/xxxx, login to portal with bcm1:1.
