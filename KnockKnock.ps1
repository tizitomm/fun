    Add-Type -AssemblyName System.Speech
    $synth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
    $synth.Voice
    $synth.GetInstalledVoices()
    $synth.GetInstalledVoices().VoiceInfo
    $synth.SelectVoice('Microsoft Zira Desktop')
    $synth.Speak('Knock knock..')
    $synth.SelectVoice('Microsoft David Desktop')
    $synth.Speak('Whos there?')
    $synth.SelectVoice('Microsoft Zira Desktop')
    $synth.Speak('Art')
    $synth.SelectVoice('Microsoft David Desktop')
    $synth.Speak('Art who?')
    $synth.SelectVoice('Microsoft Zira Desktop')
    $synth.Speak('R2D2!')
    Start-Sleep -Seconds .5
    $synth.Rate = 45
    $synth.SelectVoice('Microsoft David Desktop')
    $synth.Speak('Ha ha ha ha Ha ha ha ha Ha ha ha ha')
    $synth.SelectVoice('Microsoft Zira Desktop')
    $synth.Speak('te he he he He he he he He he he he')
    $synth.SelectVoice('Microsoft Hazel Desktop')
    $synth.Rate = 0
    $synth.Speak('You guys are so lame')

