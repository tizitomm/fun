

function maketarget {write-host ("making target") -ForegroundColor Green}


if (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    MakeTarget
}
else 
{
    Add-Type -AssemblyName System.Windows.Forms    $output = [System.Windows.Forms.MessageBox]::Show("You are not running as Administrator. Please restart the script as Administrator.","Not an Admin!")        if ($output -eq 'OK')    {        exit    }}