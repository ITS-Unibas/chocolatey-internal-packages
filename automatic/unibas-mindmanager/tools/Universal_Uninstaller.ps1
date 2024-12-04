<#
    .Synopsis
    Universal Uninstaller fuer EXE/MSI Installationen
    .DESCRIPTION
    Deinstalliert automatisiert saemtliche Installationen eines angegebenen Programmes.
    .PARAMETER ProgramName
    Programmname, welches in der Registry gesucht wird
    .PARAMETER ProzessNames
    Prozessnamen, welche geschlossen werden
    .PARAMETER AdditFolderName
    Es wird in folgenden Verzeichnissen (ProgramData, ProgramFiles, Programfiles(x86)) nach Ordnern gesucht, die dem AdditFolderName entsprechen und geloescht
    .PARAMETER EXEArgumente
    Silentparameter, welche fï¿½r EXE Deinstallationen verwendet werden sollen
    .PARAMETER DeleteFolder
    Es wird in folgenden Verzeichnissen (ProgramData, ProgramFiles, Programfiles(x86)) nach Ordnern gesucht, die dem Programmnamen entsprechen und geloescht
    .PARAMETER SI
    Skip InitialScript, wenn gesetzt
    .PARAMETER SF
    Skip FinallyScript, wenn gesetzt
    .PARAMETER SIS
    Skip Inventory Scan, wenn gesetzt
    .PARAMETER MS
    Erweitert den Default MSI Silent Parameter
    .NOTES
    FileName:    Universal_Uninstaller.ps1
    Author:      Kevin Schäfer, Benny Sturm, Maximilian Burgert, Philip Stokes
    Contact:     support-its@unibas.ch
    Created:     2016-08-18
    Updated:     2019-10-28
    Version:     1.12.0
#>

param(
  [string]$ProgramName,
  [string[]]$ProzessNames,
  [string]$AdditFolderName,
  [string]$EXEArgumente = "/S",
  [switch]$DeleteFolder,
  [switch]$SI,
  [switch]$SF,
  [switch]$SIS = $false,
  [string]$MS
)

$LogPath = $env:SWP
$TimeStamp = Get-Date -Format yyyyMMdd-HHmmss

#Interactive Services Detection Dienst stoppen
$OS = (Get-WmiObject Win32_OperatingSystem).Caption
If ($OS -notlike "*Windows 7*"){
  $WinRelease = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ReleaseId).ReleaseId
  $Release = [int]$WinRelease
}

If($Release -lt 1803 -or $OS -like "*Windows 7"){
  $ServiceStatus = Get-Service -Name UI0Detect | Select-Object -ExpandProperty Status -Unique
  $ServiceStartModes = Get-WmiObject -Class Win32_Service -Filter "Name = 'UI0Detect'" | Select-Object -ExpandProperty StartMode

  If ($ServiceStatus -notlike "Stopped"){
    (Get-WmiObject -Class Win32_Service -filter "name='UI0Detect'").stopservice()
    Start-Sleep 3
  }
 
  If ($ServiceStartModes -notlike "Disabled"){
    (Get-WmiObject -Class Win32_Service -filter "name='UI0Detect'").ChangeStartMode("Disabled")
    Start-Sleep 3
  }
}


#Pruefung ob SWP vorhanden
If (!(Test-Path $LogPath)){
    New-Item -Path $LogPath -ItemType Directory -Force -ErrorAction SilentlyContinue
}

$PathInitialScript = "$PSScriptRoot\InitialScript.ps1"
If(!$SI -and (Test-Path $PathInitialScript)){  
  Start-Process powershell -ArgumentList '-file',"""$PathInitialScript""" -Wait
}

# Array fuer mehrere Prozesse erstellen
#Programm(e) Schliessen
If ($ProzessNames){
  foreach($process in $ProzessNames){
    Stop-Process -name $process -Force -ErrorAction SilentlyContinue
  }
}   

New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS    

