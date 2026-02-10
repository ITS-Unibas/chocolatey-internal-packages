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
  checksum     = '95191f0b08c000b88bbceeda4b4e2a0f42482e69b92c9f40887a834b5eee3225'
  checksumType = 'sha256'
}

Install-ChocolateyPackage @packageArgs
