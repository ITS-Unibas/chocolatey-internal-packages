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
<<<<<<< HEAD
  checksum     = ''
  checksumType = ''
=======
  checksum     = '54d875981b6a32eb916bae0e3b3fafef365cbe3ea96c940c38d1b7257d8bb171'
  checksumType = 'sha256'
>>>>>>> 3a281d320b89097d0e065df1ec4561b572a50628
}

Install-ChocolateyPackage @packageArgs