If((Get-WmiObject Win32_OperatingSystem).OSArchitecture -eq "64-Bit"){

    [array]$UninstallStrings = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty UninstallString -ea SilentlyContinue
    $UninstallStrings += Get-ItemProperty -Path "HKLM:\SOFTWARE\WoW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty UninstallString -ea SilentlyContinue
    [array]$DisplayName = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayName -ea SilentlyContinue
    $DisplayName += Get-ItemProperty -Path "HKLM:\SOFTWARE\WoW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayName -ea SilentlyContinue
    [array]$DisplayVersion = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayVersion -ea SilentlyContinue
    $DisplayVersion += Get-ItemProperty -Path "HKLM:\SOFTWARE\WoW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayVersion -ea SilentlyContinue
    [array]$RegPath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\WoW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName}).PSPath
    $RegPath += (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName}).PSPath
    
    #User Installationen durchsuchen
    $UninstallStrings += Get-ItemProperty -Path "HKU:\*\SOFTWARE\WoW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty UninstallString -ea SilentlyContinue
    $UninstallStrings += Get-ItemProperty -Path "HKU:\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty UninstallString -ea SilentlyContinue
    $DisplayName += Get-ItemProperty -Path "HKU:\*\SOFTWARE\WoW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayName -ea SilentlyContinue
    $DisplayName += Get-ItemProperty -Path "HKU:\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayName -ea SilentlyContinue
    $DisplayVersion += Get-ItemProperty -Path "HKU:\*\SOFTWARE\WoW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayVersion -ea SilentlyContinue
    $DisplayVersion += Get-ItemProperty -Path "HKU:\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayVersion -ea SilentlyContinue
    $RegPath += (Get-ItemProperty -Path "HKU:\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName}).PSPath
    $RegPath += (Get-ItemProperty -Path "HKU:\*\SOFTWARE\WoW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName}).PSPath
}
Else {
    [array]$UninstallStrings = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty UninstallString -ea SilentlyContinue
    [array]$DisplayName = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayName -ea SilentlyContinue
    [array]$DisplayVersion = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayVersion -ea SilentlyContinue
    [array]$RegPath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName}).PSPath
    
    #User Installationen durchsuchen
    $UninstallStrings += Get-ItemProperty -Path "HKU:\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty UninstallString -ea SilentlyContinue
    $DisplayName += Get-ItemProperty -Path "HKU:\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayName -ea SilentlyContinue
    $DisplayVersion += Get-ItemProperty -Path "HKU:\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName} | Select-Object -ExpandProperty DisplayVersion -ea SilentlyContinue
    $RegPath += (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object{$_.DisplayName -like $ProgramName}).PSPath
}

If (!$DisplayVersion){
    $DisplayVersion = "NA"
}

for($i=0;$i -lt $UninstallStrings.length;$i++){
    
    if($UninstallStrings[$i] -match "msiexec"){
      
      if($UninstallStrings[$i]){
            $LogFileName = "Uninstall_$($DisplayName[$i])_$($DisplayVersion[$i])_$($TimeStamp).log"
            $Logfile = $LogPath + $LogFileName 
            
            Write-Verbose $UninstallStrings[$i]
            $uninstallParam = ""
            if($UninstallStrings[$i] -match "/I"){
                $uninstallParam = ([string]$UninstallStrings[$i]).Replace("/I","/X").Replace("MsiExec.exe","").Replace("/i","/X").Replace("msiexec.exe","") + " /QB!- REBOOT=ReallySuppress /L*v `"$Logfile`""
              if ($MS){    
                $uninstallParam = ([string]$UninstallStrings[$i]).Replace("/I","/X").Replace("MsiExec.exe","").Replace("/i","/X").Replace("msiexec.exe","") + " /QB!- REBOOT=ReallySuppress /L*v `"$Logfile`" $MS"
              }
              $pos = $uninstallParam.IndexOf("/X")
              $uninstallParam = $uninstallParam.Substring($pos)

            }
            else{
                $uninstallParam += ([string]$UninstallStrings[$i]).Replace("MsiExec.exe","") + " /QB!- REBOOT=ReallySuppress /L*v `"$Logfile`""
                if ($MS){    
                  $uninstallParam += ([string]$UninstallStrings[$i]).Replace("MsiExec.exe","") + " /QB!- REBOOT=ReallySuppress /L*v `"$Logfile`" $MS"
                }
            }
            Write-Verbose $uninstallParam            
            Start-Process "C:\Windows\System32\msiexec.exe" -Argumentlist $uninstallParam -ErrorAction SilentlyContinue -Wait | Wait-Process -Timeout 900
        }
     }
}

