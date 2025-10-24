$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.20.0.exe'
  checksum      = '92b630d356eae492c6549d032876c735f8bb236ec04b1660e38af166085db8ca'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
