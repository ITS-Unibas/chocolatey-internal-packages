$ErrorActionPreference = 'Stop';

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
  checksum     = '75ba6659c29b141bb99c229d75468ae987c64f84aac0b2a295ee366d01b9a7ab'
  checksumType = 'sha256'
}

Install-ChocolateyPackage @packageArgs