for($i=0;$i -lt $UninstallStrings.length;$i++){
    If($UninstallStrings[$i] -match ".exe" -and $UninstallStrings[$i] -notmatch "msiexec")
    {
        [int]$indexOfExe = ([string]$UninstallStrings[$i]).IndexOf(".exe")
        $lastIndexOfExe = $indexOfExe + 5
        [string]$Path = ([string]$UninstallStrings[$i]).Substring(0,$lastIndexOfExe-1).Replace("`"","")
        
        $cmd = "`" /c `"" + "`"$Path`""
        Write-Verbose $cmd
        
        $EXEExecute = (Start-Process cmd -ArgumentList "`"$cmd $EXEArgumente`"" -PassThru -ErrorAction SilentlyContinue -Wait)

        $ReturnFromExe = $EXEExecute.ExitCode

        $LogFileName = "Uninstall_$($DisplayName[$i])_$($DisplayVersion[$i])_$($TimeStamp).log"
        $Logfile = $LogPath + $LogFileName

        $FileExists = Test-Path $LogFile
        $DateNow = Get-Date -Format "dd.MM.yyyy HH:mm" 
        If ($FileExists -eq $True){
            Add-Content $LogFile -value ('Uninstalldate: ' + $DateNow)
            Add-Content $LogFile -value ('EXE returned: ' + $ReturnFromExe)
        } 
        else {
            New-Item $Logfile -type file
            Add-Content $LogFile -value ('Uninstalldate: ' + $DateNow)
            Add-Content $LogFile -value ('EXE returned: ' + $ReturnFromExe)
        }
    }

}

for($i=0;$i -lt $RegPath.Length;$i++){
  if($null -ne $RegPath[$i]){ 
    $RegPath[$i] = $RegPath[$i].Replace("Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE","HKLM:").Replace("Microsoft.PowerShell.Core\Registry::HKEY_USERS","HKU:")
    If(Test-Path $RegPath[$i]){
      Remove-Item $RegPath[$i] -Recurse -Force  
    }    
  }
}      

# Remove .lnk and folders in start menu
get-childitem "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\" -recurse | Where-Object {$_.Name -like $ProgramName} | ForEach-Object {
  Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
}

If($DeleteFolder){
    $AllFolder = @()
    $AllFolder += Get-ChildItem ${env:ProgramFiles} -Recurse | where {$_.PSIsContainer -and $_.Name -match "$ProgramName"} -ErrorAction SilentlyContinue | Select-Object Name, FullName, Parent
    $AllFolder += Get-ChildItem ${env:ProgramFiles(x86)} -Recurse | where {$_.PSIsContainer -and $_.Name -match "$ProgramName" } -ErrorAction SilentlyContinue | Select-Object Name, FullName, Parent
    $AllFolder += Get-ChildItem $env:ProgramData -Recurse | where {$_.PSIsContainer -and $_.Name -match "$ProgramName"} -ErrorAction SilentlyContinue | Select-Object Name, FullName, Parent
    # -ne $Null -and $AdditFolderName -ne ''
  If ($AdditFolderName){
        $AllFolder += Get-ChildItem ${env:ProgramFiles} -Recurse | where {$_.PSIsContainer -and $_.Name -match "$AdditFolderName"} -ErrorAction SilentlyContinue | Select-Object Name, FullName, Parent
        $AllFolder += Get-ChildItem ${env:ProgramFiles(x86)} -Recurse | where {$_.PSIsContainer -and $_.Name -match "$AdditFolderName" } -ErrorAction SilentlyContinue | Select-Object Name, FullName, Parent
        $AllFolder += Get-ChildItem $env:ProgramData -Recurse | where {$_.PSIsContainer -and $_.Name -match "$AdditFolderName"} -ErrorAction SilentlyContinue | Select-Object Name, FullName, Parent
  }

    foreach($Folder in $AllFolder){
        $Foldername = [string]$Folder.Name
        $ParentPath = ([string]$Folder.FullName) -replace [Regex]::Escape($Foldername), ""

        Remove-Item -Path $Folder.FullName -Recurse -Force | Wait-Process
        if($Folder.Parent -notlike "Program Files" -or $Folder.Parent -notlike "Program Files(x86)" -or $Folder.Parent -notlike "ProgramData"){
            $isEmpty = Get-ChildItem -Path $ParentPath | Measure-Object

            If($isEmpty.Count -eq 0){
                Remove-Item -Path $ParentPath -Recurse -Force | Wait-Process
            }
            else{
                Write-Verbose "Folder not empty"
            }
        }
    }
}

$PathFinalScript = "$PSScriptRoot\FinalScript.ps1"

If(!$SF -and (Test-Path $PathFinalScript)){
  Start-Process powershell -ArgumentList '-file',"""$PathFinalScript""" -Wait
}

Remove-PSDrive -Name HKU -Force

If (!($env:SWP + "\" -eq $LogPath)){
  #Logfiles kopieren
  Copy -r "$LogPath*" $env:SWP
}

If($Release -lt 1803){
  If ($ServiceStartModes -like "Manual"){
    (Get-WmiObject -Class Win32_Service -filter "name='UI0Detect'").ChangeStartMode("Manual")
  }
}

#Inventarscan ausfuehren
If (!($SIS)){
  & "c:\Program Files (x86)\LANDesk\LDClient\LDISCN32.EXE"
}
