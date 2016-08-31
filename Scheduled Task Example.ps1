$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\AddToDomain.ps1"
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Settings = New-ScheduledTaskSettingsSet
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask "AddToDomain" -InputObject $Task -User "NT Authority\SYSTEM"

Unregister-ScheduledTask -TaskName "AddToDomain" -Confirm:$false