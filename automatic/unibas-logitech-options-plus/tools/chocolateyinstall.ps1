$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:temp\"

$url = ''
$checksum = ''
$checksumType = 'sha256'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url
  silentArgs     = "/quiet /analytics No /update No /dfu Yes"
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Logi Options+*'
  checksum       = $checksum
  checksumType   = $checksumType
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1) 