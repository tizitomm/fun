﻿function MakeTomAdmin {

    $objuser = [ADSI]("WinNT://pitt-bradford/thn16")
    $objgroup = [ADSI]("WinNT://$env:ComputerName/Administrators")
    $objgroup.PSBase.Invoke("Add",$objuser.PSBase.Path) | out-file $up\desktop\PSMidterm.txt -append