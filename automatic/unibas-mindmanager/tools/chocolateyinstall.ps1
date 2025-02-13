$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# First, unzip the package
$packageArgs = @{
  packageName    = 'unibas-mindmanager'
  url            = 'https://download.mindjet.com/MindManager_64bit_24.1.150_Admin.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'Mindmanager*'
  checksum       = 'b854471402e0e1c7a93844bbaee5b5dfaccad875fbfb3152d9d2730f086b2550'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs

# Now install the MSI
$fileLocation = Join-Path $toolsDir 'MindManager 24.msi'

$installerArgs = @{
  packageName    = 'unibas-mindmanager'
  file          = $fileLocation
  fileType      = 'MSI'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" SHORTCUTDESKTOP=0 ONLINEHELP=0"
  validExitCodes = @(0, 3010, 1641)
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyInstallPackage @installerArgs