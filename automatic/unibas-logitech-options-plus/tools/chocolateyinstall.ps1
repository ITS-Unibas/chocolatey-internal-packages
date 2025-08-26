$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:temp\"

$url = 'https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.exe'
$checksum = '2025ce1b0a2a0fedfba848cf744c41d678cda6222364117b23d64b80046c7c6b'
$checksumType = 'sha256'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url
  silentArgs     = "/quiet /analytics No /update No /dfu Yes"
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Logi Options+*'
  checksum       = $checksum
  checksumType   = $checksumType
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyInstallPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1) 
