$ErrorActionPreference = 'Stop';

$packageName = 'unibas-maxqda'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://updates.maxqda.de/MAXQDA/MAXQDA_Setup.msi'
  silentArgs     = '/qn LIC_SRV="131.152.22.50" LIC_NAME="MAXQDA" DISABLE_AUTO_UPDATES=1 DISABLE_MANUAL_UPDATES=1 /norestart' # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0,129, 3010, 1605, 1614, 1641)
  softwareName   = 'MAXQDA*'
  checksum     = 'f582d6dce3a58a06fd86b79b7debc80d4a0e911361450f52c8e5a539a35c88af'
  checksumType = 'sha256'
}

Install-ChocolateyPackage @packageArgs
