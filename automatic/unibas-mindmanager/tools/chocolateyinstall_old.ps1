$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:TEMP\"
$fileLocation = Join-Path $toolsDir 'MindManager 23.msi'

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
    file = (Join-Path $toolsDir 'MindManager_64bit_24.1.150_Admin.zip')
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  silentArgs     = "/quiet /norestart CAPTUREENABLED=`"0`" /l*v `"$($LogPath)Install_$($env:chocolateyPackageName)_$($env:chocolateyPackageVersion).log`""
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Mindmanager*'
}
&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1)


