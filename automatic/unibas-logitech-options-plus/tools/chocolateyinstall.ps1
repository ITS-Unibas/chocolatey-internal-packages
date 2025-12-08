$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:temp\"

$url64 = 'https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.exe'
$checksum64 = ''
$checksumType64 = 'sha256'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = $url64
  silentArgs     = "/quiet /analytics No /update No /dfu Yes"
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Logi Options+*'
  checksum64     = $checksum64
  checksumType64 = $checksumType64
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1) 
