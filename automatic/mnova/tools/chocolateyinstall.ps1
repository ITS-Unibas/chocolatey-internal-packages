$ErrorActionPreference = 'Stop';

$packageName = 'mnova'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://mestrelab.com/downloads/mnova/win/msi/MestReNova-15.1.0-37919_x64.msi'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'mnova*'
  checksum64     = '3b6f65512800443a27eac9c7cc0b013e72b5f3c52ec22923c5c57190f8269195'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
