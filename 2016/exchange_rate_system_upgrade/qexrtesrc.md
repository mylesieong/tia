# Exchange Rate System Upgrade 

In this project, several sub-projects are involved. They are:
1. MTFX: A screen application that show the realtime foreign ccy tx summary  
1. GRPRATE: A imodule rewrite simliar to GCRDRATE which is added with GROUP and CHANNEL parms
1. GEXCIFGP: A RPG module wrapped with a CL that tells the group of a CIF (output: RET/CORP/VIP)
1. RTGAPP: A screen that maintenance the rate of different rate/ used by treasure
1. CRTEINQ: A update to realtime rate viewer

## MTFX: Monitor Transaction Screen Application 
```json
{
	    src:i700bcm/qexrtesrc,
		cl:	mtfxcl
			mtfxloop
			mtfxappcl
			mtfxbeg          * ref: ztmlib/dctmsrc(dctmschdl) run at the beg of day to set dtaara and kickoff sbmjob
		pf:	mtfxtxpf
			mtfxccypf
			mtfxmovpf
			mtfxaltpf        * alerting sms/email action pf
			mtfxaltrv        * alerting receiver list
		lf:	pst001im
		rpg:mtfxtx, 
			mtfxccy, 
			mtfxmov,
			mtfxalt.     
			mtfxaltsd        * alert sending
		rpg/dds: mtfxapp:mtfxappd,       *main screen
		dtaara:  mtfxcp
				 mtfxloop    *'171500 180000 000300 000015 REDAY SS              '
				 mtfxaltara
}
```

## Exchange Group Rate Enabling (GRPRATE) 
```
{
		src:    i700bcm/qexrtesrc
		rpg:    ggrprate
		cl:     ggrpratecl
        test:   ymyles1/qrtgvarsrc(bbtexcifgp)
}
```

## GEXCIFGPCL
```
{
		src:    i700bcm/qexrtesrc,
		rpg:    gexcifgrp
		cl:     gexcifgpcl
	    test:   bbtexcifgp
}
```

## RTGAPP:
```
{
		src:    i700bcm/qexrtesrc,
		cl:     RTGAPPCL
		rpg/dds:RTGAPP x RTGAPPD
				RTGAPPMNT x RTGAPPMNTD
		pf: RTGVARPF
			RTGVARLOG
			RTGCHNLST
			RTGGRPLST  
}
```

## CRTEINQ(G)
```
{
		src: I700BCM/QEXRTESRC
		cl:     CRTERPTSCL     
			    CRTERPTCL     
				CRTEINQCL      *moved to i700bcm from zchexapp
		pf:     CRTERPTP       *no changed
		    	CRTECCYLST     *no changed but need move to i700bcm
		qry:    CRTERPTQ
		rpg:    CRTERPT
		rpg/dds:CRTEINQ x CRTEINQD *moved to i700bcm 
		dtaara: CRTERPTDTA
}
```
