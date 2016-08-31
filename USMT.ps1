
$os = Get-WmiObject Win32_OperatingSystem

if ($os.Name -like '*2012*') 
{
    Write-Host "OS is Windows Server 2012"
    Get-Win8ADK
    Invoke-WebRequest "download.microsoft.com/download/9/9/F/99f5e440-5eb5-4952-9935-b99662c3df70/adk/adksetup.exe" -OutFile "$env:userprofile\desktop\adksetup.exe"
    Start-Process $env:userprofile\desktop\adksetup.exe

}
else
{
    Write-Host "OS is Windows 7"
    Get-Win7ADK
}

