# GFatca: Generate Fatca required XML.

This is a as400 tool that reads pf and generate output pf that contains a xml with fatca specified format.
Prequisition: 1. User prepare the data in GFATPF
              2. GFATPARM is updated according to the fatca schema

{
    src:  ymyles1/qgfatcasrc 
    cl:   GFATPGMCL
    rpg:  GFATPGM
    pf:   GFATACCT (input- dynamic)
          GFATCUST (input- dynamic)
          GFATREL  (input- dynamic)
          GFATPAY  (input- dynamic)
          GFATPOOL (input- dynamic)
          GFATBK   (input- static)
          GFATPARM (input- static)
          GFATXML  (output)
}
