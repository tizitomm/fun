
# What you want to name the printer
$name = "HP LaserJet 2055DN"

# Driver name = exactly how it shows in Windows Update
$driverName = "HP LaserJet P205X series PCL6 Class Driver"
$portName = "9100"
$printerIP = "150.212.135.200"

Add-PrinterPort -Name $name -PrinterHostAddress "150.212.135.200"
Add-PrinterDriver -Name $name -InfPath "C:\users\thn16\Desktop\Drivers!\Printers\Windows Server 2012 Datacenter R2\HP\LaserJet P2055dn"

Add-Printer -ComputerName B132-2 -Name $name -DriverName $driverName -PortName $printerIP


