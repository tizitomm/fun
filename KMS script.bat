cscript c:\windows\system32\slmgr.vbs -skms Pitt-kms-01.cssd.pitt.edu
cscript c:\windows\system32\slmgr.vbs -ato
cd c:\program files\microsoft office\office15
cscript ospp.vbs /sethst:pitt-kms-01.cssd.pitt.edu
cscript ospp.vbs /act