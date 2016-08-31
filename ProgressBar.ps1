$a = Get-ChildItem \\draeger-old\c | Measure-Object -Property Length -Sum
$a.sum/1024
$a


$t = Get-ChildItem C:\users\thn16\Desktop\Test | Measure-Object -Property Length -Sum
$t.sum/1024
$t

for ($i = $t.sum;$i -lt $a.sum;$i++)
{
    $a = Get-ChildItem \\draeger-old\c | Measure-Object -Property Length -Sum
    $t = Get-ChildItem C:\users\thn16\Desktop\Test | Measure-Object -Property Length -Sum
    Write-Progress -Activity "Robocopying files.." -Status "$i GB transferred" -PercentComplete ($i / $a.sum*100)
}