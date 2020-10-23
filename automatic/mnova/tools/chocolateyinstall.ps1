$ErrorActionPreference = 'Stop';

$packageName = 'mnova'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://mestrelab.com/downloads/mnova/win/msi/MestReNova-14.2.0-26256_x64.msi'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'mnova*'
  checksum64     = '1f417322434bb0467911553964b04e3067e106b58fab0d52fcd37c1b0a43331c'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
