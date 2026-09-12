$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.19.0.exe'
  checksum      = '81D090D03C6F527502B7CE7E6E47DFF5337124AA7A77D480D6B2C557D6AA99B6'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
