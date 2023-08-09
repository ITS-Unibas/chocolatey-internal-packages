$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.22.0.exe'
  checksum      = 'a94b30dfec6f42d3b7cf4c9bd9259bf88f03271c2ddc81db26ea23307d4a1827'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
