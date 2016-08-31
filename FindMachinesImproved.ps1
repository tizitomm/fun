 # nslookup b132-2.upb.pitt.edu 136.142.57.10

 # 136.142.57.10 -> Pittsburgh's DNS Server
 # 136.142.188.73 ->
 # 136.142.188.76 ->

 function FindComputer {

    $all = $null

    if (Test-Path $env:userprofile\Desktop\FreeMachines.txt)
    {
        Remove-Item $env:userprofile\Desktop\FreeMachines.txt
        New-Item $env:userprofile\Desktop\FreeMachines.txt -ItemType File
        Write-Output "Free machines found between 150.212.132.1 - 150.121.133.255" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
        Get-Date | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
        $env:username | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
    }
    else 
    {
        New-Item $env:userprofile\Desktop\FreeMachines.txt -ItemType File
        write-Output "Free machines found between 150.212.132.1 - 150.121.133.255" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
        Get-Date | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
    }


    $x = 132	$y = 1		while ($x -lt 134 -and $y -lt 256)		{                   if (Test-Connection 150.212.$x.$y -Quiet -ErrorAction SilentlyContinue -Count 1)            {                Write-Host 150.212.$x.$y is TAKEN!            }            else             {                $arp = ARP -a 150.212.$x.$y                if ($arp -ne "No ARP Entries Found.")                {                    Write-Output "************************************" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                                   Write-Output "" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                    $pitt = Resolve-DnsName -Name 150.212.$x.$y -Server 136.142.57.10,136.142.188.73,136.142.188.76 -ErrorAction SilentlyContinue
                    $brad = Resolve-DnsName -Name 150.212.$x.$y -Server 150.212.138.69,150.212.138.70 -ErrorAction SilentlyContinue
                    Write-Output ("Potential machine 150.212.$x.$y (no ping response)") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
                    Write-Output ("No ARP entries found for 150.212.$x.$y") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
                    Write-Output "" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
                    if ([string]::IsNullOrWhiteSpace($pitt))
                    {
                        Write-Output ("150.212.$x.$y has no DNS records from Pittsburgh`'s DNS server (136.142.57.10)") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
                        Write-Output ("150.212.$x.$y has no DNS records from Bradford`'s DNS server (150.212.138.69)") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
                        Write-Output "" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                    }                    elseif ([string]::IsNullOrWhiteSpace($brad))                    {                        Write-Output ("150.212.$x.$y has no DNS records from Bradford`'s DNS server (150.212.138.69)") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                    }                    else                     {                        Write-Output ("Pittsburgh DNS record (136.142.57.10):") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                        $pitt.Name | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                        Write-Output "" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                        Write-Output ("Bradford DNS record (150.212.138.69):") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                        $brad.Name | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                    }                }            }            if ($y -lt 256)            {                $y++                           }            if ($y -ge 255)            {                $x++                $y=1            }                  }}