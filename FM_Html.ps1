 # nslookup b132-2.upb.pitt.edu 136.142.57.10

 # 136.142.57.10 -> Pittsburgh's DNS Server
 # 136.142.188.73 ->
 # 136.142.188.76 ->

function addrow {param($row, $all)$all += $row
}

 function FindComputer {

    $all = $null
    $body = $null
    $global:allmachine = $null
    $global:allpittfinal = $null
    $global:allbradfinal = $null

    if (Test-Path $env:userprofile\Desktop\FreeMachines.txt)
    {
        Remove-Item $env:userprofile\Desktop\FreeMachines.txt
        New-Item $env:userprofile\Desktop\FreeMachines.txt -ItemType File
        Write-Output "Free machines found between 150.212.132.1 - 150.121.133.255" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
        Get-Date | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
    }
    else 
    {
        New-Item $env:userprofile\Desktop\FreeMachines.txt -ItemType File
        write-Output "Free machines found between 150.212.132.1 - 150.121.133.255" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
        Get-Date | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
    }
    
    if (Test-Path $env:userprofile\Desktop\FreeMachines.csv)
    {
        Remove-Item $env:userprofile\Desktop\FreeMachines.csv
        New-Item $env:userprofile\Desktop\FreeMachines.csv -ItemType File    
    }

    else
    {
        New-Item $env:userprofile\Desktop\FreeMachines.csv -ItemType File    
    }


    $x = 132	$y = 1		while ($x -lt 134 -and $y -lt 256)		{                   $machine = "150.212.$x.$y"            if (Test-Connection 150.212.$x.$y -Quiet -ErrorAction SilentlyContinue -Count 1)            {                Write-Host 150.212.$x.$y is TAKEN!            }            else             {                Write-Host 150.212.$x.$y may be AVAILABLE                $arptest = ARP -a 150.212.$x.$y                if ($arptest -eq "No ARP Entries Found.")                {                    $arp = "No ARP Entries Found."                    Write-Output "************************************" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                                   Write-Output "" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                    $pitt = Resolve-DnsName -Name 150.212.$x.$y -Server 136.142.57.10,136.142.188.73,136.142.188.76 -ErrorAction SilentlyContinue
                    $brad = Resolve-DnsName -Name 150.212.$x.$y -Server 150.212.138.69,150.212.138.70 -ErrorAction SilentlyContinue                    $pittfinal = Resolve-DnsName -Name 150.212.$x.$y -Server 136.142.57.10,136.142.188.73,136.142.188.76 -ErrorAction SilentlyContinue
                    $bradfinal = Resolve-DnsName -Name 150.212.$x.$y -Server 150.212.138.69,150.212.138.70 -ErrorAction SilentlyContinue
                    Write-Output ("Potential machine 150.212.$x.$y (no ping response)") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
                    Write-Output ("No ARP entries found for 150.212.$x.$y") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append

                    if ([string]::IsNullOrWhiteSpace($pitt))
                    {
                        $pittfinal = "No DNS records from Pittsburgh`'s DNS server (136.142.57.10)"
                        Write-Output ("150.212.$x.$y has no DNS records from Pittsburgh`'s DNS server (136.142.57.10)") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
                        Write-Output "" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                    }                    elseif ([string]::IsNullOrWhiteSpace($brad))                    {                        $bradfinal = "No DNS records from Bradford`'s DNS server (150.212.138.69)"                        Write-Output ("150.212.$x.$y has no DNS records from Bradford`'s DNS server (150.212.138.69)") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append
                        Write-Output "" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                    }                    else                     {                        Write-Output ("Pittsburgh DNS record (136.142.57.10)") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                        $pittfinal | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                        Write-Output "" | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                        Write-Output ("Bradford DNS record (150.212.138.69)") | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                        $bradfinal | Out-File $env:userprofile\Desktop\FreeMachines.txt -Append                    }$all = @()$row = New-Object PSObject
$row | Add-Member -MemberType NoteProperty -Name "IP Address" -Value $machine
$row | Add-Member -MemberType NoteProperty -Name "Pitt DNS" -Value $pitt.Name
$row | Add-Member -MemberType NoteProperty -Name "Bradford DNS" -Value $brad.Name
$all += $row
$all | Export-Csv "$env:userprofile\desktop\FreeMachines.csv" -NoTypeInformation -Append

                }                            }                                                if ($y -lt 256)            {                $y++                           }            if ($y -ge 255)            {                $x++                $y=1            }          }

       MakeHtml
       Add-Type -AssemblyName System.Windows.Forms
       [System.Windows.Forms.MessageBox]::Show("All potentially unused machines have been found and have been saved into Freemachines.txt, FreeMachines.csv, and a FreeMachines.html on your desktop. I suggest viewing the HTML page for best readability.","Free Machines!");
}function MakeHTML {

$all = Import-Csv $env:userprofile\Desktop\FreeMachines.csv

$Header = @"
<h1> These are machines not responding to ping and have no ARP entries.</h1>
<style>
TABLE {border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;padding: 2px}
TH {border-width: 1px;padding: 10px;border-style: solid;border-color: black;background-color: yellow;}
TD {border-width: 1px;padding: 10px;border-style: solid;border-color: black;}
FOOTER {color:blue;font-size: 180%; margin-top: 20px;}
</style>
<title>
Open Machines
</title>
"@

$body = $all | ConvertTo-Html

$footer = @" 
<footer style=color:blue; font-align:center;>Created by Tom Neilly for CTM Services</footer>
"@

ConvertTo-HTML -Head $header -Body $body -PostContent $footer -As List | out-file $env:userprofile\desktop\MachineReport.html}FindComputer