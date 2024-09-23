﻿$ErrorActionPreference = 'Stop';

$packageName = 'unibas-maxqda'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://updates.maxqda.de/24/MAXQDA24_Setup.msi'
  silentArgs     = '/qn LIC_SRV="131.152.22.50" LIC_NAME="MAXQDA" DISABLE_AUTO_UPDATES=1 DISABLE_MANUAL_UPDATES=1 /norestart' # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0,129, 3010, 1605, 1614, 1641)
  softwareName   = 'MAXQDA*'
  checksum     = '2b2db98385335dd0b63a6aa4fdef2ae13be4fecfd1444a5365aeb0ead6427305'
  checksumType = 'sha256'
}

Install-ChocolateyPackage @packageArgs
