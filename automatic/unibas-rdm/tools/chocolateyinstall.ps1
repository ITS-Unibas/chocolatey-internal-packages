$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.27.0.exe'
  checksum      = 'cc5951a9e6c354fb6aebe43557c9b1b9a9210282e4d2c290070217de073cc1b7'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
