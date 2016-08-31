
# Tom Neilly
# Scripting (IS SO FUN I FREAKIN' LOVE IT)
# Midterm Powershell Scripting
# 2/26/2015

# Shortens the user profile variable to what I prefer to have it set to
Set-Variable -Name up -Value $env:USERPROFILE -Confirm:$false 

# Initially sets the IP address to the default 150.212.134.10 until we find a more appropriate unused address
Set-NetIPAddress -IPAddress "150.212.134.2" -AddressFamily IPv4 -PrefixLength 22







# Scans the 150.212.134.xxx /24 subnet for a free IP address by pinging machines
# While a test-connection of 1 packet is returned, increments the IP address by 1
# When a test-connection fails, assumes this IP address is free and creates a global
# variable of the free IP address

function FindIp {
	[int]$x = 10
	
		while (Test-Connection 150.212.134.$x -count 1 -quiet)
		{
		  echo ("150.212.134.$x is IN USE.") | out-file $up\desktop\PSMidterm.txt -append
		  $x++
		}

	echo ("150.212.134.$x is AVAILABLE")
	$global:assignIP = "150.212.134.$x" 
	echo ("$assignIP will be used for target computer.") | out-file $up\desktop\PSMidterm.txt -append
	echo ("$assignIP will be used for target computer.")
}

# Uses the global variable to assign the IP address
function AssignIP {
Set-NetIPAddress -IPAddress $assignip -AddressFamily IPv4 -PrefixLength 22
}


# Uses the Resolve-DnsName cmdlet to find an available computer name for temporary used
# until it has updates run on it and is delivered.

# Searches for computer names starting with CTMBuild1. If machine name exists,
# increments the number by one until it finds a machine that does not exist.
# Declares a global variable which will later be used to name the machine.

function FindComputerName {
	$x = 1
		while (Resolve-DnsName -Name CTMBuild$x -ErrorAction SilentlyContinue)
		{
			echo ("CTMBuild$x is being used")
			$x++	
		}
	$global:machinename = "CTMBuild$x"
	echo ("The machine name $machinename is available and will be applied.") | out-file $up\desktop\PSMidterm.txt -append
	echo ("The machine name $machinename is available and will be applied.")
}

# Sets the computer name
function SetName {
	
}

function AddToDomain {
    Add-Computer -DomainName "upb.pitt.edu" -OUPath "Computers" -NewName $machinename -Force -Credential
}

# Sends email with log attachment to Tom and Bob
function SendLog {
	param([string]$to)

	$machinename = "Temp1"
	$from = "tizitomm@gmail.com"
	#$to = "thn16@pitt.edu"
	$cc = "ellison@pitt.edu"
	$attachment = "$up\desktop\psmidterm.txt"
	$subject = "PowerShell Notification : Machine Info"
	$body = "PowerShell Notification 'n Machine Name = $machinename 'n IP Address = $assignip"

	# Retrieves my encrypted Gmail credentials from another script,
	# decrypts them, and uses them to send the email. This prevents
	# me from having any interaction and leaves things to be automated.
	$encrypted = Get-Content C:\encrypted_password1.txt | ConvertTo-SecureString
	$credential = New-Object System.Management.Automation.PsCredential($from, $encrypted)

	$smtpclient = New-Object Net.Mail.SmtpClient($smtpserver, 587)
	$smtpclient.EnableSsl = $true
	$smtpclient.Credentials = $credential
	$smtpclient.Send($from, $to, $subject, $body)

	#Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -BodyAsHTML $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $credential -Attachments $attachment
	Send-MailMessage -From $From -to $To -Subject $Subject -BodyAsHTML $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $credential -Attachments $attachment
}

# Starts calling all functions in the script
