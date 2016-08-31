Add-Type -AssemblyName System.Speech
$synth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
$synth.Voice
$synth.GetInstalledVoices()
$synth.GetInstalledVoices().VoiceInfo
$synth.SelectVoice('Microsoft Zira Desktop')
# $synth.Speak('I am the Microsoft Zira voice! I can even say variables, such as this computer name is ' + $env:COMPUTERNAME + ' and it is being used by ' + $env:username)


function talk {
param($t)

$synth.Speak($t)
}


