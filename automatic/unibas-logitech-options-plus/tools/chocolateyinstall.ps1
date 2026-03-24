$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:temp\"

$url = 'https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.exe'
$checksum = '8cb12fae8d35e4ab531f39c7d49e731cb5379285516d86c6b61aaea994ae7e07'
$checksumType = 'sha256'
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url
  checksum       = $checksum
  checksumType   = $checksumType
  silentArgs     = "/quiet /analytics No /update No /dfu Yes"
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Logi Options+*'
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1) 
