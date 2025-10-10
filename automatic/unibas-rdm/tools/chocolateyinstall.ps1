$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.16.0.exe'
  checksum      = 'd7621a4adbcc0e3538b8795891b87e53518dd4108ac08df15dcd9d70a6496847'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
