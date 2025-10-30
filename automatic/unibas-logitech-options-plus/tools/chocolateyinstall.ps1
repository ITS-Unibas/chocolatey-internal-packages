$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:temp\"

$url = 'https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.exe'
$checksum = '2c3d26741543c85049ea4dbccef69a6deb7db12acf343a53fcca8da398267b79'
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
