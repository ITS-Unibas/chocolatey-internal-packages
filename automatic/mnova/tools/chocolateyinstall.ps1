$ErrorActionPreference = 'Stop';

$packageName = 'mnova'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://mestrelab.com/downloads/mnova/win/msi/MestReNova-14.2.2-28739_x64.msi'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'mnova*'
  checksum64     = '1a5857b9d095e41737638fd65243903227a313c3fdf01fdd9a22b31317a449b3'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
