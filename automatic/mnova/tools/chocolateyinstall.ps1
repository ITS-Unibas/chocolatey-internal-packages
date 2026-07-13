$ErrorActionPreference = 'Stop';

$packageName = 'mnova'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://mestrelab.com/downloads/mnova/win/msi/MestReNova-17.0.1-41952_x64.msi'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'mnova*'
  checksum64     = '174abd1dbed085dba66723903497e8248b5a6871f0697046ab774158f25d9e5c'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
