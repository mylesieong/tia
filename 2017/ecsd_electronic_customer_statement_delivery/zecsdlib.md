# ECSD Project

Electronic Customer Statement Delivery application is an AS400 application that allows user maintain whether customer need e-statement or physical statement. The project include an module for public use to inquiry/create/update such records. The application is also bundle to icbs standard account-openning procedure.

One worth noting fact is that the module is developed under a test-driven mindset, which means the test comes before the module.


```
{
        src:   ZECSDLIB/QXXXSRC,
        cl:    ECSDAPPCL
               ECSDACTCL > I700bcm
               ECSDMNUCL > ZIHD
        pf:    ECSDPF 
               ECSDLOG
               ECSDCONF
               ECSDREL
        lf:    ECSDPFL1             *LF of 5 keys
        rpg/dds:    ECSDAPP:ECSDAPPD     *main screen
                    ECSDAPPMNT:ECSDAPPMND     *maintenancescreen
                    ECSDACT              *module
        test:       BBTECSDPF#
                    BBTACT
                    BBTACTCRT1
                    BBTACTCRT2
                    BBTACTDLT1
                    BBTACTDLT2
                    BBTACTINQ1
                    BBTACTUPDR
                    BBTACTUPD1
                    BBTACTUPD2
                    BBTACTUPD3
        outside-call:   I700BCM/TASORC(PTADNEW)
                        I700BCM/TASORC(PTASNEW)
                        ZVIPLIB/QRPGLESRC(CMIVIP)
}
```
