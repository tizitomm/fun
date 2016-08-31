# power settings

Get-CimInstance -Namespace root\cimv2\power -ClassName win32_PowerPlan | Select-Object ElementName, IsActive | Format-Table -AutoSize
Get-CimInstance -Namespace root\cimv2\power -ClassName win32_PowerPlan | Select-Object Elementname, IsActive | Where IsActive -eq True
