Remove-Item $env:USERPROFILE\desktop\VirusRemovalTools -Confirm:$False -ErrorAction SilentlyContinue -Recurse
Remove-Item C:\VirusRemovalTools -Confirm:$False -ErrorAction SilentlyContinue -Recurse

mkdir $env:USERPROFILE\desktop\VirusRemovalTools

if (Test-Path $env:USERPROFILE\desktop\)
    {
        $global:savepath = "$env:USERPROFILE\desktop\VirusRemovalTools"
    }
elseif (Test-Path C:)
    {
        $global:savepath = "C:\VirusRemovalTools"
    }

$combofix = Invoke-WebRequest http://www.bleepingcomputer.com/download/combofix/dl/12/
$combofix = $combofix.Links | Where href -like http://down*exe
$combofix = $combofix.Href

Write-Host "Downloading ComboFix..." -ForegroundColor Cyan
Invoke-WebRequest $combofix -OutFile $savepath\combofix.exe

Write-Host "Downloading RKill..." -ForegroundColor Cyan
Invoke-Webrequest download.bleepingcomputer.com/grinler/rkill.exe  -OutFile $savepath\rkill.exe

Write-Host "Downloading Unhide..." -ForegroundColor Cyan
Invoke-WebRequest download.bleepingcomputer.com/grinler/unhide.exe -OutFile $savepath\unhide.exe

Write-Host "Downloading SuperANTISpyware..." -ForegroundColor Cyan
Invoke-WebRequest http://cdn.superantispyware.com/SUPERAntiSpyware.exe -OutFile $savepath\SUPERAntiSpyware.exe

Write-Host "Downloading MalwareBytes..." -ForegroundColor Cyan
Invoke-WebRequest http://downloads.malwarebytes.org/file/mbam/ -OutFile  $savepath\mbam-setup-2.1.6.1022.exe

$adwcleaner = Invoke-WebRequest http://www.bleepingcomputer.com/download/adwcleaner/dl/125/
$adwcleaner = $adwcleaner.Links | Where href -like http://down*exe
$adwcleaner = $adwcleaner.Href

Write-Host "Downloading AdwCleaner..." -ForegroundColor Cyan
Invoke-WebRequest $adwcleaner -OutFile $savepath\adwcleaner_4.200.exe

Write-Host "Downloading JRT (Junkware Removal Tool)..." -ForegroundColor Cyan
Invoke-WebRequest http://thisisudax.org/downloads/JRT.exe -OutFile $savepath\junkwareRemovalTool.exe

Write-Host "Downloading SpyBot 2..." -ForegroundColor Cyan
Invoke-WebRequest www.spybotupdates.biz/files/spybot-2.4.exe -OutFile $savepath\Spybot.exe

Write-Host "Downloading HitmanPro..." -ForegroundColor Cyan
Invoke-WebRequest dl.surfright.nl/HitmanPro_x64.exe -OutFile $savepath\hitmanpro.exe

Write-Host "Downloading Emsisoft Emergency Kit..." -ForegroundColor Cyan
Invoke-WebRequest dl.emsisoft.com/EmsisoftEmergencyKit.exe -OutFile $savepath\EmsisoftEmergencyKit.exe


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("Downloads are complete. Please check $savepath for your downloads.","Complete!")
start $savepath
