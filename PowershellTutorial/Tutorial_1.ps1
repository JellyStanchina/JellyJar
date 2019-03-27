

Function Stuff
{

get-date | Get-Member

$NameList=’John’,’Charlotte’,’Sean’,’Colleen’,’Namoli’,’Maura’,’Neula’
Get-Random -InputObject $NameList



# Provide Folder name and create
$Folder=’C:\src\JellyJar\PowershellTutorial\Demo’

New-Item -ItemType Directory -Path $Folder -Force

# Create a series of 10 files
for ($x=0;$x -lt 100; $x++)
{
    # Let’s create a completely random filename
    $filename=”$($Folder)\$((Get-Random 100000).tostring()).txt”

    # Now we’ll create the file with some content
    Add-Content -Value ‘Just a simple demo file’ -Path $filename
}

[byte][char]'A'



(Get-Random 23) + 1



[char][byte]((Get-Random 64)+32)


# Digits 0-9
for ($i=48;$i -lt 58;$i++)
{
    [char][byte]$i
}


# Lowercase letters
for ($i=97;$i -lt 123;$i++)
{
    [char][byte]$i
}

# Uppercase leters
for ($i=65;$i -lt 91;$i++)
{
    [char][byte]$i
}



$randomFileName=''
$characterAmount = (Get-Random 1024) +1

for($i=0 ; $i -lt $characterAmount ; $i++)
{
    $randomFileName=$randomFileName+[char][byte]((Get-Random 24)+97)
}

WRITE-HOST $characterAmount
WRITE-HOST $randomFileName

$randomFileName=''


$tuturialFolder=’C:\src\JellyJar\PowershellTutorial\Demo’
$randomFileName = "$($tuturialFolder)\LogFile_$((Get-Random 100000).ToString()).txt"

Write-Host $randomFileName



$timeDifference = New-TimeSpan -Minutes 30
Set-Date -Adjust $timeDifference

Stop-Computer -WhatIf
Stop-Computer -ComputerName 'Foo','Bar','Blat' -WhatIf
Get-Help Stop-Computer
Get-Help Restart-Computer

Restart-Computer -WhatIf

Get-Help Get-Date -Online


# https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings
Get-Date -DisplayHint Time
Get-Date -Format g
Get-Date -Format G
Get-Date -Format d
Get-Date -Format D
Get-Date -Format f
Get-Date -Format F

Get-Date -UFormat "%Y / %m / %d / %A / %Z"


(Get-Date -Year 2000 -Month 12 -Day 31).DayOfYear


$nowDate = Get-Date
$nowDate.IsDaylightSavingTime()
$nowDate.ToUniversalTime()

Write-Host $env:ComputerName


$objBios = Get-WmiObject Win32_Bios -ComputerName $env:ComputerName
$objBios | `
    Format-List -Property `
        Name, `
        @{Label="BIOS Age";Expression={(Get-Date) - $_.ConvertToDateTime($_.ReleaseDate)}}
        
        
# Pipes the DateTime to a TXT file
Get-Date -Format F | Add-Content Test.txt



Get-Date -Format o

$myTimeStamp = Get-Date -Format o | foreach {$_ -replace ":", "."}
Write-Host $myTimeStamp
mkdir $myTimeStamp
$myTimeStamp | Add-Content Test.txt


Get-Help Get-Date
Get-Date -Date 03/15/1969
Get-Date -Day 21
Get-Date -Month 2 -Day 31

Get-Date -DisplayHint Time

Get-Date -Hour 23


# UFormat
# https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/Get-Date?view=powershell-3.0
# Notes Section

DateTimeUFormatDisplay -strDisplayType 'Default' -listLetterArg 'c'
DateTimeUFormatDisplay -strDisplayType 'Date' -listLetterArg 'D','x'
DateTimeUFormatDisplay -strDisplayType 'Year' -listLetterArg 'C','Y','y','G','g'
DateTimeUFormatDisplay -strDisplayType 'Month' -listLetterArg 'b','B','h','m'
DateTimeUFormatDisplay -strDisplayType 'Week' -listLetterArg 'W','V','U'
DateTimeUFormatDisplay -strDisplayType 'Day' -listLetterArg 'a','A','u','d','e','j','w'
DateTimeUFormatDisplay -strDisplayType 'Time' -listLetterArg 'p','r','R','T','X','Z','H','I','k','l','M','S','s'


}



# Establish to the Voice Comobject
$voiceAPI=New-Object -comobject SAPI.SPVoice

# Speed up the rate of the Speaker’s voice
$voiceAPI.Rate=3

# Obtain the list of voices in Windows 10
$voiceFont=$voiceAPI.GetVoices()

# Establish a table to match the Microsoft voices with the names of the comedians
$nameMatch=@{‘Abbott:’ = ‘ZIRA’; ‘Costello:’ = ‘DAVID’ }

# Retrieve a massive string from the Internet for T2S
$RawSketch=Invoke-WebRequest `
    -Uri ‘http://www.abbottandcostellofanclub.com/whos-on-first/’ `
    -UseBasicParsing

$CR=[char][byte]13
$LF=[char][byte]10
$Tab=[char][byte]9
$RawSketchContent=$RawSketch.Content
$RawSketchContent=$RawSketchContent.Replace($cr+$lf+$tab,’ ‘)
$SketchArray=$rawsketchcontent.split(“`r”)
$StartofSketch=$SketchArray | Select-string -SimpleMatch ‘<PRE>’ | Select-Object -expandproperty LineNumber
$EndofSketch=$SketchArray | Select-string -SimpleMatch ‘</PRE>’ | Select-Object -expandproperty LineNumber

$CognitiveSpeakers=@()
$CognitiveSpeakers+=’BUD:;en-AU;”Microsoft Server Speech Text to Speech Voice (en-AU, Catherine)”‘
$CognitiveSpeakers+=’LOU:;en-IE;”Microsoft Server Speech Text to Speech Voice (en-IE, Shaun)”‘

$CurrentSpeaker=’Nobody’
$TempVoiceFilename=’whoisonfirst.wav’

For ($a=$StartofSketch+1; $a -lt $EndofSketch; $a++)
{
    Remove-Item $TempVoiceFilename -Force -ErrorAction SilentlyContinue
    $LinetoSpeak=$sketcharray[$a-1]
    $SearchForSpeaker=(($LinetoSpeak | Select-String -Pattern ‘[a-zA-Z]+(:)’).Matches)
    $LinetoSpeakStart=1

    If ($SearchForSpeaker -ne $NULL)
    {
        $Speaker=$SearchForSpeaker[0].Value
        $LinetoSpeakStart=$SearchForSpeaker[0].Index + $SearchForSpeaker[0].Length + 5

        If ($Speaker -ne $CurrentSpeaker)
        {
            $CurrentSpeaker = $Speaker
            $RawSpeakerData=$CognitiveSpeakers -match $CurrentSpeaker
            $SpeakerData=$RawSpeakerData.split(';')
            $Region=$SpeakerData[1]
            $Voice=$SpeakerData[2]
            $Name=$SpeakerData[0]
        }

        If ($LinetoSpeak.Length -gt 1)
        {
            $LinetoSpeak.replace('','').replace('','')
            $Content=$LineToSpeak.Substring($LinetoSpeakStart).replace('','').replace('','')
            Invoke-AzureTextToSpeech `
                -Region $Region `
                -Content $Content `
                -Voice $Voice `
                -Filename $TempVoiceFilename
            Do { } until (Test-Path $TempVoiceFilename)
            Play-MediaFile -filename $TempVoiceFilename
            Start-Sleep -Milliseconds 1000
        }
    }
}





Function Play-MediaFile($Filename)
{
    $PlayMedia=New-object System.Media.Soundplayer
    $PlayMedia.SoundLocation=($Filename)
    $PlayMedia.playsync()
}


Function Invoke-AzureTextToSpeech($Region,$Voice,$Content,$Filename)

{

    # Obtain Access Token to communicate with Voice API
    # I erased mine, you'll have to get your own ;)
    $APIKey='00000000000000000000000000000000'
    $AccessToken=Invoke-RestMethod `
        -Uri "https://api.cognitive.microsoft.com/sts/v1.0/issueToken" `
        -Method 'POST' `
        -ContentType 'application/json' `
        -Headers @{'Ocp-Apim-Subscription-Key' = $APIKey }

    # Generate GUID for Access
    # Just use this Cmdlet to generate a new one (New-Guid).tostring().replace('-','')
    $XSearchAppId='00000000000000000000000000000000'

    # Just use this Cmdlet to generate a new one (New-Guid).tostring().replace('-','')
    $XSearchClientId='00000000000000000000000000000000'

    # Current list of Audio formats for Azure Text to Speech
    # HTTP Headers X-Microsoft-OutputFormat
    # https://docs.microsoft.com/en-us/azure/cognitive-services/speech/api-reference-rest/bingvoiceoutput
    $AudioFormats=( `
        'ssml-16khz-16bit-mono-tts', `
        'raw-16khz-16bit-mono-pcm', `
        'audio-16khz-16kbps-mono-siren', `
        'riff-16khz-16kbps-mono-siren', `
        'riff-16khz-16bit-mono-pcm', `
        'audio-16khz-128kbitrate-mono-mp3', `
        'audio-16khz-64kbitrate-mono-mp3', `
        'audio-16khz-32kbitrate-mono-mp3' `
    )

    # WAV File format
    $AudioOutputType=$AudioFormats[4]
    $UserAgent='PowerShellForAzureCognitiveApp'
    $Header=@{ `
        'Content-Type' = 'application/ssml+xml'; `
        'X-Microsoft-OutputFormat' = $AudioOutputType; `
        'X-Search-AppId' = $XSearchAppId; `
        'X-Search-ClientId' = $XSearchClientId; `
        'Authorization' = $AccessToken `
    }

    $Body=''+$Content+''

    Invoke-RestMethod `
        -Uri "https://speech.platform.bing.com/synthesize" `
        -Method 'POST' `
        -Headers $Header `
        -ContentType 'application/ssml+xml' `
        -Body $Body `
        -UserAgent $UserAgent `
        -OutFile $Filename

}









Function DateTimeUFormatDisplay
{
    Param ($strDisplayType , $listLetterArg)

    Write-Host "`n`n********************************************************************************************"
    Write-Host $strDisplayType "`n"

    ForEach ($letterArg in $listLetterArg)
    {
        Write-Host $LetterArg":" (Get-Date -UFormat %$LetterArg)
    }
}




