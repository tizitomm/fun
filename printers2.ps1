
$printername = "Brother MFC-9970CDW"
$PrinterIP = "150.212.135.203"
$PrinterPort = "9100"
$PrinterPortName = "IP_" + $PrinterIP
$DriverPath = "C:\Users\thn16\desktop\drivers!\printers\windows 8.1\brother\MFC-9970DN\oemfxa5c.inf"
$DriverInf = "C:\Users\thn16\desktop\drivers!\printers\windows 8.1\brother\MFC-9970DN\oemfxa5c.inf"

Add-Printer -ComputerName $env:COMPUTERNAME -Name $printername -DriverName $printername -PortName $printerIP 
Add-PrinterDriver -ComputerName $env:COMPUTERNAME -Name $printername -InfPath $DriverInf
#Add-PrinterPort -ComputerName $env:computername -Name $printername -

Add-Printer -ComputerName $env:COMPUTERNAME -Name $printername -PortName $printerIP 