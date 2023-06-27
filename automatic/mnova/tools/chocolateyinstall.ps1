$ErrorActionPreference = 'Stop';

$packageName = 'mnova'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://mestrelab.com/downloads/mnova/win/msi/MestReNova-14.3.3-33362_x64.msi'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'mnova*'
  checksum64     = '0a2a632405db4808ad106a0fb30fc347bcc1be3629f455a6bbaeb5cfd34d7f74'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
