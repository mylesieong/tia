# Exchange Group Rate Enabling (GRPRATE) and Transaction Monitoring (MTFX)

* A list of program and screen which input from PST00101 to 3 pfs about transaction
* Screen to present that 3 pfs
* All screen action are inquiry 
{
	source-file: {
		old-location:	ymyles1/qmtfxsrc,
		new-location:	i700bcm/qexrtesrc,
		cl:	[mtfxcl, 
			mtfxloop, 
			mtfxappcl,
			mtfxbeg          * ref: ztmlib/dctmsrc(dctmschdl) run at the beg of day to set dtaara and kickoff sbmjob
			]
		pf:	[mtfxtxpf, 
			mtfxccypf, 
			mtfxmovpf,
			mtfxaltpf        * alerting sms/email action pf
			mtfxaltrv        * alerting receiver list
			]
		lf:	[pst001im
			]
		rpg:[mtfxtx, 
			mtfxccy, 
			mtfxmov,
			mtfxalt.     
			mtfxaltsd        * alert sending
			]
		rpg/dds:[mtfxapp:mtfxappd,       *main screen
				]
		dtaara: [mtfxcp
				 mtfxloop    *'171500 180000 000300 000015 REDAY SS              '
				 mtfxaltara
				 ]
	}
	
}

## GGRPRATECL:
* A imodule rewrite simliar to GCRDRATE which is added with GROUP and CHANNEL parms
{
	source-file: {
		old-location:ymyles1/qrtgvarsrc,
		new-loaction:i700bcm/qexrtesrc, 
		rpg-source: [ggrprate]
		cl-source: [ggrpratecl]
	}
	
	old-lible:[ymyles1
			icbsbcmdb1
			imodule
			qgpl
			qtemp
		]
	new-lible: [i700bcm
				icbsbcmdb1
				imodule
				qgpl
				qtemp
				]
}

#
**program: ymyles1/qrtgvarsrc(bbtexcifgp)
**standard output cases:
a. a cif 0000125695 do C transaction from MOP to USD through ECHAN, result should be: 00001248003 (11P7)
b. a cif 0000125695 do C transaction from MOP to USD through normal channel, result should be: 00001248393 
c. a cif 0000125695 do T transaction from HKD to GBP through ECHAN, result should be:  .08938059
d. a cif 0000125695 do T transaction from HKD to GBP through normal channel, result should be:  0.0894397 (read glc002 for everythng)
e. a cif 0000125695 do T transaction from USD to HKD through ECHAN, result should be: 7.73730695 
f. a cif 0000125695 do T transaction from USD to HKD through normal channel, result should be: 7.7464077
**not found output cases:
g. no cif, group CORP and ECHAN, doing C from MOP to USD, result should be: 00001248392 (11P7)
h. no cif, group CORP and No Channel, doing C from MOP to USD, result should be: 00001248393
i. no cif, no group and ECHAN, doing C from MOP to USD, result should be: 0000124839269
j. no cif, no group and no channel, doing C from MOP to USD, result should be: 00001248393
k. a cif 0000125695, group RET and ECHAN doing C from MOP to USD, result should be: 00001248003

## GEXCIFGPCL:
* A RPG wrapped with a CL that tells the group of a CIF
* RET/CORP/VIP
{
	source-file: {
		old-location: ymyles1/qrtgvarsrc
		new-loaction:i700bcm/qexrtesrc,
		rpg-source: [gexcifgrp]
		cl-source: [gexcifgpcl]
	}
	
	black-box-test: bbtexcifgp
	
	old-lible: [YMYLES1
			ICBSBCMDB1
			QGPL
			QTEMP]
			
	new-lible: [I700BCM
			ICBSBCMDB1
			QGPL
			QTEMP]
}

#
**program: ymyles1/qrtgvarsrc(bbtexcifgp)
**standard output cases:
a. a cif 0000308633 should be VIP
   verify: Y
b. a cif 0000010936 should be RET
   verify: Y
c. a cif 0000010944 should be CORP
   verify: Y
**not found output cases:
a. a cif 0000012174 should be not found
   verify: Y

## RTGAPP:
{
	source-file: {
		location:	i700bcm/qexrtesrc,
		cl: [RTGAPPCL
			]
		rpg/dds:[RTGAPP x RTGAPPD
				RTGAPPMNT x RTGAPPMNTD]
		pf: [RTGVARPF
			RTGVARLOG
			RTGCHNLST
			RTGGRPLST  
			]
	}
}

## CRTEINQ(G)
{
	source-file: {
		OLD-location: ymyles1/qrtgvarsrc
		location: I700BCM/QEXRTESRC
		cl-source: [CRTERPTSCL     
					CRTERPTCL     
					CRTEINQCL      *moved to i700bcm from zchexapp
					]
		pf-source: [CRTERPTP       *no changed
					CRTECCYLST     *no changed but need move to i700bcm
					],     
		qry-soruce:[CRTERPTQ],     
		rpg-source:[CRTERPT]       
		rpg/dds: [CRTEINQ x CRTEINQD] *moved to i700bcm 
		dtaara: [CRTERPTDTA]
	}
}

