$shell = New-Object -ComObject "Shell.Application"
$folder = $shell.Namespace('C:\Program Files\Microsoft Office\Office15')
$item = $folder.Parsename('excel.exe')
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
if ($verb) {$verb.DoIt()}

$folder = $shell.Namespace('C:\Program Files\Microsoft Office\Office15')
$item = $folder.Parsename('winword.exe')
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
if ($verb) {$verb.DoIt()}

$folder = $shell.Namespace('C:\Program Files\Microsoft Office\Office15')
$item = $folder.Parsename('powerpnt.exe')
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
if ($verb) {$verb.DoIt()}

$folder = $shell.Namespace('C:\Program Files (x86)\Mozilla Firefox')
$item = $folder.Parsename('firefox.exe')
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
if ($verb) {$verb.DoIt()}

