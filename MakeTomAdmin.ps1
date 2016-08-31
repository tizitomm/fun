function MakeTomAdmin {    # http://blogs.technet.com/b/heyscriptingguy/archive/2008/03/11/how-can-i-use-windows-powershell-to-add-a-domain-user-to-a-local-group.aspx

    $objuser = [ADSI]("WinNT://pitt-bradford/thn16")
    $objgroup = [ADSI]("WinNT://$env:ComputerName/Administrators")
    $objgroup.PSBase.Invoke("Add",$objuser.PSBase.Path) | out-file $up\desktop\PSMidterm.txt -append        Unregister-ScheduledTask -TaskName "MakeTommyboyAdministrator" -Confirm:$false    Remove-Item -Path "C:\MakeTomAdmin.ps1"}MakeTomAdmin