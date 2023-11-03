$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.22.0.exe'
  checksum      = 'ce567366437fe27a16f3bfe9cf23ee2f0b6796b2773b77ed856e9e419693a19c'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
