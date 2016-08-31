@echo off

set /p smode="Would you like to reboot your computer into safemode? y/n"

If /I "%smode%"=="y" goto yes
If /I "%smode%"=="n" goto no

:yes
echo.
echo Okay, your machine will be restarted into safemode.
echo.
bcdedit /set {current} safeboot network
goto :done

:no
echo.
echo Okay, your machine will not be restarted into safemode.
echo.
goto done

:done

netsh interface show interface
set /p var2="Which network adapter would you like to assign the static IP address to?"

echo.
echo Your IP address will be 150.212.134.xxx
echo.


set /p var="Enter last octet if the IP address you'd like to use:"

echo Setting the "%var2%" to IP 150.212.134.%var%

netsh int ip set address "%var2%" static 150.212.134.%var% 255.255.252.0 150.212.132.1
netsh int ip set dns "%var2%" static 150.212.138.69
netsh interface ip add dns name="%var2%" addr=150.212.138.70 index=2

echo Mapping X: drive to \\servy.upb.pitt.edu\programs$

net use x: \\servy.upb.pitt.edu\programs$

pause
echo Downloading virus removal tools from \\servy.upb.pitt.edu\programs$

mkdir %homepath%\Desktop\VirusRemovalTools
robocopy x:\VirusRemovalTools %homepath%\Desktop\VirusRemovalTools
cd %homepath%\Desktop\VirusRemovalTools
start %homepath%\desktop\VirusRemovalTools


If /I "%smode%"=="n" goto launch
If /I "%smode%"=="y" goto reboot

:launch
echo Rkill and Unhide will now be launched!
echo.
echo.
pause
start VirusRemovalTools
rkill.exe
unhide.exe
goto :finish

:reboot
echo.
echo Restarting in safemode now...
echo.
echo.
pause
shutdown -r

:finish
pause
exit