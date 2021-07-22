$ErrorActionPreference = 'Stop';

$packageName = 'unibas-slack'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = 'https://downloads.slack-edge.com/releases/windows/4.18.0/prod/ia32/slack-standalone-4.18.0.0.msi'
  checksum      = '3cad47d22b22d5460becc95b7f75700191e715cc05921646dd11e938d12b6f90'
  checksumType  = 'sha256'
  url64bit      = 'https://downloads.slack-edge.com/releases/windows/4.18.0/prod/x64/slack-standalone-4.18.0.0.msi'
  checksum64    = '7821699675bc67b63d1c7f2eb08dfc41ce3359d4d3cb37742ddb74090073eb1c'
  checksumType64= 'sha256'
  softwareName  = 'unibas-slack*'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0)
  
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
}

Install-ChocolateyPackage @packageArgs
